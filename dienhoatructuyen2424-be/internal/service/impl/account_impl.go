package impl

import (
	"context"
	"database/sql"
	"fmt"
	"go-backend-api/global"
	"go-backend-api/internal/database"
	"go-backend-api/internal/model"
	"go-backend-api/internal/utils/cache"
	"go-backend-api/internal/utils/crypto"
	"go-backend-api/pkg/response"
	"log"
	"math/rand"
	"time"

	"github.com/google/uuid"
)

type sAccount struct {
	r   *database.Queries
	qTx *sql.Tx
	db  *sql.DB
}

func NewAccountImpl(r *database.Queries, qTx *sql.Tx, db *sql.DB) *sAccount {
	return &sAccount{
		r:   r,
		qTx: qTx,
		db:  db,
	}
}

// Tạo tài khoản mới
func (s *sAccount) CreateAccount(ctx context.Context, in *model.AccountInput) (codeResult int, out model.AccountOutput, err error) {
	// Khởi tạo transaction
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeMenuError, out, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	// Tạo một bản sao của queries sử dụng transaction
	qtx := s.r.WithTx(tx)
	subjectUUID := ctx.Value("subjectUUID")
	println("subjectUUID account: ", subjectUUID)
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeAccountNotFound, out, err
	}
	// TODO: check Email and username
	accountFound, err := s.r.CheckAccountBaseExists(ctx, database.CheckAccountBaseExistsParams{
		Email:    in.Email,
		Username: in.UserName,
	})
	if err != nil {
		return response.ErrCodeAccountNotFound, model.AccountOutput{}, err
	}
	if accountFound > 0 {
		return response.ErrCodeEmailOrUsernameExists, model.AccountOutput{}, fmt.Errorf("Email has already registered")
	}
	// TODO: hash Password
	accountBase := database.Account{}
	userSalt, err := crypto.GenerateSalt(16)
	if err != nil {
		return response.ErrCodeHashAccount, model.AccountOutput{}, err
	}
	// Kiểm tra role_max_number
	countRoleMaxNumber, err := s.r.GetRoleById(ctx, in.RoleId)
	if err != nil {
		return response.ErrCodeMaxRole, model.AccountOutput{}, err
	}
	//Kiểm tra số lượng tài khoản theo role count(account_id) theo role_id
	countAccountId, err := s.r.CheckCountRoleId(ctx, in.RoleId)
	if err != nil {
		return response.ErrCodeCheckCountAccount, model.AccountOutput{}, err
	}
	// Kiểm tra tài khoản đã được
	if int64(countRoleMaxNumber.RoleMaxNumber) < (countAccountId + 1) {
		return response.ErrCodeRoleAccountValid, model.AccountOutput{}, fmt.Errorf("Số lượng tài khoản tạo đã vượt quá số lượng quy định")
	}
	//
	accountBase.Password = crypto.HashPassword(global.Config.JWT.PASSWORD, userSalt, global.Config.JWT.SECRET_KEY)
	rand.Seed(time.Now().UnixNano())
	currentTime := time.Now()
	timeStr := currentTime.Format("20060102150405")
	newCode := fmt.Sprintf("TC_%s", timeStr)
	newUUID := uuid.New().String()
	_, err = qtx.InsertAccount(ctx, database.InsertAccountParams{
		ID:        newUUID,
		Code:      newCode,
		Number:    rand.Int31(),
		Name:      in.Name,
		Username:  in.UserName,
		Email:     in.Email,
		Password:  accountBase.Password,
		Salt:      userSalt,
		Status:    in.Status,
		Images:    in.Images,
		CreatedBy: infoUser.ID,
	})
	if err != nil {
		log.Printf("Lỗi khi chèn tài khoản: %v", err)
		return response.ErrCodeAccountCreate, model.AccountOutput{}, err
	}

	// nếu license tồn tại thì thêm vào bảng role account
	// thêm vào bảng role account
	err = qtx.CreateRoleAccount(ctx, database.CreateRoleAccountParams{
		ID:        newUUID,
		AccountID: newUUID,
		RoleID:    in.RoleId,
		CreatedBy: sql.NullString{infoUser.ID, true},
	})
	if err != nil {
		log.Printf("Lỗi khi chèn tài khoản vào bảng role account: %v", err)
		return response.ErrCodeRoleAccountCreate, model.AccountOutput{}, err
	}
	accountOutput := model.AccountOutput{
		ID:       newUUID,
		Name:     in.Name,
		Email:    in.Email,
		UserName: in.UserName,
		Status:   in.Status,
		Images:   in.Images,
	}
	// Commit transaction
	if err := tx.Commit(); err != nil {
		return response.ErrCodeTransactionError, out, err
	}

	committed = true
	return response.ErrCodeSucces, accountOutput, err
}

// Lấy thông tin tài khoản theo ID
func (s *sAccount) GetAccountById(ctx context.Context, id string) (codeResult int, out model.AccountOutput, err error) {
	log.Println("CALL service Get Account By Id ...")
	accountItem, err := s.r.GetAccountById(ctx, id)
	if err != nil {
		return response.ErrCodeAccountNotFound, out, err
	}
	return response.ErrCodeSucces, model.AccountOutput{
		ID:          accountItem.ID,
		Code:        accountItem.Code,
		UserName:    accountItem.Username,
		Name:        accountItem.Name,
		Email:       accountItem.Email,
		Status:      accountItem.Status,
		Images:      accountItem.Images,
		FuncPackage: accountItem.RoleName.String,
	}, nil
}

// Cập nhật tài khoản
func (s *sAccount) UpdateAccount(ctx context.Context, in *model.AccountEditInput, id string) (codeResult int, out model.AccountOutput, err error) {
	// Kiểm tra username and mail
	accountFound, err := s.r.CheckAccountBaseExistsUpdate(ctx, database.CheckAccountBaseExistsUpdateParams{
		Email:    in.Email,
		Username: in.UserName,
		ID:       id,
	})
	if err != nil {
		return response.ErrCodeCheckExistsAccount, model.AccountOutput{}, err
	}
	if accountFound > 0 {
		return response.ErrCodeEmailOrUsernameExists, model.AccountOutput{}, fmt.Errorf("Username or Email has already registered")
	}
	err = s.r.EditAccountById(ctx, database.EditAccountByIdParams{
		Name:     in.Name,
		Code:     in.Code,
		Username: in.UserName,
		Email:    in.Email,
		Status:   in.Status,
		Images:   in.Images,
		ID:       id,
	})

	if err != nil {
		return response.ErrCodeEditAccount, model.AccountOutput{}, err
	}
	updatedAccount, err := s.r.GetAccountById(ctx, id)
	if err != nil {
		return response.ErrCodeAccountNotFound, model.AccountOutput{}, err
	}
	accountOutput := model.AccountOutput{
		ID:          updatedAccount.ID,
		Code:        updatedAccount.Code,
		Name:        updatedAccount.Name,
		UserName:    updatedAccount.Username,
		Email:       updatedAccount.Email,
		Status:      updatedAccount.Status,
		Images:      updatedAccount.Images,
		FuncPackage: updatedAccount.RoleName.String,
	}
	return response.ErrCodeSucces, accountOutput, nil
}

// Xóa tài khoản
func (s *sAccount) DeleteAccounts(ctx context.Context, ids []string) (codeResult int, err error) {
	// Bắt đầu transaction
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	qtx := s.r.WithTx(tx)
	for _, id := range ids {
		// Kiểm tra trạng thái tài khoản
		infoAccount, err := qtx.GetAccountById(ctx, id)
		if err != nil {
			return response.ErrCodeAccountNotFound, fmt.Errorf("account %s: %w", id, err)
		}
		if infoAccount.Status {
			return response.ErrCodeDeleteAccount, fmt.Errorf("Tài khoản %s đang hoạt động, vui lòng khóa tài khoản trước khi xóa", infoAccount.Name)
		}

		// Kiểm tra tài khoản con
		childAccount, err := s.r.CheckTotalAccountChildExists(ctx, id)
		if err != nil {
			return response.ErrCodeDeleteAccount, fmt.Errorf("account %s: %w", id, err)
		}
		if childAccount > 0 {
			return response.ErrCodeDeleteAccount, fmt.Errorf("Tài khoản %s có tài khoản con, vui lòng xóa tài khoản con trước", infoAccount.Name)
		}

		// Cập nhật is_deleted trong bảng account
		if err := qtx.DeleteAccountById(ctx, id); err != nil {
			return response.ErrCodeDeleteAccount, fmt.Errorf("delete account %s: %w", id, err)
		}

		// Cập nhật is_deleted trong bảng role_account
		if err := qtx.DeleteRoleAccountByAccountId(ctx, id); err != nil {
			return response.ErrCodeDeleteAccount, fmt.Errorf("delete role_account for %s: %w", id, err)
		}
	}

	// Commit transaction
	if err := tx.Commit(); err != nil {
		return response.ErrCodeTransactionError, err
	}
	committed = true

	return response.ErrCodeSucces, nil
}

// Lấy danh sách tất cả tài khoản
func (s *sAccount) GetAllAccount(ctx context.Context, page, pageSize int, search string) (codeResult int, out []model.AccountOutput, total int64, err error) {
	subjectUUID := ctx.Value("subjectUUID")
	println("subjectUUID account: ", subjectUUID)
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeAccountNotFound, out, 0, err
	}
	offset := (page - 1) * pageSize
	lst, err := s.r.GetAllAccountByCreatedBy(ctx, database.GetAllAccountByCreatedByParams{
		CreatedBy: infoUser.ID,
		Limit:     int32(pageSize),
		Offset:    int32(offset),
		Column2:   search,
		CONCAT:    search,
		CONCAT_2:  search,
		CONCAT_3:  search,
		CONCAT_4:  search,
		CONCAT_5:  search,
	})
	if err != nil {
		return response.ErrCodeAccountNotFound, nil, 0, err
	}
	total, err = s.r.CountAllAccountByCreatedBy(ctx, database.CountAllAccountByCreatedByParams{
		CreatedBy: infoUser.ID,
		Column2:   search,
		CONCAT:    search,
		CONCAT_2:  search,
		CONCAT_3:  search,
		CONCAT_4:  search,
		CONCAT_5:  search,
	})
	if err != nil {
		return response.ErrCodeAccountSum, nil, 0, err
	}
	for _, item := range lst {
		out = append(out, model.AccountOutput{
			ID:          item.ID,
			Code:        item.Code,
			Name:        item.Name,
			UserName:    item.Username,
			Email:       item.Email,
			Status:      item.Status,
			Images:      item.Images,
			FuncPackage: item.RoleName.String,
		})
	}

	log.Println("Successfully fetched accounts:", len(out))
	return response.ErrCodeSucces, out, total, nil
}

func (s *sAccount) LockAndUnlockAccount(ctx context.Context, id string) (codeResult int, err error) {
	infoAccount, err := s.r.GetAccountById(ctx, id)
	if err != nil {
		return response.ErrCodeAccountNotFound, err
	}
	// check childrent account
	childAccount, err := s.r.CheckTotalAccountChildExists(ctx, id)
	if err != nil {
		return response.ErrCodeLockAccount, err
	}
	if childAccount > 0 {
		return response.ErrCodeLockAccount, fmt.Errorf("Tài khoản %s có tài khoản con, vui lòng xóa tài khoản con trước", infoAccount.Name)
	}
	//
	newStatus := !infoAccount.Status
	err = s.r.LockAndUnlockAccount(ctx, database.LockAndUnlockAccountParams{
		Status: newStatus,
		ID:     id,
	})
	if err != nil {
		return response.ErrCodeLockAccount, err
	}
	return response.ErrCodeSucces, err
}

func (s *sAccount) ResetPasswordAccount(ctx context.Context, id string) (codeResult int, err error) {
	infoAccount, err := s.r.GetAccountById(ctx, id)
	if err != nil {
		return response.ErrCodeAccountNotFound, err
	}
	userSalt, err := crypto.GenerateSalt(16)
	if err != nil {
		return response.ErrCodeHashAccount, err
	}
	Password := crypto.HashPassword(global.Config.JWT.PASSWORD, userSalt, global.Config.JWT.SECRET_KEY)
	err = s.r.ResetPasswordAccount(ctx, database.ResetPasswordAccountParams{
		Number:   infoAccount.Number,
		Password: Password,
		Salt:     userSalt,
		ID:       id,
	})
	return response.ErrCodeSucces, err
}

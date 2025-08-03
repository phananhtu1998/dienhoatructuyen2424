package impl

import (
	"context"
	"database/sql"
	"encoding/json"
	"fmt"
	"go-backend-api/global"
	consts "go-backend-api/internal/const"
	"go-backend-api/internal/database"
	"go-backend-api/internal/model"
	"go-backend-api/internal/utils"
	"go-backend-api/internal/utils/auth"
	"go-backend-api/internal/utils/cache"
	"go-backend-api/internal/utils/crypto"
	"go-backend-api/internal/utils/random"
	"go-backend-api/internal/utils/sendto"
	"go-backend-api/pkg/response"
	"log"
	"math/rand"
	"strconv"
	"strings"
	"time"

	"github.com/google/uuid"
)

type sCustomer struct {
	r   *database.Queries
	qTx *sql.Tx
	db  *sql.DB
}

func NewCustomerImpl(r *database.Queries, qTx *sql.Tx, db *sql.DB) *sCustomer {
	return &sCustomer{
		r:   r,
		qTx: qTx,
		db:  db,
	}
}

func (s *sCustomer) Register(ctx context.Context, in *model.CustomerVerifyInput) (codeResult int, err error) {
	// 1. hash email
	fmt.Printf("VerifyKey: %s\n", in.Verify_email)
	hashKey := crypto.GetHash(strings.ToLower(in.Verify_email))
	fmt.Printf("hashKey: %s\n", hashKey)
	// 2. check customer exists in customer base
	customerFound, err := s.r.CheckCustomerBaseExists(ctx, in.Verify_email)
	if err != nil {
		return response.ErrCodeCustomerHasExists, err
	}
	if customerFound > 0 {
		return response.ErrCodeCustomerHasExists, fmt.Errorf("user has already registered")
	}
	customerKey := utils.GetCustomerKey(hashKey)
	// 4. Generate OTP
	otpNew := random.GenerateSixDigitOtp()
	fmt.Printf("otpNew: %s\n", otpNew)
	fmt.Printf("Otp is :::%d\n", otpNew)
	err = sendto.SendTemplateEmailOtp(
		[]string{in.Verify_email},
		consts.HOST_EMAIL,
		"otp-auth.html", // <-- Tên file template HTML thực tế
		map[string]interface{}{
			"otp": otpNew, // Dữ liệu được inject vào {{.OTP}} trong file HTML
		},
	)
	if err != nil {
		return response.ErrSendEmailOtp, err
	}
	err = global.Rdb.SetEx(ctx, customerKey, strconv.Itoa(otpNew), time.Duration(consts.TIME_OTP_REGISTER)*time.Minute).Err()
	if err != nil {
		return response.ErrInvalidOTP, err
	}
	newUUID := uuid.New().String()
	// 7. save OTP to MYSQL
	result, err := s.r.InsertOTPVerify(ctx, database.InsertOTPVerifyParams{
		ID:            newUUID,
		VerifyOtp:     strconv.Itoa(otpNew),
		VerifyEmail:   in.Verify_email,
		VerifyKeyHash: hashKey,
	})

	if err != nil {
		return response.ErrSendEmailOtp, err
	}

	// 8. getlasId
	lastIdVerifyUser, err := result.LastInsertId()
	if err != nil {
		return response.ErrSendEmailOtp, err
	}
	log.Println("lastIdVerifyUser", lastIdVerifyUser)
	return response.ErrCodeSucces, nil
}

func (s *sCustomer) VerifyOTP(ctx context.Context, in *model.VerifyInput) (codeResult int, out model.VerifyOTPOutput, err error) {
	// logic
	hashKey := crypto.GetHash(strings.ToLower(in.Verify_email))
	log.Printf("hashKey: %s\n", hashKey)
	// get otp
	otpFound, err := global.Rdb.Get(ctx, utils.GetCustomerKey(hashKey)).Result()
	if err != nil {
		return response.ErrCodeGetCache, out, err
	}
	if in.VerifyCode != otpFound {
		return response.ErrCodeOtpNotMatch, out, fmt.Errorf("OTP not match")
	}
	infoOTP, err := s.r.GetInfoOTP(ctx, hashKey)
	if err != nil {
		return response.ErrCodeGetDb, out, err
	}
	log.Println("infoOTP", infoOTP)
	// uopdate status verified
	err = s.r.UpdateCustomerVerificationStatus(ctx, hashKey)
	if err != nil {
		return response.ErrCodeUpdateDb, out, err
	}

	// output
	out.Token = infoOTP.VerifyKeyHash // token temp
	return response.ErrCodeSucces, out, nil
}
func (s *sCustomer) UpdatePasswordRegister(ctx context.Context, token string, password string) (out model.UpdatePasswordRegisterOutput, CodeResult int, err error) {
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return out, response.ErrCodeTransactionInitializationError, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	// Tạo một bản sao của queries sử dụng transaction
	qtx := s.r.WithTx(tx)
	// 1. token is already verified : customer_verify table
	infoOTP, err := qtx.GetInfoOTP(ctx, token)
	if err != nil {
		return out, response.ErrCodeUserOtpNotExists, err
	}
	// 1 check isVerified OK
	if infoOTP.IsVerified == false {
		return out, response.ErrCodeUserOtpNotExists, fmt.Errorf("customer OTP not verified")
	}
	// 2. check token is exists in customer_base
	//update customer_base table
	customerSalt, err := crypto.GenerateSalt(16)
	if err != nil {
		return out, response.ErrCodeHash, err
	}
	Password := crypto.HashPassword(password, customerSalt, global.Config.JWT.SECRET_KEY)
	rand.Seed(time.Now().UnixNano())
	_, err = qtx.AddCustomerBase(ctx, database.AddCustomerBaseParams{
		ID:       uuid.New().String(),
		Number:   rand.Int31(),
		Email:    infoOTP.VerifyEmail,
		Salt:     customerSalt,
		Password: Password,
	})
	if err != nil {
		return out, response.ErrCodeSetDb, err
	}
	Id := uuid.New().String()
	currentTime := time.Now()
	timeStr := currentTime.Format("20060102150405")
	newCode := fmt.Sprintf("TC_%s", timeStr)
	_, err = qtx.AddCustomerHaveUserId(ctx, database.AddCustomerHaveUserIdParams{
		ID:               Id,
		Code:             newCode,
		Username:         infoOTP.VerifyEmail,
		Name:             "",
		PaymentID:        "",
		Image:            "",
		State:            1,
		Mobile:           "",
		Gender:           0,
		Birthday:         time.Now(),
		Email:            infoOTP.VerifyEmail,
		IsAuthentication: 1,
	})
	if err != nil {
		return out, response.ErrCodeUserOtpNotExists, err
	}
	if err := tx.Commit(); err != nil {
		return out, response.ErrCodeTransactionError, err
	}
	out.Id = Id
	committed = true
	return out, response.ErrCodeSucces, nil
}

func (s *sCustomer) UpdateInfoCustomer(ctx context.Context, in *model.UpdateInfoCustomerInput, Id string) (codeResult int, out model.UpdateInfoCustomerInput, err error) {
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, out, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	// Tạo một bản sao của queries sử dụng transaction
	qtx := s.r.WithTx(tx)
	err = qtx.UpdateCustomerInfoById(ctx, database.UpdateCustomerInfoByIdParams{
		Username:  in.Username,
		Name:      in.Name,
		Image:     in.Image,
		Mobile:    in.Mobile,
		Gender:    in.Gender,
		Birthday:  time.Now(),
		PaymentID: in.Payment_Id,
		ID:        Id,
	})
	if err != nil {
		return response.ErrCodeUserOtpNotExists, out, err
	}
	// add info vehicle
	currentTime := time.Now()
	timeStr := currentTime.Format("20060102150405")
	newCode := fmt.Sprintf("TC_%s", timeStr)
	_, errVehicle := qtx.AddVehicle(ctx, database.AddVehicleParams{
		ID:           uuid.New().String(),
		Code:         newCode,
		NumberPlate:  in.Number_Plate,
		CustomerID:   Id,
		ParkingLotID: in.Parking_Id,
	})
	if errVehicle != nil {
		return response.ErrCodeInsertDb, out, nil
	}

	if err := tx.Commit(); err != nil {
		return response.ErrCodeTransactionError, out, err
	}
	committed = true
	return response.ErrCodeSucces, *in, err
}

func (s *sCustomer) CheckTokenCustomer(ctx context.Context, token string) (Status bool, err error) {
	count, err := s.r.CheckKeyHashExists(ctx, token)
	if err != nil {
		return false, err
	}
	if count == 0 {
		return false, fmt.Errorf("token not exists")
	}
	return true, nil
}

func (s *sCustomer) LoginCustomer(ctx context.Context, in *model.LoginCustomerInput) (codeResult int, out model.LoginCustomerOutput, err error) {
	// Lấy email tài khoản
	customerInfo, err := s.r.GetStatusCustomerInfo(ctx, in.Username)
	if err != nil {
		return response.ErrCodeUserOtpNotExists, out, err
	}
	//Lấy thông tin tài khoản
	customerBase, err := s.r.GetOneCustomerInfo(ctx, customerInfo.Email)
	if err != nil {
		return response.ErrCodeUserOtpNotExists, out, err
	}
	out.ID = customerInfo.ID
	out.Email = customerInfo.Email
	// Kiểm tra mật khẩu
	if !crypto.MatchingPassword(customerBase.Password, in.Password, customerBase.Salt) {
		return response.ErrCodePasswordAccount, out, fmt.Errorf("does not match password")
	}

	if customerInfo.State != 1 {
		return response.ErrCodeStatusAccount, out, fmt.Errorf("tài khoản đã bị khóa hoặc chưa kích hoạt")
	}
	if customerInfo.IsAuthentication != 1 {
		return response.ErrCodeStatusAccount, out, fmt.Errorf("tài khoản chưa được xác thực")
	}
	subToken := utils.GenerateCliTokenUUID(int(customerBase.Number))
	log.Println("subtoken:", subToken)
	infoCustomerJson, err := json.Marshal(customerInfo)
	if err != nil {
		return response.ErrCodeConverJson, out, fmt.Errorf("convert to json failed: %v", err)
	}
	err = global.Rdb.Set(ctx, subToken, infoCustomerJson, time.Duration(consts.REFRESH_TOKEN)*time.Hour).Err()
	if err != nil {
		return response.ErrCodeSetCache, out, fmt.Errorf("lỗi ở phần set vào redis")
	}
	out.AccessToken, err = auth.CreateToken(subToken)
	if err != nil {
		return response.ErrCodeAuthFailed, out, fmt.Errorf("lỗi ở phần tạo token")
	}
	out.RefreshToken, err = auth.CreateRefreshToken(subToken)
	if err != nil {
		return response.ErrCodeAuthFailed, out, fmt.Errorf("lỗi ở phần tạo token")
	}
	// check bảng check customer id có tồn tại hay chưa
	customerIdFound, err := s.r.CheckCustomerIdExists(ctx, customerInfo.ID)
	if err != nil {
		return response.ErrCodeCheckCountAccount, out, fmt.Errorf("lỗi ở phần check customer id: %v", err)
	}
	if customerIdFound > 0 {
		err := s.r.UpdateRefreshTokenCustomer(ctx, database.UpdateRefreshTokenCustomerParams{
			CustomerID:   customerInfo.ID,
			RefreshToken: out.RefreshToken,
		})
		if err != nil {
			return response.ErrCodeUpdateTokenFailed, out, fmt.Errorf("lỗi update key: %v", err)
		}
	} else {
		err := s.r.InsertKeyCustomer(ctx, database.InsertKeyCustomerParams{
			ID:           uuid.NewString(),
			CustomerID:   customerInfo.ID,
			RefreshToken: out.RefreshToken,
		})
		if err != nil {
			return response.ErrCodeCreateTokenFailed, out, fmt.Errorf("lỗi insert key: %v", err)
		}
	}
	return response.ErrCodeSucces, out, err
}

func (s *sCustomer) LogoutCustomer(ctx context.Context) (codeResult int, err error) {
	// Lấy subjectUUID từ context
	subjectUUID := ctx.Value("subjectUUID")
	if subjectUUID == nil {
		return response.ErrCodeSubjectUUID, fmt.Errorf("subjectUUID not found in context")
	}
	// Lấy thông tin user từ cache
	var infoUser model.GetCacheToken
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeGetCache, err
	}
	// đưa vào danh sách blacklist
	redisKey := fmt.Sprintf("TOKEN_BLACK_LIST_%s", subjectUUID)
	err = global.Rdb.Set(ctx, redisKey, 1, time.Duration(consts.REFRESH_TOKEN)*time.Hour).Err()
	if err != nil {
		return response.ErrCodeSetCache, fmt.Errorf("lỗi ở phần set vào redis")
	}
	err = s.r.DeleteKeyCustomer(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeKeyCustomerDelete, err
	}
	return response.ErrCodeSucces, err
}

func (s *sCustomer) RefreshTokenCustomer(ctx context.Context, refreshToken string) (codeResult int, out model.LoginCustomerOutput, err error) {
	// kiểm tra refresh trong db
	countRefreshToken, err := s.r.CountRefreshTokenByCustomer(ctx, refreshToken)
	if countRefreshToken == 0 {
		fmt.Println("err0000:", err)
		return response.ErrCodeRefreshTokenused, out, fmt.Errorf("Tài khoản chưa được đăng ký hoặc đã đăng nhập ở nơi khác vui lòng đăng nhập lại")
	}
	// lấy Id của account
	subjectUUID := ctx.Value("subjectUUID")
	if subjectUUID == nil {
		fmt.Println("err1111:", err)
		return response.ErrCodeSubjectUUID, out, err
	}
	// Lấy thông tin user từ cache
	var infoUser model.GetCacheToken
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		fmt.Println("err22222:", err)
		return response.ErrCodeGetCache, out, err
	}
	// Kiểm tra trong db coi có sử dụng chưa
	getRefreshTokenUsed, err := s.r.FoundRefreshTokenByCustomerId(ctx, database.FoundRefreshTokenByCustomerIdParams{
		CustomerID:   infoUser.ID,
		JSONCONTAINS: fmt.Sprintf("[\"%s\"]", refreshToken),
	})
	if getRefreshTokenUsed > 0 {
		err := s.r.DeleteKey(ctx, infoUser.ID)
		return response.ErrCodeAuthFailed, out, err
	}
	// Lấy email tài khoản
	customerInfo, err := s.r.GetCustomerInfoById(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeUserOtpNotExists, out, err
	}
	// Lấy number customer
	customerBase, err := s.r.GetOneCustomerInfo(ctx, customerInfo.Email)
	if err != nil {
		return response.ErrCodeUserOtpNotExists, out, err
	}
	subToken := utils.GenerateCliTokenUUID(int(customerBase.Number))
	infoAccountJson, err := json.Marshal(customerInfo)
	if err != nil {
		return response.ErrCodeConverJson, out, fmt.Errorf("convert to json failed: %v", err)
	}
	err = global.Rdb.Set(ctx, subToken, infoAccountJson, time.Duration(consts.REFRESH_TOKEN)*time.Hour).Err()
	if err != nil {
		return response.ErrCodeSetCache, out, fmt.Errorf("lỗi ở phần set vào redis")
	}
	out.ID = customerInfo.ID
	out.Email = customerInfo.Email
	out.AccessToken, err = auth.CreateToken(subToken)
	out.RefreshToken, err = auth.CreateRefreshToken(subToken)
	err = s.r.UpdateRefreshTokenUsedByCustomerId(ctx, database.UpdateRefreshTokenUsedByCustomerIdParams{
		CustomerID:      infoUser.ID,
		RefreshToken:    out.RefreshToken,
		JSONARRAY:       out.RefreshToken, // Đảm bảo kiểu string
		JSONARRAYAPPEND: refreshToken,     // Ép kiểu đúng khi truyền vào
	})
	if err != nil {
		return response.ErrCodeUpdateRefreshToken, out, fmt.Errorf("lỗi update key: %v", err)

	}
	// update refresh token
	return codeResult, out, err
}

func (s *sCustomer) GetAllCustomer(ctx context.Context, page, pageSize int, search string, paymentID string) (codeResult int, out []model.CustomerOutput, total int64, err error) {
	offset := (page - 1) * pageSize
	var searchParam *string
	var paymentIDParam *string
	if search != "" {
		searchParam = &search
	}
	if paymentID != "" {
		paymentIDParam = &paymentID
	}
	// Lấy danh sách khách hàng
	lstCustomer, err := s.r.GetListCustomer(ctx, database.GetListCustomerParams{
		Limit:     int32(pageSize),
		Offset:    int32(offset),
		Column1:   searchParam,    // Tham số tìm kiếm
		CONCAT:    searchParam,    // Được sử dụng trong LIKE cho code
		CONCAT_2:  searchParam,    // Được sử dụng trong LIKE cho email
		CONCAT_3:  searchParam,    // Được sử dụng trong LIKE cho username
		Column5:   paymentIDParam, // Tham số payment_id
		Column6:   paymentIDParam, // Sử dụng trong điều kiện IS NULL OR = ''
		PaymentID: paymentID,      // Giá trị chính xác cho payment_id
	})

	if err != nil {
		return response.ErrCodeGetDb, out, total, err
	}

	// Đếm tổng số bản ghi thỏa mãn điều kiện
	total, err = s.r.CountListCustomer(ctx, database.CountListCustomerParams{
		Column1:   searchParam,    // Tham số tìm kiếm
		CONCAT:    searchParam,    // Được sử dụng trong LIKE cho code
		CONCAT_2:  searchParam,    // Được sử dụng trong LIKE cho email
		CONCAT_3:  searchParam,    // Được sử dụng trong LIKE cho username
		Column5:   paymentIDParam, // Tham số payment_id
		Column6:   paymentIDParam, // Sử dụng trong điều kiện IS NULL OR = ''
		PaymentID: paymentID,      // Giá trị chính xác cho payment_id
	})

	if err != nil {
		return response.ErrCodeGetDb, out, total, err
	}

	// Khởi tạo slice để tránh nil khi không có dữ liệu
	out = make([]model.CustomerOutput, 0, len(lstCustomer))

	// Chuyển đổi dữ liệu sang định dạng output
	for _, item := range lstCustomer {
		out = append(out, model.CustomerOutput{
			Code:     item.Code,
			Email:    item.Email,
			ID:       item.ID,
			Image:    item.Image,
			Payment:  item.Name,
			State:    int(item.State),
			UserName: item.Username,
		})
	}

	return response.ErrCodeSucces, out, total, nil
}

func (s *sCustomer) GetCustomerById(ctx context.Context, Id string) (codeResult int, out model.CustomerDetailOutput, err error) {
	findCustomerById, err := s.r.GetCustomerById(ctx, Id)
	if err != nil {
		return response.ErrCodeGetDb, out, err
	}
	out = model.CustomerDetailOutput{
		CustomerOutput: model.CustomerOutput{
			Code:     findCustomerById.Code,
			Email:    findCustomerById.Email,
			ID:       findCustomerById.ID,
			Image:    findCustomerById.Image,
			Payment:  findCustomerById.NamePayment,
			State:    int(findCustomerById.State),
			UserName: findCustomerById.Username,
		},
		Gender:           findCustomerById.Gender,
		Mobile:           findCustomerById.Mobile,
		Name_Parking_Lot: findCustomerById.NameParkingLot,
		Number_Plate:     findCustomerById.NumberPlate,
	}
	return response.ErrCodeSucces, out, err
}

func (s *sCustomer) GetStateByVerifyHash(ctx context.Context, verify_key_hash string) (codeResult int, state int8, err error) {
	state, err = s.r.CheckStateByVerifyHash(ctx, verify_key_hash)
	if err != nil {
		return response.ErrCodeGetDb, state, err
	}
	return response.ErrCodeSucces, state, err
}

func (s *sCustomer) LockAndUnlockCustomer(ctx context.Context, state int8, Id string) (codeResult int, err error) {
	// check customer exists
	countCustomer, err := s.r.CountCustomerById(ctx, Id)
	if err != nil {
		return response.ErrCodeGetDb, err
	}
	if countCustomer == 0 {
		return response.ErrCodeFoundCustomer, fmt.Errorf("Không tìm thấy khách hàng")
	}
	err = s.r.LockAndUnlockCustomerById(ctx, database.LockAndUnlockCustomerByIdParams{
		ID:    Id,
		State: state,
	})
	if err != nil {
		return response.ErrCodeUpdateDb, err
	}
	return response.ErrCodeSucces, err
}

package impl

import (
	"context"
	"database/sql"
	"fmt"
	"go-backend-api/internal/database"
	"go-backend-api/internal/model"
	"go-backend-api/internal/service"
	"go-backend-api/internal/utils/cache"
	"go-backend-api/internal/utils/random"
	"go-backend-api/pkg/response"
	"log"
	"strconv"
	"strings"
	"time"

	"github.com/google/uuid"
)

type sFuncpackage struct {
	r   *database.Queries
	qTx *sql.Tx
	db  *sql.DB
}

func NewFuncpackageImpl(r *database.Queries, qTx *sql.Tx, db *sql.DB) service.Ifuncpackage {
	return &sFuncpackage{
		r:   r,
		qTx: qTx,
		db:  db,
	}
}

func (s *sFuncpackage) CreateFuncPackage(ctx context.Context, in *model.FuncpackageInput) (codeResult int, out model.FuncpackageOutput, err error) {
	var leftValue, rightValue int32
	newID := uuid.New().String()
	// Bắt đầu transaction
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
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeRoleError, out, err
	}
	// Nếu created_by trống, đây là node gốc

	// Lấy thông tin của node cha
	RoleId, err := s.r.GetOneRoleAccountByAccountId(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeRoleAccountNotFound, model.FuncpackageOutput{}, fmt.Errorf("role id not found: %w", err)
	}
	parentRole, err := s.r.GetParentRoleInfo(ctx, RoleId.RoleID)
	if err != nil {
		return response.ErrCodeRoleAccountNotFound, model.FuncpackageOutput{}, fmt.Errorf("parent role not found: %w", err)
	}

	// Lấy giá trị role max number của tài khoản hiện tại
	rolemaxnumber, err := s.r.GetRoleById(ctx, RoleId.RoleID)
	if err != nil {
		return response.ErrCodeMaxRole, model.FuncpackageOutput{}, fmt.Errorf("failed to get role max number: %w", err)
	}
	// Lấy tổng giá trị mà được phép tạo của tài khoản hiện tại
	summaxnumber, err := s.r.GetTotalAccounts(ctx, database.GetTotalAccountsParams{
		CreatedBy: infoUser.ID,
		Column2:   infoUser.ID,
		Column3:   infoUser.ID,
	})
	if err != nil {
		return response.ErrCodeMaxRole, model.FuncpackageOutput{}, fmt.Errorf("Lỗi khi lấy tổng số tài khoản được phép tạo: %w", err)
	}
	summaxnumberInt64 := summaxnumber.(int64)
	accountCreated, err := s.r.GetAccountCreated(ctx, infoUser.ID)
	if int64(rolemaxnumber.RoleMaxNumber) <= (summaxnumberInt64 + int64(in.Role_max_number) + accountCreated) {
		return response.ErrCodeRoleAccountValid, model.FuncpackageOutput{}, fmt.Errorf("Số lượng tài khoản của gói này đã vượt quá số lượng cho phép")
	}
	// Cập nhật right values
	err = qtx.UpdateRightValuesForInsert(ctx, parentRole.RoleRightValue)
	if err != nil {
		return response.ErrCodeRoleError, model.FuncpackageOutput{}, fmt.Errorf("failed to update right values: %w", err)
	}

	// Cập nhật left values
	err = qtx.UpdateLeftValuesForInsert(ctx, parentRole.RoleRightValue)
	if err != nil {
		return response.ErrCodeRoleError, model.FuncpackageOutput{}, fmt.Errorf("failed to update left values: %w", err)
	}

	leftValue = parentRole.RoleRightValue
	rightValue = parentRole.RoleRightValue + 1
	code := "TC_" + strconv.Itoa(random.GenerateSixDigitOtp())
	// Tạo role mới
	_, err = qtx.CreateRole(ctx, database.CreateRoleParams{
		ID:             newID,
		Code:           code,
		RoleName:       in.Role_name,
		RoleLeftValue:  leftValue,
		RoleRightValue: rightValue,
		RoleMaxNumber:  int32(in.Role_max_number),
		LicenseID:      "",
		CreatedBy:      infoUser.ID,
	})
	if err != nil {
		return response.ErrCodeRoleError, model.FuncpackageOutput{}, fmt.Errorf("failed to create role: %w", err)
	}
	// Commit transaction
	if err = tx.Commit(); err != nil {
		return response.ErrCodeRoleError, model.FuncpackageOutput{}, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return response.ErrCodeSucces, model.FuncpackageOutput{
		Id:   newID,
		Code: code,
		FuncpackageInput: model.FuncpackageInput{
			Role_name:       in.Role_name,
			Role_max_number: in.Role_max_number,
		},
	}, nil
}
func (s *sFuncpackage) GetAllFuncPackageByCreatedBy(ctx context.Context, page, pageSize int, search string) (codeResult int, out []model.FuncpackageOutput, total int64, err error) {
	subjectUUID := ctx.Value("subjectUUID")
	var infoUser model.GetCacheToken
	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		log.Println("111111111111111:", err)
		return response.ErrCodeRoleError, out, 0, err
	}

	// Lấy tổng số bản ghi trước
	total, err = s.r.CountAllFuncPackageByCreatedBy(ctx, database.CountAllFuncPackageByCreatedByParams{
		CreatedBy: infoUser.ID,
		Column2:   search,
		CONCAT:    search, // for r.code
		CONCAT_2:  search, // for r.role_name
		CONCAT_3:  search, // for a.username
		CONCAT_4:  search, // for a.name
		CONCAT_5:  search, // for m.menu_name
	})
	if err != nil {
		log.Println("3333333333333333333:", err)
		return response.ErrCodeRoleError, nil, 0, err
	}

	// Tính toán offset
	offset := (page - 1) * pageSize

	// Kiểm tra nếu offset vượt quá tổng số bản ghi
	if int64(offset) >= total {
		return response.ErrCodeSucces, []model.FuncpackageOutput{}, total, nil
	}

	lstFuncpackage, err := s.r.GetAllFuncPackageByCreatedBy(ctx, database.GetAllFuncPackageByCreatedByParams{
		CreatedBy: infoUser.ID,
		Limit:     int32(pageSize),
		Offset:    int32(offset),
		Column2:   search,
		CONCAT:    search, // for r.code
		CONCAT_2:  search, // for r.role_name
		CONCAT_3:  search, // for a.username
		CONCAT_4:  search, // for a.name
		CONCAT_5:  search, // for m.menu_name
	})
	if err != nil {
		log.Println("222222222222222222222222:", err)
		return response.ErrCodeRoleError, out, 0, fmt.Errorf("Lỗi khi lấy danh sách gói chức năng")
	}

	for _, item := range lstFuncpackage {
		// Xử lý menu names
		var menuNames []string
		if item.MenuNames.Valid && item.MenuNames.String != "" {
			menuNames = strings.Split(item.MenuNames.String, ",")
		}

		// Xử lý account names
		var accountNames []string
		if item.AccountNames.Valid && item.AccountNames.String != "" {
			accountNames = strings.Split(item.AccountNames.String, ",")
		}

		// Xử lý account IDs
		var accountIDs []string
		if item.AccountIds.Valid && item.AccountIds.String != "" {
			accountIDs = strings.Split(item.AccountIds.String, ",")
		}

		// Xử lý account statuses
		var accountStatuses []string
		if item.AccountStatuses.Valid && item.AccountStatuses.String != "" {
			accountStatuses = strings.Split(item.AccountStatuses.String, ",")
		}

		// Debug logging để kiểm tra dữ liệu
		log.Printf("Item ID: %s", item.ID)
		log.Printf("Account Names: %v (length: %d)", accountNames, len(accountNames))
		log.Printf("Account IDs: %v (length: %d)", accountIDs, len(accountIDs))
		log.Printf("Account Statuses: %v (length: %d)", accountStatuses, len(accountStatuses))
		log.Printf("Raw Account Statuses String: '%s'", item.AccountStatuses.String)

		// Xử lý status
		status := "Chưa thiết lập"
		var dateEndStr string
		if item.DateEnd != nil {
			switch v := item.DateEnd.(type) {
			case string:
				dateEndStr = v
			case []byte:
				dateEndStr = string(v)
			}
		}
		var dateStartTime time.Time
		dateStartValid := false
		if item.DateStart != nil {
			switch v := item.DateStart.(type) {
			case time.Time:
				dateStartTime = v
				dateStartValid = true
			}
		}
		if len(menuNames) > 0 {
			if dateEndStr != "" {
				endDate, err := time.Parse("2006-01-02 15:04:05", dateEndStr)
				log.Println("endDate: ", endDate)
				if err == nil && dateStartValid {
					today := time.Now()
					daysDiff := daysBetweenDates(dateStartTime, endDate)
					if endDate.Before(today) || endDate.Equal(today) {
						status = "Hết hạn"
					} else if daysDiff <= 7 {
						status = "Sắp hết hạn"
					} else {
						status = "Hoạt động"
					}
				}
			}
		}

		// Xử lý thời gian sử dụng
		var convertUse string
		if dateEndStr == "NO_EXPIRATION" {
			convertUse = "Vô thời hạn"
			status = "Vô thời hạn"
		} else {
			if dateStartValid {
				startDateStr := dateStartTime.Format("2006-01-02 15:04:05")
				convertUse = startDateStr + " " + dateEndStr
			} else {
				convertUse = "Không xác định"
			}
		}

		// Tạo danh sách menus
		var menus []model.Menu
		for _, name := range menuNames {
			if trimmed := strings.TrimSpace(name); trimmed != "" {
				menus = append(menus, model.Menu{Menu_Name: trimmed})
			}
		}

		// Tạo danh sách accounts - FIX: Xử lý chính xác việc mapping status
		var accounts []model.Account
		maxLength := len(accountNames)
		if len(accountIDs) > maxLength {
			maxLength = len(accountIDs)
		}

		for i := 0; i < maxLength; i++ {
			accountName := ""
			accountID := ""
			accountStatus := "Chưa xác định"

			// Lấy account name nếu có
			if i < len(accountNames) {
				accountName = strings.TrimSpace(accountNames[i])
			}

			// Lấy account ID nếu có
			if i < len(accountIDs) {
				accountID = strings.TrimSpace(accountIDs[i])
			}

			// Lấy account status nếu có - FIX: Kiểm tra chặt chẽ hơn
			if i < len(accountStatuses) {
				statusValue := strings.TrimSpace(accountStatuses[i])
				log.Printf("Processing account %d: name='%s', id='%s', status_raw='%s'", i, accountName, accountID, statusValue)

				switch statusValue {
				case "1":
					accountStatus = "Hoạt động"
				case "0":
					accountStatus = "Bị khóa"
				case "":
					accountStatus = "Chưa xác định"
				default:
					// Log để debug các giá trị không mong đợi
					log.Printf("Unexpected status value: '%s' for account %s", statusValue, accountID)
					accountStatus = "Chưa xác định"
				}
			} else {
				log.Printf("No status found for account %d (name='%s', id='%s')", i, accountName, accountID)
			}

			// Chỉ thêm account nếu có đủ thông tin cần thiết
			if accountName != "" && accountID != "" {
				accountCreated, err := s.r.CheckTotalAccountChildExists(ctx, accountID)
				if err != nil {
					log.Printf("Error checking account child exists for ID %s: %v", accountID, err)
					return response.ErrCodeRoleError, nil, 0, err
				}

				accounts = append(accounts, model.Account{
					Account_Id:           accountID,
					Account_Name:         accountName,
					Account_number:       int(accountCreated),
					Account_total_number: int(item.RoleMaxNumber),
					Account_status:       accountStatus,
				})
			} else {
				log.Printf("Skipping account %d due to missing name or ID: name='%s', id='%s'", i, accountName, accountID)
			}
		}

		out = append(out, model.FuncpackageOutput{
			Id:           item.ID,
			Status:       status,
			Date_use:     convertUse,
			TotalAccount: int(item.AccountCount),
			Menus:        menus,
			Accounts:     accounts,
			License_Id:   item.LicenseID,
			Code:         item.Code,
			FuncpackageInput: model.FuncpackageInput{
				Role_name:       item.RoleName,
				Role_max_number: int(item.RoleMaxNumber),
			},
		})
	}

	return response.ErrCodeSucces, out, total, nil
}
func (s *sFuncpackage) DeleteFuncPackage(ctx context.Context, id string) (codeResult int, err error) {
	// Bắt đầu transaction
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, fmt.Errorf("failed to begin transaction: %w", err)
	}
	defer tx.Rollback()
	// Kiểm tra có tài khoản đang sử dụng hay không
	countRoleAccount, err := s.r.CheckCountRoleId(ctx, id)
	if err != nil {
		return response.ErrCodeAccountSum, fmt.Errorf("failed to check count role account: %w", err)
	}
	if countRoleAccount > 0 {
		return response.ErrCodeDeleteAccount, fmt.Errorf("Vui lòng xóa tài khoản đang sử dụng gói chức năng này trước")
	}
	// Xóa role
	// Lấy thông tin
	role, err := s.r.GetRoleById(ctx, id)
	if err != nil {
		return response.ErrCodeRoleNotFound, fmt.Errorf("role not found: %w", err)
	}
	// Kiểm tra có gói con hay không nếu có không được xóa
	if role.RoleRightValue-role.RoleLeftValue > 1 {
		return response.ErrCodeRoleError, fmt.Errorf("Vui lòng xóa gói chức năng con trước")
	}
	left := role.RoleLeftValue
	right := role.RoleRightValue
	width := right - left + 1
	if err := s.r.SoftDeleteRolesByRange(ctx, database.SoftDeleteRolesByRangeParams{
		UpdateAt:       time.Now(),
		RoleLeftValue:  left,
		RoleRightValue: right,
	}); err != nil {
		return response.ErrCodeRoleError, fmt.Errorf("failed to delete roles: %w", err)
	}
	if err := s.r.DecreaseParentRightValues(ctx, database.DecreaseParentRightValuesParams{
		RoleRightValue:   width,
		RoleLeftValue:    left,
		RoleRightValue_2: right,
	}); err != nil {
		return response.ErrCodeRoleError, fmt.Errorf("failed to decrease parent right values: %w", err)
	}
	if err := s.r.DecreaseLeftValues(ctx, database.DecreaseLeftValuesParams{
		RoleLeftValue:   width,
		RoleLeftValue_2: left,
	}); err != nil {
		return response.ErrCodeRoleError, fmt.Errorf("failed to decrease left values: %w", err)
	}
	if err := s.r.DecreaseRightValues(ctx, database.DecreaseRightValuesParams{
		RoleRightValue:   width,
		RoleRightValue_2: right,
	}); err != nil {
		return response.ErrCodeRoleError, fmt.Errorf("failed to decrease right values: %w", err)
	}
	// Commit transaction
	if err = tx.Commit(); err != nil {
		return response.ErrCodeRoleError, fmt.Errorf("failed to commit transaction: %w", err)
	}

	return response.ErrCodeSucces, nil
}

func (s *sFuncpackage) GetAllFuncPackageSelectByCreatedBy(ctx context.Context) (codeResult int, out []model.FuncpackageSelectOutput, err error) {
	subjectUUID := ctx.Value("subjectUUID")
	var infoUser model.GetCacheToken

	// Lấy Id tài khoản đang đăng nhập từ context
	if err := cache.GetCache(ctx, subjectUUID.(string), &infoUser); err != nil {
		return response.ErrCodeRoleError, out, err
	}

	items, err := s.r.GetAllFuncPackageSelectByCreatedBy(ctx, infoUser.ID)
	if err != nil {
		return response.ErrCodeRoleError, out, err
	}

	for _, item := range items {
		var status string

		// Convert dateend thành string
		var dateStr string
		if bytes, ok := item.Dateend.([]byte); ok {
			dateStr = string(bytes)
		} else if str, ok := item.Dateend.(string); ok {
			dateStr = str
		}

		// Kiểm tra trạng thái
		if dateStr == "NO_EXPIRATION" {
			status = "Đang hoạt động"
		} else if dateStr != "" {
			// Parse thành time và so sánh với hiện tại
			if endTime, err := time.Parse("2006-01-02 15:04:05", dateStr); err == nil {
				if time.Now().Before(endTime) {
					status = "Đang hoạt động"
				} else {
					status = "Hết hạn"
				}
			} else {
				status = "Hết hạn"
			}
		} else {
			status = "Hết hạn"
		}

		out = append(out, model.FuncpackageSelectOutput{
			Id:     item.ID,
			Name:   item.RoleName,
			Status: status,
		})
	}

	return response.ErrCodeSucces, out, nil
}

func daysBetweenDates(date1, date2 time.Time) int {
	t1 := time.Date(date1.Year(), date1.Month(), date1.Day(), 0, 0, 0, 0, date1.Location())
	t2 := time.Date(date2.Year(), date2.Month(), date2.Day(), 0, 0, 0, 0, date2.Location())

	return int(t2.Sub(t1).Hours() / 24)
}

package account

import (
	"go-backend-api/internal/model"
	"go-backend-api/internal/service"
	"go-backend-api/pkg/response"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

var Accounts = new(cAccount)

type cAccount struct {
	accountService service.Iaccount
}

// GetAllAccount
// @Summary      Lấy danh sách tất cả tài khoản
// @Description  API này trả về danh sách tất cả tài khoản trong hệ thống
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param search query string false "Từ khóa tìm kiếm"
// @Param page query int false "Số trang (mặc định: 1)"
// @Param page_size query int false "Số lượng mỗi trang (mặc định: 20)"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /account/get_all_account [GET]
func (ac *cAccount) GetAllAccount(ctx *gin.Context) {
	page := 1
	pageSize := 20

	if pageStr := ctx.Query("page"); pageStr != "" {
		if p, err := strconv.Atoi(pageStr); err == nil && p > 0 {
			page = p
		}
	}

	if pageSizeStr := ctx.Query("page_size"); pageSizeStr != "" {
		if ps, err := strconv.Atoi(pageSizeStr); err == nil && ps > 0 {
			pageSize = ps
		}
	}
	search := ctx.Query("search")
	statusCode, accounts, total, err := service.AccountItem().GetAllAccount(ctx.Request.Context(), page, pageSize, search)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}
	paginatedResponse := model.NewPaginationResponse(accounts, page, pageSize, total)
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    paginatedResponse,
	})
}

// GetAccountById
// @Summary      Lấy tài khoản theo ID
// @Description  API này trả về tài khoản theo ID
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID tài khoản cần lấy"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /account/get_account_by_id/{id} [GET]
func (ac *cAccount) GetAccountById(ctx *gin.Context) {
	id := ctx.Param("id") // Lấy ID từ request
	statusCode, account, err := service.AccountItem().GetAccountById(ctx, id)
	if err != nil {
		log.Printf("Error getting account: %v", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    account,
	})
}

// UpdateAccount
// @Summary      Cập nhật tài khoản
// @Description  API này cập nhật thông tin tài khoản dựa trên ID
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID tài khoản cần cập nhật"
// @Param        body body   model.AccountEditInput true "Dữ liệu cập nhật tài khoản"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /account/update_account/{id} [PUT]
func (ac *cAccount) UpdateAccount(ctx *gin.Context) {
	id := ctx.Param("id")
	var modelAccount model.AccountEditInput
	if err := ctx.ShouldBindJSON(&modelAccount); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"error": "Invalid input data"})
		return
	}
	statusCode, account, err := service.AccountItem().UpdateAccount(ctx, &modelAccount, id)
	if err != nil {
		log.Printf("Error update account: %v", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    account,
	})
}

// DeleteAccount
// @Summary      Xóa nhiều tài khoản
// @Description  API xóa nhiều tài khoản dựa trên ID
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        body  body  []string  true  "Danh sách ID của tài khoản cần xóa"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /account/delete_account/{id} [DELETE]
func (ac *cAccount) DeleteAccounts(ctx *gin.Context) {
	var ids []string

	if err := ctx.ShouldBindJSON(&ids); err != nil {
		response.ErrorResponse(ctx, http.StatusBadRequest, "Dữ liệu đầu vào không hợp lệ")
		return
	}

	statusCode, err := service.AccountItem().DeleteAccounts(ctx, ids)
	if err != nil {
		log.Printf("Error deleting account: %v", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}

	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    nil,
	})
}

// CreateAccount
// @Summary      Tạo tài khoản mới
// @Description  API này cho phép tạo tài khoản mới
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        body  body   model.AccountInput  true  "Thông tin tài khoản cần tạo"
// @Success      200   {object}  response.ResponseData
// @Failure      400   {object}  response.ErrorResponseData
// @Failure      500   {object}  response.ErrorResponseData
// @Router       /account/create_account [POST]
func (ac *cAccount) CreateAccount(ctx *gin.Context) {
	var params model.AccountInput
	//  Lấy role account của tài khoản đang tạo
	// Kiểm tra số lượng account được phép tạo
	// check valid
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, gin.H{"error": "Invalid input data"})
		return
	}

	// call service CreateAccount
	statusCode, account, err := service.AccountItem().CreateAccount(ctx.Request.Context(), &params)
	if err != nil {
		log.Printf("Error creating account: %v", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}

	// respone data
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    account,
	})
}

// LockAndUnlockAccount
// @Summary      Khóa hoặc mở khóa tài khoản
// @Description  API này khóa hoặc mở khóa thông tin tài khoản dựa trên ID
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID tài khoản cần khóa hoặc mở khóa"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /account/lock_and_unlock_account/{id} [PUT]
func (ac *cAccount) LockAndUnlockAccount(ctx *gin.Context) {
	id := ctx.Param("id")
	statusCode, err := service.AccountItem().LockAndUnlockAccount(ctx.Request.Context(), id)
	if err != nil {
		log.Printf("Error getting account: %v", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    nil,
	})
}

// ResetPasswordAccount
// @Summary      Reset mật khẩu tài khoản
// @Description  API reset mật khẩu tài khoản dựa trên ID
// @Tags         Account
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID tài khoản cần reset Reset mật khẩu"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /account/reset_password_account/{id} [PUT]
func (ac *cAccount) ResetPasswordAccount(ctx *gin.Context) {
	id := ctx.Param("id")
	statusCode, err := service.AccountItem().ResetPasswordAccount(ctx.Request.Context(), id)
	if err != nil {
		log.Printf("Error reset password account: %v", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    nil,
	})
}

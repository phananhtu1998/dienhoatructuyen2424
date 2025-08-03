package customer

import (
	"go-backend-api/global"
	"go-backend-api/internal/model"
	"go-backend-api/internal/service"
	"go-backend-api/pkg/response"
	"log"
	"net/http"
	"strconv"

	"github.com/gin-gonic/gin"
	"go.uber.org/zap"
)

// management controller Login Customer
var Customer = new(cCustomerLogin)

type cCustomerLogin struct {
	CustomerService service.Icustomer
}

// Customer Registration documentation
// @Summary      Đăng ký người dùng khách hàng
// @Description  Đang ký người dùng khách hàng
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Param        payload body model.CustomerVerifyInput true "payload"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/register [post]
func (c *cCustomerLogin) Register(ctx *gin.Context) {
	var params model.CustomerVerifyInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	codeStatus, err := service.CustomerItem().Register(ctx.Request.Context(), &params)
	if err != nil {
		global.Logger.Error("Error registering user OTP", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeStatus,
			Message: response.Msg[codeStatus],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeStatus,
		Message: response.Msg[codeStatus],
		Data:    nil,
	})
}

// Verify OTP documentation
// @Summary      Xác thực OTP
// @Description  Xác thực OTP
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Param        payload body model.VerifyInput true "payload"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/verify_otp [post]
func (c *cCustomerLogin) VerifyOTP(ctx *gin.Context) {
	var params model.VerifyInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	codeResult, output, err := service.CustomerItem().VerifyOTP(ctx.Request.Context(), &params)
	if err != nil {
		global.Logger.Error("Error registering user OTP", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: response.Msg[http.StatusBadRequest],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeResult,
		Message: response.Msg[codeResult],
		Data:    output,
	})
}

// Change Password documentation
// @Summary      Thay đổi password
// @Description  Thay đổi password
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Param        payload body model.UpdatePasswordRegisterInput true "payload"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/update_password_register [post]
func (c *cCustomerLogin) UpdatePasswordRegister(ctx *gin.Context) {
	var params model.UpdatePasswordRegisterInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	output, codeResult, err := service.CustomerItem().UpdatePasswordRegister(ctx.Request.Context(), params.Token, params.Password)
	if err != nil {
		global.Logger.Error("Error change password user", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: response.Msg[http.StatusBadRequest],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeResult,
		Message: response.Msg[codeResult],
		Data:    output,
	})
}

// UpdateCustomerInfo
// @Summary      Cập nhật customer info
// @Description  API cập nhật customer info dựa trên ID
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Security     TokenKey
// @Param        id   path   string  true  "Id"
// @Param        body body  model.UpdateInfoCustomerInput true "Customer info cần cập nhật"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/update_customer_info/{id} [PUT]
func (ac *cCustomerLogin) UpdateInfoCustomer(ctx *gin.Context) {
	Id := ctx.Param("id")
	var customerInfoUpdates model.UpdateInfoCustomerInput
	if err := ctx.ShouldBindJSON(&customerInfoUpdates); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	code, updatedMenus, err := service.CustomerItem().UpdateInfoCustomer(ctx.Request.Context(), &customerInfoUpdates, Id)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    code,
			Message: response.Msg[code],
			Data:    nil,
		})
		return
	}

	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    code,
		Message: response.Msg[code],
		Data:    updatedMenus,
	})
}

// Authenticate
// @Summary      Login
// @Description  Login
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Param        payload body model.LoginCustomerInput true "payload"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Failure      400  {object}  response.ErrorResponseData  "Bad Request"
// @Router       /customer/login [post]
func (c *cCustomerLogin) Login(ctx *gin.Context) {
	// Implement logic for login
	var params model.LoginCustomerInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	codeRs, dataRs, err := service.CustomerItem().LoginCustomer(ctx.Request.Context(), &params)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeRs,
			Message: response.Msg[codeRs],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeRs,
		Message: response.Msg[codeRs],
		Data:    dataRs,
	})
}

// Authenticate
// @Summary      Logout
// @Description  Logout
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/logout [post]
func (c *cCustomerLogin) Logout(ctx *gin.Context) {
	codeRs, err := service.CustomerItem().LogoutCustomer(ctx.Request.Context())
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeRs,
			Message: response.Msg[codeRs],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeRs,
		Message: response.Msg[codeRs],
		Data:    nil,
	})
}

// Authenticate
// @Summary      RefreshToken
// @Description  RefreshToken
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Param        RefreshToken  header  string  true  "Refresh Token"
// @Security     BearerAuth
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/refresh-token [post]
func (c *cCustomerLogin) RefreshTokens(ctx *gin.Context) {
	RefreshToken := ctx.GetHeader("RefreshToken")
	if RefreshToken == "" {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: "RefreshToken is missing",
			Data:    nil,
		})
		return
	}
	codeRs, data, err := service.CustomerItem().RefreshTokenCustomer(ctx.Request.Context(), RefreshToken)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeRs,
			Message: response.Msg[codeRs],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeRs,
		Message: response.Msg[codeRs],
		Data:    data,
	})
}

// GetAllCustomer
// @Summary      Lấy danh sách tất cả người dùng
// @Description  API này trả về danh sách tất cả người dùng trong hệ thống
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param search query string false "Từ khóa tìm kiếm"
// @Param payment query string false "Id của payment"
// @Param page query int false "Số trang (mặc định: 1)"
// @Param page_size query int false "Số lượng mỗi trang (mặc định: 20)"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/get_all_customer [GET]
func (ac *cCustomerLogin) GetAllCustomer(ctx *gin.Context) {
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
	payment := ctx.Query("payment")
	statusCode, customers, total, err := service.CustomerItem().GetAllCustomer(ctx.Request.Context(), page, pageSize, search, payment)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    statusCode,
			Message: response.Msg[statusCode],
			Data:    nil,
		})
		return
	}
	paginatedResponse := model.NewPaginationResponse(customers, page, pageSize, total)
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    statusCode,
		Message: response.Msg[statusCode],
		Data:    paginatedResponse,
	})
}

// GetCustomerById
// @Summary      Lấy khách hàng theo ID
// @Description  API này trả về khách hàng theo ID
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID khách hàng cần lấy"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/get_customer_by_id/{id} [GET]
func (ac *cCustomerLogin) GetCustomerById(ctx *gin.Context) {
	id := ctx.Param("id") // Lấy ID từ request
	statusCode, customer, err := service.CustomerItem().GetCustomerById(ctx, id)
	if err != nil {
		log.Printf("Error getting customer: %v", zap.Error(err))
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
		Data:    customer,
	})
}

// Lock And Unlock Customer
// @Summary      Khóa và mở khóa khách hàng
// @Description  Khóa và mở khóa khách hàng
// @Tags         Customer
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id path string true "Customer ID"
// @Param        payload body model.CustomerStateRequest true "State request"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /customer/lock_and_unlock_customer/{id} [post]
func (c *cCustomerLogin) LockAndUnlockCustomer(ctx *gin.Context) {
	var param model.CustomerStateRequest
	id := ctx.Param("id")

	if err := ctx.ShouldBindJSON(&param); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}

	codeResult, err := service.CustomerItem().LockAndUnlockCustomer(ctx.Request.Context(), param.State, id)
	if err != nil {
		global.Logger.Error("Error lock and unlock customer", zap.Error(err))
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: response.Msg[http.StatusBadRequest],
			Data:    nil,
		})
		return
	}

	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeResult,
		Message: response.Msg[codeResult],
		Data:    nil,
	})
}

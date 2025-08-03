package license

import (
	"go-backend-api/internal/model"
	"go-backend-api/internal/service"
	"go-backend-api/pkg/response"
	"net/http"

	"github.com/gin-gonic/gin"
)

var Licenses = new(cLicense)

type cLicense struct {
	LicenseService service.ILicense
}

// CreateLicense
// @Summary      Tạo mới license cho gói chức năng
// @Description  API tạo mới license cho gói chức năng
// @Tags         License
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        body  body   model.License  true  "Thông tin License cần tạo"
// @Success      200   {object}  response.ResponseData
// @Failure      400   {object}  response.ErrorResponseData
// @Failure      500   {object}  response.ErrorResponseData
// @Router       /license/create_license [POST]
func (ac *cLicense) CreateAccount(ctx *gin.Context) {
	var params model.License
	// check valid
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	code, license, err := service.LicenseItem().CreateLicense(ctx.Request.Context(), &params)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    code,
			Message: response.Msg[code],
			Data:    nil,
		})
		return
	}
	// respone data
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    code,
		Message: response.Msg[code],
		Data:    license,
	})
}

// LicenseReNewal
// @Summary      Gia hạn license
// @Description  API gia hạn license
// @Tags         License
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID license cần gia hạn"
// @Param        body body   model.LicenseRenewal true "Dữ liệu gia hạn license"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /license/license_renewal/{id} [PUT]
func (ac *cLicense) LicenseReNewal(ctx *gin.Context) {
	id := ctx.Param("id")
	var modelLicense model.LicenseRenewal
	if err := ctx.ShouldBindJSON(&modelLicense); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	statusCode, license, err := service.LicenseItem().LicenseReNewal(ctx.Request.Context(), &modelLicense, id)
	if err != nil {
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
		Data:    license,
	})
}

package funcpackage

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

var Funcpackages = new(cFuncpackage)

type cFuncpackage struct {
	funcpackageService service.Ifuncpackage
}

// Funcpackages
// @Summary Tạo gói chức năng
// @Description Api tạo gói chức năng trong hệ thống
// @Tags FuncPackages
// @Accept json
// @Produce json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        payload body model.FuncpackageInput true "payload"
// @Success 200 {object} response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router /funcpackage/create_func_package [post]
func (c *cFuncpackage) CreateFuncPackage(ctx *gin.Context) {
	var params model.FuncpackageInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	codeRole, dataRole, err := service.FuncpackageItem().CreateFuncPackage(ctx.Request.Context(), &params)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeRole,
			Message: response.Msg[codeRole],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    codeRole,
		Message: response.Msg[codeRole],
		Data:    dataRole,
	})
}

// Funcpackages
// @Summary Lấy gói chức năng
// @Description Api lấy gói chức năng trong hệ thống
// @Tags FuncPackages
// @Accept json
// @Produce json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param search query string false "Từ khóa tìm kiếm"
// @Param page query int false "Số trang (mặc định: 1)"
// @Param page_size query int false "Số lượng mỗi trang (mặc định: 20)"
// @Success 200 {object} response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router /funcpackage/get_all_func_package [GET]
func (c *cFuncpackage) GetAllFuncPackage(ctx *gin.Context) {
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
	codeFuncpackage, dataFuncpackage, total, err := service.FuncpackageItem().GetAllFuncPackageByCreatedBy(ctx.Request.Context(), page, pageSize, search)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeFuncpackage,
			Message: response.Msg[codeFuncpackage],
			Data:    nil,
		})
		return
	}
	paginatedResponse := model.NewPaginationResponse(dataFuncpackage, page, pageSize, total)
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    20001,
		Message: response.Msg[20001],
		Data:    paginatedResponse,
	})
}

// DeleteFuncPackage
// @Summary      Xóa gói chức năng
// @Description  API này xóa gói chức năng
// @Tags         FuncPackages
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID của gói chức năng cần xóa"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /funcpackage/delete_funcpackage/{id} [DELETE]
func (ac *cFuncpackage) DeleteFuncPackage(ctx *gin.Context) {
	id := ctx.Param("id")
	statusCode, err := service.FuncpackageItem().DeleteFuncPackage(ctx.Request.Context(), id)
	if err != nil {
		log.Printf("Error getting funcpackage: %v", zap.Error(err))
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

// Funcpackages
// @Summary Lấy gói chức năng cho select
// @Description Api lấy gói chức năng cho select trong hệ thống
// @Tags FuncPackages
// @Accept json
// @Produce json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Success 200 {object} response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router /funcpackage/get_all_func_package_select [GET]
func (c *cFuncpackage) GetAllFuncPackageSelect(ctx *gin.Context) {
	codeFuncpackage, dataFuncpackage, err := service.FuncpackageItem().GetAllFuncPackageSelectByCreatedBy(ctx.Request.Context())
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    codeFuncpackage,
			Message: response.Msg[codeFuncpackage],
			Data:    nil,
		})
		return
	}
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    20001,
		Message: response.Msg[20001],
		Data:    dataFuncpackage,
	})
}

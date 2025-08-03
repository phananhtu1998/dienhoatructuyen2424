package roles_menu

import (
	"go-backend-api/internal/model"
	"go-backend-api/internal/service"
	"go-backend-api/pkg/response"
	"net/http"

	"github.com/gin-gonic/gin"
)

var RolesMenus = new(cRolesMenu)

type cRolesMenu struct {
	rolesMenuService service.IRolesMenu
}

// GetFuncpackageMenuByFuncpackageId
// @Summary      Lấy chức năng menu theo ID
// @Description  API này trả về chức năng menu theo ID
// @Tags         FuncPackageMenu
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path   string  true  "ID function package"
// @Param        search query string false "Từ khóa tìm kiếm"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /funcpackagesmenu/get_funcpackage_menu_by_funcpackage_id/{id} [GET]
func (c *cRolesMenu) GetRoleMenuByRoleId(ctx *gin.Context) {
	id := ctx.Param("id")
	search := ctx.Query("search")
	code, menu, err := service.RolesMenuItem().GetRoleMenuByRoleId(ctx.Request.Context(), id, search)
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
		Data:    menu,
	})
}

// UpdateFuncpackageMenu godoc
// @Summary      Cập nhật chức năng menu
// @Description  Api cập nhật phân quyền menu cho chức năng
// @Tags         FuncPackageMenu
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path      string  true  "ID của role menu"
// @Param        payload body model.RolesMenu true "Thông tin cần cập nhật"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /funcpackagesmenu/update_funcpackage_menu/{id} [put]
func (c *cRolesMenu) UpdateRolesMenu(ctx *gin.Context) {
	id := ctx.Param("id")
	var input model.RolesMenu
	if err := ctx.ShouldBindJSON(&input); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}

	code, result, err := service.RolesMenuItem().UpdateRolesMenu(ctx.Request.Context(), id, &input)
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
		Data:    result,
	})
}

// DeleteFuncpackageMenu godoc
// @Summary      Xóa chức năng menu
// @Description  Api gói chức năng menu
// @Tags         FuncPackageMenu
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Param        id   path      string  true  "ID của Funcpackage menu"
// @Success      200  {object}  response.ResponseData
// @Failure      400  {object}  response.ErrorResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /funcpackagesmenu/delete_funcpackage_menu/{id} [delete]
func (c *cRolesMenu) DeleteRolesMenu(ctx *gin.Context) {
	id := ctx.Param("id")
	code, err := service.RolesMenuItem().DeleteRolesMenu(ctx.Request.Context(), id)
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
		Data:    nil,
	})
}

// CreateFuncpackageMenuMultiple
// @Summary Tạo nhiều menu theo chức năng
// @Description Api tạo nhiều menu theo chức năng cho hệ thống
// @Tags FuncPackageMenu
// @Accept json
// @Produce json
// @Security BearerAuth
// @Security     ApiKeyAuth
// @Param payload body []model.RolesMenu true "Funcpackage menu mapping details"
// @Success 200 {object} response.ResponseData
// @Failure 500 {object} response.ErrorResponseData "Server error"
// @Router /funcpackagesmenu/create_funcpackage_menu_multiple [post]
func (c *cRolesMenu) CreateMultipleRoleMenus(ctx *gin.Context) {
	// Lấy dữ liệu từ request body
	var params []model.RolesMenu
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}

	// Gọi service để tạo roles menu
	code, result, err := service.RolesMenuItem().CreateMultipleRoleMenus(ctx.Request.Context(), params)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    code,
			Message: response.Msg[code],
			Data:    nil,
		})
		return
	}
	// Trả về kết quả thành công
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    code,
		Message: response.Msg[code],
		Data:    result,
	})
}

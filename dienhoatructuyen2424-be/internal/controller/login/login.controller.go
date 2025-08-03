package login

import (
	"go-backend-api/internal/model"
	"go-backend-api/internal/service"
	"go-backend-api/pkg/response"
	"log"
	"net/http"

	"github.com/gin-gonic/gin"
)

var Logins = new(cLogin)

type cLogin struct {
	loginService service.ILogin
}

// Authenticate
// @Summary      Login
// @Description  Login
// @Tags         Authenticate
// @Accept       json
// @Produce      json
// @Param        payload body model.LoginInput true "payload"
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Failure      400  {object}  response.ErrorResponseData  "Bad Request"
// @Router       /auth/login [post]
func (c *cLogin) Login(ctx *gin.Context) {
	// Implement logic for login
	var params model.LoginInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	codeRs, dataRs, err := service.LoginItem().Login(ctx.Request.Context(), &params)
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
// @Tags         Authenticate
// @Accept       json
// @Produce      json
// @Security     BearerAuth
// @Security     ApiKeyAuth
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /auth/logout [post]
func (c *cLogin) Logout(ctx *gin.Context) {
	codeRs, err := service.LoginItem().Logout(ctx.Request.Context()) // truyền ctx.Request.Context để truyền giá trị subjectUUID
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
// @Tags         Authenticate
// @Accept       json
// @Produce      json
// @Param        RefreshToken  header  string  true  "Refresh Token"
// @Security     ApiKeyAuth
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /auth/refresh-token [post]
func (c *cLogin) RefreshTokens(ctx *gin.Context) {
	codeRs, data, err := service.LoginItem().RefreshTokens(ctx.Request.Context()) // truyền ctx.Request.Context để truyền giá trị subjectUUID
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

// Authenticate
// @Summary      ChangePassword
// @Description  ChangePassword
// @Tags         Authenticate
// @Accept       json
// @Produce      json
// @Param        payload body model.ChangePasswordInput true "payload"
// @Security     BearerAuth
// @Success      200  {object}  response.ResponseData
// @Failure      500  {object}  response.ErrorResponseData
// @Router       /auth/change_password [post]
func (c *cLogin) ChangePassword(ctx *gin.Context) {
	var params model.ChangePasswordInput
	if err := ctx.ShouldBindJSON(&params); err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    400,
			Message: response.Msg[400],
			Data:    nil,
		})
		return
	}
	log.Println("params:", &params)
	codeRs, dataRs, err := service.LoginItem().ChangePassword(ctx.Request.Context(), &params) // truyền ctx.Request.Context để truyền giá trị subjectUUID
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

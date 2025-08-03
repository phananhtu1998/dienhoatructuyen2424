package upload

import (
	"go-backend-api/internal/service"
	"go-backend-api/pkg/response"
	"net/http"

	"github.com/gin-gonic/gin"
)

// UploadFile
// @Summary Upload file
// @Description API upload file cho hệ thống
// @Tags Upload
// @Accept multipart/form-data
// @Produce json
// @Security BearerAuth
// @Security     ApiKeyAuth
// @Param file formData file true "File cần upload"
// @Success 200 {object} response.ResponseData
// @Failure 500 {object} response.ErrorResponseData "Server error"
// @Router /upload/upload_file [post]
func UploadFileHandler(ctx *gin.Context) {
	// Lấy file từ request
	file, err := ctx.FormFile("file")
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}

	// Mở file
	fileContent, err := file.Open()
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	defer fileContent.Close()
	fileURL, err := service.UploadItem().UploadFile(fileContent, file)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	// Trả về kết quả
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    20001,
		Message: response.Msg[20001],
		Data:    fileURL,
	})
}

// UploadFile
// @Summary Upload file
// @Description API upload file cho hệ thống
// @Tags Upload
// @Accept multipart/form-data
// @Produce json
// @Security TokenKey
// @Param file formData file true "File cần upload"
// @Success 200 {object} response.ResponseData
// @Failure 500 {object} response.ErrorResponseData "Server error"
// @Router /upload/upload_file_customer [post]
func UploadFileCustomer(ctx *gin.Context) {
	// Lấy file từ request
	file, err := ctx.FormFile("file")
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}

	// Mở file
	fileContent, err := file.Open()
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	defer fileContent.Close()
	fileURL, err := service.UploadItem().UploadFile(fileContent, file)
	if err != nil {
		ctx.JSON(http.StatusBadRequest, response.ResponseData{
			Code:    http.StatusBadRequest,
			Message: err.Error(),
			Data:    nil,
		})
		return
	}
	// Trả về kết quả
	ctx.JSON(http.StatusOK, response.ResponseData{
		Code:    20001,
		Message: response.Msg[20001],
		Data:    fileURL,
	})
}

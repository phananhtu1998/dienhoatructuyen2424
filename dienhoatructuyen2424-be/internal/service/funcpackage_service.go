package service

import (
	"context"
	"go-backend-api/internal/model"
)

type (
	Ifuncpackage interface {
		CreateFuncPackage(ctx context.Context, in *model.FuncpackageInput) (codeResult int, out model.FuncpackageOutput, err error)
		GetAllFuncPackageByCreatedBy(ctx context.Context, page, pageSize int, search string) (codeResult int, out []model.FuncpackageOutput, total int64, err error)
		DeleteFuncPackage(ctx context.Context, id string) (codeResult int, err error)
		GetAllFuncPackageSelectByCreatedBy(ctx context.Context) (codeResult int, out []model.FuncpackageSelectOutput, err error)
	}
)

var (
	localFuncpackage Ifuncpackage
)

func FuncpackageItem() Ifuncpackage {
	if localFuncpackage == nil {
		panic("implement localFuncpackage not found for interface IFuncpackage")
	}
	return localFuncpackage
}

func InitFuncpackageItem(i Ifuncpackage) {
	localFuncpackage = i
}

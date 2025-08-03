package service

import (
	"context"
	"go-backend-api/internal/model"
)

type (
	IMenu interface {
		CreateMenu(ctx context.Context, in *model.MenuInput) (codeResult int, out model.MenuOutput, err error)
		//CreateMultipleMenus(ctx context.Context, inputs []model.MenuInput) (codeResult int, out []model.MenuOutput, err error)
		// GetAllMenu(ctx context.Context) (codeResult int, out []model.MenuOutput, err error)
		GetAllMenuByRoleId(ctx context.Context, search string) (codeResult int, out []model.MenuOutputFuncpackage, err error)
		GetMenuById(ctx context.Context, id string) (codeResult int, out model.MenuOutput, err error)
		EditMenuById(ctx context.Context, menuUpdates []model.MenuInputEdit) (int, []model.MenuOutput, error)
		DeleteMenu(ctx context.Context, id string) (codeResult int, err error)
	}
)

var (
	localMenu IMenu
)

func MenuItem() IMenu {
	if localMenu == nil {
		panic("implement localMenu not found for interface IMenu")
	}
	return localMenu
}

func InitMenuItem(i IMenu) {
	localMenu = i
}

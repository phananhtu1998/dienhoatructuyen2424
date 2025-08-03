package service

import (
	"context"
	"go-backend-api/internal/model"
)

type (
	Iaccount interface {
		CreateAccount(ctx context.Context, in *model.AccountInput) (codeResult int, out model.AccountOutput, err error)
		GetAccountById(ctx context.Context, id string) (codeResult int, out model.AccountOutput, err error)
		UpdateAccount(ctx context.Context, in *model.AccountEditInput, id string) (codeResult int, out model.AccountOutput, err error)
		DeleteAccounts(ctx context.Context, ids []string) (codeResult int, err error)
		GetAllAccount(ctx context.Context, page, pageSize int, search string) (codeResult int, out []model.AccountOutput, total int64, err error)
		LockAndUnlockAccount(ctx context.Context, id string) (codeResult int, err error)
		ResetPasswordAccount(ctx context.Context, id string) (codeResult int, err error)
	}
)

var (
	localAccount Iaccount
)

func AccountItem() Iaccount {
	if localAccount == nil {
		panic("implement localUserLogin not found for interface IUserLogin")
	}
	return localAccount
}

func InitAccountItem(i Iaccount) {
	localAccount = i
}

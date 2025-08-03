package service

import (
	"context"
	"go-backend-api/internal/model"
)

type (
	Icustomer interface {
		Register(ctx context.Context, in *model.CustomerVerifyInput) (codeResult int, err error)
		VerifyOTP(ctx context.Context, in *model.VerifyInput) (codeResult int, out model.VerifyOTPOutput, err error)
		UpdatePasswordRegister(ctx context.Context, token string, password string) (out model.UpdatePasswordRegisterOutput, CodeResult int, err error)
		UpdateInfoCustomer(ctx context.Context, in *model.UpdateInfoCustomerInput, email string) (codeResult int, out model.UpdateInfoCustomerInput, err error)
		CheckTokenCustomer(ctx context.Context, token string) (Status bool, err error)
		LoginCustomer(ctx context.Context, in *model.LoginCustomerInput) (codeResult int, out model.LoginCustomerOutput, err error)
		LogoutCustomer(ctx context.Context) (codeResult int, err error)
		RefreshTokenCustomer(ctx context.Context, refreshToken string) (codeResult int, out model.LoginCustomerOutput, err error)
		GetAllCustomer(ctx context.Context, page, pageSize int, search string, payment_Id string) (codeResult int, out []model.CustomerOutput, total int64, err error)
		GetCustomerById(ctx context.Context, Id string) (codeResult int, out model.CustomerDetailOutput, err error)
		GetStateByVerifyHash(ctx context.Context, verify_key_hash string) (codeResult int, state int8, err error)
		LockAndUnlockCustomer(ctx context.Context, state int8, Id string) (codeResult int, err error)
	}
)

var (
	localCustomer Icustomer
)

func CustomerItem() Icustomer {
	if localCustomer == nil {
		panic("implement localCustomer not found for interface Icustomer")
	}
	return localCustomer
}

func InitCustomerItem(i Icustomer) {
	localCustomer = i
}

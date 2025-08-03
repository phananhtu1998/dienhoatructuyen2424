package manage

import (
	"go-backend-api/global"
	"go-backend-api/internal/controller/account"
	"go-backend-api/internal/middlewares"

	"github.com/gin-gonic/gin"
)

type AdminRouter struct{}

func (ar *AdminRouter) InitAdminRouter(Router *gin.RouterGroup) {
	// public router
	adminRouterPublic := Router.Group("/account")
	adminRouterPublic.Use(middlewares.AuthenMiddleware())
	adminRouterPublic.Use(middlewares.LicenseMiddleware())
	adminRouterPublic.Use(middlewares.PermissionMiddleware(global.Enforcer))
	adminRouterPublic.Use(middlewares.RateLimiterPrivateMiddlewareRedis())
	{
		adminRouterPublic.GET("/get_all_account", account.Accounts.GetAllAccount)
		adminRouterPublic.GET("/get_account_by_id/:id", account.Accounts.GetAccountById)
		adminRouterPublic.PUT("/update_account/:id", account.Accounts.UpdateAccount)
		adminRouterPublic.DELETE("/delete_account/:id", account.Accounts.DeleteAccounts)
		adminRouterPublic.POST("/create_account", account.Accounts.CreateAccount)
		adminRouterPublic.PUT("/lock_and_unlock_account/:id", account.Accounts.LockAndUnlockAccount)
		adminRouterPublic.PUT("/reset_password_account/:id", account.Accounts.ResetPasswordAccount)
	}
	// private router
	//adminRouterPrivate := Router.Group("/account")
	//adminRouterPrivate.Use(limiter())
	// adminRouterPrivate.Use(Authen())
	// adminRouterPrivate.Use(Permission())
	// {
	// 	adminRouterPrivate.POST("/test_transaction", account.Accounts.TestTransaction)
	// }
}

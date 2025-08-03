package customer

import (
	"go-backend-api/internal/controller/customer"
	"go-backend-api/internal/middlewares"

	"github.com/gin-gonic/gin"
)

type CustomerRouter struct{}

func (ar *CustomerRouter) InitCustomerRouter(Router *gin.RouterGroup) {
	customerRouterPublic := Router.Group("/customer")
	customerRouterPublic.Use(middlewares.RateLimiterGlobalMiddlewareRedis())
	{
		customerRouterPublic.POST("/register", customer.Customer.Register)
		customerRouterPublic.POST("/verify_otp", customer.Customer.VerifyOTP)
		customerRouterPublic.POST("/update_password_register", customer.Customer.UpdatePasswordRegister)
		customerRouterPublic.POST("/login", customer.Customer.Login)
	}
	customerRouter := Router.Group("/customer")
	customerRouter.Use(middlewares.CustomerMiddleware())
	{
		customerRouter.PUT("/update_customer_info/:id", customer.Customer.UpdateInfoCustomer)
	}
	customerRoutePrivate := Router.Group("/customer")
	customerRoutePrivate.Use(middlewares.AuthenMiddleware())
	customerRoutePrivate.Use(middlewares.RateLimiterPrivateMiddlewareRedis())
	{
		customerRoutePrivate.POST("/logout", customer.Customer.Logout)
		customerRoutePrivate.POST("/refresh-token", customer.Customer.RefreshTokens)
		customerRoutePrivate.GET("/get_all_customer", customer.Customer.GetAllCustomer)
		customerRoutePrivate.GET("/get_customer_by_id/:id", customer.Customer.GetCustomerById)
		customerRoutePrivate.POST("/lock_and_unlock_customer/:id", customer.Customer.LockAndUnlockCustomer)
	}
}

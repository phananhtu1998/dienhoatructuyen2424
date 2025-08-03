package funcpackage

import (
	"go-backend-api/global"
	"go-backend-api/internal/controller/funcpackage"
	"go-backend-api/internal/middlewares"

	"github.com/gin-gonic/gin"
)

type FuncpackageRouter struct{}

func (ar *FuncpackageRouter) InitFuncpackageRouter(Router *gin.RouterGroup) {
	funcpackageRouterPrivate := Router.Group("/funcpackage")
	funcpackageRouterPrivate.Use(middlewares.AuthenMiddleware())
	funcpackageRouterPrivate.Use(middlewares.LicenseMiddleware())
	funcpackageRouterPrivate.Use(middlewares.PermissionMiddleware(global.Enforcer))
	funcpackageRouterPrivate.Use(middlewares.RateLimiterPrivateMiddlewareRedis())
	{
		funcpackageRouterPrivate.POST("/create_func_package", funcpackage.Funcpackages.CreateFuncPackage)
		funcpackageRouterPrivate.GET("/get_all_func_package", funcpackage.Funcpackages.GetAllFuncPackage)
		funcpackageRouterPrivate.DELETE("/delete_funcpackage/:id", funcpackage.Funcpackages.DeleteFuncPackage)
		funcpackageRouterPrivate.GET("/get_all_func_package_select", funcpackage.Funcpackages.GetAllFuncPackageSelect)
	}
}

package menu

import (
	"go-backend-api/global"
	"go-backend-api/internal/controller/menu"
	"go-backend-api/internal/middlewares"

	"github.com/gin-gonic/gin"
)

type MenuRouter struct{}

func (ar *MenuRouter) InitAdminRouter(Router *gin.RouterGroup) {
	// private router
	menuRouterPrivate := Router.Group("/menu")
	menuRouterPrivate.Use(middlewares.AuthenMiddleware())
	menuRouterPrivate.Use(middlewares.RateLimiterPrivateMiddlewareRedis())
	menuRouterPrivate.Use(middlewares.PermissionMiddleware(global.Enforcer))
	menuRouterPrivate.Use(middlewares.LicenseMiddleware())
	{
		menuRouterPrivate.POST("/create_menu", menu.Menus.CreateMenu)
		menuRouterPrivate.GET("/get_menu_by_id/:id", menu.Menus.GetMenuById)
		menuRouterPrivate.PUT("/update_multiple_menu/", menu.Menus.EditMenuById)
		menuRouterPrivate.DELETE("/delete/:id", menu.Menus.DeleteMenu)
		menuRouterPrivate.GET("/get_all_menu_by_function_package", menu.Menus.GetAllMenuByRoleId)
	}

}

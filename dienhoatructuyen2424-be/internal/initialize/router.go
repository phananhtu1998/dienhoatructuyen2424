package initialize

import (
	"go-backend-api/global"
	consts "go-backend-api/internal/const"
	"go-backend-api/internal/middlewares"
	"go-backend-api/internal/routers"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func InitRouter() *gin.Engine {
	var r *gin.Engine
	if global.Config.Server.Mode == "dev" {
		gin.SetMode(gin.DebugMode)
		gin.ForceConsoleColor()
		r = gin.Default()
	} else {
		gin.SetMode(gin.ReleaseMode)
		r = gin.New()
		r.Use(gin.Recovery()) // Đảm bảo panic được xử lý
		r.Use(gin.Logger())
	}
	r.Use(cors.New(cors.Config{
		AllowAllOrigins:  true,
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Authorization", "X-API-Key"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
	}))
	// middleware
	r.Use(middlewares.RateLimiterGlobalMiddlewareRedis())
	r.Use(middlewares.PrometheusMiddleware())
	// Endpoint cho Prometheus scrape metrics
	r.GET("/metrics", gin.WrapH(promhttp.Handler()))
	manageRouter := routers.RouterGroupApp.Manage
	loginRouter := routers.RouterGroupApp.Login
	menuRouter := routers.RouterGroupApp.Menu
	// roleRouter := routers.RouterGroupApp.Role
	rolesMenuRouter := routers.RouterGroupApp.RolesMenu
	//roleAccountRouter := routers.RouterGroupApp.RoleAccount
	licenseRouter := routers.RouterGroupApp.License
	uploadRouter := routers.RouterGroupApp.Upload
	funcpackageRouter := routers.RouterGroupApp.Funcpackage
	customerRouter := routers.RouterGroupApp.Customer
	MainGroup := r.Group(consts.HOST_PREFIX)
	{
		MainGroup.GET("/ping", func(c *gin.Context) {
			c.JSON(200, gin.H{
				"status": "pong",
			})
		})
		MainGroup.GET("/checkstatus") //tracking monitor
	}
	{
		manageRouter.InitAdminRouter(MainGroup)
		loginRouter.InitLoginRouter(MainGroup)
		menuRouter.InitAdminRouter(MainGroup)
		//roleRouter.InitRoleRouter(MainGroup)
		rolesMenuRouter.InitRolesMenuRouter(MainGroup)
		//roleAccountRouter.InitRoleAccountsRouter(MainGroup)
		licenseRouter.InitLicenseRouter(MainGroup)
		uploadRouter.InitUploadRouter(MainGroup)
		funcpackageRouter.InitFuncpackageRouter(MainGroup)
		customerRouter.InitCustomerRouter(MainGroup)
	}
	return r
}

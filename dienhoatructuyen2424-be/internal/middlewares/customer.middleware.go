package middlewares

import (
	consts "go-backend-api/internal/const"
	"go-backend-api/internal/utils"
	"log"

	"github.com/gin-gonic/gin"
)

func CustomerMiddleware() gin.HandlerFunc {
	return func(c *gin.Context) {
		url := c.Request.URL.Path
		log.Println("URL request:", url)

		token := c.GetHeader("TokenKey")
		if token == "" {
			log.Println("TokenKeyHeader is missing")
			c.AbortWithStatusJSON(401, gin.H{"code": 401, "message": "Unauthorized"})
			return
		}

		if !utils.CheckTokenValid(token) {
			log.Println("Token is invalid or expired")
			c.AbortWithStatusJSON(401, gin.H{"code": 401, "message": "Unauthorized"})
			return
		}

		state := utils.GetCustomerStateByToken(token)
		if state != consts.StateActive {
			message := utils.GetMapValue(utils.CustomerStatusMap, state, "Không xác định")
			c.AbortWithStatusJSON(401, gin.H{"code": 401, "message": message})
			return
		}

		c.Next()
	}
}

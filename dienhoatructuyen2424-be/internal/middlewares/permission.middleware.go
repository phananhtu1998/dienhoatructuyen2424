package middlewares

import (
	"encoding/json"
	"go-backend-api/internal/model"
	"go-backend-api/internal/utils/auth"
	"go-backend-api/internal/utils/cache"
	"go-backend-api/internal/utils/rbac"
	"log"
	"net/http"
	"strings"

	"github.com/casbin/casbin/v2"
	"github.com/gin-gonic/gin"
)

func PermissionMiddleware(enforcer *casbin.SyncedEnforcer) gin.HandlerFunc {
	return func(c *gin.Context) {
		ctx := c.Request.Context()

		// Lấy token từ request
		jwtToken, _ := auth.ExtracBearerToken(c)
		claims, _ := auth.VerifyTokenSubject(jwtToken)

		var infoUser model.GetCacheToken
		if err := cache.GetCache(ctx, claims.Subject, &infoUser); err != nil {
			c.JSON(http.StatusUnauthorized, gin.H{"message": "Invalid user session"})
			c.Abort()
			return
		}

		// Lấy danh sách quyền của user từ DB
		lstUserPermission, err := rbac.GetFullPermisionByAccount(ctx, infoUser.ID)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"message": "Error retrieving user permissions"})
			c.Abort()
			return
		}

		// Xóa quyền cũ để đảm bảo clean
		enforcer.DeletePermissionsForUser(infoUser.ID)

		// Load quyền vào Casbin
		for _, perm := range lstUserPermission {
			perm.Method = strings.ReplaceAll(perm.Method, "'", "\"")
			var methods []string
			if err := json.Unmarshal([]byte(perm.Method), &methods); err != nil {
				continue
			}
			for _, method := range methods {
				// ✅ Dùng đúng infoUser.ID làm subject
				enforcer.AddPermissionForUser(infoUser.ID, perm.Menu_group_name, method)
			}
		}

		// Kiểm tra quyền user với Casbin
		fullPath := c.Request.URL.Path // ✅ Không TrimPrefix
		act := c.Request.Method
		sub := infoUser.ID

		log.Println("sub:", sub)
		log.Println("act:", act)
		log.Println("fullPath:", fullPath)

		allowed := false

		// Check trực tiếp
		hasDirectPermission, err := enforcer.Enforce(sub, fullPath, act)
		log.Println("hasDirectPermission:", hasDirectPermission)
		if err == nil && hasDirectPermission {
			allowed = true
		}

		// Nếu không có quyền trực tiếp, kiểm tra path cha
		if !allowed {
			pathParts := strings.Split(strings.Trim(fullPath, "/"), "/")
			var parentPath string
			for i := 0; i < len(pathParts)-1; i++ {
				if i == 0 {
					parentPath = "/" + pathParts[0]
				} else {
					parentPath = parentPath + "/" + pathParts[i]
				}

				hasParentPermission, err := enforcer.Enforce(sub, parentPath, act)
				log.Printf("Checking parent path: %s => %v", parentPath, hasParentPermission)
				if err == nil && hasParentPermission {
					allowed = true
					break
				}
			}
		}

		if !allowed {
			log.Printf("❌ Permission denied for user %s, path %s, method %s", sub, fullPath, act)
			c.AbortWithStatusJSON(http.StatusForbidden, gin.H{"message": "Permission denied"})
			return
		}

		// ✅ Cho phép tiếp tục xử lý
		c.Next()
	}
}

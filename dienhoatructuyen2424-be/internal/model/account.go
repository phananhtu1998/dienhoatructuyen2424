package model

type AccountInput struct {
	Name     string `json:"name" binding:"required" example:"Admin"`
	Email    string `json:"email" binding:"required" example:"admin@gmail.com"`
	UserName string `json:"username" binding:"required" example:"admin"`
	Status   bool   `json:"status"`
	Images   string `json:"images" example:"/upload/images/phananhtu.jpg"`
	RoleId   string `json:"role_id" binding:"required" example:"2b796313-1134-44b3-b527-2c27d41a1624"`
}
type AccountOutput struct {
	ID          string `json:"id"`
	Code        string `json:"code"`
	Name        string `json:"name"`
	UserName    string `json:"username"`
	Email       string `json:"email"`
	Status      bool   `json:"status"`
	Images      string `json:"images"`
	FuncPackage string `json:"funcpackage"`
}

type AccountEditInput struct {
	Name     string `json:"name" binding:"required" example:"Admin"`
	Code     string `json:"code" binding:"required" example:"TC_ADMIN"`
	Email    string `json:"email" binding:"required" example:"admin@gmail.com"`
	UserName string `json:"username" binding:"required" example:"admin"`
	Status   bool   `json:"status"`
	Images   string `json:"images" example:"/upload/images/phananhtu.jpg"`
}

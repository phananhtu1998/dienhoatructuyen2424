package model

import "time"

type Role struct {
	Id               string    `json:"id"`
	Code             string    `json:"code"`
	Role_name        string    `json:"role_name"`
	Role_left_value  int       `json:"role_left_value"`
	Role_right_value int       `json:"role_right_value"`
	Role_max_number  int       `json:"role_max_number"`
	Is_licensed      bool      `json:"is_licensed"`
	Created_by       string    `json:"created_by"`
	Is_deleted       bool      `json:"is_deleted"`
	Created_at       time.Time `json:"created_at"`
	Updated_by       string    `json:"updated_by"`
}
type FuncpackageInput struct {
	Role_name       string `json:"role_name"`
	Role_max_number int    `json:"role_max_number"`
}
type FuncpackageOutput struct {
	Id           string    `json:"id"`
	License_Id   string    `json:"license_id"`
	Code         string    `json:"code"`
	Status       string    `json:"status"`
	Date_use     string    `json:"date_use"`
	Menus        []Menu    `json:"menus"`
	Accounts     []Account `json:"accounts"`
	TotalAccount int       `json:"total_account"`
	FuncpackageInput
}

type Menu struct {
	Menu_Name string `json:"menu_name"`
}
type Account struct {
	Account_Id           string `json:"account_id"`
	Account_Name         string `json:"account_name"`
	Account_number       int    `json:"account_number"`
	Account_total_number int    `json:"account_total_number"`
	Account_status       string `json:"account_status"`
}
type RoleHierarchyOutput struct {
	Id        string                `json:"id"`
	Code      string                `json:"code"`
	Role_name string                `json:"role_name"`
	Children  []RoleHierarchyOutput `json:"children"`
}

type RolePermission struct {
	Id              string `json:"id"`
	Role_name       string `json:"role_name"`
	Menu_group_name string `json:"menu_group_name"`
	Method          string `json:"method"`
}

type FuncpackageSelectOutput struct {
	Id     string `json:"id"`
	Name   string `json:"name"`
	Status string `json:"status"`
}

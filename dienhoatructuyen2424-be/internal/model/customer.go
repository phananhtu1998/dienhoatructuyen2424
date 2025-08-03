package model

type CustomerVerifyInput struct {
	Verify_email string `json:"verify_email" binding:"required"`
}

type CustomerVerifyOutput struct {
	CustomerVerifyInput
	Id         string `json:"id"`
	Created_at string `json:"created_at"`
	Update_at  string `json:"update_at"`
}
type VerifyInput struct {
	Verify_email string `json:"Verify_email"`
	VerifyCode   string `json:"verify_code"`
}
type VerifyOTPOutput struct {
	Token string `json:"token"`
}
type UpdatePasswordRegisterInput struct {
	Token    string `json:"token"`
	Password string `json:"password"`
}

type UpdatePasswordRegisterOutput struct {
	Id string `json:"id"`
}

type UpdateInfoCustomerInput struct {
	Username     string `json:"username"`
	Name         string `json:"name"`
	Image        string `json:"image"`
	Mobile       string `json:"mobile"`
	Gender       int8   `json:"gender"`
	Birthday     string `json:"birthday"`
	Parking_Id   string `json:"parking_id"`
	Payment_Id   string `json:"payment_id"`
	Number_Plate string `json:"number_plate"`
}

type LoginCustomerInput struct {
	Username string `json:"username" binding:"required" example:"Admin"`
	Password string `json:"password" binding:"required" example:"thaco@1234"`
}

type LoginCustomerOutput struct {
	ID           string `json:"id"`
	Email        string `json:"email"`
	AccessToken  string `json:"accesstoken"`
	RefreshToken string `json:"refreshToken"`
}

type CustomerOutput struct {
	ID       string `json:"id"`
	Code     string `json:"code"`
	UserName string `json:"username"`
	Email    string `json:"email"`
	Image    string `json:"image"`
	Payment  string `json:"payment"`
	State    int    `json:"state"`
}

type CustomerDetailOutput struct {
	CustomerOutput
	Mobile           string `json:"mobile"`
	Birthday         string `json:"birthday"`
	Gender           int8   `json:"gender"`
	Number_Plate     string `json:"number_plate"`
	Name_Parking_Lot string `json:"name_parking_lot"`
}

type CustomerStateRequest struct {
	State int8 `json:"state"`
}

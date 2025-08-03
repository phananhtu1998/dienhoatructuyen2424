package response

const (
	ErrCodeSucces             = 20001 // success
	ErrCodeParamInvalid       = 20003 //email is invalid
	ErrInvalidToken           = 30001 // token invalid
	ErrCodeUpdateTokenFailed  = 30004 // update failed
	ErrCodeCreateTokenFailed  = 30005 // create failed
	ErrInvalidOTP             = 30002 // OTP invalid
	ErrSendEmailOtp           = 30003 // sent email
	ErrCodeSubjectUUID        = 30006 //
	ErrCodeRefreshTokenused   = 30007 // token not found
	ErrCodeUpdateRefreshToken = 30008 // update failed
	// user authentication
	ErrUnauthorized   = 40001 // user authentication unauthorized
	ErrCodeAuthFailed = 40005
	// Err Login
	ErrCodeOtpNotExists     = 60009
	ErrCodeUserOtpNotExists = 60010
	ErrCodeOtpNotMatch      = 60011
	//  Two Factor Authentication
	ErrCodeTwoFactorAuthSetupFailed  = 80001
	ErrCodeTwoFactorAuthVerifyFailed = 80002
	// error code Menu
	ErrCodeMenuNotFound  = 90001 // menu not found
	ErrCodeMenuHasExists = 90002 // menu already exists
	ErrCodeMenuError     = 90003
	// error code Role
	ErrCodeRoleError    = 10001
	ErrCodeRoleSucces   = 10002
	ErrCodeRoleNotFound = 10003
	// error code RoleMenu
	ErrCodeRoleMenuError    = 11001
	ErrCodeRoleMenuSucces   = 11002
	ErrCodeRoleMenuNotFound = 11003
	// error code RoleAccount
	ErrCodeRoleAccountError    = 12001
	ErrCodeRoleAccountSucces   = 12002
	ErrCodeRoleAccountNotFound = 12003
	ErrCodeRoleAccountCreate   = 12011
	// error code account
	ErrCodeRoleAccountMaxNumber = 13002 // role account max number
	// error code license
	ErrCodeLicenseValid      = 13000
	ErrCodeCustomerHasExists = 60001 // user already registered
	ErrCodeHash              = 60002
	//Account
	ErrCodeAccountNotFound       = 14002
	ErrCodeAccountSum            = 14003
	ErrCodeEmailOrUsernameExists = 14004
	ErrCodeAccountNotExists      = 14005
	ErrCodeHashAccount           = 14006
	ErrCodeMaxRole               = 14007
	ErrCodeCheckCountAccount     = 14008
	ErrCodeRoleAccountValid      = 14009
	ErrCodeAccountCreate         = 14010
	ErrCodeCheckExistsAccount    = 14011
	ErrCodeEditAccount           = 14012
	ErrCodeDeleteAccount         = 14013
	ErrCodeLockAccount           = 14014
	ErrCodePasswordAccount       = 14015
	ErrCodeStatusAccount         = 14016
	ErrCodeAccountResetPassword  = 14017
	// Error code transaction
	ErrCodeTransactionError               = 15001
	ErrCodeTransactionInitializationError = 15002
	// Error code Conver Json
	ErrCodeConverJson = 16001
	ErrCodeCovert     = 16002
	// Error Code Cache
	ErrCodeSetCache = 17001
	ErrCodeGetCache = 17002
	// Error code customer
	ErrCodeKeyCustomerDelete = 18001
	// Err code db
	ErrCodeGetDb    = 19001
	ErrCodeSetDb    = 19002
	ErrCodeDeleteDb = 19003
	ErrCodeUpdateDb = 19004
	// Error code Erea
	ErrCodeInsertDb                  = 31000
	ErrCodeNotFoundArea              = 31001
	ErrCodeCountArea                 = 31002
	ErrCodeUpdateArea                = 31003
	ErrCodeDeleteArea                = 32004
	ErrCodeExitsName                 = 32003
	ErrCodeDeleteAreaExitsParkingLot = 32005
	// Error Code ParkingLot
	ErrCodeNotFoundParkingLot = 33001
	// Error code Customer
	ErrCodeFoundCustomer    = 34001
	ErrCodeRegisterCustomer = 34002
	// Error code ParkingSpot
	ErrCodeParkingSpotFull    = 35001
	ErrCodeParkingSpotExisted = 35002
	ErrCodeDeleteParkingSpot  = 35003
)

// message
var Msg = map[int]string{
	ErrCodeSucces:                         "success",
	ErrCodeParamInvalid:                   "Email is invalid",
	ErrInvalidToken:                       "Token invalid",
	ErrInvalidOTP:                         "OTP invalid",
	ErrSendEmailOtp:                       "Failed to send email OTP",
	ErrCodeUserOtpNotExists:               "User OTP not exists",
	ErrCodeAuthFailed:                     "Authentication failed",
	ErrCodeTwoFactorAuthSetupFailed:       "Failed to setup Two Factor Authentication",
	ErrUnauthorized:                       "Unauthorized",
	ErrCodeTwoFactorAuthVerifyFailed:      "Two Factor Authentication setup failed",
	ErrCodeMenuNotFound:                   "menu not found",
	ErrCodeMenuHasExists:                  "menu already exists",
	ErrCodeMenuError:                      "menu error",
	ErrCodeRoleMenuError:                  "role menu error",
	ErrCodeRoleMenuSucces:                 "role menu succes",
	ErrCodeRoleMenuNotFound:               "role menu not found",
	ErrCodeRoleError:                      "role error",
	ErrCodeRoleSucces:                     "role succes",
	ErrCodeRoleNotFound:                   "role not found",
	ErrCodeRoleAccountError:               "role account error",
	ErrCodeRoleAccountSucces:              "role account succes",
	ErrCodeRoleAccountNotFound:            "role account not found",
	ErrCodeRoleAccountMaxNumber:           "role account max number",
	ErrCodeLicenseValid:                   "License valid",
	ErrCodeCustomerHasExists:              "Customer already registered",
	ErrCodeOtpNotExists:                   "OTP not exists",
	ErrCodeAccountNotFound:                "Account not found",
	ErrCodeAccountSum:                     "Account sum error",
	ErrCodeEmailOrUsernameExists:          "Email or Username already exists",
	ErrCodeAccountNotExists:               "Account not exists",
	ErrCodeHashAccount:                    "Hash account error",
	ErrCodeMaxRole:                        "Not found max number role",
	ErrCodeCheckCountAccount:              "Check count account error",
	ErrCodeRoleAccountValid:               "Role account limit create account",
	ErrCodeAccountCreate:                  "Create account error",
	ErrCodeRoleAccountCreate:              "Create role account error",
	ErrCodeCheckExistsAccount:             "Check exists account error",
	ErrCodeEditAccount:                    "Edit account error",
	ErrCodeTransactionError:               "Transaction error",
	ErrCodeTransactionInitializationError: "Transaction initialization error",
	ErrCodeDeleteAccount:                  "Delete account error",
	ErrCodeLockAccount:                    "Lock account error",
	ErrCodePasswordAccount:                "Password account error",
	ErrCodeStatusAccount:                  "Account locked",
	ErrCodeConverJson:                     "Conver json error",
	ErrCodeSetCache:                       "Set cache error",
	ErrCodeUpdateTokenFailed:              "Update token failed",
	ErrCodeCreateTokenFailed:              "Create token failed",
	ErrCodeSubjectUUID:                    "SubjectUUID not found in context",
	ErrCodeGetCache:                       "Get cache error",
	ErrCodeCovert:                         "Data type conversion error",
	ErrCodeRefreshTokenused:               "RefreshToken is used",
	ErrCodeUpdateRefreshToken:             "Update refresh token error",
	ErrCodeAccountResetPassword:           "Reset password error",
	ErrCodeKeyCustomerDelete:              "Key customer error delete",
	ErrCodeOtpNotMatch:                    "OTP not match",
	ErrCodeGetDb:                          "Get db error",
	ErrCodeSetDb:                          "Set db error",
	ErrCodeDeleteDb:                       "Delete db error",
	ErrCodeUpdateDb:                       "Update db error",
	ErrCodeHash:                           "Hash error",
	ErrCodeInsertDb:                       "Error insert info area at area table",
	ErrCodeNotFoundArea:                   "Area not found",
	ErrCodeCountArea:                      "Count area error",
	ErrCodeUpdateArea:                     "Update area error",
	ErrCodeDeleteArea:                     "Delete area error",
	ErrCodeNotFoundParkingLot:             "Parking lot not found",
	ErrCodeFoundCustomer:                  "Not found customer",
	ErrCodeExitsName:                      "Exits name",
	ErrCodeRegisterCustomer:               "Register customer error",
	ErrCodeParkingSpotFull:                "full parking spot",
	ErrCodeDeleteAreaExitsParkingLot:      "Plese delete parking lot first",
	ErrCodeParkingSpotExisted:             "Parking spot existed",
	ErrCodeDeleteParkingSpot:              "The parking spot you selected for deletion is currently occupied. Please delete it after the vehicle has vacated the spot.",
}

package consts

const (
	EAMIL                             int    = 1
	MOBILE                            int    = 2
	TIME_2FA_OTP_REGISTER             int    = 10
	REFRESH_TOKEN                     int    = 168
	HOST_EMAIL                        string = "teamaithacoindustries@gmail.com"
	HOST_PREFIX                       string = "/v1/2025"
	RATELIMIT_REQUEST_PRIVATE         int    = 50
	RATELIMIT_SECOND__PRIVATE         int    = 1
	RATELIMIT_REQUEST_GLOBAL          int    = 1000
	RATELIMIT_SECOND__GLOBAL          int    = 1
	PASS_MAIL                         string = "ratw fwmz thqo erbf"
	TIME_OTP_REGISTER                 int    = 10
	StateLocked                       int8   = 0
	StateActive                       int8   = 1
	StateNotActivated                 int8   = 2
	StateUnavailable                  int8   = 3
	StatusParkingLotNewCreate         int8   = 0
	StatusParkingLotActive            int8   = 1
	StatusParkingLotMaintenance       int8   = 2
	StatusParkingLotTemporarilyClosed int8   = 3
	//
	StatusRegisterBoookingComfirm int8 = 1
	StatusRegisterBoookingPedding int8 = 0
	StatusRegisterBoookingCancel  int8 = 2
	// -- 0- Trống, 1- Đang gửi, 2-Đã đặt chỗ
	StatusParkingMangementEmpty   int8 = 0
	StatusParkingMangementSending int8 = 1
	StatusParkingMangementBooked  int8 = 2
)

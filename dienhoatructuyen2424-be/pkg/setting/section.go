package setting

type Config struct {
	Mysql  MySQLSetting  `mapstructure:"mysql"`
	Logger LoggerSetting `mapstructure:"logger"`
	Redis  RedisSetting  `mapstructure:"redis"`
	Server ServerSetting `mapstructure:"server"`
	JWT    JWTSettings   `mapstructure:"jwt"`
	MinIO  MinioSettings `mapstructure:"minio"`
}
type ServerSetting struct {
	Port int    `mapstructure:"port"`
	Mode string `mapstructure:"mode"`
}
type RedisSetting struct {
	Host     string `mapstructure:"host"`
	Port     int    `mapstructure:"port"`
	Password string `mapstructure:"password"`
	Database int    `mapstructure:"database"`
}

type MySQLSetting struct {
	Host            string `mapstructure:"host"`
	Port            int    `mapstructure:"port"`
	Username        string `mapstructure:"username"`
	Password        string `mapstructure:"password"`
	Dbname          string `mapstructure:"dbname"`
	MaxIdleConns    int    `mapstructure:"maxIdleConns"`
	MaxOpenConns    int    `mapstructure:"maxOpenConns"`
	ConnMaxLifetime int    `mapstructure:"connMaxLifetime"`
}

type LoggerSetting struct {
	Log_level     string `mapstructure:"log_level"`
	File_log_name string `mapstructure:"file_log_name"`
	Max_backups   int    `mapstructure:"max_backups"`
	Max_age       int    `mapstructure:"max_age"`
	Max_size      int    `mapstructure:"max_size"`
	Compress      bool   `mapstructure:"compress"`
}

// jwt settings
type JWTSettings struct {
	TOKEN_HOUR_LIFESPAN int    `mapstructure:"TOKEN_HOUR_LIFESPAN"`
	API_SECRET_KEY      string `mapstructure:"API_SECRET_KEY"`
	JWT_EXPIRATION      string `mapstructure:"JWT_EXPIRATION"`
	SECRET_KEY          string `mapstructure:"SECRET_KEY"`
	ACCESS_TOKEN        string `mapstructure:"ACCESS_TOKEN"`
	REFRESH_TOKEN       string `mapstructure:"REFRESH_TOKEN"`
	PASSWORD            string `mapstructure:"PASSWORD"`
}

// minio settings
type MinioSettings struct {
	ENDPOINT    string `mapstructure:"ENDPOINT"`
	ACCESS_KEY  string `mapstructure:"ACCESS_KEY"`
	SECRET_KEY  string `mapstructure:"SECRET_KEY"`
	USESSL      bool   `mapstructure:"USESSL"`
	BUCKET_NAME string `mapstructure:"BUCKET_NAME"`
	CHUNK_SIZE  int    `mapstructure:"CHUNK_SIZE"`
	USE_SSL     bool   `mapstructure:"USE_SSL"`
	URL         string `mapstructure:"URL"`
}

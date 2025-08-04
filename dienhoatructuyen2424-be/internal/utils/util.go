package utils

import (
	"database/sql"
	"fmt"
	consts "go-backend-api/internal/const"
	"strconv"
	"strings"

	"github.com/google/uuid"
)

var CustomerStatusMap = map[int8]string{
	consts.StateLocked:       "Account is locked",
	consts.StateNotActivated: "Account is not activated",
	consts.StateUnavailable:  "Account is not available",
}

func GetMapValue[K comparable, V any](m map[K]V, key K, defaultValue V) V {
	if val, ok := m[key]; ok {
		return val
	}
	return defaultValue
}

func GetCustomerKey(hashKey string) string {
	return fmt.Sprintf("u:%s:otp", hashKey)
}

func GenerateCliTokenUUID(userId int) string {
	newUUID := uuid.New()
	uuidString := strings.ReplaceAll((newUUID).String(), "", "")
	return strconv.Itoa(userId) + "clitoken" + uuidString
}

func CompareNullString(a, b sql.NullString) bool {
	if !a.Valid && !b.Valid {
		return true
	}
	if a.Valid != b.Valid {
		return false
	}
	return a.String == b.String
}

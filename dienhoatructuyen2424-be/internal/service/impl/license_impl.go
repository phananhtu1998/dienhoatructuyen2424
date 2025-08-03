package impl

import (
	"context"
	"database/sql"
	"fmt"
	"go-backend-api/internal/database"
	"go-backend-api/internal/model"
	"go-backend-api/internal/utils/auth"
	"go-backend-api/pkg/response"
	"log"
	"time"

	"github.com/google/uuid"
)

type sLicense struct {
	r   *database.Queries
	qTx *sql.Tx
	db  *sql.DB
}

func NewLicenseImpl(r *database.Queries, qTx *sql.Tx, db *sql.DB) *sLicense {
	return &sLicense{
		r:   r,
		qTx: qTx,
		db:  db,
	}
}

func (s *sLicense) CreateLicense(ctx context.Context, in *model.License) (codeResult int, out model.LicenseOutput, err error) {
	// Khởi tạo transaction
	tx, err := s.db.BeginTx(ctx, nil)
	if err != nil {
		return response.ErrCodeTransactionInitializationError, out, fmt.Errorf("failed to begin transaction: %w", err)
	}

	var committed bool
	defer func() {
		if !committed {
			tx.Rollback()
		}
	}()
	qtx := s.r.WithTx(tx)
	// Tạo token không có thời hạn
	license, err := auth.CreateTokenNoExpiration(in.DateStart, in.DateEnd)
	if err != nil {
		return response.ErrCodeCreateTokenFailed, out, err
	}

	// Parse date strings to time.Time
	var (
		dateEnd   string
		dateStart time.Time
	)

	// Kiểm tra thời hạn của license cha
	dateend := ctx.Value("dateend")
	dateendStr, ok := dateend.(string)
	if !ok {
		return response.ErrCodeCovert, out, fmt.Errorf("dateend is not a valid string")
	}

	if in.DateEnd == "NO_EXPIRATION" {
		if dateendStr == "NO_EXPIRATION" {
			dateEnd = "NO_EXPIRATION"
			dateStart = time.Now()
		} else {
			return response.ErrCodeLicenseValid, out, fmt.Errorf("Lỗi đinh dạng cho ngày kết thúc")
		}
	} else {
		// Kiểm tra DateEnd có đúng định dạng không
		_, err = time.Parse("2006-01-02 15:04:05", in.DateEnd)
		if err != nil {
			return response.ErrCodeCovert, out, fmt.Errorf("Không đúng định dạng cho ngày kết thúc, YYYY-MM-DD HH:mm:ss hoặc NO_EXPIRATION, %s", in.DateEnd)
		}
		if dateendStr != "NO_EXPIRATION" && in.DateEnd > dateendStr {
			return response.ErrCodeLicenseValid, out, fmt.Errorf("Vui lòng chọn ngày kết thúc cho gói này sớm hơn gói cha")
		}
		dateEnd = in.DateEnd // Lưu dưới dạng string vì DB là VARCHAR(255)
		dateStart, err = time.Parse("2006-01-02 15:04:05", in.DateStart)
		if err != nil {
			return response.ErrCodeCovert, out, err
		}
	}

	//  Tạo Id cho license
	var licenseId = uuid.New().String()
	// Tạo license trong database
	_, err = qtx.CreateLicense(ctx, database.CreateLicenseParams{
		ID:        licenseId,
		License:   license,
		RoleID:    in.RoleId,
		DateStart: dateStart,
		DateEnd:   dateEnd, // Giữ nguyên kiểu string
	})
	if err != nil {
		return response.ErrCodeLicenseValid, out, err
	}
	// Cập nhật license_id trong bảng role
	err = qtx.UpdateLicenseByRoleId(ctx, database.UpdateLicenseByRoleIdParams{
		LicenseID: licenseId,
		ID:        in.RoleId,
	})
	if err != nil {
		return response.ErrCodeLicenseValid, out, err
	}
	// Commit transaction
	err = tx.Commit()
	if err != nil {
		return response.ErrCodeTransactionError, out, err
	}
	committed = true
	out.License = license
	return response.ErrCodeSucces, out, nil
}
func (s *sLicense) LicenseReNewal(ctx context.Context, in *model.LicenseRenewal, id string) (codeResult int, out model.LicenseOutput, err error) {
	// Tạo token không có thời hạn
	license, err := auth.CreateTokenNoExpiration(in.DateStart, in.DateEnd)
	if err != nil {
		return response.ErrCodeCreateTokenFailed, out, err
	}

	// Lấy thông tin license hiện tại
	licenseInfo, err := s.r.GetLicenseById(ctx, id)
	if err != nil {
		log.Println("Lỗi lấy thông tin license: ", err)
		return response.ErrCodeLicenseValid, out, err
	}

	var (
		dateStart time.Time
		dateEnd   string
	)

	// Lấy ngày kết thúc gói cha từ context
	dateend := ctx.Value("dateend")
	dateendStr, ok := dateend.(string)
	if !ok {
		return response.ErrCodeCovert, out, fmt.Errorf("dateend is not a valid string")
	}

	if in.DateEnd == "NO_EXPIRATION" {
		if dateendStr == "NO_EXPIRATION" {
			dateEnd = "NO_EXPIRATION"
			dateStart = licenseInfo.DateStart
		} else {
			return response.ErrCodeCovert, out, fmt.Errorf("Lỗi định dạng cho ngày kết thúc")
		}
	} else {
		// Kiểm tra định dạng DateEnd
		_, err := time.Parse("2006-01-02 15:04:05", in.DateEnd)
		if err != nil {
			return response.ErrCodeCovert, out, fmt.Errorf("Không đúng định dạng cho ngày kết thúc: %s", in.DateEnd)
		}

		// Parse DateStart
		dateStart, err = time.Parse("2006-01-02 15:04:05", in.DateStart)
		if err != nil {
			return response.ErrCodeCovert, out, fmt.Errorf("Không đúng định dạng cho ngày bắt đầu: %s", in.DateStart)
		}

		if dateendStr != "NO_EXPIRATION" && in.DateEnd > dateendStr {
			return response.ErrCodeCovert, out, fmt.Errorf("Vui lòng chọn ngày kết thúc cho gói này sớm hơn gói cha")
		}
		dateEnd = in.DateEnd
	}

	log.Println("dateStart dùng để cập nhật: ", dateStart)

	// Cập nhật vào DB
	err = s.r.UpdateLicense(ctx, database.UpdateLicenseParams{
		License:   license,
		DateStart: dateStart,
		DateEnd:   dateEnd,
		ID:        id,
	})
	if err != nil {
		log.Println("Lỗi cập nhật license: ", err)
		return response.ErrCodeLicenseValid, out, err
	}

	out.License = license
	return codeResult, out, nil
}

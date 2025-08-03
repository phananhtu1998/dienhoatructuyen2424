-- name: GetValidOTP :one
SELECT verify_otp, verify_key_hash, verify_email, id
FROM `customer_verify`
WHERE verify_key_hash = ? AND is_verified = 0;

-- name: UpdateCustomerVerificationStatus :exec
UPDATE `customer_verify`
SET is_verified = 1,
    update_at = now()
WHERE verify_key_hash = ?;

-- name: InsertOTPVerify :execresult
INSERT INTO `customer_verify` (
    id,
    verify_otp,
    verify_email,
    verify_key_hash, 
    is_verified, 
    is_deleted, 
    created_at, 
    update_at
)
VALUES (?, ?, ?, ?, 0, 0, NOW(), NOW());


-- name: GetInfoOTP :one
SELECT id, verify_otp, verify_email, verify_key_hash, is_verified, is_deleted, created_at, update_at
FROM `customer_verify`
WHERE verify_key_hash = ?;

-- name: CheckKeyHashExists :one
SELECT COUNT(id) FROM `customer_verify` WHERE is_deleted = false AND verify_key_hash = ?;



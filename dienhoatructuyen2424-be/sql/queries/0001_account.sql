-- name: GetAccountById :one
SELECT a.id,a.code, a.number, a.name,a.username, a.email, a.status,a.images,a.salt,a.created_by, a.password,r.role_name
FROM `account` a
LEFT JOIN role_account ra ON ra.account_id = a.id
LEFT JOIN role r ON r.id = ra.role_id
WHERE a.id = ? AND a.is_deleted = false AND r.is_deleted = false AND ra.is_deleted = false;

-- name: GetOneAccountInfoAdmin :one
SELECT id, number,code, name, email,username, password,salt,status,created_by,create_at,update_at, images
FROM `account`
WHERE username = ? AND is_deleted = false;

-- name: InsertAccount :execresult
INSERT INTO `account` (
    id,
    code,
    number,
    username,
    name,
    email,
    password,
    salt,
    status,
    images,
    created_by,
    is_deleted,
    create_at,
    update_at
)
VALUES(?,?,?,?,?,?,?,?,?,?,?,false,NOW(),NOW());

-- name: EditAccountById :exec
UPDATE account 
SET
    name = ?,
    username = ?,
    code = ?,
    email = ?,
    status = ?,
    images = ?,
    update_at = NOW()
WHERE id = ?;

-- name: ChangPasswordById :exec
UPDATE account 
SET
    password = ?,
    update_at = NOW()
WHERE id = ?;

-- name: DeleteAccountById :exec
UPDATE account 
SET
    is_deleted = true,
    update_at = NOW()
WHERE id = ?;


-- name: CheckAccountBaseExists :one
SELECT COUNT(*)
FROM `account`
WHERE (email = ? || username = ?) AND is_deleted = false;

-- name: CheckAccountBaseExistsUpdate :one
SELECT COUNT(*)
FROM `account`
WHERE (email = ? || username = ?) AND id != ?;

-- name: GetLicenseByAccountId :one
SELECT a.id,r.role_name,l.license
FROM account as a
JOIN role_account ra ON a.id = ra.account_id
JOIN role r ON ra.role_id = r.id
JOIN license l ON l.id = r.license_id
WHERE a.id = ? AND a.is_deleted = false AND ra.is_deleted = false AND r.is_deleted = false AND l.is_deleted = false;

-- name: DeleteRoleAccountByAccountId :exec
UPDATE `role_account`
SET is_deleted = true, update_at = NOW()
WHERE account_id = ?;

-- name: GetAllAccountByCreatedBy :many
SELECT a.id,a.code, a.number,r.role_name, a.name,a.username, a.email, a.status,a.images,a.salt,a.created_by, a.password
FROM `account` a
LEFT JOIN role_account ra ON ra.account_id = a.id
LEFT JOIN role r ON r.id = ra.role_id
WHERE a.created_by = ? AND a.is_deleted = false AND r.is_deleted = false AND ra.is_deleted = false
AND (
  ? IS NULL OR
  a.code LIKE CONCAT('%', ?, '%') OR 
  a.name LIKE CONCAT('%', ?, '%') OR 
  a.email LIKE CONCAT('%', ?, '%') OR 
  a.username LIKE CONCAT('%', ?, '%') OR 
  r.role_name LIKE CONCAT('%', ?, '%')
)
ORDER BY a.create_at DESC
LIMIT ? OFFSET ?;

-- name: CountAllAccountByCreatedBy :one
SELECT count(a.id)
FROM `account` a
LEFT JOIN role_account ra ON ra.account_id = a.id
LEFT JOIN role r ON r.id = ra.role_id
WHERE a.created_by = ? AND a.is_deleted = false AND r.is_deleted = false AND ra.is_deleted = false
AND (
  ? IS NULL OR
  a.code LIKE CONCAT('%', ?, '%') OR 
  a.name LIKE CONCAT('%', ?, '%') OR 
  a.email LIKE CONCAT('%', ?, '%') OR 
  a.username LIKE CONCAT('%', ?, '%') OR 
  r.role_name LIKE CONCAT('%', ?, '%')
);

-- name: LockAndUnlockAccount :exec
UPDATE account 
SET
    status = ?,
    update_at = NOW()
WHERE id = ?;

-- name: CheckTotalAccountChildExists :one
SELECT COUNT(id)
FROM `account`
WHERE created_by = ? AND is_deleted = false;

-- name: ResetPasswordAccount :exec
UPDATE `account`
SET number = ?,password = ?,salt = ?, update_at = NOW()
WHERE id = ?;



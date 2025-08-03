-- name: AddCustomerHaveUserId :execresult
INSERT INTO `customer_info` (
    id, code, username, name, payment_id, image, state, mobile, 
    gender, birthday, email, is_authentication, created_at, update_at
)
VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW());

-- name: UpdateCustomerInfoById :exec
UPDATE `customer_info`
SET username = ?,
    name = ?,
    `image` = ?,
    mobile = ?,
    gender = ?,
    birthday = ?,
    payment_id = ?,
    update_at = now()
WHERE id = ?;


-- name: GetStatusCustomerInfo :one
SELECT ci.id, ci.code, ci.state, ci.is_authentication, ci.email, ci.username, ci.name, ci.image, ci.mobile, ci.gender, ci.birthday, ci.payment_id, v.parking_lot_id
FROM `customer_info` ci
LEFT JOIN vehicle v ON v.customer_id = ci.id
WHERE ci.username = ?;

-- name: GetCustomerInfoById :one
SELECT id, code, state, is_authentication, email, username, name, image, mobile, gender, birthday
FROM `customer_info`
WHERE id = ?;


-- name: GetCustomerInfoByUsername :one
SELECT id, code, state, is_authentication, email, username, name, image, mobile, gender, birthday
FROM `customer_info`
WHERE username = ?;

-- name: GetListCustomer :many
SELECT 
  ci.id, 
  ci.code,
  ci.username,
  ci.email,
  ci.image,
  pm.name,
  ci.state 
FROM customer_info ci
JOIN payment pm ON pm.id = ci.payment_id
WHERE pm.is_deleted = false
  AND (
    ? IS NULL OR
    ci.code LIKE CONCAT('%', ?, '%') OR 
    ci.email LIKE CONCAT('%', ?, '%') OR 
    ci.username LIKE CONCAT('%', ?, '%')
  )
  AND (
    ? IS NULL OR ? = '' OR ci.payment_id = ?
  )
LIMIT ? OFFSET ?;


-- name: CountListCustomer :one
SELECT count(ci.id)
FROM customer_info ci
JOIN payment pm ON pm.id = ci.payment_id
WHERE pm.is_deleted = false
  AND (
    ? IS NULL OR
    ci.code LIKE CONCAT('%', ?, '%') OR 
    ci.email LIKE CONCAT('%', ?, '%') OR 
    ci.username LIKE CONCAT('%', ?, '%')
  )
  AND (
    ? IS NULL OR ? = '' OR ci.payment_id = ?
  );

-- name: GetCustomerById :one
SELECT ci.id, ci.code,ci.name as Name_Customer,ci.username,ci.mobile,ci.birthday,ci.gender,ci.email,v.number_plate,pl.name as Name_parking_lot,p.name as Name_payment,ci.image,ci.state
FROM customer_info ci
JOIN payment p ON p.id = ci.payment_id
JOIN vehicle v ON v.customer_id = ci.id
JOIN parking_lot pl ON v.parking_lot_id = pl.id
WHERE p.is_deleted = false AND v.is_deleted = false AND pl.is_deleted = false AND ci.id = ?;

-- name: CheckStateByVerifyHash :one
SELECT ci.state 
FROM customer_info ci
JOIN customer_verify cv ON cv.verify_email = ci.email
WHERE cv.verify_key_hash = ?;

-- name: LockAndUnlockCustomerById :exec
UPDATE `customer_info`
SET state = ?,
    update_at = now()
WHERE id = ?;

-- name: CountCustomerById :one
SELECT count(id)
FROM `customer_info`
WHERE id = ?;



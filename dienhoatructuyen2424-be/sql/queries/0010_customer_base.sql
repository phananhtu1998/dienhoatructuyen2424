-- name: GetOneCustomerInfo :one
SELECT id, email, password, number, salt
FROM `customer_base`
WHERE email = ?;

-- name: GetOneCustomerInfoAdmin :one
SELECT id, number, email, password, salt,created_at, update_at
FROM `customer_base`
WHERE email = ?;

-- name: CheckCustomerBaseExists :one
SELECT COUNT(*)
FROM customer_base
WHERE email = ?;

-- name: AddCustomerBase :execresult
INSERT INTO customer_base (
    id, number, email, password, salt, created_at,update_at
) VALUES (
    ?, ?, ?, ?, ?, NOW(), NOW()
);


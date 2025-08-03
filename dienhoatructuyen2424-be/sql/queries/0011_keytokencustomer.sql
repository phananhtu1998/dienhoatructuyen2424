-- name: InsertKeyCustomer :exec
INSERT INTO `keytokencustomer` (id, customer_id, refresh_token, refresh_tokens_used) 
VALUES (?, ?, ?, COALESCE(?, JSON_ARRAY())); 

-- name: CheckCustomerIdExists :one
SELECT COUNT(id) AS total_count
FROM `keytokencustomer`
WHERE customer_id = ?;

-- name: UpdateRefreshTokenCustomer :exec
UPDATE `keytokencustomer` 
SET refresh_token = ?, update_at = CURRENT_TIMESTAMP
WHERE customer_id = ?;

-- name: DeleteKeyCustomer :exec
DELETE FROM `keytokencustomer` WHERE customer_id = ?;

-- name: CountRefreshTokenByCustomer :one
SELECT COUNT(id) AS total_count
FROM `keytokencustomer`
WHERE refresh_token = ?;

-- name: FoundRefreshTokenByCustomerId :one
SELECT COUNT(id) AS total_count
FROM `keytokencustomer`
WHERE JSON_CONTAINS(refresh_tokens_used, ?, '$') 
AND customer_id = ?;

-- name: UpdateRefreshTokenUsedByCustomerId :exec
UPDATE `keytokencustomer`
SET refresh_token = ?, 
    refresh_tokens_used = CASE
        WHEN refresh_tokens_used IS NULL THEN JSON_ARRAY(?)
        ELSE JSON_ARRAY_APPEND(refresh_tokens_used, '$', ?)
    END,
    update_at = CURRENT_TIMESTAMP
WHERE customer_id = ?;


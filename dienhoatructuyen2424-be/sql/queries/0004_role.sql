-- name: GetRoleById :one
SELECT id, code, role_name,role_left_value,role_right_value,role_max_number,created_by,create_at,update_at
FROM `role`
WHERE id = ? AND is_deleted = false;


-- name: GetAllRole :many
SELECT id, code, role_name, role_left_value, role_right_value, role_max_number, created_by, create_at, update_at
FROM `role`
WHERE is_deleted = false
ORDER BY role_left_value DESC
LIMIT ? OFFSET ?;

-- name: GetParentRoleInfo :one
SELECT role_left_value, role_right_value
FROM `role`
WHERE id = ? AND is_deleted = false;

-- name: UpdateRole :exec
UPDATE `role`
SET code = ?, role_name = ?,role_left_value = ?,role_right_value = ?,role_max_number = ?,created_by = ?,update_at = NOW()
WHERE id = ?;

-- name: DeleteRole :exec
UPDATE `role`
SET is_deleted = true, update_at = ?
WHERE id = ?;

-- name: UpdateRightValuesForInsert :exec
UPDATE `role`
SET role_right_value = role_right_value + 2
WHERE role_right_value >= ? AND is_deleted = false;

-- name: UpdateLeftValuesForInsert :exec
UPDATE `role`
SET role_left_value = role_left_value + 2
WHERE role_left_value > ? AND is_deleted = false;

-- name: CreateRole :execresult
INSERT INTO `role` (
  id, code, role_name, role_left_value, role_right_value,license_id,
  role_max_number, created_by, create_at, update_at
) VALUES (
  ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW()
);

-- name: GetMaxRightValue :one
SELECT COALESCE(MAX(role_right_value), 0) as max_right_value
FROM `role`
WHERE is_deleted = false;

-- name: GetChildRolesByParentId :many
SELECT id, code, role_name, role_left_value, role_right_value, role_max_number, created_by, create_at, update_at
FROM `role`
WHERE created_by = ? AND is_deleted = false
ORDER BY role_left_value ASC;

-- name: GetTotalRoles :one
SELECT COUNT(*) FROM `role` WHERE is_deleted = false;

-- name: SoftDeleteRolesByRange :exec
UPDATE `role`
SET is_deleted = true, update_at = ?
WHERE role_left_value >= ? AND role_right_value <= ? AND is_deleted = false;

-- name: GetAllPermissions :many
SELECT a.id,a.name, r.role_name, m.menu_group_name,rm.list_method as Method FROM account a
JOIN role_account ra ON ra.account_id = a.id
JOIN role r ON r.id = ra.role_id
JOIN roles_menu rm ON rm.role_id = r.id
JOIN menu m ON m.id = rm.menu_id
WHERE a.is_deleted = false AND r.is_deleted = false AND m.is_deleted = false;

-- name: GetAllPermissionsByAccountId :many
SELECT a.id,a.name, r.role_name, m.menu_group_name,rm.list_method as Method FROM account a
JOIN role_account ra ON ra.account_id = a.id
JOIN role r ON r.id = ra.role_id
JOIN roles_menu rm ON rm.role_id = r.id
JOIN menu m ON m.id = rm.menu_id
WHERE a.is_deleted = false AND r.is_deleted = false AND m.is_deleted = false AND a.id = ?;

-- name: GetTotalAccounts :one
SELECT COALESCE(CAST(SUM(role_max_number) AS SIGNED), 0) AS MaxNumberAccount
FROM `role`
WHERE (created_by = ? OR ? IS NULL OR ? = '')
    AND is_deleted = false;

-- name: GetAccountCreated :one
SELECT COUNT(id) 
FROM `role` 
WHERE created_by = ? AND is_deleted = false;

-- name: UpdateLicenseByRoleId :exec
UPDATE `role`
SET license_id = ?
WHERE id = ? AND is_deleted = false;

-- name: GetAllFuncPackageByCreatedBy :many
SELECT DISTINCT
    r.id,
    r.code,
    r.role_name,
    r.role_max_number,
    r.role_left_value,
    MAX(l.date_start) as date_start,
    MAX(l.date_end) as date_end,
    r.license_id,
    (
        SELECT GROUP_CONCAT(DISTINCT m.menu_name ORDER BY m.menu_name SEPARATOR ',')
        FROM roles_menu rm
        JOIN menu m ON m.id = rm.menu_id
        WHERE rm.role_id = r.id AND rm.is_deleted = false AND m.is_deleted = false
    ) AS menu_names,
    (
        SELECT GROUP_CONCAT(DISTINCT a.id ORDER BY a.id SEPARATOR ',')
        FROM role_account ra
        JOIN account a ON a.id = ra.account_id
        WHERE ra.role_id = r.id AND ra.is_deleted = false AND a.is_deleted = false
    ) AS account_ids,
    (
        SELECT GROUP_CONCAT(DISTINCT a.name ORDER BY a.id SEPARATOR ',')
        FROM role_account ra
        JOIN account a ON a.id = ra.account_id
        WHERE ra.role_id = r.id AND ra.is_deleted = false AND a.is_deleted = false
    ) AS account_names,
    -- ĐÃ SỬA: Bỏ DISTINCT khỏi account_statuses
    (
        SELECT GROUP_CONCAT(COALESCE(a.status, '') ORDER BY a.id SEPARATOR ',')
        FROM role_account ra
        JOIN account a ON a.id = ra.account_id
        WHERE ra.role_id = r.id AND ra.is_deleted = false AND a.is_deleted = false
    ) AS account_statuses,
    (
        SELECT COUNT(DISTINCT ra.account_id)
        FROM role_account ra
        WHERE ra.role_id = r.id AND ra.is_deleted = false
    ) AS account_count
FROM role r
LEFT JOIN license l ON r.id = l.role_id AND l.is_deleted = false
WHERE r.is_deleted = false
  AND r.created_by = ?
  AND (
    ? IS NULL OR ? = '' OR
    r.code LIKE CONCAT('%', ?, '%') OR 
    r.role_name LIKE CONCAT('%', ?, '%') OR 
    EXISTS (
        SELECT 1 FROM role_account ra
        JOIN account a ON a.id = ra.account_id
        WHERE ra.role_id = r.id AND ra.is_deleted = false AND a.is_deleted = false
        AND (
            a.username LIKE CONCAT('%', ?, '%') OR
            a.name LIKE CONCAT('%', ?, '%')
        )
    ) OR
    EXISTS (
        SELECT 1 FROM roles_menu rm
        JOIN menu m ON m.id = rm.menu_id
        WHERE rm.role_id = r.id AND rm.is_deleted = false AND m.is_deleted = false
        AND m.menu_name LIKE CONCAT('%', ?, '%')
    )
  )
GROUP BY r.id, r.code, r.role_name, r.role_max_number, r.role_left_value, r.license_id
ORDER BY r.role_left_value DESC
LIMIT ? OFFSET ?;

-- name: DecreaseParentRightValues :exec
UPDATE role
SET role_right_value = role_right_value - ?
WHERE role_left_value < ? AND role_right_value > ? AND is_deleted = false;

-- name: DecreaseLeftValues :exec
UPDATE role
SET role_left_value = role_left_value - ?
WHERE role_left_value > ? AND is_deleted = false;

-- name: DecreaseRightValues :exec
UPDATE role
SET role_right_value = role_right_value - ?
WHERE role_right_value > ? AND is_deleted = false;

-- name: CountAllFuncPackageByCreatedBy :one
SELECT COUNT(r.id) AS total
FROM role r
LEFT JOIN license l ON r.id = l.role_id AND l.is_deleted = false
WHERE r.is_deleted = false
  AND r.created_by = ?
  AND (
    ? IS NULL OR
    r.code LIKE CONCAT('%', ?, '%') OR
    r.role_name LIKE CONCAT('%', ?, '%') OR
    EXISTS (
        SELECT 1 FROM role_account ra
        JOIN account a ON a.id = ra.account_id
        WHERE ra.role_id = r.id AND ra.is_deleted = false AND a.is_deleted = false
        AND (
            a.username LIKE CONCAT('%', ?, '%') OR
            a.name LIKE CONCAT('%', ?, '%')
        )
    ) OR
    EXISTS (
        SELECT 1 FROM roles_menu rm
        JOIN menu m ON m.id = rm.menu_id
        WHERE rm.role_id = r.id AND rm.is_deleted = false AND m.is_deleted = false
        AND m.menu_name LIKE CONCAT('%', ?, '%')
    )
  );


-- name: GetAllFuncPackageSelectByCreatedBy :many
SELECT 
    r.id, 
    r.role_name, 
    MAX(l.date_end) AS dateend
FROM role r
JOIN roles_menu rm ON r.id = rm.role_id
JOIN license l ON l.role_id = r.id
WHERE r.created_by = ?
  AND r.is_deleted = false
GROUP BY r.id, r.role_name;




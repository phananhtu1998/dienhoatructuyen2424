-- name: GetMenuById :one
SELECT 
    m1.id, m1.menu_name, m1.menu_icon, m1.menu_url, m1.menu_parent_Id, 
    m1.menu_level, m1.menu_number_order, m1.menu_group_name, m1.is_deleted, 
    m1.create_at, m1.update_at,
    COALESCE(
        CONCAT('[', GROUP_CONCAT(
            CASE 
                WHEN m2.id IS NOT NULL THEN 
                    JSON_OBJECT(
                        'id', m2.id, 
                        'menu_name', m2.menu_name, 
                        'menu_icon', m2.menu_icon, 
                        'menu_url', m2.menu_url, 
                        'menu_level', m2.menu_level,
                        'menu_number_order', m2.menu_number_order,
                        'menu_group_name', m2.menu_group_name,
                        'is_deleted', m2.is_deleted
                    )
                ELSE NULL
            END 
            ORDER BY m2.menu_number_order ASC SEPARATOR ','
        ), ']'), '[]'
    ) AS children
FROM menu m1
LEFT JOIN menu m2 ON m1.id = m2.menu_parent_Id AND m2.is_deleted = false
WHERE m1.id = ? AND m1.is_deleted = false
GROUP BY m1.id 
ORDER BY m1.menu_number_order ASC;

-- name: GetAllMenus :many
SELECT 
    m1.id, m1.menu_name, m1.menu_icon, m1.menu_url, m1.menu_parent_Id,
    m1.menu_level, m1.menu_number_order, m1.menu_group_name, m1.is_deleted
FROM menu m1
LEFT JOIN roles_menu rm ON rm.menu_id = m1.id
WHERE m1.is_deleted = false AND rm.role_id = ?
ORDER BY m1.menu_level ASC, m1.menu_number_order ASC;

-- name: InsertMenu :execresult
INSERT INTO menu (
    id, menu_name, menu_icon, menu_url, menu_parent_Id, menu_level, 
    menu_number_order, menu_group_name, is_deleted, create_at, update_at
) 
VALUES (?, ?, ?, ?, ?, ?, ?, ?, false, NOW(), NOW());

-- name: CountMenuByURL :one
SELECT COUNT(*) AS total_count
FROM menu
WHERE ((menu_url = ? AND menu_url IS NOT NULL AND menu_url != '')
   OR (menu_name = ? AND menu_name IS NOT NULL AND menu_name != '')) AND is_deleted = false;

-- name: UpdateSingleMenu :exec
UPDATE menu
SET 
    menu_name = ?, 
    menu_icon = ?, 
    menu_url = ?, 
    menu_parent_id = ?, 
    menu_level = ?, 
    menu_number_order = ?, 
    menu_group_name = ?
WHERE id = ?;

-- name: DeleteMenu :exec
UPDATE menu SET is_deleted = true WHERE id = ?;

-- name: UpdateMenuDeleted :exec
UPDATE menu SET is_deleted = true WHERE id = ?;


-- name: GetMenuByRoleId :many
SELECT 
    m.id,
    m.menu_name,
    m.menu_icon,
    m.menu_url,
    m.menu_level,
    m.menu_number_order,
    m.menu_parent_Id,
    m.menu_group_name,
    rm.list_method
FROM `menu` m
JOIN `roles_menu` rm ON rm.menu_id = m.id
JOIN `role` r ON rm.role_id = r.id
WHERE r.id = ? 
  AND m.is_deleted = false 
  AND rm.is_deleted = false 
  AND r.is_deleted = false
  AND (
    ? IS NULL OR
    m.menu_name LIKE CONCAT('%', ?, '%') 
)
ORDER BY 
    m.menu_level ASC,
    m.menu_number_order ASC;

-- name: CountMenuWithParentId :one
SELECT COUNT(*) FROM menu WHERE menu_parent_Id = ? AND is_deleted = false;

-- name: CountRootMenus :one
SELECT COUNT(*) FROM menu WHERE menu_parent_Id IS NULL AND is_deleted = false;

-- name: CountEditMenu :one
SELECT COUNT(*) AS total_count
FROM menu AS outer_menu
WHERE outer_menu.id != ?
  AND outer_menu.is_deleted = false
  AND (
    -- Check duplicate name (exclude NULL and empty)
    (
      outer_menu.menu_name IS NOT NULL 
      AND TRIM(outer_menu.menu_name) != ''
      AND outer_menu.menu_name = (
        SELECT inner_menu.menu_name 
        FROM menu AS inner_menu 
        WHERE inner_menu.id = ?
          AND inner_menu.menu_name IS NOT NULL
          AND TRIM(inner_menu.menu_name) != ''
      )
    )
    OR
    -- Check duplicate URL (exclude NULL and empty)
    (
      outer_menu.menu_url IS NOT NULL 
      AND TRIM(outer_menu.menu_url) != ''
      AND outer_menu.menu_url = (
        SELECT inner_menu.menu_url 
        FROM menu AS inner_menu 
        WHERE inner_menu.id = ?
          AND inner_menu.menu_url IS NOT NULL
          AND TRIM(inner_menu.menu_url) != ''
      )
    )
  );





-- +goose Up
-- +goose StatementBegin
CREATE TABLE `roles_menu`(
    `id` CHAR(36) NOT NULL,
    `menu_id` CHAR(36) NOT NULL,
    `role_id` CHAR(36) NOT NULL,
    `list_method` JSON NOT NULL,
    `is_deleted` BOOLEAN NOT NULL DEFAULT '0',
    `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    CONSTRAINT `fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu`(`id`),
    CONSTRAINT `fk_role_id` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`),
    INDEX idx_role_id (`role_id`),
    INDEX idx_menu_id (`menu_id`)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `roles_menu`;
-- +goose StatementEnd

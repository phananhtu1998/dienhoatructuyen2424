-- +goose Up
-- +goose StatementBegin
CREATE TABLE `role_account`(
    `id` CHAR(36) NOT NULL,
    `account_id` CHAR(36) NOT NULL,
    `role_id` CHAR(36) NOT NULL,
    `created_by` CHAR(36),
    `is_deleted` BOOLEAN NOT NULL,
    `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    CONSTRAINT `fk_role_account_id` FOREIGN KEY (`account_id`) REFERENCES `account`(`id`),
    CONSTRAINT `fk_account_role_id` FOREIGN KEY (`role_id`) REFERENCES `role`(`id`),
    INDEX idx_role_id (`role_id`),
    INDEX idx_account_id (`account_id`)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `role_account`;
-- +goose StatementEnd

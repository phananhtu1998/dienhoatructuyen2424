-- +goose Up
-- +goose StatementBegin
CREATE TABLE `customer_info`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `payment_id` CHAR(36) NOT NULL,
    `image` VARCHAR(255) NOT NULL,
    `state` TINYINT NOT NULL COMMENT 'state: 0-Locked, 1-Activated, 2-Not Activated',
    `is_authentication` TINYINT NOT NULL COMMENT 'Authentication status: 0-Not Authenticated, 1-Pending, 2-Authenticated, 3-Failed',
    `mobile` VARCHAR(255) NOT NULL,
    `gender` TINYINT NOT NULL,
    `birthday` DATETIME NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `update_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `customer_info`;
-- +goose StatementEnd

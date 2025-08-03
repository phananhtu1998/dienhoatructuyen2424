-- +goose Up
-- +goose StatementBegin
CREATE TABLE `customer_verify`(
    `id` CHAR(36) NOT NULL,
    `verify_otp` VARCHAR(255) NOT NULL,
    `verify_email` VARCHAR(255) NOT NULL,
    `verify_key_hash` VARCHAR(255) NOT NULL,
    `is_verified` BOOLEAN NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `update_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `customer_verify`;
-- +goose StatementEnd

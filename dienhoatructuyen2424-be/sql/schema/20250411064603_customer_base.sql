-- +goose Up
-- +goose StatementBegin
CREATE TABLE `customer_base`(
    `id` CHAR(36) NOT NULL,
    `number` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `salt` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `update_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `customer_base`;
-- +goose StatementEnd

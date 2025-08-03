-- +goose Up
-- +goose StatementBegin
CREATE TABLE `keytokencustomer` (
    `id` CHAR(36) NOT NULL,
    `customer_id` CHAR(36) NOT NULL,
    `refresh_token` TEXT NOT NULL,
    `refresh_tokens_used` JSON DEFAULT NULL,
    `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX idx_customer_id (`customer_id`),
    CONSTRAINT `fk_customer_id` FOREIGN KEY (`customer_id`) REFERENCES `customer_info`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='keytokencustomer';
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS `keytokencustomer`;
-- +goose StatementEnd

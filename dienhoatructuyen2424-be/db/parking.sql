CREATE TABLE `account`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `status` BOOLEAN NOT NULL COMMENT '[active,inactive]',
    `images` VARCHAR(255) NOT NULL,
    `created_by` VARCHAR(255) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL DEFAULT '0',
    `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`)
);
CREATE TABLE `role`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `role_name` VARCHAR(255) NOT NULL,
    `role_left_value` INT NOT NULL,
    `role_right_value` INT NOT NULL,
    `role_max_number` BIGINT NOT NULL,
    `is_licensed` BOOLEAN NOT NULL,
    `created_by` VARCHAR(255) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL DEFAULT '0',
    `create_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `update_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`)
);
CREATE TABLE `menu`(
    `id` CHAR(36) NOT NULL,
    `menu_name` VARCHAR(255) NOT NULL,
    `menu_icon` VARCHAR(255) NOT NULL,
    `menu_url` VARCHAR(255) NOT NULL,
    `menu_parent_Id` CHAR(36) NOT NULL,
    `menu_level` INT NOT NULL,
    `menu_number_order` FLOAT(53) NOT NULL,
    `menu_group_name` VARCHAR(255) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `create_at` TIMESTAMP NOT NULL,
    `update_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `RolesMenu`(
    `id` CHAR(36) NOT NULL,
    `menu_id` CHAR(36) NOT NULL,
    `role_id` CHAR(36) NOT NULL,
    `list_method` JSON NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `RoleAccount`(
    `id` CHAR(36) NOT NULL,
    `account_id` CHAR(36) NOT NULL,
    `role_id` CHAR(36) NOT NULL,
    `license_id` CHAR(36) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `license`(
    `id` CHAR(36) NOT NULL,
    `license` VARCHAR(255) NOT NULL,
    `date_start` DATETIME NOT NULL,
    `date_end` DATETIME NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `update_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
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
CREATE TABLE `customer_base`(
    `id` CHAR(36) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `salt` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `update_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `customer_info`(
    `id` CHAR(36) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `parking_id` CHAR(36) NOT NULL,
    `payment_id` CHAR(36) NOT NULL,
    `number_plate` VARCHAR(255) NOT NULL,
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
CREATE TABLE `area`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `parking_lot`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `area_id` CHAR(36) NOT NULL,
    `number_of_floors` INT NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `parking_spot`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `parking_lot_id` CHAR(36) NOT NULL,
    `qrcode` VARCHAR(255) NOT NULL,
    `floor` INT NOT NULL,
    `spot_number` INT NOT NULL,
    `status` BOOLEAN NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `manage_booking_list`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `customer_id` CHAR(36) NOT NULL,
    `time_booking` TIMESTAMP NOT NULL,
    `payment_id` CHAR(36) NOT NULL,
    `description` TEXT NOT NULL,
    `status` TINYINT NOT NULL,
    `is_deleted` TIMESTAMP NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `vehicle`(
    `id` CHAR(36) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `number_plate` VARCHAR(255) NOT NULL,
    `customer_id` CHAR(36) NOT NULL,
    `parking_lot_id` CHAR(36) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `payment`(
    `id` CHAR(36) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `transaction_history`(
    `id` CHAR(36) NOT NULL,
    `number_plate` VARCHAR(255) NOT NULL,
    `time_in` TIMESTAMP NOT NULL,
    `time_out` TIMESTAMP NOT NULL,
    `spot_number` INT NOT NULL,
    `status` BOOLEAN NOT NULL,
    `is_deleted` BOOLEAN NOT NULL,
    `created_at` TIMESTAMP NOT NULL,
    `updated_at` TIMESTAMP NOT NULL,
    PRIMARY KEY(`id`)
);

-- set timezone cho db
SET GLOBAL time_zone = '+7:00';
SET time_zone = '+7:00';


ALTER TABLE `account`
MODIFY `username` VARCHAR(255) COLLATE utf8mb4_bin;

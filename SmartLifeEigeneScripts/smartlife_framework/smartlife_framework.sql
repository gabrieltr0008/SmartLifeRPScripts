CREATE DATABASE IF NOT EXISTS `smartlife_framework`;
USE `smartlife_framework`;

CREATE TABLE `users` (
    `identifier` VARCHAR(80) NOT NULL,

    PRIMARY KEY (`identifier`)
);

ALTER TABLE `users`
    ADD `position` VARCHAR(53) NULL DEFAULT '{-269.4, -955.3, 31.2}'
;
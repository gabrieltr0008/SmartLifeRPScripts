CREATE DATABASE IF NOT EXISTS `smartlife_framework`;
USE `smartlife_framework`;

CREATE TABLE `users` (
	`identifier` VARCHAR(40) NOT NULL,
	`position` VARCHAR(53) NULL DEFAULT '{-269.4,-955.3,31.2}',
	`skin` LONGTEXT NULL DEFAULT NULL,
	`isdead` INT(11) NOT NULL DEFAULT 0,

	PRIMARY KEY (`identifier`)
);

CREATE TABLE `items` (
	`name` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,

	PRIMARY KEY (`name`)
);

CREATE TABLE `inventory` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(40) NOT NULL,
	`item` VARCHAR(20) NOT NULL,

	PRIMARY KEY (`id`)
);

CREATE TABLE `owned_vehicles` (
	`identifier` VARCHAR(40) NOT NULL,
	`position` VARCHAR(50) NULL,
	`plate` VARCHAR(12) NOT NULL,
	`model` LONGTEXT NOT NULL DEFAULT '',
	`statu` INT(11) NOT NULL DEFAULT 0,

	PRIMARY KEY (`plate`)
);

CREATE TABLE `vehicles` (
	`model` VARCHAR(50) NOT NULL,
	`label` VARCHAR(50) NOT NULL,
	`price` INT(11) NOT NULL DEFAULT 0,

	PRIMARY KEY (`model`)
)
GRANT ALL ON `np_data`.* TO 'np_server'@'localhost' IDENTIFIED BY '123';
-- GRANT автоматически создаёт пользователя, если он ещё не создан.
-- Не используется CREATE USER, потому что MySQL не поддерживает CREATE USER IF NOT EXIST.
-- Начиная с MySQL 5.7.6 данное поведение GRANT считается устаревшим

CREATE DATABASE `np_data` DEFAULT CHARACTER SET utf8;

USE `np_data`;

CREATE TABLE `user` (
	`id` INT UNSIGNED NOT NULL KEY
);

CREATE TABLE `relation` (
	`id` TINYINT UNSIGNED NOT NULL KEY,
	`title_key` VARCHAR(64)
);

CREATE TABLE `change` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
	`user_id` INT UNSIGNED NOT NULL,
	`relation_id` TINYINT UNSIGNED NOT NULL,
	`date` TIMESTAMP NOT NULL,
	FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`relation_id`) REFERENCES `relation` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `record_book` (
	`id` TINYINT UNSIGNED NOT NULL KEY
);

CREATE TABLE `record` (
	`id` INT UNSIGNED NOT NULL AUTO_INCREMENT KEY,
	`record_book_id` TINYINT UNSIGNED NOT NULL,
	`user_id` INT UNSIGNED NOT NULL,
	`date` TIMESTAMP NOT NULL,
	FOREIGN KEY (`record_book_id`) REFERENCES `record_book` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);
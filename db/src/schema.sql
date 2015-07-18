CREATE DATABASE `np_data` DEFAULT CHARACTER SET utf8;

GRANT ALL ON `np_data`.* TO 'np_server'@'localhost' IDENTIFIED BY '123';
# GRANT автоматически создаёт пользователя, если он ещё не создан.
# Не используется CREATE USER, потому что MySQL не поддерживает CREATE USER IF NOT EXIST.
# Начиная с MySQL 5.7.6 данное поведение GRANT считается устаревшим
GRANT USAGE ON *.* TO 'np_server'@'localhost' IDENTIFIED BY 'clean.sql';
DROP USER 'np_server'@'localhost';
-- GRANT автоматически создаёт пользователя, если он ещё не создан.
-- Это необходимо, потому что MySQL не поддерживает DROP USER IF EXIST.
-- Начиная с MySQL 5.7.6 данное поведение GRANT считается устаревшим

DROP DATABASE IF EXISTS `np_data`;
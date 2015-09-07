USE `np_data`;

INSERT INTO `user` (`id`)
VALUES 
	(1001),
	(1002),
	(1003),
	(1004)
;

INSERT INTO `relation` (`id`)
VALUES
	(1),
	(2),
	(3)
;

-- Все возможные переходы из одного состояния (relation) в другое
INSERT INTO `transition` (`id`, `from_relation_id`, `to_relation_id`)
VALUES
	(12, 1, 2),
	(13, 1, 3),
	(21, 2, 1),
	(23, 2, 3),
	(31, 3, 1),
	(32, 3, 2)
;

INSERT INTO `change` (`user_id`, `transition_id` , `date`)
VALUES
	(1001, 12, CURRENT_TIMESTAMP),
	(1002, 32, CURRENT_TIMESTAMP - INTERVAL 2 HOUR),
	(1003, 31, CURRENT_TIMESTAMP - INTERVAL 10 HOUR),
	(1003, 23, CURRENT_TIMESTAMP - INTERVAL 21 HOUR),
	(1004, 13, CURRENT_TIMESTAMP - INTERVAL 1 DAY)
;
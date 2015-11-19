USE `np_data`;

INSERT INTO `user` (`id`)
VALUES 
	(209991765), --Gray
	(53083705), --Медведев
	(38940203), --Жириновский
	(1052662), --Роман
	(3079367), --Руслан
	(3059512) --Серёга
;

INSERT INTO `relation` (`id`, `title_key`)
VALUES
	(0, 'relation.не_указано'),
	(1, 'relation.женат'),
	(2, 'relation.есть_подруга'),
	(3, 'relation.помолвлен'),
	(4, 'relation.женат'),
	(5, 'relation.всё_сложно'),
	(6, 'relation.в_активном_поиске'),
	(7, 'relation.влюблён')
;

INSERT INTO `change` (`user_id`, `relation_id`, `date`)
VALUES
	(209991765, 3, CURRENT_TIMESTAMP),
	(209991765, 2, CURRENT_TIMESTAMP - INTERVAL 2 HOUR),
	(53083705, 7, CURRENT_TIMESTAMP - INTERVAL 10 HOUR),
	(38940203, 6, CURRENT_TIMESTAMP - INTERVAL 21 HOUR),
	(3079367, 2, CURRENT_TIMESTAMP - INTERVAL 1 DAY),
	(3079367, 2, CURRENT_TIMESTAMP - INTERVAL 2 DAY),
	(3059512, 0, CURRENT_TIMESTAMP - INTERVAL 2 DAY),
	(3079367, 2, CURRENT_TIMESTAMP - INTERVAL 4 DAY),
	(38940203, 5, CURRENT_TIMESTAMP - INTERVAL 2 MONTH),
	(1052662, 7, CURRENT_TIMESTAMP - INTERVAL 11 YEAR)
;

INSERT INTO `record_book` (`id`)
VALUES
	(1)
;

INSERT INTO `record` (`record_book_id`, `user_id`, `date`)
VALUES
	(1, 209991765, CURRENT_TIMESTAMP),
	(1, 53083705, CURRENT_TIMESTAMP - INTERVAL 10 HOUR),
	(1, 38940203, CURRENT_TIMESTAMP - INTERVAL 21 HOUR),
	(1, 3079367, CURRENT_TIMESTAMP - INTERVAL 2 DAY),
	(1, 3059512, CURRENT_TIMESTAMP - INTERVAL 2 DAY)
;
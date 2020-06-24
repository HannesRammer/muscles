CREATE TABLE `exercise_to_muscles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `muscle_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `body_part_id` int(11) DEFAULT NULL,
  `muscle_type` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1213 DEFAULT CHARSET=utf8;

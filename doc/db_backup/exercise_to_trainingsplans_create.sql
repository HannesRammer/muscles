CREATE TABLE `exercise_to_trainingsplans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `trainingsplan_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `reps` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `pause` int(11) DEFAULT NULL,
  `unit` text,
  `video_id` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;

CREATE TABLE `tag_to_exercise` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `exercise_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

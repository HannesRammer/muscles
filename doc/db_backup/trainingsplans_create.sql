CREATE TABLE `trainingsplans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `copied_from_trainingsplan_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

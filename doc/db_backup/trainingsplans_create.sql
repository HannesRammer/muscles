CREATE TABLE `trainingsplans` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `copied_from_trainingsplan_id` int(11) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL,
  `sets` int(11) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `tags` text,
  `duration` decimal(10,0) DEFAULT NULL,
  `played` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

CREATE TABLE `exercises` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `image1` varchar(255) DEFAULT NULL,
  `description` text,
  `image2` varchar(255) DEFAULT NULL,
  `main_description` text,
  `how_to` text,
  `how_not_to` text,
  `info` text,
  `exercise_type` varchar(255) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT '1',
  `default_video_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

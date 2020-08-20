CREATE TABLE `muscles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext,
  `picture_id` int(11) DEFAULT NULL,
  `en_name` varchar(255) DEFAULT NULL,
  `body_part_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;

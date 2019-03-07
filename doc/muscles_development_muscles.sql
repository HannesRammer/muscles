-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: muscles_development
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `muscles`
--

DROP TABLE IF EXISTS `muscles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `muscles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` mediumtext,
  `picture_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `muscles`
--

LOCK TABLES `muscles` WRITE;
/*!40000 ALTER TABLE `muscles` DISABLE KEYS */;
INSERT INTO `muscles` VALUES (1,'Großer Brustmuskel',0),(2,'Trizeps',0),(3,'Vorderer Deltamuskel',47),(4,'Hakenarmmuskel',15),(5,'Vorderer Sägemuskel',48),(6,'Unterschulterblattmuskel',45),(7,'Großer Rückenmuskel',13),(9,'Hinterer Deltamuskel',19),(10,'Mittlerer Deltamuskel',27),(11,'Kleiner Brustmuskel',23),(12,'Oberer Trapezmuskel',32),(13,'Großer Rautenmuskel',12),(14,'Kleiner Rundmuskel',25),(16,'Gerader Bauchmuskel',9),(17,'Innerer schräger Bauchmuskel',22),(18,'Äußerer schräger Bauchmuskel',2),(19,'Oberer Brustmuskel',31),(21,'Untergrätenmuskel',43),(22,'Hinterer Sägemuskel',20),(23,'Unterer Brustmuskel',10),(24,'Großer Rundmuskel',14),(25,'Kleiner Rautenmuskel',24),(26,'Unterer Trapezmuskel',42),(27,'Mittlerer Trapezmuskel',28),(28,'Armbeuger',3),(29,'Oberarmspeichenmuskel',30),(30,'Lendenmuskeln',0),(31,'Bizeps kurzer Kopf',5),(32,'Äußerer Brustmuskel',1),(33,'Trizeps langer Kopf',40),(34,'Bizeps langer Kopf',6),(35,'Trizeps innerer Kopf',39),(36,'Trizeps seitlicher Kopf',41),(37,'Paravertebrale Muskeln',0),(38,'Obergrätenmuskel',33),(39,'Schulterblattheber',37),(42,'Riemenmuskeln',34),(52,'Treppenmuskeln',0),(56,'Kopfwender',26);
/*!40000 ALTER TABLE `muscles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-04  1:05:33

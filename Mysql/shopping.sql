-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sp_product`
--

DROP TABLE IF EXISTS `sp_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_product` (
  `id` int NOT NULL,
  `name` text,
  `category` text,
  `price` int DEFAULT NULL,
  `img` text,
  `stock` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_product`
--

LOCK TABLES `sp_product` WRITE;
/*!40000 ALTER TABLE `sp_product` DISABLE KEYS */;
INSERT INTO `sp_product` VALUES (1,'Flour','Flour',25,'แป้งธรรมดา.jpg','IN STOCK'),(2,'Charcoal Flour','Flour',25,'แป้งชาโคล.png','IN STOCK'),(3,'Pandan flour','Flour',25,'ใบเตย.jpg','IN STOCK'),(4,'sausage','Savory',10,'ไส้กรอก.jpg','IN STOCK'),(5,'Ham','Savory',10,'แฮม.jpg','IN STOCK'),(6,'Crab sticks','Savory',10,'ปูอัด.jpg','IN STOCK'),(7,'Egg','Savory',10,'ไข่.jpg','IN STOCK'),(8,'Chocolate','Sweet',10,'ช็อกโกแลต.jpg','IN STOCK'),(9,'Strawberry','Sweet',10,'สตอดบอรี่.jpg','IN STOCK'),(10,'Banana','Sweet',10,'กล้วยหอม.jpg','IN STOCK'),(11,'Peanut butter','Sweet',10,'เนยถั่ว.jpg','IN STOCK'),(12,'Jelly','Topping',10,'เยลลี่.jpg','IN STOCK'),(13,'Orio','Topping',10,'โอริโอ้.jpg','IN STOCK'),(14,'Chilli sauce','Sauce',0,'ซอสพริก.jpg','IN STOCK'),(15,'Tomatoes sauce','Sauce',0,'ซอสมะเขือเทศ.jpg','IN STOCK');
/*!40000 ALTER TABLE `sp_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sp_transaction`
--

DROP TABLE IF EXISTS `sp_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sp_transaction` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `tranid` text,
  `orderlist` text,
  `amount` int DEFAULT NULL,
  `operation` text,
  `mill` bigint DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_transaction`
--

LOCK TABLES `sp_transaction` WRITE;
/*!40000 ALTER TABLE `sp_transaction` DISABLE KEYS */;
INSERT INTO `sp_transaction` VALUES (1,'1712800821772','[{\"index\":\"0\",\"id\":\"1\",\"name\":\"Flour\",\"price\":\"25\",\"img\":\"\\u0e41\\u0e1b\\u0e49\\u0e07\\u0e18\\u0e23\\u0e23\\u0e21\\u0e14\\u0e32.jpg\",\"count\":\"1\"},{\"index\":\"8\",\"id\":\"9\",\"name\":\"Strawberry\",\"price\":\"10\",\"img\":\"\\u0e2a\\u0e15\\u0e2d\\u0e14\\u0e1a\\u0e2d\\u0e23\\u0e35\\u0e48.jpg\",\"count\":\"1\"},{\"index\":\"7\",\"id\":\"8\",\"name\":\"Chocolate\",\"price\":\"10\",\"img\":\"\\u0e0a\\u0e47\\u0e2d\\u0e01\\u0e42\\u0e01\\u0e41\\u0e25\\u0e15.jpg\",\"count\":\"1\"},{\"index\":\"11\",\"id\":\"12\",\"name\":\"Jelly\",\"price\":\"10\",\"img\":\"\\u0e40\\u0e22\\u0e25\\u0e25\\u0e35\\u0e48.jpg\",\"count\":\"1\"}]',55,'COMPLETED',1712800821000),(2,'1712802280170','[{\"index\":\"2\",\"id\":\"3\",\"name\":\"\\u0e41\\u0e1b\\u0e49\\u0e07\\u0e43\\u0e1a\\u0e40\\u0e15\\u0e22\",\"price\":\"25\",\"img\":\"\\u0e43\\u0e1a\\u0e40\\u0e15\\u0e22.jpg\",\"count\":\"1\"},{\"index\":\"7\",\"id\":\"8\",\"name\":\"\\u0e0a\\u0e47\\u0e2d\\u0e01\\u0e42\\u0e01\\u0e41\\u0e25\\u0e15\",\"price\":\"10\",\"img\":\"\\u0e0a\\u0e47\\u0e2d\\u0e01\\u0e42\\u0e01\\u0e41\\u0e25\\u0e15.jpg\",\"count\":\"1\"},{\"index\":\"12\",\"id\":\"13\",\"name\":\"\\u0e42\\u0e2d\\u0e23\\u0e34\\u0e42\\u0e2d\\u0e49\",\"price\":\"10\",\"img\":\"\\u0e42\\u0e2d\\u0e23\\u0e34\\u0e42\\u0e2d\\u0e49.jpg\",\"count\":\"1\"}]',45,'COMPLETED',1712802280000),(3,'1712802371174','[{\"index\":\"0\",\"id\":\"1\",\"name\":\"Flour\",\"price\":\"25\",\"img\":\"\\u0e41\\u0e1b\\u0e49\\u0e07\\u0e18\\u0e23\\u0e23\\u0e21\\u0e14\\u0e32.jpg\",\"count\":\"1\"},{\"index\":\"6\",\"id\":\"7\",\"name\":\"Egg\",\"price\":\"10\",\"img\":\"\\u0e44\\u0e02\\u0e48.jpg\",\"count\":\"1\"},{\"index\":\"11\",\"id\":\"12\",\"name\":\"Jelly\",\"price\":\"10\",\"img\":\"\\u0e40\\u0e22\\u0e25\\u0e25\\u0e35\\u0e48.jpg\",\"count\":\"1\"},{\"index\":\"10\",\"id\":\"11\",\"name\":\"Peanut butter\",\"price\":\"10\",\"img\":\"\\u0e40\\u0e19\\u0e22\\u0e16\\u0e31\\u0e48\\u0e27.jpg\",\"count\":\"1\"}]',55,'COMPLETED',1712802371000),(4,'1712809510543','[{\"index\":\"0\",\"id\":\"1\",\"name\":\"Flour\",\"price\":\"25\",\"img\":\"\\u0e41\\u0e1b\\u0e49\\u0e07\\u0e18\\u0e23\\u0e23\\u0e21\\u0e14\\u0e32.jpg\",\"count\":\"1\"},{\"index\":\"6\",\"id\":\"7\",\"name\":\"Egg\",\"price\":\"10\",\"img\":\"\\u0e44\\u0e02\\u0e48.jpg\",\"count\":\"1\"},{\"index\":\"11\",\"id\":\"12\",\"name\":\"Jelly\",\"price\":\"10\",\"img\":\"\\u0e40\\u0e22\\u0e25\\u0e25\\u0e35\\u0e48.jpg\",\"count\":\"1\"},{\"index\":\"12\",\"id\":\"13\",\"name\":\"Orio\",\"price\":\"10\",\"img\":\"\\u0e42\\u0e2d\\u0e23\\u0e34\\u0e42\\u0e2d\\u0e49.jpg\",\"count\":\"1\"}]',55,'COMPLETED',1712809510000),(5,'1712810105859','[{\"index\":\"1\",\"id\":\"2\",\"name\":\"Charcoal Flour\",\"price\":\"25\",\"img\":\"\\u0e41\\u0e1b\\u0e49\\u0e07\\u0e0a\\u0e32\\u0e42\\u0e04\\u0e25.png\",\"count\":\"1\"},{\"index\":\"7\",\"id\":\"8\",\"name\":\"Chocolate\",\"price\":\"10\",\"img\":\"\\u0e0a\\u0e47\\u0e2d\\u0e01\\u0e42\\u0e01\\u0e41\\u0e25\\u0e15.jpg\",\"count\":\"1\"},{\"index\":\"6\",\"id\":\"7\",\"name\":\"Egg\",\"price\":\"10\",\"img\":\"\\u0e44\\u0e02\\u0e48.jpg\",\"count\":\"1\"},{\"index\":\"12\",\"id\":\"13\",\"name\":\"Orio\",\"price\":\"10\",\"img\":\"\\u0e42\\u0e2d\\u0e23\\u0e34\\u0e42\\u0e2d\\u0e49.jpg\",\"count\":\"1\"}]',55,'COMPLETED',1712810105000);
/*!40000 ALTER TABLE `sp_transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-11 13:19:36

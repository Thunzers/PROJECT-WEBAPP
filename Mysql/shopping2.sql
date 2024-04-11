-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: shopping2
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
INSERT INTO `sp_product` VALUES (1,'แป้งธรรมดา','รายการเครป',25,'แป้งธรรมดา.jpg','IN STOCK'),(2,'แป้งชาโคล','รายการเครป',25,'แป้งชาโคล.jpg','IN STOCK'),(3,'แป้งใบเตย','รายการเครป',25,'ใบเตย.jpg','IN STOCK'),(4,'ไส้กรอก','คาว',10,'ไส้กรอก.jpg','IN STOCK'),(5,'แฮม','คาว',10,'แฮม.jpg','IN STOCK'),(6,'ปูอัด','คาว',10,'ปูอัด.jpg','IN STOCK'),(7,'ไข่','คาว',10,'ไข่.jpg','IN STOCK'),(8,'ช็อกโกแลต','หวาน',10,'ช็อกโกแลต.jpg','IN STOCK'),(9,'สตอเบอรี่','หวาน',10,'สตอดบอรี่.jpg','IN STOCK'),(10,'กล้วยหอม','หวาน',10,'กล้วยหอม.jpg','IN STOCK'),(11,'เนยถั่ว','หวาน',10,'เนยถั่ว.jpg','IN STOCK'),(12,'เยลลี่','ท็อปปิ้ง',10,'เยลลี่.jpg','IN STOCK'),(13,'โอริโอ้','ท็อปปิ้ง',10,'โอริโอ้.jpg','IN STOCK'),(14,'พริก','ซอส',0,'ซอสพริก.jpg','IN STOCK'),(15,'มะเขือเทศ','ซอส',0,'ซอสมะเขือเทศ.jpg','IN STOCK');
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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sp_transaction`
--

LOCK TABLES `sp_transaction` WRITE;
/*!40000 ALTER TABLE `sp_transaction` DISABLE KEYS */;
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

-- Dump completed on 2024-04-11 13:20:26

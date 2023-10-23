CREATE DATABASE  IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `ADID` int NOT NULL,
  `file_path` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ad_file` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Alternate` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ADID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,'images','1.png','https://www.youtube.com/watch?v=KTZmufxigQQ','First slide'),(2,'images','2.png','https://www.youtube.com/watch?v=IlT5iih4G2I','Second slide'),(3,'images','3.png','https://farmerstory.idv.tw/','Third slide'),(4,'images','4.png','https://agriharvest.tw/archives/40646','Four'),(5,'images','5.png','https://udn.com/news/story/7241/5051991','Five'),(6,'images','6.png','https://news.pts.org.tw/article/501990','Six');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comid` tinyint NOT NULL AUTO_INCREMENT,
  `Member_Username` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Id` int DEFAULT NULL,
  `textcom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heart` int DEFAULT NULL,
  `new_date` date DEFAULT NULL,
  PRIMARY KEY (`comid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'123',1,'123',4,'2021-01-09'),(3,'123',3,'null',1,'2021-01-02'),(4,'123',3,'null',1,'2021-01-02'),(5,'123',3,'null',1,'2021-01-02'),(6,'123',3,'15',1,'2021-01-02'),(7,'123',3,'5',1,'2021-01-02'),(8,'123',2,'123',1,'2021-01-03'),(9,'123',13,'44',2,'2021-01-07');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `counter`
--

DROP TABLE IF EXISTS `counter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `counter` (
  `People_Number` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `counter`
--

LOCK TABLES `counter` WRITE;
/*!40000 ALTER TABLE `counter` DISABLE KEYS */;
INSERT INTO `counter` VALUES (4);
/*!40000 ALTER TABLE `counter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guestbook`
--

DROP TABLE IF EXISTS `guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guestbook` (
  `GBNO` int NOT NULL AUTO_INCREMENT,
  `GBname` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Mail` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Subject` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Content` text COLLATE utf8mb4_unicode_ci,
  `Putdate` date DEFAULT NULL,
  PRIMARY KEY (`GBNO`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guestbook`
--

LOCK TABLES `guestbook` WRITE;
/*!40000 ALTER TABLE `guestbook` DISABLE KEYS */;
INSERT INTO `guestbook` VALUES (1,'1','1','1','1','1','2021-01-02'),(2,'1','1','1','1','1','2021-01-02'),(3,'123','123','123','123','123','2021-01-03'),(4,'7','7','7','7','我們','2021-01-03'),(5,'4','4','4','4','4','2021-01-03'),(6,'8','8','8','8','8','2021-01-03'),(7,'9','9','9','9','9',NULL),(8,'10','10','10','10','10',NULL),(9,'11','11','11','11','11',NULL),(10,'12','11','11','11','11',NULL),(11,'11','11','11','11','11',NULL),(12,'4','4','4','4','4','2021-01-06'),(13,'13','13','13','13','13','2021-01-06'),(14,'14','15','15','15','15','2021-01-06'),(15,'16','16','16','16','16','2021-01-06'),(16,'123','0909090909','45@45','41','4','2021-01-07');
/*!40000 ALTER TABLE `guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `Member_Name` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Member_Username` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Member_Password` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Member_Email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Member_Tel` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Member_Address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Member_Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES ('123','123','123','123','0931670407','aaa'),('gglai','12345678','00000','funnychick0407@gmail.com','0931670407','aaa'),('3','3','3','3','3','3'),('456','456','456','','0909',''),('5','5','5','5','5','5'),('6','6','6','6','6','6'),('789','789','789','','0909087956','');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_Id` int NOT NULL AUTO_INCREMENT,
  `Member_Username` varchar(8) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Id` int DEFAULT NULL,
  `order_Quantity` int DEFAULT NULL,
  PRIMARY KEY (`order_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (9,'123',3,2),(10,'123',9,1),(11,'123',6,1),(12,'123',3,11),(13,'123',3,4),(14,'123',4,4),(15,'123',4,1),(16,'123',13,1);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_Id` int NOT NULL AUTO_INCREMENT,
  `pay_way` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_way` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`order_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'貨到付款','7-11店到店'),(2,'貨到付款','7-11店到店'),(3,'貨到付款','7-11店到店'),(4,'貨到付款','7-11店到店'),(5,'貨到付款','7-11店到店'),(6,'貨到付款','7-11店到店'),(7,'貨到付款','7-11店到店'),(8,'貨到付款','7-11店到店'),(9,'貨到付款','7-11店到店'),(10,'貨到付款','7-11店到店'),(11,'貨到付款','全家店到店'),(12,'貨到付款','7-11店到店'),(13,'貨到付款','7-11店到店'),(14,'貨到付款','7-11店到店'),(15,'貨到付款','7-11店到店'),(16,'轉帳','黑貓宅急便');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `Product_Id` int NOT NULL,
  `Product_Code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Product_brand` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Name` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_FM` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Price` int DEFAULT NULL,
  `Product_Inventory` int DEFAULT NULL,
  `Product_Note` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Product_Picture` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Product_Id`),
  UNIQUE KEY `Product_Id` (`Product_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'a1','蔬菜','小松菜','250g',49,20,'嚴選在地新鮮食材、無多重農藥殘留、有機檢驗合格，小農用心契作幫您的健康把關，給您品嚐土地最真實的滋味。',NULL),(2,'a2','蔬菜','菠菜','250g',79,25,'嚴選在地新鮮食材、無多重農藥殘留、有機檢驗合格，小農用心契作幫您的健康把關，給您品嚐土地最真實的滋味。',NULL),(3,'a3','蔬菜','高麗菜','550g',69,11,'嚴選在地新鮮食材、無多重農藥殘留、有機檢驗合格，小農用心契作幫您的健康把關，給您品嚐土地最真實的滋味。',NULL),(4,'a4','蔬菜','地瓜葉','250g',49,25,'嚴選在地新鮮食材、無多重農藥殘留、有機檢驗合格，小農用心契作幫您的健康把關，給您品嚐土地最真實的滋味。',NULL),(5,'b1','水果','百香果','600g',140,30,'每顆水果皆口感清脆多汁順口，果肉細緻，品嘗過就難以忘懷的口感，皆經過最嚴格的三道把關程序：產地稽核、自主檢驗、人工篩選，把上選水果交到您的手上。',NULL),(6,'b2','水果','楊桃','1000g+-10%',87,9,'每顆水果皆口感清脆多汁順口，果肉細緻，品嘗過就難以忘懷的口感，皆經過最嚴格的三道把關程序：產地稽核、自主檢驗、人工篩選，把上選水果交到您的手上。',NULL),(7,'b3','水果','珍珠芭樂','1000g',69,30,'每顆水果皆口感清脆多汁順口，果肉細緻，品嘗過就難以忘懷的口感，皆經過最嚴格的三道把關程序：產地稽核、自主檢驗、人工篩選，把上選水果交到您的手上。',NULL),(8,'b4','水果','富士蘋果','1000g',100,20,'每顆水果皆口感清脆多汁順口，果肉細緻，品嘗過就難以忘懷的口感，皆經過最嚴格的三道把關程序：產地稽核、自主檢驗、人工篩選，把上選水果交到您的手上。',NULL),(9,'c1','乳製品','鮮牛乳','936ml',100,29,'１００％生乳製造，羊乳通過多重品保驗證，衛生安<br>全有保障。含蛋白質、脂肪、礦物質、醣類及維生素，鈣質含量高，是全家餐桌上早餐最好的營養補充最完整的保健食品。',NULL),(10,'c2','乳製品','鮮羊乳','936ml',149,30,'１００％生乳製造，羊乳通過多重品保驗證，衛生安<br>全有保障。含蛋白質、脂肪、礦物質、醣類及維生素，鈣質含量高，是全家餐桌上早餐最好的營養補充最完整的保健食品。',NULL),(11,'c3','乳製品','玻尿酸優格飲','200g',50,30,'１００％生乳製造，羊乳通過多重品保驗證，衛生安<br>全有保障。含蛋白質、脂肪、礦物質、醣類及維生素，鈣質含量高，是全家餐桌上早餐最好的營養補充最完整的保健食品。',NULL),(12,'c4','乳製品','奶油乳酪','350g',80,30,'１００％生乳製造，羊乳通過多重品保驗證，衛生安<br>全有保障。含蛋白質、脂肪、礦物質、醣類及維生素，鈣質含量高，是全家餐桌上早餐最好的營養補充最完整的保健食品。',NULL),(13,'a5','蔬菜','地瓜','500g',49,44,'44',NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shoppingcar`
--

DROP TABLE IF EXISTS `shoppingcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shoppingcar` (
  `carid` int NOT NULL AUTO_INCREMENT,
  `Product_Id` int NOT NULL,
  `Member_Username` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `Car_Quantity` int DEFAULT NULL,
  `Product_Id2` int DEFAULT NULL,
  `Product_Id3` int DEFAULT NULL,
  `Product_Id4` int DEFAULT NULL,
  `Car_Quantity2` int DEFAULT NULL,
  `Car_Quantity3` int DEFAULT NULL,
  `Car_Quantity4` int DEFAULT NULL,
  PRIMARY KEY (`carid`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shoppingcar`
--

LOCK TABLES `shoppingcar` WRITE;
/*!40000 ALTER TABLE `shoppingcar` DISABLE KEYS */;
/*!40000 ALTER TABLE `shoppingcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-08 20:38:33

/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.14-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: dolphin_admin_backend
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `line_color` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK46ccwnsi9409t36lurvtyljak` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES
(1,'#808080','Hardware/Tools'),
(2,'#0000FF','Gaming/Electronics'),
(3,'#FFC0CB','Cosmetics/Beauty'),
(4,'#8B4513','DIY Crafts/Kitchenware');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `age` int(11) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKr91517q1xbl3a22xvax0mnd4j` FOREIGN KEY (`id`) REFERENCES `user_` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES
(22,'male',1),
(34,'female',2),
(28,'male',3),
(45,'female',4),
(19,'male',5),
(31,'female',6),
(52,'male',7),
(27,'female',8),
(40,'male',9),
(24,'female',10),
(33,'male',11),
(29,'female',12),
(36,'male',13),
(21,'female',14),
(55,'male',15),
(42,'female',16),
(26,'male',17),
(38,'female',18),
(20,'male',19),
(47,'female',20),
(30,'male',21),
(23,'female',22),
(58,'male',23),
(32,'female',24),
(25,'male',25),
(41,'female',26),
(37,'male',27),
(18,'female',28),
(44,'male',29),
(35,'female',30),
(50,'male',31),
(22,'female',32),
(29,'male',33),
(48,'female',34),
(39,'male',35),
(27,'female',36),
(53,'male',37),
(31,'female',38),
(24,'male',39),
(46,'female',40),
(33,'male',41),
(19,'female',42),
(51,'male',43),
(28,'female',44),
(43,'male',45),
(26,'female',46),
(34,'male',47),
(21,'female',48),
(57,'male',49),
(30,'female',50);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_`
--

DROP TABLE IF EXISTS `order_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `simid` varchar(36) NOT NULL,
  `status` enum('CANCELED','COMPLETED','PENDING','SHIPPED') DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbcqs50rf794der0iy0h6c0mgd` (`customer_id`),
  CONSTRAINT `FKbcqs50rf794der0iy0h6c0mgd` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_`
--

LOCK TABLES `order_` WRITE;
/*!40000 ALTER TABLE `order_` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `price_per_unit` decimal(15,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjpk230vxy41y3ncj7kpuu9y2e` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKjpk230vxy41y3ncj7kpuu9y2e` FOREIGN KEY (`order_id`) REFERENCES `order_` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(1000) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1mtsbur82frn64de7balymq9s` (`category_id`),
  CONSTRAINT `FK1mtsbur82frn64de7balymq9s` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(1,'18V Cordless drill with variable speed.','Power Drill',89.99,50,1),
(2,'45-piece chrome vanadium steel set.','Socket Wrench Set',45.50,120,1),
(3,'Auto-ranging tester for voltage and resistance.','Digital Multimeter',29.00,75,1),
(4,'12,000 DPI optical sensor with RGB.','Gaming Mouse',59.99,200,2),
(5,'Cherry MX Blue switches, aluminum frame.','Mechanical Keyboard',109.00,85,2),
(6,'144Hz refresh rate, 1ms response time.','27-inch Monitor',249.50,30,2),
(7,'Hyaluronic acid and Vitamin C formula.','Face Serum',32.00,150,3),
(8,'12 high-pigment matte and shimmer shades.','Eyeshadow Palette',45.00,90,3),
(9,'Non-greasy, water-resistant facial protection.','Sunscreen SPF 50',18.25,300,3),
(10,'12-inch pre-seasoned heavy duty pan.','Cast Iron Skillet',35.99,40,4),
(11,'8-inch high-carbon stainless steel blade.','Chef Knife',65.00,55,4),
(12,'60W professional grade with 20 glue sticks.','Hot Glue Gun',14.50,210,4);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_`
--

DROP TABLE IF EXISTS `user_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_`
--

LOCK TABLES `user_` WRITE;
/*!40000 ALTER TABLE `user_` DISABLE KEYS */;
INSERT INTO `user_` VALUES
(1,'james.smith@example.com','James Smith','$2a$10$eImiui..placeholder'),
(2,'mary.johnson@example.com','Mary Johnson','$2a$10$eImiui..placeholder'),
(3,'robert.williams@example.com','Robert Williams','$2a$10$eImiui..placeholder'),
(4,'patricia.brown@example.com','Patricia Brown','$2a$10$eImiui..placeholder'),
(5,'michael.jones@example.com','Michael Jones','$2a$10$eImiui..placeholder'),
(6,'jennifer.garcia@example.com','Jennifer Garcia','$2a$10$eImiui..placeholder'),
(7,'william.miller@example.com','William Miller','$2a$10$eImiui..placeholder'),
(8,'linda.davis@example.com','Linda Davis','$2a$10$eImiui..placeholder'),
(9,'david.rodriguez@example.com','David Rodriguez','$2a$10$eImiui..placeholder'),
(10,'elizabeth.martinez@example.com','Elizabeth Martinez','$2a$10$eImiui..placeholder'),
(11,'richard.hernandez@example.com','Richard Hernandez','$2a$10$eImiui..placeholder'),
(12,'barbara.lopez@example.com','Barbara Lopez','$2a$10$eImiui..placeholder'),
(13,'joseph.gonzalez@example.com','Joseph Gonzalez','$2a$10$eImiui..placeholder'),
(14,'susan.wilson@example.com','Susan Wilson','$2a$10$eImiui..placeholder'),
(15,'thomas.anderson@example.com','Thomas Anderson','$2a$10$eImiui..placeholder'),
(16,'jessica.thomas@example.com','Jessica Thomas','$2a$10$eImiui..placeholder'),
(17,'christopher.taylor@example.com','Christopher Taylor','$2a$10$eImiui..placeholder'),
(18,'sarah.moore@example.com','Sarah Moore','$2a$10$eImiui..placeholder'),
(19,'charles.jackson@example.com','Charles Jackson','$2a$10$eImiui..placeholder'),
(20,'karen.martin@example.com','Karen Martin','$2a$10$eImiui..placeholder'),
(21,'christopher.lee@example.com','Christopher Lee','$2a$10$eImiui..placeholder'),
(22,'nancy.perez@example.com','Nancy Perez','$2a$10$eImiui..placeholder'),
(23,'matthew.thompson@example.com','Matthew Thompson','$2a$10$eImiui..placeholder'),
(24,'betty.white@example.com','Betty White','$2a$10$eImiui..placeholder'),
(25,'anthony.harris@example.com','Anthony Harris','$2a$10$eImiui..placeholder'),
(26,'margaret.clark@example.com','Margaret Clark','$2a$10$eImiui..placeholder'),
(27,'mark.lewis@example.com','Mark Lewis','$2a$10$eImiui..placeholder'),
(28,'sandra.robinson@example.com','Sandra Robinson','$2a$10$eImiui..placeholder'),
(29,'steven.walker@example.com','Steven Walker','$2a$10$eImiui..placeholder'),
(30,'ashley.young@example.com','Ashley Young','$2a$10$eImiui..placeholder'),
(31,'paul.hall@example.com','Paul Hall','$2a$10$eImiui..placeholder'),
(32,'dorothy.allen@example.com','Dorothy Allen','$2a$10$eImiui..placeholder'),
(33,'andrew.wright@example.com','Andrew Wright','$2a$10$eImiui..placeholder'),
(34,'kimberly.king@example.com','Kimberly King','$2a$10$eImiui..placeholder'),
(35,'joshua.scott@example.com','Joshua Scott','$2a$10$eImiui..placeholder'),
(36,'donna.green@example.com','Donna Green','$2a$10$eImiui..placeholder'),
(37,'kevin.baker@example.com','Kevin Baker','$2a$10$eImiui..placeholder'),
(38,'michelle.adams@example.com','Michelle Adams','$2a$10$eImiui..placeholder'),
(39,'brian.nelson@example.com','Brian Nelson','$2a$10$eImiui..placeholder'),
(40,'carol.hill@example.com','Carol Hill','$2a$10$eImiui..placeholder'),
(41,'edward.ramirez@example.com','Edward Ramirez','$2a$10$eImiui..placeholder'),
(42,'amanda.campbell@example.com','Amanda Campbell','$2a$10$eImiui..placeholder'),
(43,'ronald.mitchell@example.com','Ronald Mitchell','$2a$10$eImiui..placeholder'),
(44,'melissa.roberts@example.com','Melissa Roberts','$2a$10$eImiui..placeholder'),
(45,'timothy.carter@example.com','Timothy Carter','$2a$10$eImiui..placeholder'),
(46,'deborah.phillips@example.com','Deborah Phillips','$2a$10$eImiui..placeholder'),
(47,'jeffrey.evans@example.com','Jeffrey Evans','$2a$10$eImiui..placeholder'),
(48,'stephanie.turner@example.com','Stephanie Turner','$2a$10$eImiui..placeholder'),
(49,'ryan.torres@example.com','Ryan Torres','$2a$10$eImiui..placeholder'),
(50,'rebecca.parker@example.com','Rebecca Parker','$2a$10$eImiui..placeholder');
/*!40000 ALTER TABLE `user_` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cooldown_ends_at` datetime(6) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `is_cooldown_active` bit(1) DEFAULT NULL,
  `sim_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKkh2nnetkrhdqajgjcky68hmne` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'dolphin_admin_backend'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-19 13:33:43

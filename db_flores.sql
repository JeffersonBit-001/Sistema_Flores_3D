-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_flores
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrito` (
  `carrito_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `flor_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp(),
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`carrito_id`),
  KEY `user_id` (`user_id`),
  KEY `fk_precio` (`flor_id`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`flor_id`) REFERENCES `flores` (`flor_id`),
  CONSTRAINT `fk_precio` FOREIGN KEY (`flor_id`) REFERENCES `flores` (`flor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
INSERT INTO `carrito` VALUES (4,2,4,3,'2024-09-28 21:36:15',120.00),(5,3,4,4,'2024-09-28 22:19:17',120.00),(6,2,4,1,'2024-09-28 22:30:50',120.00),(7,2,4,1,'2024-09-28 22:31:07',120.00),(8,2,4,1,'2024-09-28 22:31:09',120.00),(9,2,4,1,'2024-09-28 22:31:09',120.00),(10,2,4,1,'2024-09-28 22:31:10',120.00),(11,2,4,1,'2024-09-28 22:31:12',120.00),(13,1,4,1,'2024-10-07 22:51:54',120.00),(14,2,1,1,'2024-10-25 14:55:05',135.00),(15,2,2,1,'2024-10-25 14:57:44',50.00),(16,2,3,1,'2024-10-25 14:57:53',120.00);
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Girasoles'),(2,'Tulipanes'),(3,'Rosas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `comentario_id` int(11) NOT NULL AUTO_INCREMENT,
  `flor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL CHECK (`calificacion` between 1 and 5),
  `fecha_comentario` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`comentario_id`),
  KEY `flor_id` (`flor_id`),
  KEY `comentarios_ibfk_2` (`user_id`),
  CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`flor_id`) REFERENCES `flores` (`flor_id`),
  CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (1,1,2,'Muy bueno le gusto mucho a mi tia',5,'2024-09-20 18:35:30'),(3,1,1,'a',3,'2024-09-22 17:37:33'),(4,1,1,'God',5,'2024-09-22 17:43:32'),(8,4,2,'hola',5,'2024-09-28 20:54:22'),(9,1,2,'buenas',5,'2024-09-28 20:55:44'),(10,2,2,'adios',3,'2024-09-28 20:56:01');
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pedido` (
  `detalle_id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_id` int(11) DEFAULT NULL,
  `flor_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`detalle_id`),
  KEY `pedido_id` (`pedido_id`),
  KEY `flor_id` (`flor_id`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`flor_id`) REFERENCES `flores` (`flor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,4,1,120.00),(2,1,4,1,120.00),(4,11,1,2,135.00),(5,12,3,3,120.00),(6,12,2,2,50.00);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flores`
--

DROP TABLE IF EXISTS `flores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flores` (
  `flor_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `fecha_agregado` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`flor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flores`
--

LOCK TABLES `flores` WRITE;
/*!40000 ALTER TABLE `flores` DISABLE KEYS */;
INSERT INTO `flores` VALUES (1,'Caja de Girasoles','Caja de Girasoles',135.00,20,'Box 14.png','2024-09-20 17:57:04'),(2,'Caja de Tulipanes','Caja de Tulipanes Con forma Circular',50.00,35,'Box 1.jpg','2024-09-22 17:47:44'),(3,'Caja de Rosas','Caja de rosas Negra y un pequeÃ±o listÃ³n',120.00,15,'Box 3.jpg','2024-09-20 23:35:07'),(4,'Caja especial de Amor','Caja de dia de San Valentin contiene Rosas de distintos colores',120.00,10,'Box 8.jpeg','2024-09-22 17:48:57');
/*!40000 ALTER TABLE `flores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flores_categorias`
--

DROP TABLE IF EXISTS `flores_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flores_categorias` (
  `flor_id` int(11) NOT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`flor_id`,`categoria_id`),
  KEY `categoria_id` (`categoria_id`),
  CONSTRAINT `flores_categorias_ibfk_1` FOREIGN KEY (`flor_id`) REFERENCES `flores` (`flor_id`),
  CONSTRAINT `flores_categorias_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flores_categorias`
--

LOCK TABLES `flores_categorias` WRITE;
/*!40000 ALTER TABLE `flores_categorias` DISABLE KEYS */;
INSERT INTO `flores_categorias` VALUES (1,1),(2,2),(3,3),(4,3);
/*!40000 ALTER TABLE `flores_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `pago_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion_envio` varchar(255) NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `numero_tarjeta` varchar(16) NOT NULL,
  `fecha_expiracion` varchar(5) NOT NULL,
  `cvv` varchar(4) NOT NULL,
  `monto_total` decimal(10,2) NOT NULL,
  `fecha_pago` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`pago_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,2,'Kiara Mishell Santti Saavedra','kiara_santi@gmail.com','999222333','casa de kiara','Lima','S M P','012332','4534534543534543','07/12','324',1940.00,'2024-09-28 23:09:04'),(2,1,'Joaquin Alfonso Loa Denegri','jloadenegri@gmail.com','949234515','mi casa','Lima','Comas','12312312','4324234234234','07/14','432',260.00,'2024-10-04 23:34:22'),(3,1,'Joaquin Loa','jloadenegri@gmail.com','949234515','Av.Felipe Pinglo Alva 308','Lima','Comas','01504','345643543534543','07/12','432',140.00,'2024-10-07 20:28:26'),(4,1,'Joaquin Loa','jloadenegri@gmail.com','949234515','Av.Felipe Pinglo Alva 308','Lima','Comas','01504','345643543534543','07/12','432',140.00,'2024-10-07 20:31:53'),(12,29,'Melody Loa Denegri','melody@gmail.com','998438923','Carabayllo','Lima','Carabayllo','01578','78987976765','09/12','523',290.00,'2024-10-28 00:30:42'),(13,30,'Palomino','palomino@gmail.com','999434514','Utp','Lima','Olivos','01576','9898345612345678','07/22','876',480.00,'2024-10-28 14:17:17');
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','enviado','entregado','cancelado') DEFAULT 'pendiente',
  PRIMARY KEY (`pedido_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `register` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,1,260.00,'2024-10-04 23:34:22','pendiente'),(11,29,290.00,'2024-10-28 00:30:42','enviado'),(12,30,480.00,'2024-10-28 14:17:17','enviado');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `register` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'Joaquin','jloadenegri@gmail.com','12345','mi casa','949234515','2024-09-17 23:33:21'),(2,'Kiara','kiara_santi@gmail.com','Kiara','Otro lao','999999222','2024-09-20 02:25:27'),(3,'Raul','raul_escualaya@gmail.com','raul','casa de raul','112345678','2024-09-20 02:27:42'),(29,'Melody Loa Denegri','melody@gmail.com','melody','Carabayllo','998438923','2024-10-28 00:27:28'),(30,'Palomino','palomino@gmail.com','palomino','Utp','999434514','2024-10-28 14:15:27');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'db_flores'
--

--
-- Dumping routines for database 'db_flores'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-02  8:13:11

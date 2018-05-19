-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: bimo
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `asiento`
--

DROP TABLE IF EXISTS `asiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asiento` (
  `id_funcion` int(11) DEFAULT NULL,
  `asientos` varchar(50) DEFAULT NULL,
  `no_tarjeta` varchar(16) DEFAULT NULL,
  `seccion` varchar(3) DEFAULT NULL,
  `fecha_mov` date DEFAULT NULL,
  `hora_mov` time DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiento`
--

LOCK TABLES `asiento` WRITE;
/*!40000 ALTER TABLE `asiento` DISABLE KEYS */;
INSERT INTO `asiento` VALUES (1,'1_1','1234','A1',NULL,NULL,NULL),(1,'1_3','1234','A1',NULL,NULL,NULL),(1,'1_6,1_7','1234','A1',NULL,NULL,NULL),(1,'7_7','1234','A1',NULL,NULL,NULL),(1,'5_6,5_5,5_4','999999999999','A2',NULL,NULL,NULL),(1,'4_3,4_4,4_5,4_6','1234124312431243','A2',NULL,NULL,NULL),(1,'1_1,1_2,1_3','1234','B1',NULL,NULL,NULL),(1,'1_8,1_9,1_10','1234','B2',NULL,NULL,NULL),(1,'1_1,2_1,2_2,1_2','1234','A1',NULL,NULL,NULL),(3,'1_1,1_2,2_2,2_3','1234','B2',NULL,NULL,NULL),(3,'1_10,2_10','1234','B2',NULL,NULL,NULL),(3,'5_10','1234','B2',NULL,NULL,NULL),(3,'5_10','1234','B2',NULL,NULL,NULL),(0,'1_9,1_7','1234','A3',NULL,NULL,NULL),(0,'10_3,10_4,10_5,10_6,10_7','1','A3',NULL,NULL,NULL),(0,'4_1,4_2,4_3','1234','A3',NULL,NULL,NULL),(1,'1_1,1_2','1234234554236666','A1',NULL,NULL,NULL),(0,'1_8,1_9,1_10','1111111111111111','A1','2018-05-18','15:00:00',5000),(0,'1_10,2_10','1111111111111111','A2','2018-05-18','15:00:00',3000),(0,'2_8','1111111111111111','A1','2018-05-18','18:20:36',800),(0,'1_1','1111111122222222','A1','2018-05-18','22:03:59',800);
/*!40000 ALTER TABLE `asiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estacionamiento`
--

DROP TABLE IF EXISTS `estacionamiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estacionamiento` (
  `no_tarjeta` varchar(17) DEFAULT NULL,
  `id_funcion` int(11) DEFAULT NULL,
  `num_cajon` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estacionamiento`
--

LOCK TABLES `estacionamiento` WRITE;
/*!40000 ALTER TABLE `estacionamiento` DISABLE KEYS */;
INSERT INTO `estacionamiento` VALUES ('1111',0,2);
/*!40000 ALTER TABLE `estacionamiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `folio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `artistas` varchar(200) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imgurl` text,
  PRIMARY KEY (`folio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Lago de los Cisnes','Ballet Voronezh','Uno de los clásicos más importantes de todos los tiempos: El lago de los cisnes viene a México interpretado por 35 distinguidos bailarines rusos.','/img/cascanueces.jpg'),(2,'2 Comediante con \"Madre\"','Jorge Falcón y Teo González','Jorge Falcón y Teo González llegan para alegrar tu noche con risas garantizadas o te devolvemos tu dinero.','/img/2comediantes.jpg'),(3,'El Rey León','Más de 100 artistas en escena.','Descubre el musical que conmueve al mundo y siente que te transportas a África con esta conmovedora historia musicalizada.','/img/elreyleon.jpg'),(4,'Tributo a Paco de Lucía','Michel Camilo & Tomatio','Michel Camilo (República Dominicana) y Tomatio (España) se unen para realizar un tributo al celebre guitarrista español \"Paco de Lucía\".','/img/paco.jpg'),(5,'Molotov Unplugged','Molotov e Invitados','Revive los temas icónicos de la controversial banda mexicana \"Molotov\" junto a invitados sorpresa en un ámbiente alternativo.','/img/molotov.jpg'),(6,'Luis Miguel: México Por Siempre','Luis Miguel','El \"Sol de México\" llega en su gira nacional para cantar sus nuevos éxtos y sus clásicos que tanto ama el pueblo.','/img/luismiguel.jpg'),(7,'Ara Malikian','Ara Malikian','Ara Malikian, presenta su último trabajo \"La Increíble Historia de Violín\" en su gira mundial. Un maravillo viaje alrededor del mundo.','/img/aramalikian.jpg');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcion`
--

DROP TABLE IF EXISTS `funcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcion` (
  `id` int(11) NOT NULL,
  `folio` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  PRIMARY KEY (`folio`,`fecha`,`hora`),
  CONSTRAINT `funcion_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `evento` (`folio`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcion`
--

LOCK TABLES `funcion` WRITE;
/*!40000 ALTER TABLE `funcion` DISABLE KEYS */;
INSERT INTO `funcion` VALUES (0,1,'2018-03-30','20:00:00'),(1,1,'2018-03-31','20:00:00'),(2,1,'2018-04-01','20:00:00'),(3,2,'2018-04-15','21:00:00'),(4,3,'2018-05-06','20:00:00'),(5,3,'2018-05-07','20:00:00'),(6,4,'2018-05-25','21:00:00'),(7,4,'2018-05-26','21:00:00'),(8,5,'2018-06-01','22:00:00'),(9,6,'2018-07-07','22:00:00'),(10,7,'2018-07-17','21:00:00');
/*!40000 ALTER TABLE `funcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lista_de_codigos_validos`
--

DROP TABLE IF EXISTS `lista_de_codigos_validos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lista_de_codigos_validos` (
  `codigo` varchar(16) NOT NULL,
  `estado` tinyint(1) DEFAULT '0',
  `num_promo` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`codigo`),
  KEY `num_promo` (`num_promo`),
  CONSTRAINT `lista_de_codigos_validos_ibfk_1` FOREIGN KEY (`num_promo`) REFERENCES `promocion` (`num_promo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lista_de_codigos_validos`
--

LOCK TABLES `lista_de_codigos_validos` WRITE;
/*!40000 ALTER TABLE `lista_de_codigos_validos` DISABLE KEYS */;
/*!40000 ALTER TABLE `lista_de_codigos_validos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios_evento`
--

DROP TABLE IF EXISTS `precios_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precios_evento` (
  `folio_evento` int(11) DEFAULT NULL,
  `top` float NOT NULL,
  `mid` float NOT NULL,
  `low` float NOT NULL,
  KEY `folio_evento` (`folio_evento`),
  CONSTRAINT `precios_evento_ibfk_1` FOREIGN KEY (`folio_evento`) REFERENCES `evento` (`folio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_evento`
--

LOCK TABLES `precios_evento` WRITE;
/*!40000 ALTER TABLE `precios_evento` DISABLE KEYS */;
INSERT INTO `precios_evento` VALUES (1,1000,800,400),(2,800,750,600),(3,500,300,100),(4,600,500,400),(5,3000,2500,1800),(6,1200,900,500),(7,500,300,180);
/*!40000 ALTER TABLE `precios_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion`
--

DROP TABLE IF EXISTS `promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocion` (
  `num_promo` int(11) NOT NULL AUTO_INCREMENT,
  `folio` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  PRIMARY KEY (`num_promo`),
  KEY `folio` (`folio`),
  CONSTRAINT `promocion_ibfk_1` FOREIGN KEY (`folio`) REFERENCES `evento` (`folio`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion`
--

LOCK TABLES `promocion` WRITE;
/*!40000 ALTER TABLE `promocion` DISABLE KEYS */;
INSERT INTO `promocion` VALUES (1,3,'Niños entran gratis en la compra minima de 2 boletos','2018-03-27','2018-09-30'),(2,7,'Descuento del 20% en la compra del segundo boleto','2018-04-02','2018-09-30');
/*!40000 ALTER TABLE `promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promocion_titular`
--

DROP TABLE IF EXISTS `promocion_titular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promocion_titular` (
  `num_promo` int(11) NOT NULL AUTO_INCREMENT,
  `no_tarjeta` varchar(16) NOT NULL,
  PRIMARY KEY (`num_promo`,`no_tarjeta`),
  KEY `no_tarjeta` (`no_tarjeta`),
  CONSTRAINT `promocion_titular_ibfk_1` FOREIGN KEY (`num_promo`) REFERENCES `promocion` (`num_promo`),
  CONSTRAINT `promocion_titular_ibfk_2` FOREIGN KEY (`no_tarjeta`) REFERENCES `titular` (`no_tarjeta`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promocion_titular`
--

LOCK TABLES `promocion_titular` WRITE;
/*!40000 ALTER TABLE `promocion_titular` DISABLE KEYS */;
INSERT INTO `promocion_titular` VALUES (1,'1234'),(2,'1234');
/*!40000 ALTER TABLE `promocion_titular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titular`
--

DROP TABLE IF EXISTS `titular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titular` (
  `no_tarjeta` varchar(16) NOT NULL,
  PRIMARY KEY (`no_tarjeta`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titular`
--

LOCK TABLES `titular` WRITE;
/*!40000 ALTER TABLE `titular` DISABLE KEYS */;
INSERT INTO `titular` VALUES ('1234');
/*!40000 ALTER TABLE `titular` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-05-19  9:31:38

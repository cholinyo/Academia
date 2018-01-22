-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: dbacademia
-- ------------------------------------------------------
-- Server version	5.6.38

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
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaturas` (
  `idasignatura` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Horario` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  `Profesor` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `Estado` varchar(4) CHARACTER SET utf8 COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idasignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (19,'Lengua','Tarde','22','alta'),(20,'Naturale','Lunes 13.00','2','alta'),(21,'Naturales','Lunes 13.00','8','alta'),(22,'Ingle','Viernes 13','8','alta'),(23,'Lengua','Vierens 15','9','alta'),(24,'Lengua','Lengua','2','alta'),(25,'Estadistica','Sabado','8','alta'),(26,'Lengua','Lengua','2','alta'),(27,'Música','Marte 11h','2','alta'),(28,'Naturalez','Lunes 8h Martes 13h','8','alta'),(29,'Tecnologia','Viernes y  Jueves 12','8','alta'),(30,'Religion','Sabados maÃ±ana','8','baja'),(31,'Religión','Jueves 16h','8','baja'),(32,'Religión','Lunes 13h','22','alta');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matriculas`
--

DROP TABLE IF EXISTS `matriculas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matriculas` (
  `idmatricula` int(11) NOT NULL AUTO_INCREMENT,
  `idusuario` int(11) DEFAULT NULL,
  `idasignatura` int(11) DEFAULT NULL,
  `activo` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idmatricula`),
  UNIQUE KEY `idmatriculas_UNIQUE` (`idmatricula`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matriculas`
--

LOCK TABLES `matriculas` WRITE;
/*!40000 ALTER TABLE `matriculas` DISABLE KEYS */;
INSERT INTO `matriculas` VALUES (23,12,19,NULL),(25,20,26,NULL),(26,13,19,NULL),(27,14,19,NULL),(28,23,19,NULL),(29,3,21,NULL),(30,23,23,NULL),(31,23,24,NULL),(33,5,21,NULL),(34,12,21,NULL),(35,15,21,NULL),(36,16,28,NULL),(37,29,28,NULL),(38,15,28,NULL),(39,12,23,NULL),(40,24,23,NULL),(41,26,23,NULL),(42,53,28,NULL),(43,52,28,NULL),(44,16,19,NULL),(45,3,19,NULL),(46,18,19,NULL),(47,58,19,NULL);
/*!40000 ALTER TABLE `matriculas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peticionestutorias`
--

DROP TABLE IF EXISTS `peticionestutorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peticionestutorias` (
  `idpeticion` int(11) NOT NULL AUTO_INCREMENT,
  `idprofesor` int(11) DEFAULT NULL,
  `idalumno` int(11) DEFAULT NULL,
  `dia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  `estado` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observaciones` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`idpeticion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peticionestutorias`
--

LOCK TABLES `peticionestutorias` WRITE;
/*!40000 ALTER TABLE `peticionestutorias` DISABLE KEYS */;
INSERT INTO `peticionestutorias` VALUES (1,22,23,'Martes',10,'rechazada','observaciones'),(2,22,23,'Jueves',12,'aceptada','Por favor apruebe. Soy bueno!!!'),(3,22,23,'Martes',10,'pendiente','Necesito aprobar');
/*!40000 ALTER TABLE `peticionestutorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorias`
--

DROP TABLE IF EXISTS `tutorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorias` (
  `idtutorias` int(11) NOT NULL AUTO_INCREMENT,
  `idprofesor` int(11) DEFAULT NULL,
  `dia` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `hora` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtutorias`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorias`
--

LOCK TABLES `tutorias` WRITE;
/*!40000 ALTER TABLE `tutorias` DISABLE KEYS */;
INSERT INTO `tutorias` VALUES (8,22,'Martes',10),(10,22,'Miercoles',11),(11,22,'Jueves',12);
/*!40000 ALTER TABLE `tutorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `rol` varchar(45) NOT NULL,
  `baja` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin','Administrador',NULL,'admin','no'),(2,'vicentin','123456','Vicente','Caruncho Ramos','profesor','si'),(3,'Manolita','null','Manolo','Garcia Garcia','estudiante','no'),(4,'Juan','juan','Juan','Garcia Perez','estudiante','si'),(5,'Ana','null','Ana','Garcia Ramos','estudiante','no'),(6,'Pilirr','null','Pilar','Pilarica Garcia','estudiante','si'),(7,'martina','null','Martina','Garcia Guapa','estudiante','si'),(8,'Mene','null','Manolonnn','Martinez Soria','profesor','no'),(9,'pepe','null','Pepe','Mora Rubio','profesor','no'),(10,'Manolor','nullr','Manolor','GarcÃ­a GarcÃ­a','estudiante','si'),(11,'obi','obi','Obi','Wan Kenobi','estudiante','si'),(12,'caro','null','Carolina','Caruncho','estudiante','no'),(13,'Juan','juan','Juan','Marcilla','estudiante','si'),(14,'maria','maria','Maria','de laO','estudiante','no'),(15,'Biguiri','ala','Biguirimana','Bahati Colini','estudiante','no'),(16,'uri','uri','Uriarte','Gonzalez Camas','estudiante','no'),(17,'Uritz','uru','Uritz ','Aduritx','estudiante','no'),(18,'juanin','juanin','Juan ','Ballester Garces','estudiante','no'),(19,'albert','Alberto','Albertini','Gal Gil','estudiante','no'),(20,'Martina','mam','Martina','Caruncho Delgado','estudiante','no'),(21,'Leo','null','Leo','Messi El10','estudiante','si'),(22,'profe','profe','Vicente','Caruncho Ramos','profesor','no'),(23,'alu','alu','Alumno','Prueba','estudiante','no'),(24,'jose','Jose','Jose','Peris Navarro','estudiante','no'),(25,'Jon','123456','Jon','Herrera Gomez','estudiante','no'),(26,'Manolo','123','Manolo ','Garcia Gomez','estudiante','no'),(27,'viva','123','111','111','estudiante','no'),(28,'mariola','mari','Mariola','Gomez Sanchez','estudiante','no'),(29,'German','german','1234','Gomez Acebo','estudiante','no'),(30,'james','1234567','James ','Madrid Barca','estudiante','no'),(31,'miguel','123456','Miguel','Bartolome','estudiante','no'),(32,'ruben','null','Rubén','Arrandiz','estudiante','no'),(33,'salva','123456','Salvador','Aguilella ','estudiante','no'),(34,'Java','1234','Java','Jaimito Ramos','estudiante','no'),(35,'juan','12345','Joan','Taus','estudiante','no'),(36,'Aleix','12345','Aleix','Debon','estudiante','no'),(37,'jmata','Juan','Juan','Mata Rile','estudiante','no'),(38,'marc','123','Marcelino','Panivino','estudiante','no'),(39,'joder','12345','Joder ','Nova','estudiante','no'),(40,'GarbiÃ±e','1234','GarbiÃ±e','Muguruza','estudiante','no'),(41,'Emilio','123','Emilio','ButragueÃ±o','estudiante','no'),(42,'juan','123','Juan','Gomez','estudiante','no'),(43,'Alex','123','Alex','Angulo','estudiante','no'),(44,'Mira','123','Mira','Jimenez Gal','estudiante','no'),(45,'Manolo','m1','Manolo','Huertas','estudiante','no'),(46,'ale','12','Alejandro','Gomes Martinez','estudiante','no'),(47,'Jene','12345','Jane','fona Redonda','estudiante','no'),(48,'Andrea','123','Andrea ','Janeido','estudiante','no'),(49,'Mira','123456','Mira','Sorvino','estudiante','no'),(50,'Manolo','Garcia','Manuel','LÃ¡piz','estudiante','no'),(51,'Jenifer','123','Jenifer','Rus Agrado','estudiante','no'),(52,'ximo','12345','Ximo','Bayo','estudiante','no'),(53,'miren','null','Mirena','Nova','estudiante','no'),(54,'aaaa','aaa','Ana','Gomez','estudiante','si'),(55,'miki','12345','Miki','Nadal','estudiante','si'),(56,'Jorge','123456','Jorge','Mañez Peritó','estudiante','no'),(57,'Jperis','123456','José','Perís Gañan','estudiante','no'),(58,'Manolo','123456','Manolo','Escobar','estudiante','no');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-22 12:04:26

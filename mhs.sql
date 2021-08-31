-- MariaDB dump 10.18  Distrib 10.4.17-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mahasiswa
-- ------------------------------------------------------
-- Server version	10.4.17-MariaDB

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
-- Table structure for table `dosen`
--

DROP TABLE IF EXISTS `dosen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosen` (
  `nidn` varchar(5) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` char(1) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  PRIMARY KEY (`nidn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosen`
--

LOCK TABLES `dosen` WRITE;
/*!40000 ALTER TABLE `dosen` DISABLE KEYS */;
INSERT INTO `dosen` VALUES ('00001','Nugraha Adisono','L','+6200000000'),('00002','Aduinin Din','P','+6200000001'),('00003','Jaka Tarub','L','+6200000002'),('00004','Geraldin Etok','P','+6200000033'),('00005','Govar Bahar','L','+6200000023'),('00006','Sonya Silimin','P','+6200000045'),('00007','Jimmy Nutron','L','+6200000032'),('00008','Toyota X','L','+6200000054'),('00009','Honda Salim','L','+6200000067'),('00010','Adi Sena Ayu','P','+6200345234');
/*!40000 ALTER TABLE `dosen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jurusan`
--

DROP TABLE IF EXISTS `jurusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurusan` (
  `kd_jur` varchar(20) NOT NULL,
  `nama_jurusan` varchar(50) DEFAULT NULL,
  `nidn_kajur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_jur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurusan`
--

LOCK TABLES `jurusan` WRITE;
/*!40000 ALTER TABLE `jurusan` DISABLE KEYS */;
/*!40000 ALTER TABLE `jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matkul`
--

DROP TABLE IF EXISTS `matkul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matkul` (
  `kd_mk` varchar(5) NOT NULL,
  `nama_mk` varchar(25) NOT NULL,
  `sks` int(11) NOT NULL,
  PRIMARY KEY (`kd_mk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matkul`
--

LOCK TABLES `matkul` WRITE;
/*!40000 ALTER TABLE `matkul` DISABLE KEYS */;
INSERT INTO `matkul` VALUES ('MK001','Interaksi Manusia dan Kom',3),('MK002','Basis Data',3),('MK003','Web Programming',5),('MK004','Struktur Data dan Algorit',3),('MK005','Struktur Bangunan',2),('MK006','Architecture Etnic',3),('MK007','Studio Perancangan',4),('MK008','Machine Learning',3),('MK009','Game Development',4),('MK010','Argonometri',2);
/*!40000 ALTER TABLE `matkul` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mhs`
--

DROP TABLE IF EXISTS `mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mhs` (
  `nim` int(11) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `kode_jurusan` varchar(20) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL,
  `no_tlp` varchar(15) DEFAULT NULL,
  `angkatan` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mhs`
--

LOCK TABLES `mhs` WRITE;
/*!40000 ALTER TABLE `mhs` DISABLE KEYS */;
INSERT INTO `mhs` VALUES (1815101001,'Nyoman Sami',NULL,'Tabanan','P','081334000005','2019'),(1815101002,'Made Pengkol',NULL,'Singaraja','L','081334000006','2018'),(1815101003,'Ketut Semedi',NULL,'Jembrana','L','081334000007','2018'),(1815101004,'Luh Dino',NULL,'Denpasar','P','081334000008','2018'),(1915101001,'Kadek Juki',NULL,'Denpasar','P','081334000002','2019'),(1915101002,'Komang Sirna',NULL,'Jembrana','L','081334000003','2019'),(1915101003,'Ketut Jali',NULL,'Negara','L','081334000004','2019'),(2015101001,'Putu Kebog',NULL,'Singaraja','L','081334000001','2020'),(2015101002,'Luh De Funny',NULL,'Singaraja','P','081334000009','2020'),(2015101003,'Alexsander Epoxi',NULL,'Singaraja','L','081334000010','2020');
/*!40000 ALTER TABLE `mhs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mk_mhs`
--

DROP TABLE IF EXISTS `mk_mhs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mk_mhs` (
  `kd_mk` varchar(5) NOT NULL,
  `kd_mhs` int(11) DEFAULT NULL,
  `kd_dosen` varchar(5) NOT NULL,
  `tahun` int(11) NOT NULL,
  `smst` int(11) NOT NULL,
  KEY `fk_nim` (`kd_mhs`),
  CONSTRAINT `fk_nim` FOREIGN KEY (`kd_mhs`) REFERENCES `mhs` (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mk_mhs`
--

LOCK TABLES `mk_mhs` WRITE;
/*!40000 ALTER TABLE `mk_mhs` DISABLE KEYS */;
INSERT INTO `mk_mhs` VALUES ('MK001',2015101001,'00001',2021,2),('MK002',1915101001,'00002',2021,4),('MK003',1915101002,'00003',2021,4),('MK004',1915101003,'00004',2021,4),('MK005',1815101001,'00005',2021,6),('MK006',1815101002,'00006',2021,6),('MK007',2015101002,'00007',2021,2),('MK008',2015101003,'00008',2021,2),('MK009',1815101001,'00009',2021,6),('MK010',2015101003,'00010',2021,2);
/*!40000 ALTER TABLE `mk_mhs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24 12:09:47

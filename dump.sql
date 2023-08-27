CREATE DATABASE  IF NOT EXISTS `schooldjango` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `schooldjango`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: schooldjango
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add matiere',7,'add_matiere'),(26,'Can change matiere',7,'change_matiere'),(27,'Can delete matiere',7,'delete_matiere'),(28,'Can view matiere',7,'view_matiere'),(29,'Can add classes',8,'add_classes'),(30,'Can change classes',8,'change_classes'),(31,'Can delete classes',8,'delete_classes'),(32,'Can view classes',8,'view_classes'),(33,'Can add student',9,'add_student'),(34,'Can change student',9,'change_student'),(35,'Can delete student',9,'delete_student'),(36,'Can view student',9,'view_student'),(37,'Can add project module',10,'add_projectmodule'),(38,'Can change project module',10,'change_projectmodule'),(39,'Can delete project module',10,'delete_projectmodule'),(40,'Can view project module',10,'view_projectmodule'),(41,'Can add enseignant',11,'add_enseignant'),(42,'Can change enseignant',11,'change_enseignant'),(43,'Can delete enseignant',11,'delete_enseignant'),(44,'Can view enseignant',11,'view_enseignant'),(45,'Can add submit_file',12,'add_submit_file'),(46,'Can change submit_file',12,'change_submit_file'),(47,'Can delete submit_file',12,'delete_submit_file'),(48,'Can view submit_file',12,'view_submit_file');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user`
--

DROP TABLE IF EXISTS `authentication_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) DEFAULT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `identifiant` varchar(50) DEFAULT NULL,
  `native` date DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_user_email_2220eff5_uniq` (`email`),
  UNIQUE KEY `identifiant` (`identifiant`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user`
--

LOCK TABLES `authentication_user` WRITE;
/*!40000 ALTER TABLE `authentication_user` DISABLE KEYS */;
INSERT INTO `authentication_user` VALUES (1,'pbkdf2_sha256$600000$p8leUoQ9r2D9UtFJJuw1mH$wZYT8AvDEesoF+c4qSZ/9JdbgDHupc2oKVtaJ7PaCuk=','2023-08-24 19:38:22.629830',1,'school','soo','ulrich','',1,1,'2023-08-14 00:11:18.902464','sooulr000',NULL,NULL,NULL),(2,'pbkdf2_sha256$600000$zfvrbREfD3X6zO2EazhTGJ$NZuzEgNapcLOe9KfTeStb5wBZtNb5KTEBzCb3/j2p4U=','2023-08-25 12:35:13.000000',0,'elve','elv','ulrich','sooulric@gmai.com',0,1,'2023-08-20 21:56:02.000000','elvulr933','2023-08-11','9338','eleve'),(3,'pbkdf2_sha256$600000$zfvrbREfD3X6zO2EazhTGJ$NZuzEgNapcLOe9KfTeStb5wBZtNb5KTEBzCb3/j2p4U=','2023-08-25 12:35:13.000000',0,'prof','pro','pro','sooulric@gmai.pro',0,1,'2023-08-20 21:56:02.000000','propro000','2023-08-11','000','enseignant'),(12,'pbkdf2_sha256$600000$zfvrbREfD3X6zO2EazhTGJ$NZuzEgNapcLOe9KfTeStb5wBZtNb5KTEBzCb3/j2p4U=','2023-08-27 11:49:29.425557',0,'titi','soo','ulrich','sooulric@gmai.ckm',0,1,'2023-08-20 21:56:02.000000','sooulr399','2023-08-11','3998','admin'),(17,'!uywGQzUcvqmhyuIueeIb3cJl5VeA7zDIZ5Apmbl3',NULL,0,'pro127','pro','pro','com@dom.ci',0,1,'2023-08-25 11:26:01.862658','propro794','2023-08-31','79451','enseignant'),(18,'pbkdf2_sha256$600000$pyKooSXaHo2QoOobMeQo56$o6VvMjBukrwMojjbcMsovOpqsmpCBHzv6GEm3R9P/i0=',NULL,0,'el_test','el_test','el_test','el_test@y.el',0,1,'2023-08-25 14:34:26.000000','el_el_111','2023-08-25','111','eleve');
/*!40000 ALTER TABLE `authentication_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user_groups`
--

DROP TABLE IF EXISTS `authentication_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_user_groups_user_id_group_id_8af031ac_uniq` (`user_id`,`group_id`),
  KEY `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` (`group_id`),
  CONSTRAINT `authentication_user__user_id_30868577_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`),
  CONSTRAINT `authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user_groups`
--

LOCK TABLES `authentication_user_groups` WRITE;
/*!40000 ALTER TABLE `authentication_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authentication_user_user_permissions`
--

DROP TABLE IF EXISTS `authentication_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authentication_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `authentication_user_user_user_id_permission_id_ec51b09f_uniq` (`user_id`,`permission_id`),
  KEY `authentication_user__permission_id_ea6be19a_fk_auth_perm` (`permission_id`),
  CONSTRAINT `authentication_user__permission_id_ea6be19a_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `authentication_user__user_id_736ebf7e_fk_authentic` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authentication_user_user_permissions`
--

LOCK TABLES `authentication_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `authentication_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `authentication_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoirs_matiere`
--

DROP TABLE IF EXISTS `devoirs_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoirs_matiere` (
  `id` int NOT NULL AUTO_INCREMENT,
  `matiere_name` varchar(100) NOT NULL,
  `enseignant_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devoirs_matiere_enseignant_id_afd7457f_fk_authentication_user_id` (`enseignant_id`),
  CONSTRAINT `devoirs_matiere_enseignant_id_afd7457f_fk_authentication_user_id` FOREIGN KEY (`enseignant_id`) REFERENCES `authentication_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoirs_matiere`
--

LOCK TABLES `devoirs_matiere` WRITE;
/*!40000 ALTER TABLE `devoirs_matiere` DISABLE KEYS */;
INSERT INTO `devoirs_matiere` VALUES (2,'Django',12);
/*!40000 ALTER TABLE `devoirs_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoirs_projectmodule`
--

DROP TABLE IF EXISTS `devoirs_projectmodule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoirs_projectmodule` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `subject` longtext NOT NULL,
  `status` varchar(40) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `end_at` datetime(6) NOT NULL,
  `Enseignant_id` bigint DEFAULT NULL,
  `matiere_id` int DEFAULT NULL,
  `assigned_to_eleve_id` bigint DEFAULT NULL,
  `project_file` varchar(100) DEFAULT NULL,
  `submitted_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `submitted_id` (`submitted_id`),
  KEY `devoirs_projectmodule_matiere_id_40c4aee5_fk_devoirs_matiere_id` (`matiere_id`),
  KEY `devoirs_projectmodul_assigned_to_eleve_id_c8ad4546_fk_authentic` (`assigned_to_eleve_id`),
  KEY `devoirs_projectmodul_Enseignant_id_dbb589a8_fk_authentic` (`Enseignant_id`),
  CONSTRAINT `devoirs_projectmodul_assigned_to_eleve_id_c8ad4546_fk_authentic` FOREIGN KEY (`assigned_to_eleve_id`) REFERENCES `authentication_user` (`id`),
  CONSTRAINT `devoirs_projectmodul_Enseignant_id_dbb589a8_fk_authentic` FOREIGN KEY (`Enseignant_id`) REFERENCES `authentication_user` (`id`),
  CONSTRAINT `devoirs_projectmodul_submitted_id_2c391a90_fk_devoirs_s` FOREIGN KEY (`submitted_id`) REFERENCES `devoirs_submit_file` (`id`),
  CONSTRAINT `devoirs_projectmodule_matiere_id_40c4aee5_fk_devoirs_matiere_id` FOREIGN KEY (`matiere_id`) REFERENCES `devoirs_matiere` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoirs_projectmodule`
--

LOCK TABLES `devoirs_projectmodule` WRITE;
/*!40000 ALTER TABLE `devoirs_projectmodule` DISABLE KEYS */;
INSERT INTO `devoirs_projectmodule` VALUES (18,'new','new','in_progress','2023-08-26 12:49:55.364219','2023-11-16 00:00:00.000000',12,2,18,'documents/uploads/default/uploadsnewpeakpx_2.jpg',NULL),(20,'test','zdazaz','in_progress','2023-08-26 19:28:32.898850','2023-09-16 00:00:00.000000',12,2,18,'documents/uploads/default/uploads_test_wp5104277-shounen-anime-wallpapers.jpg',NULL),(21,'ter','tehbthb','in_progress','2023-08-26 19:55:04.809883','2023-09-10 00:00:00.000000',12,2,18,'documents/uploads/titi/uploads_ter_wp5306470-shounen-anime-wallpapers.jpg',NULL),(24,'test','zdazaz','in_progress','2023-08-27 11:00:07.163171','2024-06-15 00:00:00.000000',NULL,2,18,'documents/uploads/default/uploads_test_wp5306470-shounen-anime-wallpapers.jpg',NULL),(26,'test1','zdazaz','in_progress','2023-08-27 11:01:14.969660','2024-06-15 00:00:00.000000',NULL,2,18,'documents/uploads/default/uploads_test1_wp5306470-shounen-anime-wallpapers.jpg',NULL);
/*!40000 ALTER TABLE `devoirs_projectmodule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devoirs_submit_file`
--

DROP TABLE IF EXISTS `devoirs_submit_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoirs_submit_file` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `submit_file` varchar(100) DEFAULT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `project_id` bigint DEFAULT NULL,
  `submitted_by_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `devoirs_submit_file_project_id_2069ee32_fk_devoirs_p` (`project_id`),
  KEY `devoirs_submit_file_submitted_by_id_8b21842d_fk_authentic` (`submitted_by_id`),
  CONSTRAINT `devoirs_submit_file_project_id_2069ee32_fk_devoirs_p` FOREIGN KEY (`project_id`) REFERENCES `devoirs_projectmodule` (`id`),
  CONSTRAINT `devoirs_submit_file_submitted_by_id_8b21842d_fk_authentic` FOREIGN KEY (`submitted_by_id`) REFERENCES `authentication_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoirs_submit_file`
--

LOCK TABLES `devoirs_submit_file` WRITE;
/*!40000 ALTER TABLE `devoirs_submit_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoirs_submit_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_authentication_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_authentication_user_id` FOREIGN KEY (`user_id`) REFERENCES `authentication_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-08-17 19:17:42.098474','2','el1@school.com',1,'[{\"added\": {}}]',6,1),(2,'2023-08-17 19:19:14.148267','3','el2@school.com',1,'[{\"added\": {}}]',6,1),(3,'2023-08-17 19:19:54.879269','4','prof1@school.com',1,'[{\"added\": {}}]',6,1),(4,'2023-08-17 19:20:37.216148','5','prof2@school.com',1,'[{\"added\": {}}]',6,1),(5,'2023-08-17 22:28:55.767074','6','el3@school.com',1,'[{\"added\": {}}]',6,1),(6,'2023-08-17 22:31:37.861959','7','prof3@school.com',1,'[{\"added\": {}}]',6,1),(7,'2023-08-17 22:34:56.345871','8','prof4@school.com',1,'[{\"added\": {}}]',6,1),(8,'2023-08-20 21:45:45.783616','1','DEV',1,'[{\"added\": {}}]',8,1),(9,'2023-08-20 21:46:08.168195','1','Django',1,'[{\"added\": {}}]',7,1),(10,'2023-08-20 21:46:55.592456','1','ProjectModule object (1)',1,'[{\"added\": {}}]',10,1),(11,'2023-08-20 22:57:31.698681','1','ProjectModule object (1)',2,'[{\"changed\": {\"fields\": [\"ELeves\", \"Assigned to eleve\"]}}]',10,1),(12,'2023-08-20 23:45:11.115118','1','titi',1,'[{\"added\": {}}]',9,1),(13,'2023-08-20 23:45:38.196665','2','ProjectModule object (2)',1,'[{\"added\": {}}]',10,1),(14,'2023-08-24 12:53:11.848412','3','tres - documents/uploadedtresdc388737-8cdb-40d1-b22e-978f158f4a7f.jpeg',1,'[{\"added\": {}}]',10,1),(15,'2023-08-24 19:35:22.284557','1','test - documents/uploadedtestFICHIER_DE_SUIVI_PROJETS_NOMS_ETUDIANTS_1.docx',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(16,'2023-08-24 19:40:29.794756','16','Projetc2 - documents/upload/function_user_name_at_0x0000029BD27DB880Projetc2beamDelegate.dart',1,'[{\"added\": {}}]',10,1),(17,'2023-08-24 19:45:58.129861','16','Projetc2 - documents/uploads/function_user_name_at_0x000001CCAC1DBD80Projetc2FICHIER_DE_SUIVI_PROJ_qBuqoj7.docx',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(18,'2023-08-24 19:55:23.986804','16','Projetc2 - documents/uploads/titiProjetc2contacts.csv',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(19,'2023-08-24 19:56:18.521233','16','Projetc2 - documents/uploads/titiProjetc2WA-18e829846b21.sup',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(20,'2023-08-24 20:00:52.099009','16','Projetc2 - documents/uploads/prof1Projetc2MEGA-CLÉdeRÉCUPÉRATION.txt',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(21,'2023-08-24 20:06:29.997209','16','Projetc2 - documents/uploadsprof1/uploadsProjetc2exam_laravel_ipnet.docx',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(22,'2023-08-24 20:07:32.359144','16','Projetc2 - documents/uploads/prof1/uploadsProjetc2exam_laravel_ipnet.docx',2,'[{\"changed\": {\"fields\": [\"Project file\"]}}]',10,1),(23,'2023-08-25 11:13:30.634362','13','pro@mail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,1),(24,'2023-08-25 11:19:17.466601','13','pro@mail.com',3,'',6,1),(25,'2023-08-25 11:20:09.179211','14','pro@gm.com',1,'[{\"added\": {}}]',6,1),(26,'2023-08-25 11:20:20.519639','14','pro@gm.com',3,'',6,1),(27,'2023-08-25 11:20:56.675108','15','pro@fl.xm',1,'[{\"added\": {}}]',6,1),(28,'2023-08-25 11:23:24.919011','15','pro@fl.xm',3,'',6,1),(29,'2023-08-25 11:24:06.686669','16','pro@gl.ci',1,'[{\"added\": {}}]',6,1),(30,'2023-08-25 11:25:14.700771','16','pro@gl.ci',3,'',6,1),(31,'2023-08-25 12:14:37.855756','11','dxerct@fthcv.cop',3,'',6,1),(32,'2023-08-25 12:14:37.913252','9','testlel@yete.com',3,'',6,1),(33,'2023-08-25 12:14:37.943867','8','prof4@school.com',3,'',6,1),(34,'2023-08-25 12:14:37.978854','7','prof3@school.com',3,'',6,1),(35,'2023-08-25 12:14:38.009797','6','el3@school.com',3,'',6,1),(36,'2023-08-25 12:14:38.046068','5','prof2@school.com',3,'',6,1),(37,'2023-08-25 12:14:38.112117','4','prof1@school.com',3,'',6,1),(38,'2023-08-25 12:14:38.142913','3','el2@school.com',3,'',6,1),(39,'2023-08-25 12:14:38.178783','2','el1@school.com',3,'',6,1),(40,'2023-08-25 12:28:26.868779','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(41,'2023-08-25 12:31:35.994479','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(42,'2023-08-25 12:32:42.583494','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(43,'2023-08-25 13:45:08.781904','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(44,'2023-08-25 13:45:36.084291','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(45,'2023-08-25 13:47:37.837339','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(46,'2023-08-25 13:50:49.334882','12','sooulric@gmai.ckm',2,'[{\"changed\": {\"fields\": [\"Role\"]}}]',6,1),(47,'2023-08-25 14:35:09.608274','18','el_test@y.el',1,'[{\"added\": {}}]',6,1),(48,'2023-08-25 14:35:45.410048','2','Django',1,'[{\"added\": {}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(6,'authentication','user'),(4,'contenttypes','contenttype'),(8,'devoirs','classes'),(11,'devoirs','enseignant'),(7,'devoirs','matiere'),(10,'devoirs','projectmodule'),(9,'devoirs','student'),(12,'devoirs','submit_file'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-08-13 23:12:41.812440'),(2,'contenttypes','0002_remove_content_type_name','2023-08-13 23:12:43.940667'),(3,'auth','0001_initial','2023-08-13 23:12:45.567597'),(4,'auth','0002_alter_permission_name_max_length','2023-08-13 23:12:45.834858'),(5,'auth','0003_alter_user_email_max_length','2023-08-13 23:12:45.887384'),(6,'auth','0004_alter_user_username_opts','2023-08-13 23:12:45.924860'),(7,'auth','0005_alter_user_last_login_null','2023-08-13 23:12:45.957665'),(8,'auth','0006_require_contenttypes_0002','2023-08-13 23:12:45.983725'),(9,'auth','0007_alter_validators_add_error_messages','2023-08-13 23:12:46.023590'),(10,'auth','0008_alter_user_username_max_length','2023-08-13 23:12:46.057000'),(11,'auth','0009_alter_user_last_name_max_length','2023-08-13 23:12:46.089270'),(12,'auth','0010_alter_group_name_max_length','2023-08-13 23:12:46.162501'),(13,'auth','0011_update_proxy_permissions','2023-08-13 23:12:46.201008'),(14,'auth','0012_alter_user_first_name_max_length','2023-08-13 23:12:46.242669'),(15,'authentication','0001_initial','2023-08-13 23:12:47.850442'),(16,'admin','0001_initial','2023-08-13 23:12:48.586242'),(17,'admin','0002_logentry_remove_auto_add','2023-08-13 23:12:48.629975'),(18,'admin','0003_logentry_add_action_flag_choices','2023-08-13 23:12:48.671616'),(19,'sessions','0001_initial','2023-08-13 23:12:48.900965'),(20,'authentication','0002_user_identifiant_user_is_registered_user_native_and_more','2023-08-13 23:38:50.476560'),(21,'authentication','0003_alter_user_password','2023-08-14 00:10:31.473702'),(22,'devoirs','0001_initial','2023-08-15 21:06:08.256288'),(23,'devoirs','0002_remove_projectmodule_assigned_to_and_more','2023-08-20 10:56:33.406743'),(24,'authentication','0004_remove_user_is_registered_alter_user_is_active','2023-08-20 11:53:06.692368'),(25,'devoirs','0003_alter_projectmodule_period_date','2023-08-20 21:43:41.965177'),(26,'authentication','0005_alter_user_is_active','2023-08-20 22:41:08.843522'),(27,'authentication','0006_user_is_registered','2023-08-20 22:41:10.773463'),(28,'devoirs','0004_remove_projectmodule_assigned_to_classe_and_more','2023-08-20 22:56:18.881569'),(29,'devoirs','0005_remove_projectmodule_eleves_and_more','2023-08-20 23:42:11.725458'),(30,'devoirs','0006_remove_enseignant_enseignant_remove_student_eleves_and_more','2023-08-20 23:49:31.877982'),(31,'devoirs','0007_remove_projectmodule_file_and_more','2023-08-23 19:53:59.941157'),(32,'devoirs','0008_alter_projectmodule_submitted','2023-08-24 12:51:27.073306'),(33,'authentication','0007_remove_user_is_registered_alter_user_is_active','2023-08-25 10:43:10.175631'),(34,'authentication','0008_alter_user_is_active','2023-08-25 11:18:58.145338'),(35,'authentication','0009_alter_user_is_active','2023-08-25 11:22:01.877510'),(36,'devoirs','0009_alter_matiere_enseignant_and_more','2023-08-25 12:51:12.672823'),(37,'authentication','0010_alter_user_role','2023-08-26 12:58:09.976633'),(38,'devoirs','0010_rename_enseignant_projectmodule_enseignant','2023-08-26 12:58:11.830289'),(39,'devoirs','0011_rename_enseignant_projectmodule_enseignant','2023-08-26 12:59:47.984326');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8oylv1i03vbzk732lco3zim9flinlqic','e30:1qWkww:rElAUihI_jbzAcN01iZnqV8R0Us99L2X7iX6NnwJ_Hw','2023-08-31 21:54:38.742343'),('9i6vvrd1wxsz7do3cp7g67ycuex8655j','e30:1qZUzM:R42zOwcqS5qQXU4VQGk3C1Yghkw1YfZYllTSgWIDRTw','2023-09-08 11:28:28.895412'),('kodyaqb6yvx4twahb0t6ty7mphvmv3b6','.eJxVjDsOwjAQBe_iGlk4XuyYkp4zWPsLDiBHipMKcXeIlALaNzPvZTKuS8lr0zmPYs7GmcPvRsgPrRuQO9bbZHmqyzyS3RS702avk-jzsrt_BwVb-dYJPPcDOfbk3KAcFXuO6EEEIgtzUOkkhSigcNJEcozqAwUI0AXP5v0BEws4zg:1qWkyy:ynv72Du7M6PsTV5okX68EmYmB_hapKEp6N0aDCNfKog','2023-08-31 21:56:44.653008'),('l3gram8fn938si8dq1rvqsdwz6fu35kd','.eJxVjDsOwjAQBe_iGlk4XuyYkp4zWPsLDiBHipMKcXeIlALaNzPvZTKuS8lr0zmPYs7GmcPvRsgPrRuQO9bbZHmqyzyS3RS702avk-jzsrt_BwVb-dYJPPcDOfbk3KAcFXuO6EEEIgtzUOkkhSigcNJEcozqAwUI0AXP5v0BEws4zg:1qZG9u:_B2oCv0ELLbAPfWZw7SjLmelt7RRB-zxTqYCK3UBvhY','2023-09-07 19:38:22.661784'),('myyxrcpmuje0c5ot3d6lvah73zwrrru1','.eJxVjMsOwiAQRf-FtSED5VWX7v0GMjAgVQNJaVfGf1eSLnR7zzn3xTzuW_F7T6tfiJ2ZkOz0OwaMj1QHoTvWW-Ox1W1dAh8KP2jn10bpeTncv4OCvXxrK2drnTQQHIKwCgiT0RnIgRAmiJgmMBAJ5iwkaGWz0xhDmqY4NMXeH9nuNy4:1qaEGn:HsCMk-bgdgoJNYoduKKa3T6JrX-UokKAFMxqfNEXtOc','2023-09-10 11:49:29.509552'),('p3fvt1mz4garxah7mfmlvfqihuuw8y74','.eJxVjMsOwiAQRf-FtSED5VWX7v0GMjAgVQNJaVfGf1eSLnR7zzn3xTzuW_F7T6tfiJ2ZkOz0OwaMj1QHoTvWW-Ox1W1dAh8KP2jn10bpeTncv4OCvXxrK2drnTQQHIKwCgiT0RnIgRAmiJgmMBAJ5iwkaGWz0xhDmqY4NMXeH9nuNy4:1qZW1x:YfwfAN-bEc9XO6FkefpIjRn5Eb9rTD8Za8_KoayEZ0k','2023-09-08 12:35:13.325716'),('x57d35tm2jl9y9k999s4905pf7bg69n9','.eJxVjDsOwjAQBe_iGlk4XuyYkp4zWPsLDiBHipMKcXeIlALaNzPvZTKuS8lr0zmPYs7GmcPvRsgPrRuQO9bbZHmqyzyS3RS702avk-jzsrt_BwVb-dYJPPcDOfbk3KAcFXuO6EEEIgtzUOkkhSigcNJEcozqAwUI0AXP5v0BEws4zg:1qWi5j:SZ2TGu-yNcP_Gaa9gcPXi7TdDREcRXe7A88PO3t2Erw','2023-08-31 18:51:31.185536');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-27 15:06:32

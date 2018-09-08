-- MySQL dump 10.13  Distrib 5.7.19, for macos10.12 (x86_64)
--
-- Host: localhost    Database: custm
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Current Database: `custm`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `custm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `custm`;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) NOT NULL,
  `create_user` varchar(100) NOT NULL,
  `hair_type` int(11) DEFAULT NULL,
  `hair_structure` int(11) DEFAULT NULL,
  `scalp_moisture` int(11) DEFAULT NULL,
  `goals` varchar(200) DEFAULT NULL,
  `shampoo_color` int(11) DEFAULT NULL,
  `conditioner_color` int(11) DEFAULT NULL,
  `fragrance` int(11) DEFAULT NULL,
  `fragrance_strength` int(11) DEFAULT NULL,
  `shampoo_size` int(11) DEFAULT NULL,
  `conditioner_size` int(11) DEFAULT NULL,
  `formula_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (4,'2017-11-11 14:07:50.095886','mzj',2,2,2,'soothe_scalp',3,3,1,1,1,1,'mzj'),(7,'2017-11-22 14:14:49.095832','admin',2,1,2,'oil_control',3,2,2,3,7,1,'admin'),(8,'2017-12-14 14:25:50.983183','AnonymousUser',1,2,3,'strengthen|soothe_scalp',3,2,4,3,7,7,'AnonymousUser');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(2,'normal');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(6,2,7),(4,2,8),(5,2,9);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add order',1,'add_order'),(2,'Can change order',1,'change_order'),(3,'Can delete order',1,'delete_order'),(4,'Can add log entry',2,'add_logentry'),(5,'Can change log entry',2,'change_logentry'),(6,'Can delete log entry',2,'delete_logentry'),(7,'Can add permission',3,'add_permission'),(8,'Can change permission',3,'change_permission'),(9,'Can delete permission',3,'delete_permission'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add user',5,'add_user'),(14,'Can change user',5,'change_user'),(15,'Can delete user',5,'delete_user'),(16,'Can add content type',6,'add_contenttype'),(17,'Can change content type',6,'change_contenttype'),(18,'Can delete content type',6,'delete_contenttype'),(19,'Can add session',7,'add_session'),(20,'Can change session',7,'change_session'),(21,'Can delete session',7,'delete_session'),(22,'Can add registration profile',8,'add_registrationprofile'),(23,'Can change registration profile',8,'change_registrationprofile'),(24,'Can delete registration profile',8,'delete_registrationprofile'),(25,'Can add supervised registration profile',9,'add_supervisedregistrationprofile'),(26,'Can change supervised registration profile',9,'change_supervisedregistrationprofile'),(27,'Can delete supervised registration profile',9,'delete_supervisedregistrationprofile'),(28,'Can add site',10,'add_site'),(29,'Can change site',10,'change_site'),(30,'Can delete site',10,'delete_site');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$kDpxxODg0ZNm$1DQls/gLY2+qnTIeKMh6lXuEwxBvPzyKiCHlDRZOwNI=','2017-12-02 09:33:03.315154',1,'admin','','','haibo1047@163.com',1,1,'2017-10-01 14:26:00.000000'),(2,'pbkdf2_sha256$36000$DDLIWLAtfVlN$kLEOl8NZ5hdc2B7aStQ5D5wEhNJJbox2mU+ej5Uhm3M=','2017-11-22 14:15:48.338793',0,'mzj','mei','zejian','',0,1,'2017-11-11 12:40:57.000000'),(3,'pbkdf2_sha256$36000$gxbFkMnjOo7i$Cnl2qIXQhTjOmMWiGgp3j6uNEPkaC6oO57lPhKuCaPw=','2017-11-19 12:17:52.539524',0,'harper','','','haibo1047@163.com',0,1,'2017-11-19 12:17:52.459890'),(4,'pbkdf2_sha256$36000$URcEgzAxXcXi$CIcdVtqu/56Al7blpRMWrklbTWQE+CtVzMU2Y1iMJ84=',NULL,0,'oCKj20Mce2OMG3t_UL0-wTFim7Xg','','海破HP','jlennon@beatles.com',0,1,'2017-12-01 15:49:45.756831');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (1,1,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-10-01 14:26:52.259511','1','[2017-10-01 22:26:00+08:00--颜色:red;发质类型:1;发质结构:1;头皮油性:1]',1,'[{\"added\": {}}]',1,1),(2,'2017-10-01 15:09:08.879639','2','[2017-10-26 23:09:00+08:00--颜色:红色;发质类型:正常;发质结构:正常;头皮油性:油性]',1,'[{\"added\": {}}]',1,1),(3,'2017-10-01 16:44:25.315150','None','[2017-10-02 00:44:00+08:00--颜色:black;发质类型:1;发质结构:1;头皮油性:1]',1,'[{\"added\": {}}]',1,1),(4,'2017-10-01 16:45:33.835681','3','[2017-10-02 00:45:00+08:00--颜色:black;发质类型:1;发质结构:1;头皮油性:1]',1,'[{\"added\": {}}]',1,1),(5,'2017-10-01 16:46:24.976781','4','[2017-10-02 00:46:00+08:00--颜色:white;发质类型:2;发质结构:12;头皮油性:11]',1,'[{\"added\": {}}]',1,1),(6,'2017-10-01 16:47:42.817547','5','[2017-10-01 16:47:42.816877+00:00--颜色:blue;发质类型:5;发质结构:5;头皮油性:5]',1,'[{\"added\": {}}]',1,1),(7,'2017-10-02 08:19:26.608046','4','4--2017-10-02 08:19:26.606462+00:00',1,'[{\"added\": {}}]',1,1),(8,'2017-10-02 08:19:40.222787','4','4--2017-10-02 08:19:26.606462+00:00',2,'[{\"changed\": {\"fields\": [\"hair_structure\", \"scalp_moisture\"]}}]',1,1),(9,'2017-10-02 08:40:44.482454','4','4--2017-10-02 08:19:26.606462+00:00',2,'[]',1,1),(10,'2017-10-02 08:41:16.700379','4','4--2017-10-02 08:19:26.606462+00:00',2,'[]',1,1),(11,'2017-10-02 08:41:34.311221','4','4--2017-10-02 08:19:26.606462+00:00',2,'[]',1,1),(12,'2017-10-02 08:44:17.765531','4','4--2017-10-02 08:19:26.606462+00:00',2,'[]',1,1),(13,'2017-10-02 09:08:14.487114','5','5--2017-10-02 09:08:14.486419+00:00',1,'[{\"added\": {}}]',1,1),(14,'2017-10-02 09:09:21.249683','4','4--2017-10-02 08:19:26.606462+00:00',2,'[]',1,1),(15,'2017-10-02 09:09:42.210410','5','5--2017-10-02 09:08:14.486419+00:00',2,'[]',1,1),(16,'2017-10-02 09:37:22.260887','1','1--2017-10-02 09:37:22.259989+00:00',1,'[{\"added\": {}}]',1,1),(17,'2017-10-02 10:52:21.787135','2','2--2017-10-02 10:52:21.786393+00:00',1,'[{\"added\": {}}]',1,1),(18,'2017-11-06 14:29:11.519035','1','admin',1,'[{\"added\": {}}]',4,1),(19,'2017-11-06 14:29:31.790993','2','normal',1,'[{\"added\": {}}]',4,1),(20,'2017-11-11 12:40:57.926329','2','mzj',1,'[{\"added\": {}}]',5,1),(21,'2017-11-11 12:41:11.250654','2','mzj',2,'[{\"changed\": {\"fields\": [\"first_name\", \"last_name\"]}}]',5,1),(22,'2017-11-22 14:12:30.696313','1','admin',2,'[{\"changed\": {\"fields\": [\"groups\", \"last_login\"]}}]',5,1),(23,'2017-11-22 14:12:51.067843','2','normal',2,'[]',4,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(1,'book','order'),(6,'contenttypes','contenttype'),(8,'registration','registrationprofile'),(9,'registration','supervisedregistrationprofile'),(7,'sessions','session'),(10,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-10-01 14:21:10.536183'),(2,'auth','0001_initial','2017-10-01 14:21:10.764893'),(3,'admin','0001_initial','2017-10-01 14:21:10.812297'),(4,'admin','0002_logentry_remove_auto_add','2017-10-01 14:21:10.834529'),(5,'contenttypes','0002_remove_content_type_name','2017-10-01 14:21:10.888289'),(6,'auth','0002_alter_permission_name_max_length','2017-10-01 14:21:10.904794'),(7,'auth','0003_alter_user_email_max_length','2017-10-01 14:21:10.927862'),(8,'auth','0004_alter_user_username_opts','2017-10-01 14:21:10.939988'),(9,'auth','0005_alter_user_last_login_null','2017-10-01 14:21:10.963801'),(10,'auth','0006_require_contenttypes_0002','2017-10-01 14:21:10.967342'),(11,'auth','0007_alter_validators_add_error_messages','2017-10-01 14:21:10.975699'),(12,'auth','0008_alter_user_username_max_length','2017-10-01 14:21:10.992859'),(14,'sessions','0001_initial','2017-10-01 14:21:11.025902'),(21,'registration','0001_initial','2017-10-15 15:10:14.410540'),(22,'registration','0002_registrationprofile_activated','2017-10-15 15:10:14.450596'),(23,'registration','0003_migrate_activatedstatus','2017-10-15 15:10:14.468768'),(24,'registration','0004_supervisedregistrationprofile','2017-10-15 15:10:14.507593'),(29,'book','0001_initial','2017-11-09 16:18:12.300351'),(30,'sites','0001_initial','2017-11-19 09:25:48.645982'),(31,'sites','0002_alter_domain_unique','2017-11-19 09:25:48.664477');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('188xw22lo5vec36raxqd3p9jpfudpm2s','M2Q3OTYyZWIzYTY1NTgzZTdjNmI3ZTFiYmVjMDE1NzE4NTZhNmI5Zjp7Il9sYW5ndWFnZSI6InpoLWhhbnMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWFjZTg3YTJmYzZhNDFhN2E2MTRmMTVhNGE4ODBiNGViYzI4MTEyOCJ9','2017-11-07 15:09:37.559777'),('1nr4gd3idktqdi17g0vq905k6yiqrgwf','ODQ1NWQ4NGE3OWI0NzA5MTczZDU2ODJjODFmNzBjYTViZjg4ZTUwMDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWQ5MGY1ZTJjM2E1ZjlhNWUxOWIwYWEzMDdkOGRiMmM5M2RkNzQyIiwiX2xhbmd1YWdlIjoiemgtaGFucyJ9','2017-11-22 14:30:52.910485'),('1pv5lotds9ye8upadxr9enhyod4zmtgv','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-29 14:15:36.929345'),('1s958a4sa9i4tz96q65x5pieuqh181wt','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-19 06:31:40.991238'),('33wk8l29ion37xypp5pnza63gxzn0o03','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-23 13:01:25.097252'),('3k81d4egb6lcqoa27vjndhir2adv7joh','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-10 14:30:47.791500'),('3pvv4sowp0oau8hzpkkdwp80pkkj932r','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-10-30 15:07:36.809929'),('4j2rz9voff2g7ytggviite88s4ut879j','N2FlZDI3MDgyMzg2ZTExZDZhMjljZDg1NzNlZDFmMGQ2ZTQwZWE5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWQ5MGY1ZTJjM2E1ZjlhNWUxOWIwYWEzMDdkOGRiMmM5M2RkNzQyIn0=','2017-11-11 14:22:38.736644'),('4x7nn0v2ylunz7l9cj1gfqd6qsbsjyz3','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-19 13:37:50.445022'),('79i5uxs90nd4r16winfk63rzt9frqwku','M2Q3OTYyZWIzYTY1NTgzZTdjNmI3ZTFiYmVjMDE1NzE4NTZhNmI5Zjp7Il9sYW5ndWFnZSI6InpoLWhhbnMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWFjZTg3YTJmYzZhNDFhN2E2MTRmMTVhNGE4ODBiNGViYzI4MTEyOCJ9','2017-11-22 14:15:13.542790'),('7b2n3jmoxf9el849hhbi4r7ysnpqfxc0','ODhkMDU0YjUzODNhZWE0MTY2ZTk1MzM0YjkwNjYxM2IzMGYzNTYwNTp7Il9wYXNzd29yZF9yZXNldF90b2tlbiI6IjRyYi0wMzg2NjNmMTVjNGJmOGE2Y2Y2NyIsIl9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-20 12:51:31.609716'),('8y9iare7zwyl1bj74w0wtt9c8blzg363','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-05 08:57:32.305644'),('9dxhb7q9kxw3gsq2b5g3c7qhirifkugb','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-06 13:59:40.697792'),('9m6vvenvhrbi85yqtiho1i7zk8z4clit','M2Q3OTYyZWIzYTY1NTgzZTdjNmI3ZTFiYmVjMDE1NzE4NTZhNmI5Zjp7Il9sYW5ndWFnZSI6InpoLWhhbnMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWFjZTg3YTJmYzZhNDFhN2E2MTRmMTVhNGE4ODBiNGViYzI4MTEyOCJ9','2017-11-23 14:23:11.609186'),('bkuqt4kmxrxxj8h4fuhdyxsg1ookiz87','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-13 15:10:57.143777'),('cudqs2a070oqvwfvk6kx40boown9blhk','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-06 12:47:11.381905'),('cy1zaa3vir0gsxvft9hqt2zj558r024f','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-17 14:46:31.620527'),('dfj7oz6ep2nw33vfbu8ejyzlgzdbriw1','ZjY2MTg1MjExMmE2MTVmNzEyNDk4MGRhY2M4YWQyODZhMjc5YzM2YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4IiwiX2xhbmd1YWdlIjoiemgtaGFucyJ9','2017-11-06 12:08:26.159168'),('dnaw1nleo6n7sq273rzm5h3n3hkn7to0','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-17 15:07:21.288126'),('edyaosr1h3kyupyhv8vsz9uk0ceae9h1','ZjY2MTg1MjExMmE2MTVmNzEyNDk4MGRhY2M4YWQyODZhMjc5YzM2YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4IiwiX2xhbmd1YWdlIjoiemgtaGFucyJ9','2017-11-05 07:44:28.671184'),('ewn8aso4g3kap6fowas96q1b2dcp75n5','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-12 14:17:56.231393'),('fb09z3j9zrjilv1boqpr2buostnmopph','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-14 12:49:37.825526'),('fd0ob318m6kbnvwg3cjlgrptuikv0ohu','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-12-02 09:48:03.318409'),('gpx565q88qf85gm1tf2rvjjjj6d2f0wx','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-06 14:32:11.121728'),('hqi9wm3gg4ajdjd3dxehn5m3b7vtarkb','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-09 16:34:24.196537'),('i2313thmhsp2iwq0kxghb5wqxltp962i','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-18 13:27:49.287465'),('j831k7ilsx8nz8ic0pb82sqkj72d0nd0','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-10-19 09:09:46.423247'),('mdvid6cn4igv391m53nm3ph8x1vwgm7r','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-14 12:33:17.967857'),('mn3scwjcx7myq1li8t52kz653gtsuj72','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-14 12:16:30.400609'),('n8293jsq2cnvs2v384zwblzzeelw9trf','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-22 15:21:25.387975'),('oq8s99vpm55d5env7gjua2fx0hn6kf60','N2FlZDI3MDgyMzg2ZTExZDZhMjljZDg1NzNlZDFmMGQ2ZTQwZWE5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWQ5MGY1ZTJjM2E1ZjlhNWUxOWIwYWEzMDdkOGRiMmM5M2RkNzQyIn0=','2017-11-11 12:56:52.552474'),('rpcns38gqjmyp27txafl90psjoeo3cbf','N2FlZDI3MDgyMzg2ZTExZDZhMjljZDg1NzNlZDFmMGQ2ZTQwZWE5Mzp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyMWQ5MGY1ZTJjM2E1ZjlhNWUxOWIwYWEzMDdkOGRiMmM5M2RkNzQyIn0=','2017-11-14 13:19:14.784638'),('sx1v9yqgkb2s2aloz4mhuhp5usj2exia','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-23 13:55:31.358186'),('ti7ei1tlcpvbo3ynihj2kqivnnxhin2r','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-10 14:16:17.126932'),('tlq2noag2md4tb2p3bg9mp5fwkte45xj','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-20 13:38:45.699917'),('vta6s9vkpy9inpmcdto4cynoayscy4b8','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-10-15 14:26:38.637934'),('whcdvdoewj1wfrq7jo1fq0yx55dwy9x1','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-06 14:03:32.408565'),('xo4t582y62xz68momwv2kv8e346kda81','N2VmN2UxNzNiNjhhNjUyMGU3NmI3MTFhN2Q5NjVmNDkyZTQ4MDIxOTp7Il9sYW5ndWFnZSI6InpoLWhhbnMifQ==','2017-11-19 12:40:35.746321'),('yo2x68tsaeg3rjm4yot4e0mm8qxr1e4d','MTkwNjVlZGY4MjUxNjRmOTg1YjhmMWY1NGMyOTNkMDQzNWIwN2EyMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJlYWNlODdhMmZjNmE0MWE3YTYxNGYxNWE0YTg4MGI0ZWJjMjgxMTI4In0=','2017-11-23 12:39:29.679704');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'localhost:8000','localhost');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_registrationprofile`
--

DROP TABLE IF EXISTS `registration_registrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_registrationprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activation_key` varchar(40) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activated` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `registration_registr_user_id_5fcbf725_fk_auth_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_registrationprofile`
--

LOCK TABLES `registration_registrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_registrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_registrationprofile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_supervisedregistrationprofile`
--

DROP TABLE IF EXISTS `registration_supervisedregistrationprofile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration_supervisedregistrationprofile` (
  `registrationprofile_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`registrationprofile_ptr_id`),
  CONSTRAINT `registration_supervi_registrationprofile__0a59f3b2_fk_registrat` FOREIGN KEY (`registrationprofile_ptr_id`) REFERENCES `registration_registrationprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_supervisedregistrationprofile`
--

LOCK TABLES `registration_supervisedregistrationprofile` WRITE;
/*!40000 ALTER TABLE `registration_supervisedregistrationprofile` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_supervisedregistrationprofile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-08 22:47:34

-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: farmshift
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminler`
--

DROP TABLE IF EXISTS `adminler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adminler` (
  `admin_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `yetki_seviyesi` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`),
  KEY `adminler_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `adminler_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminler`
--

LOCK TABLES `adminler` WRITE;
/*!40000 ALTER TABLE `adminler` DISABLE KEYS */;
INSERT INTO `adminler` VALUES (1,1,'admin',NULL,NULL),(2,2,'admin',NULL,NULL),(3,1,'yönetici',NULL,NULL),(4,3,'admin',NULL,NULL),(5,4,'yönetici',NULL,NULL),(6,5,'admin',NULL,NULL),(7,1,'admin',NULL,NULL),(8,2,'yönetici',NULL,NULL),(9,3,'admin',NULL,NULL),(10,4,'yönetici',NULL,NULL);
/*!40000 ALTER TABLE `adminler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bolgeler`
--

DROP TABLE IF EXISTS `bolgeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bolgeler` (
  `bolge_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `bolge_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`bolge_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bolgeler`
--

LOCK TABLES `bolgeler` WRITE;
/*!40000 ALTER TABLE `bolgeler` DISABLE KEYS */;
INSERT INTO `bolgeler` VALUES (1,'Akdeniz',NULL,NULL),(2,'Karadeniz',NULL,NULL),(3,'Ege',NULL,NULL),(4,'İç Anadolu',NULL,NULL),(5,'Güney Doğu Anadolu',NULL,NULL),(6,'Marmara',NULL,NULL),(7,'Doğu Anadolu ',NULL,NULL);
/*!40000 ALTER TABLE `bolgeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciftciler`
--

DROP TABLE IF EXISTS `ciftciler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciftciler` (
  `ciftci_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `ciftlik_adi` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bolge_id` bigint unsigned DEFAULT NULL,
  `urun_turu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ciftci_id`),
  KEY `ciftciler_kullanici_id_foreign` (`kullanici_id`),
  KEY `ciftciler_bolge_id_foreign` (`bolge_id`),
  CONSTRAINT `ciftciler_bolge_id_foreign` FOREIGN KEY (`bolge_id`) REFERENCES `bolgeler` (`bolge_id`),
  CONSTRAINT `ciftciler_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciftciler`
--

LOCK TABLES `ciftciler` WRITE;
/*!40000 ALTER TABLE `ciftciler` DISABLE KEYS */;
INSERT INTO `ciftciler` VALUES (1,1,'Yeşil Vadi ',1,'sebze','2024-12-29 21:21:55','2024-12-29 21:21:56'),(2,2,'Doğa Harikası',2,'meyve','2024-12-29 21:22:02','2024-12-29 21:22:01'),(3,3,'Doğanın Kucağı',3,'tahıl','2024-12-29 21:22:04','2024-12-29 21:22:01'),(4,4,'Yeşil Vadi ',4,'meyve','2024-12-29 21:22:04','2024-12-29 21:22:00'),(5,5,'Altın Başak',2,'tahıl','2024-12-29 21:22:05','2024-12-29 21:21:59'),(6,6,'Altın Başak',1,'sebze','2024-12-29 21:22:03','2024-12-29 21:22:02'),(7,7,'Doğa Harikası',7,'sebze','2024-12-29 21:22:08','2024-12-29 21:22:05'),(8,8,'Yeşil Vadi ',4,'sebze','2024-12-29 21:22:08','2024-12-29 21:21:58'),(9,9,'Altın Başak',5,'tahıl','2024-12-29 21:22:07','2024-12-29 21:21:58'),(10,10,'Altın Başak',6,'sebze','2024-12-29 21:22:07','2024-12-29 21:21:58'),(12,13,'Yeşil Vadi ',1,'tahıl','2024-12-29 21:22:07','2024-12-29 21:21:57'),(13,14,'Yeşil Vadi ',2,NULL,'2024-12-29 21:22:06','2024-12-29 21:21:57');
/*!40000 ALTER TABLE `ciftciler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciftlik_ekipmanlari`
--

DROP TABLE IF EXISTS `ciftlik_ekipmanlari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciftlik_ekipmanlari` (
  `ekipman_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ciftci_id` bigint unsigned NOT NULL,
  `ekipman_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `miktar` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ekipman_id`),
  KEY `ciftlik_ekipmanlari_ciftci_id_foreign` (`ciftci_id`),
  CONSTRAINT `ciftlik_ekipmanlari_ciftci_id_foreign` FOREIGN KEY (`ciftci_id`) REFERENCES `ciftciler` (`ciftci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciftlik_ekipmanlari`
--

LOCK TABLES `ciftlik_ekipmanlari` WRITE;
/*!40000 ALTER TABLE `ciftlik_ekipmanlari` DISABLE KEYS */;
INSERT INTO `ciftlik_ekipmanlari` VALUES (1,1,'traktör',10,NULL,NULL),(2,2,'pulluk',20,NULL,NULL),(3,3,'saplama',10,NULL,NULL),(4,4,'çapa',30,NULL,NULL),(5,5,'bale makinesi',10,NULL,NULL),(6,6,'sulama sistemi',12,NULL,NULL),(7,7,'traktör',24,NULL,NULL),(8,8,'çapa',12,NULL,NULL),(9,9,'ilaçlama makinesi',14,NULL,NULL),(10,10,'sulama sistemi',8,NULL,NULL);
/*!40000 ALTER TABLE `ciftlik_ekipmanlari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favori_urunler`
--

DROP TABLE IF EXISTS `favori_urunler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favori_urunler` (
  `favori_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `urun_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`favori_id`),
  KEY `favori_urunler_kullanici_id_foreign` (`kullanici_id`),
  KEY `favori_urunler_urun_id_foreign` (`urun_id`),
  CONSTRAINT `favori_urunler_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  CONSTRAINT `favori_urunler_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favori_urunler`
--

LOCK TABLES `favori_urunler` WRITE;
/*!40000 ALTER TABLE `favori_urunler` DISABLE KEYS */;
INSERT INTO `favori_urunler` VALUES (1,1,1,NULL,NULL),(2,2,2,NULL,NULL),(3,3,1,NULL,NULL),(4,4,2,NULL,NULL),(5,5,3,NULL,NULL),(6,6,6,NULL,NULL),(7,7,5,NULL,NULL),(8,8,4,NULL,NULL),(9,9,3,NULL,NULL),(10,10,2,NULL,NULL);
/*!40000 ALTER TABLE `favori_urunler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iade_talepleri`
--

DROP TABLE IF EXISTS `iade_talepleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iade_talepleri` (
  `iade_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `siparis_id` bigint unsigned NOT NULL,
  `iade_nedeni` text COLLATE utf8mb4_unicode_ci,
  `iade_durumu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `iade_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`iade_id`),
  KEY `iade_talepleri_siparis_id_foreign` (`siparis_id`),
  CONSTRAINT `iade_talepleri_siparis_id_foreign` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iade_talepleri`
--

LOCK TABLES `iade_talepleri` WRITE;
/*!40000 ALTER TABLE `iade_talepleri` DISABLE KEYS */;
INSERT INTO `iade_talepleri` VALUES (1,1,'yanlış ürün','değerlendirmede','2024-12-31 10:27:54',NULL,NULL),(2,2,'küflü ürün','kabul edildi','2024-12-31 10:27:56',NULL,NULL),(3,3,'bozuk ürün','reddedildi','2024-12-31 10:27:57',NULL,NULL),(4,4,'eksik ürün','reddedildi','2024-12-31 10:27:59',NULL,NULL),(5,5,'küflü ürün','kabul edildi','2024-12-31 10:27:55',NULL,NULL),(6,6,'yanlış ürün','değerlendirmede','2024-12-31 10:28:01',NULL,NULL),(7,7,'eksik ürün','reddedildi','2024-12-31 10:27:56',NULL,NULL),(8,8,'eksik ürün','reddedildi','2024-12-31 10:27:58',NULL,NULL),(9,9,'küflü ürün','değerlendirmede','2024-12-31 10:28:00',NULL,NULL),(10,10,'bozuk ürün','değerlendirmede','2024-12-31 10:27:59',NULL,NULL);
/*!40000 ALTER TABLE `iade_talepleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iletisim`
--

DROP TABLE IF EXISTS `iletisim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `iletisim` (
  `iletisim_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `konu` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mesaj` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gonderim_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`iletisim_id`),
  KEY `iletisim_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `iletisim_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iletisim`
--

LOCK TABLES `iletisim` WRITE;
/*!40000 ALTER TABLE `iletisim` DISABLE KEYS */;
INSERT INTO `iletisim` VALUES (1,1,'Domatesin Lezzeti','\"Domatesin taze hali, yazın en sevilen sebzelerindendir. Salatalara ve yemeklere eşsiz bir tat katar.\"','2024-12-31 10:29:25',NULL,NULL),(2,2,'Patatesin Kullanımı','\"Patates, pratikliğiyle mutfakta çok yönlü bir sebzedir. Hem kızartma hem de haşlama şeklinde harika olur.\"','2024-12-31 10:29:24',NULL,NULL),(3,3,'Havuçun Sağlık Faydaları	','\"Havuç, göz sağlığını koruyan A vitamini açısından zengindir. Ayrıca çiğ olarak da tüketilebilen sağlıklı bir atıştırmalıktır.\"','2024-12-31 10:29:26',NULL,NULL),(4,4,'Kabak Tarifi	','\"Zeytinyağlı kabak, yaz sofralarının vazgeçilmezlerinden biridir. Hem hafif hem de besleyicidir.\"','2024-12-31 10:29:28',NULL,NULL),(5,5,'Brokolinin Faydaları','\"Brokoli, bağışıklık sistemini güçlendiren bir sebzedir. Çorbası ya da salatası ile sofralarda yerini alabilir.\"','2024-12-31 10:29:29',NULL,NULL),(6,6,'Ispanağın Besin Değeri','	\"Ispanak, demir ve folik asit açısından oldukça zengin. Çocuklar için de sağlıklı bir öğün seçeneğidir.\"','2024-12-31 10:29:28',NULL,NULL),(7,7,'Lahana Yemeği','\"Lahana, kış aylarında bağışıklığı güçlendirir. Lahana sarması ya da çorbası çok lezzetli olabilir.\"','2024-12-31 10:29:25',NULL,NULL),(8,8,'Yeşil Fasulye Tarifi','\"Yeşil fasulye, zeytinyağlı yapıldığında enfes bir yemek olur. Ayrıca salatalara da harika bir katkı sağlar.\"','2024-12-31 10:29:27',NULL,NULL),(9,9,'Karnabahar Fırında','\"Fırınlanmış karnabahar, sağlıklı ve lezzetli bir alternatiftir. Peynirle harmanlandığında tadı daha da güzelleşir.\"','2024-12-31 10:29:27',NULL,NULL),(10,10,'Çökelekli Kahvaltı','\"Çökelek, özellikle kahvaltılarda tercih edilen lezzetli bir alternatiftir. Zeytinyağlı sebzelerle mükemmel uyum sağlar.\"','2024-12-31 10:29:26',NULL,NULL);
/*!40000 ALTER TABLE `iletisim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kampanyalar`
--

DROP TABLE IF EXISTS `kampanyalar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kampanyalar` (
  `kampanya_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `urun_id` bigint unsigned NOT NULL,
  `kampanya_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `indirim_orani` double NOT NULL,
  `baslangic_tarihi` date DEFAULT NULL,
  `bitis_tarihi` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kampanya_id`),
  KEY `kampanyalar_urun_id_foreign` (`urun_id`),
  CONSTRAINT `kampanyalar_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kampanyalar`
--

LOCK TABLES `kampanyalar` WRITE;
/*!40000 ALTER TABLE `kampanyalar` DISABLE KEYS */;
INSERT INTO `kampanyalar` VALUES (2,1,'Domates Yaz İndirimi',20,'2024-12-24','2024-12-24',NULL,NULL),(3,2,'Mandarina Neşesi',15,'2024-12-24','2024-12-24',NULL,NULL),(4,3,'Buğday Bahar Fırsatları',25,'2024-12-24','2024-12-24',NULL,NULL),(5,4,'Kuru Fasulye Yıl Sonu İndirimi\n\n',10,'2024-12-24','2024-12-24',NULL,NULL),(6,5,'Ihlamur Sağlık İndirimi',15,'2024-12-24','2024-12-24',NULL,NULL),(7,6,'Salatalık Yaz Taze İndirimi',30,'2024-12-24','2024-12-24',NULL,NULL),(8,7,'Salatalıkla Sağlıklı Yaşam, Portakalın C vitaminiyle Güçlü Bir Başlangıç!',15,'2024-12-31','2024-12-31',NULL,NULL),(9,8,'Arpa ve Nohutla Beslenmenizi Zenginleştirin: Hem Lezzetli Hem Sağlıklı!',40,'2024-12-31','2024-12-31',NULL,NULL),(10,9,'Doğal Gücünüz Salatalık ve Portakalda: Farkı Hissedin!',35,'2024-12-31','2024-12-31',NULL,NULL),(11,10,'\"Portakalın Vitamin Desteği, Salatalığın Ferahlığıyla Birleşti!',30,'2024-12-31','2024-12-31',NULL,NULL);
/*!40000 ALTER TABLE `kampanyalar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kullanicilar`
--

DROP TABLE IF EXISTS `kullanicilar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kullanicilar` (
  `kullanici_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sifre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rol_id` bigint unsigned NOT NULL,
  `kayit_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kullanici_id`),
  UNIQUE KEY `kullanicilar_email_unique` (`email`),
  KEY `kullanicilar_rol_id_foreign` (`rol_id`),
  CONSTRAINT `kullanicilar_rol_id_foreign` FOREIGN KEY (`rol_id`) REFERENCES `roller` (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kullanicilar`
--

LOCK TABLES `kullanicilar` WRITE;
/*!40000 ALTER TABLE `kullanicilar` DISABLE KEYS */;
INSERT INTO `kullanicilar` VALUES (1,'ilknur işcen','ilknuriscen@gmail.com','5426586565','123456',1,'2024-12-24 15:47:54',NULL,NULL),(2,'samet şahin','sametsahin@gmail.com','5426586565','123456',2,'2024-12-24 15:47:57',NULL,NULL),(3,'doğa akpınar','dogaakpinar@gmail.com','5426586565','123456',1,'2024-12-24 15:47:58',NULL,NULL),(4,'serpil aladağ','seraladag@gmail.com','5426586565','123456',1,'2024-12-24 15:48:02',NULL,NULL),(5,'serap arslan','seraparslan@gmail.com','5426586565','123456',2,'2024-12-24 15:47:56',NULL,NULL),(6,'sıla kayış','silakayis@gmail.com','5426586565','123456',3,'2024-12-24 15:48:00',NULL,NULL),(7,'mehmet mustafa','mehmetmustafa@gmail.com','5426586565','123456',3,'2024-12-24 15:48:01',NULL,NULL),(8,'zeynep özkök','zeynepozkok@gmail.com','5426586565','123456',1,'2024-12-24 15:47:59',NULL,NULL),(9,'anıl piyancı','anilpiyanci@gmail.com','5426586565','123456',2,'2024-12-24 15:48:01',NULL,NULL),(10,'derya işcen','deryaiscen@gmail.com','5426586565','123456',3,'2024-12-24 15:48:00',NULL,NULL),(13,'hüseyin altınok','abc@gmail.com','5426586565','123456',1,'2024-12-25 20:45:49',NULL,NULL),(14,'damla sakız','dbc@gmail.com','5426586565','123456',1,'2024-12-25 20:46:39',NULL,NULL);
/*!40000 ALTER TABLE `kullanicilar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2024_12_23_140745_create_roller_table',1),(5,'2024_12_23_140836_create_bolgeler_table',1),(6,'2024_12_23_140849_create_kullanicilar_table',1),(7,'2024_12_23_140853_create_ciftciler_table',1),(8,'2024_12_23_140857_create_urun_kategorileri_table',1),(9,'2024_12_23_140901_create_urunler_table',1),(10,'2024_12_23_140905_create_siparisler_table',1),(11,'2024_12_23_140907_create_siparis_detaylari_table',1),(12,'2024_12_23_140911_create_odemeler_table',1),(13,'2024_12_23_140914_create_yorumlar_table',1),(14,'2024_12_23_140918_create_adminler_table',1),(15,'2024_12_23_140921_create_ciftlik_ekipmanlari_table',1),(16,'2024_12_23_140924_create_stok_takip_table',1),(17,'2024_12_23_140926_create_iade_talepleri_table',1),(18,'2024_12_23_140929_create_teslimat_adresleri_table',1),(19,'2024_12_23_140931_create_kampanyalar_table',1),(20,'2024_12_23_140934_create_sistem_ayarları_table',1),(21,'2024_12_23_140937_create_favori_urunler_table',1),(22,'2024_12_23_140940_create_sikayetler_table',1),(23,'2024_12_23_140943_create_iletisim_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odemeler`
--

DROP TABLE IF EXISTS `odemeler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odemeler` (
  `odeme_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `siparis_id` bigint unsigned NOT NULL,
  `odeme_turu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `odeme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tutar` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`odeme_id`),
  KEY `odemeler_siparis_id_foreign` (`siparis_id`),
  CONSTRAINT `odemeler_siparis_id_foreign` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odemeler`
--

LOCK TABLES `odemeler` WRITE;
/*!40000 ALTER TABLE `odemeler` DISABLE KEYS */;
INSERT INTO `odemeler` VALUES (1,1,'kredi kartı','2024-12-31 10:34:58',200,NULL,NULL),(2,2,'kredi kartı','2024-12-31 10:35:16',130,NULL,NULL),(3,3,'havale','2024-12-31 10:35:18',200,NULL,NULL),(4,4,'havale','2024-12-31 10:35:22',300,'2024-12-31 10:35:31',NULL),(5,5,'havale','2024-12-31 10:35:21',200,NULL,NULL),(6,6,'nakit','2024-12-31 10:35:21',140,NULL,NULL),(7,7,'nakit','2024-12-31 10:35:21',140,NULL,NULL),(8,8,'kredi kartı','2024-12-31 10:35:20',140,NULL,NULL),(9,9,'nakit','2024-12-31 10:35:20',200,NULL,NULL),(10,10,'kredi kartı','2024-12-31 10:35:19',200,NULL,NULL);
/*!40000 ALTER TABLE `odemeler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roller`
--

DROP TABLE IF EXISTS `roller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roller` (
  `rol_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `rol_adi` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`rol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roller`
--

LOCK TABLES `roller` WRITE;
/*!40000 ALTER TABLE `roller` DISABLE KEYS */;
INSERT INTO `roller` VALUES (1,'yönetici','2024-12-24 15:47:45','2024-12-24 15:47:46'),(2,'çiftçi','2024-12-24 15:47:46','2024-12-24 15:47:47'),(3,'kullanıcı','2024-12-24 15:47:48','2024-12-24 15:47:49');
/*!40000 ALTER TABLE `roller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('3tUp3F4LXCiQJQ6nvCtmRZ4G40zWBnE8yAWsN8nq',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/128.0.0.0 Safari/537.36 OPR/114.0.0.0','YTozOntzOjY6Il90b2tlbiI7czo0MDoiTkRUWlBpUHR2allTZ0ZlZDJySWhEYXZYM24xTUMxcXZSbWNLcnZLbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9rYW1wYW55YWxhciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1735643335);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sikayetler`
--

DROP TABLE IF EXISTS `sikayetler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sikayetler` (
  `sikayet_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `metin` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarih` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`sikayet_id`),
  KEY `sikayetler_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `sikayetler_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sikayetler`
--

LOCK TABLES `sikayetler` WRITE;
/*!40000 ALTER TABLE `sikayetler` DISABLE KEYS */;
INSERT INTO `sikayetler` VALUES (1,1,'Aldığım domatesler gerçekten çok taze değildi, çoğu yumuşamış ve içi çürük çıkmıştı. Böyle bir kaliteyi beklemezdim','2024-12-31 10:33:47',NULL,NULL),(2,2,'Aldığım elmaların birçoğu çok hızlı bir şekilde kararmaya başladı. Mağazadan aldığımda çok taze görünüyordu, ancak evde 2 gün içinde bozuldu.','2024-12-31 10:33:47',NULL,NULL),(3,3,'\"Almış olduğum zeytinler çok tuzluydu ve lezzeti beklediğim gibi değildi. Gerçekten sert ve yenilmesi zor bir ürün.\"\n\n','2024-12-31 10:33:46',NULL,NULL),(4,4,'Aldığım sarımsaklar aşırı kokuyordu ve normalden çok daha sertti. Çiftlik ürünleri daha doğal olmalı, bu durum hiç hoş değildi.','2024-12-31 10:33:50',NULL,NULL),(5,5,'Aldığım buğday unu bozulmuş gibiydi, çok kötü bir kokusu vardı. Ürün tarihleri de uygundu, ancak yine de kullanılmaz hale gelmişti.','2024-12-31 10:33:49',NULL,NULL),(6,6,'Aldığım kavun, olgunlaşmamıştı ve tadı çok ekşiydi. Gerçekten tatlı bir kavun almayı beklerken, bu tam bir hayal kırıklığı oldu.','2024-12-31 10:33:49',NULL,NULL),(7,7,'Aldığım patateslerin birçoğu içten çürük çıkmıştı. Taze ve kaliteli olduğunu düşündüğüm bir üründen bu kadar kötü sonuç almak şaşırtıcıydı.','2024-12-31 10:33:49',NULL,NULL),(8,8,'Çiftlikten aldığım zeytinyağının rengi koyulmuş ve tadı da bozulmuştu. Ürünün raf ömrü bitmemişti, bu nedenle bu kadar kötü olmasına anlam veremedim.','2024-12-31 10:33:48',NULL,NULL),(9,9,'Aldığım taze fasulyenin çoğu bozulmuştu ve hemen pişirmem gerekti. Yine de yemeğe lezzet vermedi, çok sert ve tatsızdı.','2024-12-31 10:33:48',NULL,NULL),(10,10,'Çilekler alırken çok güzel görünüyordu ama eve geldiğimde birçoğunun çürümeye başlamış olduğunu fark ettim. Ürünler daha dikkatli kontrol edilmeliydi.','2024-12-31 10:33:52',NULL,NULL),(11,13,'Aldığım karpuz aşırı şekerli ve tatlıydı. Doğal karpuzlar genellikle dengeli tatlara sahip olmalı, ancak bu, çok tatlıydı ve hiç gerçek tadı yoktu.','2024-12-31 10:33:52',NULL,NULL);
/*!40000 ALTER TABLE `sikayetler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparis_detaylari`
--

DROP TABLE IF EXISTS `siparis_detaylari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siparis_detaylari` (
  `siparis_detay_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `siparis_id` bigint unsigned NOT NULL,
  `urun_id` bigint unsigned NOT NULL,
  `miktar` double NOT NULL,
  `birim_fiyat` double NOT NULL,
  `toplam_fiyat` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`siparis_detay_id`),
  KEY `siparis_detaylari_siparis_id_foreign` (`siparis_id`),
  KEY `siparis_detaylari_urun_id_foreign` (`urun_id`),
  CONSTRAINT `siparis_detaylari_siparis_id_foreign` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`),
  CONSTRAINT `siparis_detaylari_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparis_detaylari`
--

LOCK TABLES `siparis_detaylari` WRITE;
/*!40000 ALTER TABLE `siparis_detaylari` DISABLE KEYS */;
INSERT INTO `siparis_detaylari` VALUES (1,1,1,12,200,250,NULL,NULL),(2,2,2,25,200,250,NULL,NULL),(3,3,3,20,200,250,NULL,NULL),(4,4,4,56,300,350,NULL,NULL),(5,5,5,2,400,450,NULL,NULL),(6,6,6,15,300,350,NULL,NULL),(7,7,7,15,500,550,NULL,NULL),(8,8,8,1,200,250,NULL,NULL),(9,9,9,67,200,250,NULL,NULL),(10,10,10,45,100,150,NULL,NULL);
/*!40000 ALTER TABLE `siparis_detaylari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `siparisler`
--

DROP TABLE IF EXISTS `siparisler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `siparisler` (
  `siparis_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `siparis_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `toplam_tutar` double NOT NULL,
  `siparis_durumu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`siparis_id`),
  KEY `siparisler_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `siparisler_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `siparisler`
--

LOCK TABLES `siparisler` WRITE;
/*!40000 ALTER TABLE `siparisler` DISABLE KEYS */;
INSERT INTO `siparisler` VALUES (1,1,'2024-12-31 10:21:47',100,'aktif',NULL,NULL),(2,2,'2024-12-31 10:21:49',230,'kargoda',NULL,NULL),(3,3,'2024-12-31 10:21:51',120,'kargoda',NULL,NULL),(4,4,'2024-12-31 10:21:51',150,'aktif',NULL,NULL),(5,5,'2024-12-31 10:21:52',270,'kargoda',NULL,NULL),(6,6,'2024-12-31 10:21:54',160,'teslim edildi',NULL,NULL),(7,7,'2024-12-31 10:21:52',600,'kargoda',NULL,NULL),(8,8,'2024-12-31 10:21:54',800,'teslim edildi',NULL,NULL),(9,9,'2024-12-31 10:21:50',130,'kargoda',NULL,NULL),(10,10,'2024-12-31 10:21:53',120,'teslim edildi',NULL,NULL);
/*!40000 ALTER TABLE `siparisler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sistem_ayarları`
--

DROP TABLE IF EXISTS `sistem_ayarları`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sistem_ayarları` (
  `ayar_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ayar_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deger` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ayar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sistem_ayarları`
--

LOCK TABLES `sistem_ayarları` WRITE;
/*!40000 ALTER TABLE `sistem_ayarları` DISABLE KEYS */;
/*!40000 ALTER TABLE `sistem_ayarları` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stok_takip`
--

DROP TABLE IF EXISTS `stok_takip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stok_takip` (
  `stok_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `urun_id` bigint unsigned NOT NULL,
  `guncel_stok` double NOT NULL,
  `son_guncelleme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`stok_id`),
  KEY `stok_takip_urun_id_foreign` (`urun_id`),
  CONSTRAINT `stok_takip_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stok_takip`
--

LOCK TABLES `stok_takip` WRITE;
/*!40000 ALTER TABLE `stok_takip` DISABLE KEYS */;
INSERT INTO `stok_takip` VALUES (1,1,200,'2024-12-24 16:09:55',NULL,NULL),(2,3,150,'2024-12-24 16:09:55',NULL,NULL),(3,2,455,'2024-12-24 16:09:55',NULL,NULL),(4,4,444,'2024-12-24 16:09:55',NULL,NULL),(5,6,443,'2024-12-24 16:09:55',NULL,NULL),(6,5,122,'2024-12-24 16:09:55',NULL,NULL),(7,7,454,'2024-12-24 16:09:55',NULL,NULL),(8,8,234,'2024-12-24 16:09:55',NULL,NULL),(9,9,567,'2024-12-24 16:09:55',NULL,NULL),(10,10,345,'2024-12-24 16:09:55',NULL,NULL);
/*!40000 ALTER TABLE `stok_takip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teslimat_adresleri`
--

DROP TABLE IF EXISTS `teslimat_adresleri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teslimat_adresleri` (
  `adres_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kullanici_id` bigint unsigned NOT NULL,
  `adres` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sehir` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `posta_kodu` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`adres_id`),
  KEY `teslimat_adresleri_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `teslimat_adresleri_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teslimat_adresleri`
--

LOCK TABLES `teslimat_adresleri` WRITE;
/*!40000 ALTER TABLE `teslimat_adresleri` DISABLE KEYS */;
INSERT INTO `teslimat_adresleri` VALUES (1,1,'çan','çanakkale','17000',NULL,NULL),(2,2,'ayvalık','balıkesir','10000',NULL,NULL),(3,3,'odunpazarı','eskişehir','26000',NULL,NULL),(4,4,'edremit','balıkesir','10000',NULL,NULL),(5,5,'biga','çanakkale','17000',NULL,NULL),(6,6,'merkez','düzce','81000',NULL,NULL),(7,7,'özlüce','bursa','16000',NULL,NULL),(8,8,'kadirli','osmaniye','80000',NULL,NULL),(9,9,'bandırma','balıkesir','10000',NULL,NULL),(10,10,'merkez','bolu','14000',NULL,NULL);
/*!40000 ALTER TABLE `teslimat_adresleri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urun_kategorileri`
--

DROP TABLE IF EXISTS `urun_kategorileri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urun_kategorileri` (
  `kategori_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aciklama` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urun_kategorileri`
--

LOCK TABLES `urun_kategorileri` WRITE;
/*!40000 ALTER TABLE `urun_kategorileri` DISABLE KEYS */;
INSERT INTO `urun_kategorileri` VALUES (1,'Sebzeler','Toprağa dikilen veya ekilen bitkilerden elde edilen, genellikle düşük kalorili ve vitamin açısından zengin olan ürünlerdir.',NULL,NULL),(2,'Meyveler','Çiçekli bitkilerde meyve veren ve tatlı ya da ekşi olan, insan beslenmesinde yaygın olarak tüketilen ürünlerdir. ',NULL,NULL),(3,'Tahıllar','Çoğunlukla un yapımında kullanılan ve insanların temel gıda maddelerinden biri olan, zengin karbonhidrat içeren ürünlerdir.',NULL,NULL),(4,'Bakliyatlar','Protein açısından zengin ve lifli olan, kurutulmuş bakla ve fasulye türlerini içeren ürünlerdir.',NULL,NULL),(5,'Süt Ürünleri','Süt ve süt ürünlerinden elde edilen, kalsiyum ve protein açısından zengin olan gıda maddeleridir.',NULL,NULL),(6,'Şifalı Bitkiler','Geleneksel tıpta veya bitkisel tedavilerde kullanılan, sağlık üzerine olumlu etkileri olduğu düşünülen bitkiler ve onların ürünleridir.',NULL,NULL);
/*!40000 ALTER TABLE `urun_kategorileri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urunler`
--

DROP TABLE IF EXISTS `urunler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `urunler` (
  `urun_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ciftci_id` bigint unsigned NOT NULL,
  `kategori_id` bigint unsigned NOT NULL,
  `urun_adi` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birim_fiyat` double NOT NULL,
  `stok_miktari` double NOT NULL,
  `birim` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `eklenme_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`urun_id`),
  KEY `urunler_ciftci_id_foreign` (`ciftci_id`),
  KEY `urunler_kategori_id_foreign` (`kategori_id`),
  CONSTRAINT `urunler_ciftci_id_foreign` FOREIGN KEY (`ciftci_id`) REFERENCES `ciftciler` (`ciftci_id`),
  CONSTRAINT `urunler_kategori_id_foreign` FOREIGN KEY (`kategori_id`) REFERENCES `urun_kategorileri` (`kategori_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `urunler`
--

LOCK TABLES `urunler` WRITE;
/*!40000 ALTER TABLE `urunler` DISABLE KEYS */;
INSERT INTO `urunler` VALUES (1,1,1,'Domates',15,200,'kg','2024-12-24 16:02:33','2024-12-29 21:21:33','2024-12-29 21:21:34'),(2,2,2,'Mandalina',20,300,'kg','2024-12-24 16:02:34','2024-12-29 21:21:35','2024-12-29 21:21:47'),(3,3,3,'Kuru Fasulye',25,400,'kg','2024-12-24 16:02:35','2024-12-29 21:21:36','2024-12-29 21:21:37'),(4,4,4,'Buğday',10,100,'kg','2024-12-24 16:02:37','2024-12-29 21:21:41','2024-12-29 21:21:41'),(5,5,5,'Süt',12,250,'litre','2024-12-24 16:02:33','2024-12-29 21:21:40','2024-12-29 21:21:43'),(6,6,6,'Ihlamur',60,350,'kg','2024-12-24 16:02:35','2024-12-29 21:21:40','2024-12-29 21:21:36'),(7,7,1,'Salatalık',20,250,'kg','2024-12-24 16:02:36','2024-12-29 21:21:43','2024-12-29 21:21:39'),(8,8,2,'Portakal',30,100,'kg','2024-12-24 16:02:38','2024-12-29 21:21:46','2024-12-29 21:21:45'),(9,9,3,'Arpa',10,150,'kg','2024-12-24 16:02:36','2024-12-29 21:21:44','2024-12-29 21:21:38'),(10,10,4,'Nohut',20,340,'kg','2024-12-24 16:02:37','2024-12-29 21:21:38','2024-12-29 21:21:38');
/*!40000 ALTER TABLE `urunler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yorumlar`
--

DROP TABLE IF EXISTS `yorumlar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yorumlar` (
  `yorum_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `urun_id` bigint unsigned NOT NULL,
  `kullanici_id` bigint unsigned NOT NULL,
  `yorum_metni` text COLLATE utf8mb4_unicode_ci,
  `puan` int NOT NULL,
  `yorum_tarihi` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`yorum_id`),
  KEY `yorumlar_urun_id_foreign` (`urun_id`),
  KEY `yorumlar_kullanici_id_foreign` (`kullanici_id`),
  CONSTRAINT `yorumlar_kullanici_id_foreign` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  CONSTRAINT `yorumlar_urun_id_foreign` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yorumlar`
--

LOCK TABLES `yorumlar` WRITE;
/*!40000 ALTER TABLE `yorumlar` DISABLE KEYS */;
INSERT INTO `yorumlar` VALUES (1,1,1,'Domates, yaz aylarının vazgeçilmezi! Lezzetli, sağlıklı ve neredeyse her yemekte kullanabileceğiniz bir sebze. Özellikle salatalarda çok güzel oluyor.',3,'2024-12-30 01:37:36',NULL,NULL),(2,2,2,'Patates, en pratik ve lezzetli sebzelerden biri. Fırında, haşlanmış ya da kızartılmış olarak her haliyle mükemmel.',2,'2024-12-30 01:37:37',NULL,NULL),(3,3,3,'Havuç, hem tatlı hem de sağlıklı bir sebze. Çocuklar için harika bir atıştırmalık olabilir. Ayrıca salatalara da çok yakışıyor.',4,'2024-12-30 01:37:38',NULL,NULL),(4,4,4,'Kabak, hafif ve besleyici bir sebze. Çorbalarda, zeytinyağlılarda ya da fırınlanmış olarak harika bir seçenek.',5,'2024-12-31 10:19:45',NULL,NULL),(5,5,5,'Brokoli, vitamin açısından oldukça zengin bir sebze. Hem sağlıklı hem de farklı tariflerle sofralarda yer alabilir.',4,'2024-12-31 10:19:45',NULL,NULL),(6,6,6,'Ispanak, demir açısından zengin olduğu için sağlığımız için çok önemli bir sebze. Yemeği, salatası ve çorbası çok lezzetli.',5,'2024-12-31 10:19:45',NULL,NULL),(7,7,7,'Lahana, özellikle kış aylarında soğuk algınlıklarına karşı güçlü bir destek. Sarması, çorbası ya da haşlaması oldukça lezzetli.',2,'2024-12-31 10:19:45',NULL,NULL),(8,8,8,'Yeşil fasulye, hafif ve doyurucu bir sebze. Zeytinyağlı veya kıymalı olarak harika oluyor.',3,'2024-12-31 10:19:45',NULL,NULL),(9,9,9,'Karnabahar, protein ve vitamin açısından zengin. Özellikle kızartması ya da fırında peynirli tarifleri çok lezzetli.',4,'2024-12-31 10:19:45',NULL,NULL),(10,10,10,'Çökelek, özellikle kahvaltılarda sebzelerle birleşerek harika bir lezzet oluşturuyor. Hem sağlıklı hem de doyurucu.',6,'2024-12-31 10:19:45',NULL,NULL);
/*!40000 ALTER TABLE `yorumlar` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-03 15:22:32

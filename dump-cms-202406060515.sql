-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.10.2

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES ('9c36e641-8e62-4889-826c-2e36fa0eac2a','9c36dccd-892c-4925-9734-89d8e24a985b','Html Dasar (tag tag html) #1','html-dasar-tag-tag-html-1','article/qud2vwyipZkIRXZ60cehjEH9tn1MZjlbFq3UTJzk.png','## Pengertian Tag dalam HTML\r\n\r\nSebagai sebuah bahasa markup, HTML membutuhkan cara untuk memberitahu web browser untuk apa fungsi sebuah text. Apakah text itu ditulis sebagai sebuah paragraf, list, atau sebagai link. Dalam HTML, tanda ini dikenal dengan istilah tag.\r\n\r\nHampir semua tag di dalam HTML ditulis secara berpasangan, yakni tag pembuka dan tag penutup, dimana objek yang dikenai perintah tag berada di antara tag pembuka dan tag penutup. Objek disini dapat berupa text, gambar, maupun video. Penulisan tag berada di antara dua kurung siku: \"<\" dan \">\".\r\n\r\nBerikut adalah format dasar penulisan tag HTML:\r\n\r\n```html\r\n<tag_pembuka>objek yang dikenai perintah tag</tag_penutup>\r\n```\r\n\r\nSebagai contoh, perhatikan kode HTML berikut :\r\n\r\n```html\r\n<p> Ini adalah sebuah paragraf </p>\r\n```\r\n\r\n    <p> adalah tag pembuka, dalam contoh ini p adalah tag untuk paragraf.\r\n    </p> adalah tag penutup paragraf. Perbedaannya dengan tag pembuka terletak dari tanda forward slash (/)\r\n\r\nJika lupa memberikan penutup tag, umumnya browser akan \"memaafkan\" kesalahan ini dan tetap menampilkan hasilnya seolah-olah kita menuliskan tag penutup. Walaupun ini sepertinya memudahkan, tidak jarang malah bikin bingung.\r\n\r\nSebagai contoh lain, jika ingin membuat suatu text dalam sebuah paragraf yang di tulis tebal atau miring, di dalam HTML dapat ditulis sebagai berikut:\r\n\r\n```language\r\n<p>Ini adalah sebuah paragraf. <i>Hanya kumpulan beberapa kalimat</i>. \r\nParagraf ini terdiri dari <b>3 kalimat</b></p>.\r\n```\r\n\r\nHasil dari kode HTML diatas, diterjemahkan oleh browser menjadi:\r\n\r\n\"Ini adalah sebuah paragraf. Tidak lain dari kumpulan beberapa kalimat. Paragraf ini terdiri dari 3 kalimat.\"\r\n\r\n## Pengertian Element dalam HTML\r\n\r\nElement adalah isi dari tag yang berada diantara tag pembuka dan tag penutup, termasuk tag itu sendiri dan atribut yang dimilikinya (jika ada). Sebagai contoh perhatikan kode HTML berikut:\r\n\r\n```language\r\n<p> Ini adalah sebuah paragraf </p>\r\n```\r\nPada contoh diatas, `\"<p>Ini adalah sebuah paragraf</p>\"` merupakan element p.\r\n\r\nElement tidak hanya berisi text, namun juga bisa tag lain.\r\n\r\nContoh:\r\n```language\r\n<p> Ini adalah sebuah <em>paragraf</em> </p>\r\n```\r\n\r\nDari contoh diatas,`<p> Ini adalah sebuah <em>paragraf</em> </p>` merupakan elemen p. Dalam pembahasan atau tutorial tentang HTML, tidak jarang istilah \"tag\" dan \"element\" saling dipertukarkan.\r\n\r\n## Pengertian Atribut dalam HTML\r\n\r\nAtribut adalah informasi tambahan yang diberikan kepada tag. Informasi ini bisa berupa instruksi untuk warna dari text, besar huruf dari text, dll. Setiap atribut memiliki pasangan nama dan nilai (value) yang ditulis dengan name=\"value\". Value diapit tanda kutip, boleh menggunakan tanda kutip satu (\') atau dua (\").\r\n\r\nContoh kode HTML:\r\n\r\n```language\r\n<a href=\"https://www.duniailkom.com\">ini adalah sebuah link</a>\r\n```\r\n\r\nPada kode HTML diatas, href=\"https://www.duniailkom.com\" adalah atribut. href merupakan nama dari atribut, dan https://www.duniailkom.com adalah value atau nilai dari atribut tersebut.\r\n\r\nTidak semua tag membutuhkan atribut, tapi anda akan sering melihat sebuah tag dengan atribut, terutama atribut id dan class yang sering digunakan untuk manipulasi halaman web menggunakan CSS maupun JavaScript.\r\n\r\nHTML memiliki banyak atribut yang beberapa diantaranya hanya cocok untuk tag tertentu saja. Sebagai contoh, atribut \"href\" diatas hanya digunakan untuk tag <a> saja (dan beberapa tag lain). Penjelasan tentang tujuan dan pengertian dari atribut seperti href ini akan kita bahas pada tutorial-tutorial selanjutnya.\r\n\r\nPada tutorial kali ini, kita telah mempelajari salah satu aspek terpenting di dalam HTML, yakni Pengertian Tag, Elemen, dan Atribut pada HTML. Dalam tutorial HTML dasar selanjutnya, kita akan mempelajari tentang Struktur Dasar Halaman HTML.','2024-06-05 07:00:52','2024-06-05 07:00:52'),('9c36e843-f817-4618-9c8d-2b74ce34ae9d','9c36dccd-892c-4925-9734-89d8e24a985b','Struktur Dasar HTML #2','struktur-dasar-html-2','article/vlHh2zdI4uADSUOMWBkd1BWJitZI7TOrOfIj6GEJ.png','## Struktur Dasar HTML\r\n\r\nSetiap halaman HTML setidaknya memiliki struktur dasar yang terdiri dari : Tag DTD atau DOCTYPE, tag html, tag head, dan tag body. Inilah yang merupakan struktur paling dasar dari HTML, walaupun HTML tidak hanya berisi struktur tersebut.\r\n\r\nAgar lebih mudah memahaminya, silahkan buka text editor (Notepad++), lalu ketikkan kode berikut ini:\r\n\r\nContoh struktur dasar HTML:\r\n\r\n```language\r\n<!DOCTYPE html>\r\n  <html>\r\n  <head>\r\n    <title>Title dari Websiteku</title>\r\n  </head>\r\n<body>\r\n   <p>Selamat Pagi Dunia, Hello World!</p>\r\n</body>\r\n</html>\r\n```\r\n\r\n## Pengertian DTD atau DOCTYPE\r\n\r\nTag paling awal dari contoh HTML diatas adalah DTD atau DOCTYPE. DTD adalah singkatan dari Document Type Declaration. Yang berfungsi untuk memberi tahu kepada web browser bahwa dokumen yang akan diproses adalah HTML.\r\n\r\nDTD memiliki banyak versi tergantung kepada versi HTML yang digunakan. Pada contoh diatas, saya menggunakan DTD versi HTML 5. Sebelum HTML 5, DTD terdiri dari text panjang yang hampir mustahil dihafal. Contohnya, DTD untuk xHTML 1.0 adalah:\r\n\r\n```language\r\n<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \r\n\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n```\r\nJika kita tidak menuliskan DTD, browser akan tetap menampilkan dan memproses halaman web kita seperti tidak terjadi apa-apa. Namun browser sebenarnya menjalankan halaman HTML tersebut pada mode khusus yang disebut quirk mode.\r\n\r\nPada quirk mode, web browser menerjemahkan halaman web (terutama kode CSS) sedikit berbeda dari seharusnya. Ini karena web browser menganggap bahwa ketika DTD tidak ditemuka, halaman tersebut kemungkinan besar merupakan halaman web usang. Agar halaman \'usang\' ini tetap tampil baik, web browser perlu menggunakan aturan-aturan yang berbeda, yakni: quirk mode.\r\n\r\nCara untuk mengetahui apakah web browser berjalan pada quirk mode atau standard mode lebih mudah jika menggunakan web browser Mozilla Firefox. Pada Firefox, klik kanan pada halaman web, lalu pilih Page Info. Pada bagian Render Mode akan terlihat apakah quirk mode, atau standard mode.\r\n\r\n### Tag <html>\r\n\r\nSetelah DTD, tag berikutnya adalah tag <html>.\r\n\r\nIni adalah tag pembuka dari keseluruhan halaman web. Semua kode HTML harus berada di dalam tag ini. Tag html dimulai dengan <html> dan diakhiri dengan </html>\r\nTag <head>\r\n\r\n### Elemen pada tag <head> \r\numumnya akan berisi berbagai definisi halaman, seperti kode CSS, JavaScript, dan kode-kode lainnya yang tidak tampil di browser.\r\n\r\n### Tag <title> \r\ndalam contoh kita sebelumnya digunakan untuk menampilkan title dari sebuah halaman web. Title ini biasanya ditampilkan pada bagian paling atas web browser. Contohnya pada tampilan halaman.html, \'Title dari Websiteku\' akan ditampilkan pada tab browser.\r\nTag <body>\r\n\r\n### Tag <body> \r\nakan berisi semua elemen yang akan tampil dalam halaman web, seperti paragraf, tabel, link, gambar, dll. Tag body ini ditutup dengan </body>. Sebagian besar waktu kita dalam merancang web akan dihabiskan di dalam tag <body> ini.\r\n\r\nPerhatikan bahwa setiap tag akan diakhiri dengan penutup tag. Termasuk <html> yang merupakan tag paling awal dari sebuah halaman web.\r\n\r\nStuktur HTML yang kita bahas disini adalah struktur yang sangat sederhana. Sebuah halaman web bisa memiliki ratusan bahkan ribuan baris, yang ditulis dengan berbagai tag HTML. Tag pertama yang akan kita bahas dalam tutorial berikutnya adalah tag <p> yang digunakan untuk membuat paragraf di dalam HTML.','2024-06-05 07:06:29','2024-06-05 07:06:29');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('9c36dccd-892c-4925-9734-89d8e24a985b','HTML','2024-06-05 06:34:26','2024-06-05 06:34:26'),('9c36dcd4-18cf-467c-8756-323479bc3c4e','CSS','2024-06-05 06:34:30','2024-06-05 06:34:30'),('9c36dcea-1590-473f-aef1-5c877d097cd8','Java Script','2024-06-05 06:34:44','2024-06-05 06:34:44'),('9c36dd01-79aa-47c9-ac5b-35631061f500','PHP','2024-06-05 06:35:00','2024-06-05 06:35:00'),('9c36dd0b-91bf-4d13-a83d-9c2d84078593','Laravel','2024-06-05 06:35:06','2024-06-05 06:35:06'),('9c36dd1d-53af-4266-9914-a3fa45528aed','Devops','2024-06-05 06:35:18','2024-06-05 06:35:18'),('9c36dd2a-0dcb-4c17-92e9-a9678cd7317d','Express JS','2024-06-05 06:35:26','2024-06-05 06:35:26'),('9c36dd3a-b95c-4017-afda-9045941a0ab7','Vue','2024-06-05 06:35:37','2024-06-05 06:35:37'),('9c36dd46-62d0-49eb-a97c-02414015cadc','Nuxt','2024-06-05 06:35:45','2024-06-05 06:35:45'),('9c36dd50-ad17-4185-b2a1-78e628d9d221','React','2024-06-05 06:35:52','2024-06-05 06:35:52'),('9c36dd5a-26e1-4075-a11c-a943a154780a','Next','2024-06-05 06:35:58','2024-06-05 06:35:58'),('9c36dd89-8333-415d-a152-a806a68f3916','Flutter','2024-06-05 06:36:29','2024-06-05 06:36:29');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `article_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (43,'2014_10_12_000000_create_users_table',1),(44,'2014_10_12_100000_create_password_reset_tokens_table',1),(45,'2019_08_19_000000_create_failed_jobs_table',1),(46,'2019_12_14_000001_create_personal_access_tokens_table',1),(47,'2024_02_22_230927_create_categories_table',1),(48,'2024_02_22_230937_create_articles_table',1),(49,'2024_02_22_231722_create_comments_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
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
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `users` VALUES ('9b6716db-52c4-4eb2-b510-cf95e065babc','tolo udon isia','tolo@mail.com',NULL,'$2y$12$TNBW0SEUpZykBIFRulM1FuRLRdAEAGdvlkXyEWUCC4AH0y9BYTHge',NULL,'2024-02-22 23:44:34','2024-06-04 19:35:05'),('9b6ef9a4-ea0d-4cc0-9ada-e42dcfeccf3a','bang nunan','fkr@mail.com',NULL,'$2y$12$12Hv6egBY5UU6gUrJgCXdemhACAo5hivUz08ZdZafmphA130JhjFO',NULL,'2024-02-26 21:49:30','2024-06-04 19:20:54'),('9b6ef9c0-6e20-428d-8c87-e9ad8a6c824f','kulo','nuwun@mail.com',NULL,'$2y$12$dUjjDGEih8hr5bf629FDQOie.HL3KIlrpk0S3wSXBY0cBvNz9.wiS',NULL,'2024-02-26 21:49:48','2024-02-26 21:49:48'),('9c360e24-4d6a-41aa-9f64-50e858b12bbe','kolamin','admin@mail.com',NULL,'$2y$12$InT8772nEHBQreYFWI/mU.QPQRLOzDhLjfxJLdYbiuNLfxD1/M9nG',NULL,'2024-06-04 20:56:34','2024-06-04 21:20:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-06  5:15:08

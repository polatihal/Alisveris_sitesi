-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 29 May 2022, 18:48:30
-- Sunucu sürümü: 10.4.17-MariaDB
-- PHP Sürümü: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `b2b`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_kadi` varchar(300) NOT NULL,
  `admin_posta` varchar(300) NOT NULL,
  `admin_sifre` varchar(300) NOT NULL,
  `admin_durum` tinyint(1) NOT NULL DEFAULT 1,
  `admin_tarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_kadi`, `admin_posta`, `admin_sifre`, `admin_durum`, `admin_tarih`) VALUES
(1, 'yavuz', 'b2b@yavuz.com', '10470c3b4b1fed12c3baac014be15fac67c6e815', 1, '2022-04-09 22:30:06');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `adminlog`
--

CREATE TABLE `adminlog` (
  `alogid` int(11) NOT NULL,
  `alogadmin` int(11) NOT NULL,
  `alogtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `alogaciklama` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `adminlog`
--

INSERT INTO `adminlog` (`alogid`, `alogadmin`, `alogtarih`, `alogaciklama`) VALUES
(1, 1, '2022-04-09 22:51:08', '0'),
(2, 1, '2022-04-13 14:45:29', '0'),
(3, 1, '2022-04-13 21:22:16', '0'),
(4, 1, '2022-04-19 17:08:51', '0'),
(5, 1, '2022-04-23 21:15:18', '0'),
(6, 1, '2022-04-25 21:00:28', '0'),
(7, 1, '2022-04-30 13:40:43', '0'),
(8, 1, '2022-05-13 17:30:23', '0'),
(9, 1, '2022-05-16 18:07:07', 'Yönetici girişi yapıldı'),
(10, 1, '2022-05-24 20:23:39', 'Yönetici girişi yapıldı'),
(11, 1, '2022-05-24 22:34:18', 'Yönetici girişi yapıldı'),
(12, 1, '2022-05-24 22:40:14', 'Yönetici girişi yapıldı'),
(13, 1, '2022-05-26 06:38:51', 'Yönetici girişi yapıldı'),
(14, 1, '2022-05-28 15:51:57', 'Yönetici girişi yapıldı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ayarlar`
--

CREATE TABLE `ayarlar` (
  `id` int(11) NOT NULL,
  `sitebaslik` varchar(300) NOT NULL,
  `siteurl` varchar(300) NOT NULL,
  `sitekeyw` varchar(300) NOT NULL,
  `sitedesc` varchar(300) NOT NULL,
  `sitelogo` varchar(300) NOT NULL,
  `sitekdv` int(11) NOT NULL,
  `sitesiparisdurum` varchar(200) NOT NULL,
  `sitedurum` tinyint(1) NOT NULL DEFAULT 1,
  `smtphost` varchar(300) NOT NULL,
  `smtpmail` varchar(300) NOT NULL,
  `smtpsifre` varchar(300) NOT NULL,
  `smtpsec` varchar(100) NOT NULL,
  `smtpport` varchar(100) NOT NULL,
  `smtpkime` varchar(300) NOT NULL,
  `tel` varchar(200) DEFAULT NULL,
  `fax` varchar(200) DEFAULT NULL,
  `eposta` varchar(200) DEFAULT NULL,
  `adres` text DEFAULT NULL,
  `map` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `ayarlar`
--

INSERT INTO `ayarlar` (`id`, `sitebaslik`, `siteurl`, `sitekeyw`, `sitedesc`, `sitelogo`, `sitekdv`, `sitesiparisdurum`, `sitedurum`, `smtphost`, `smtpmail`, `smtpsifre`, `smtpsec`, `smtpport`, `smtpkime`, `tel`, `fax`, `eposta`, `adres`, `map`) VALUES
(1, 'Yavuz Selim - B2B Projesi', 'http://localhost/b2b', 'Yavuz Selim - B2B Projesi', 'Yavuz Selim - B2B Projesi', 'yavuz-selim---b2b-projesi-6282cb63801b3.png', 18, '1', 1, 'smtp.yandex.com', 'calisanplesk@yavuz-selim.com', '251970527yavuz@@', 'tls', '587', 'softwarencoder@yavuz-selim.com', '+90 850 222 1 222', '+90 850 222 1 223', 'info@yavuz-selim.com', 'İstanbul / Eminönü', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d12041.754991549758!2d28.956320434707767!3d41.01565611879836!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab9eb9d587135%3A0x8aa0bb6b1dd6ffb7!2zRW1pbsO2bsO8LCBSw7xzdGVtIFBhxZ9hLCBGYXRpaC_EsHN0YW5idWw!5e0!3m2!1str!2str!4v1646754428501!5m2!1str!2str\" width=\"100%\" height=\"600\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bankalar`
--

CREATE TABLE `bankalar` (
  `bankaid` int(11) NOT NULL,
  `bankaadi` varchar(300) NOT NULL,
  `bankahesap` varchar(300) NOT NULL,
  `bankasube` varchar(300) NOT NULL,
  `bankaiban` varchar(300) NOT NULL,
  `bankadurum` tinyint(1) NOT NULL DEFAULT 1,
  `bankaekleyen` int(11) NOT NULL,
  `bankatarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `bankalar`
--

INSERT INTO `bankalar` (`bankaid`, `bankaadi`, `bankahesap`, `bankasube`, `bankaiban`, `bankadurum`, `bankaekleyen`, `bankatarih`) VALUES
(1, 'Deniz Bank', '123', 'Bursa', 'TR 123 123 123', 1, 1, '2022-03-01 18:03:56'),
(2, 'Garanti Bankası', '1234562', '1122', 'TR666611112224443332', 1, 1, '2022-04-19 21:20:39');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bayiler`
--

CREATE TABLE `bayiler` (
  `id` int(11) NOT NULL,
  `bayikodu` varchar(200) NOT NULL,
  `bayiadi` varchar(300) NOT NULL,
  `bayimail` varchar(300) NOT NULL,
  `bayisifre` varchar(300) NOT NULL,
  `bayidurum` tinyint(1) NOT NULL DEFAULT 2,
  `bayitarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `bayilogo` varchar(300) DEFAULT 'b2b.webp',
  `bayiindirim` tinyint(3) NOT NULL DEFAULT 0,
  `bayitelefon` varchar(50) NOT NULL,
  `bayifax` varchar(50) DEFAULT NULL,
  `bayivergino` varchar(200) NOT NULL,
  `bayivergidairesi` varchar(300) NOT NULL,
  `bayisite` varchar(300) DEFAULT NULL,
  `sifirlamakodu` varchar(300) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `bayiler`
--

INSERT INTO `bayiler` (`id`, `bayikodu`, `bayiadi`, `bayimail`, `bayisifre`, `bayidurum`, `bayitarih`, `bayilogo`, `bayiindirim`, `bayitelefon`, `bayifax`, `bayivergino`, `bayivergidairesi`, `bayisite`, `sifirlamakodu`) VALUES
(1, '62151849239d6', 'bardak tekstil', 'softwarencoder@yavuz-selim.com\r\n', 'adcd7048512e64b48da55b027577886ee5a36350', 1, '2022-02-22 17:07:21', '62151849239d6-626717eeef632.webp', 25, '99987', '789789', '65646546', 'kupa bardak', 'https://yavuz-selim.com', ''),
(3, '62151849239d6', 'bardak tekstil1', '1softwarencoder@yavuz-selim.com', 'adcd7048512e64b48da55b027577886ee5a36350', 1, '2022-02-22 17:07:21', '62151849239d6-626717eeef632.webp', 25, '99987', '789789', '65646546', 'kupa bardak', 'https://yavuz-selim.com', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bayilog`
--

CREATE TABLE `bayilog` (
  `id` int(11) NOT NULL,
  `logbayi` varchar(200) DEFAULT NULL,
  `logtarih` timestamp NULL DEFAULT current_timestamp(),
  `logip` varchar(300) DEFAULT NULL,
  `logaciklama` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `bayilog`
--

INSERT INTO `bayilog` (`id`, `logbayi`, `logtarih`, `logip`, `logaciklama`) VALUES
(3, '62151849239d6', '2022-03-18 17:18:44', '::1', 'Çıkış yapıldı'),
(2, '62151849239d6', '2022-03-18 17:16:46', '::1', 'Giriş yapıldı'),
(4, '62151849239d6', '2022-03-18 17:19:44', '::1', 'Giriş yapıldı'),
(5, '62151849239d6', '2022-03-18 17:20:50', '::1', 'YAVUZB2B-002 nolu ürünü sepete ekledi'),
(6, '62151849239d6', '2022-03-18 17:21:45', '::1', 'YAVUZB2B-002 nolu ürüne yorum yaptı'),
(7, '62151849239d6', '2022-03-18 17:37:24', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(8, '62151849239d6', '2022-03-18 17:37:44', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(9, '62151849239d6', '2022-03-18 17:38:19', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(10, '62151849239d6', '2022-03-18 17:39:08', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(11, '62151849239d6', '2022-03-18 17:45:20', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(12, '62151849239d6', '2022-03-18 17:47:05', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(13, '62151849239d6', '2022-03-18 17:49:27', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(14, '62151849239d6', '2022-03-19 13:07:57', '::1', 'Giriş yapıldı'),
(15, '62151849239d6', '2022-03-19 13:09:45', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(16, '62151849239d6', '2022-03-19 13:11:26', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(17, '62151849239d6', '2022-03-19 13:12:44', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(18, '62151849239d6', '2022-03-19 13:15:43', '::1', '6235d77f6eb05 nolu siparişi oluşturdu'),
(19, '62151849239d6', '2022-03-19 13:16:38', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(20, '62151849239d6', '2022-03-19 13:17:51', '::1', 'Çıkış yapıldı'),
(21, 'Belirtilmemiş', '2022-03-23 15:51:49', '::1', 'Yeni mesaj gönderimi yaptı'),
(22, 'Belirtilmemiş', '2022-03-23 15:52:51', '::1', 'Yeni mesaj gönderimi yaptı'),
(23, 'Belirtilmemiş', '2022-03-23 16:09:11', '::1', 'Yeni mesaj gönderimi yaptı'),
(24, '623b474cb2df4', '2022-03-23 16:14:07', '::1', 'Yeni kayıt oluşturuldu'),
(25, '62151849239d6', '2022-04-09 23:29:02', '::1', 'Giriş yapıldı'),
(26, '62151849239d6', '2022-04-09 23:40:33', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(27, '62151849239d6', '2022-04-23 22:01:59', '::1', 'Giriş yapıldı'),
(28, '62151849239d6', '2022-04-23 22:02:10', '::1', '0001 nolu ürünü sepete ekledi'),
(29, '62151849239d6', '2022-05-28 16:01:09', '::1', 'Giriş yapıldı'),
(30, '62151849239d6', '2022-05-28 16:01:16', '::1', 'Çıkış yapıldı'),
(31, '62151849239d6', '2022-05-28 16:01:59', '::1', 'Giriş yapıldı'),
(32, '62151849239d6', '2022-05-28 16:02:07', '::1', 'YAVUZB2B-001 nolu ürünü sepete ekledi'),
(33, '62151849239d6', '2022-05-28 16:06:39', '::1', '6292488ce308f nolu siparişi oluşturdu'),
(34, '62151849239d6', '2022-05-28 16:06:54', '::1', 'Çıkış yapıldı'),
(35, '62151849239d6', '2022-05-28 16:07:32', '::1', 'Giriş yapıldı'),
(36, '62151849239d6', '2022-05-28 16:07:40', '::1', '0001 nolu ürünü sepete ekledi'),
(37, '62151849239d6', '2022-05-28 16:08:06', '::1', '629248e405c4a nolu siparişi oluşturdu'),
(38, '62151849239d6', '2022-05-28 16:09:39', '::1', 'Yeni havale bildirimi yaptı'),
(39, '62151849239d6', '2022-05-28 16:10:48', '::1', 'YAVUZB2B-002 nolu ürünü sepete ekledi'),
(40, '62151849239d6', '2022-05-28 16:27:17', '::1', 'Çıkış yapıldı');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bayi_adresler`
--

CREATE TABLE `bayi_adresler` (
  `id` int(11) NOT NULL,
  `adresbayi` varchar(200) NOT NULL,
  `adresbaslik` varchar(200) NOT NULL,
  `adrestarif` text NOT NULL,
  `adresdurum` tinyint(1) NOT NULL DEFAULT 1,
  `adrestarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `bayi_adresler`
--

INSERT INTO `bayi_adresler` (`id`, `adresbayi`, `adresbaslik`, `adrestarif`, `adresdurum`, `adrestarih`) VALUES
(1, '62151849239d6', 'iş', 'beşiktaş', 2, '2022-03-01 17:59:08'),
(2, '62151849239d6', 'ev', 'istanbuldaki evim', 1, '2022-03-05 13:14:22'),
(3, '62151849239d6', 'Fatura adresim', 'ankara / çankaya / özel hotel', 1, '2022-03-14 15:46:30');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `durumkodlari`
--

CREATE TABLE `durumkodlari` (
  `id` int(11) NOT NULL,
  `durumbaslik` varchar(300) NOT NULL,
  `durumkodu` varchar(200) NOT NULL,
  `durumtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `durumekleyen` int(11) NOT NULL,
  `durumdurum` tinyint(1) NOT NULL DEFAULT 1,
  `silinmeyen_durum` tinyint(1) NOT NULL DEFAULT 2
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `durumkodlari`
--

INSERT INTO `durumkodlari` (`id`, `durumbaslik`, `durumkodu`, `durumtarih`, `durumekleyen`, `durumdurum`, `silinmeyen_durum`) VALUES
(1, 'BEKLEMEDE', '2', '2022-03-01 17:44:06', 1, 1, 1),
(2, 'İPTAL EDİLDİ', '3', '2022-03-01 17:44:06', 1, 1, 2),
(3, 'ONAYLANDI', '1', '2022-03-01 17:44:06', 1, 1, 2),
(4, 'TESLİM EDİLDi', '4', '2022-03-01 17:44:06', 1, 1, 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `havalebildirim`
--

CREATE TABLE `havalebildirim` (
  `id` int(11) NOT NULL,
  `havalebayi` varchar(200) NOT NULL,
  `havaletarih` date NOT NULL,
  `havalesaat` varchar(200) NOT NULL,
  `havaletutar` double(15,2) NOT NULL,
  `havalenot` text NOT NULL,
  `banka` int(11) NOT NULL,
  `havaleeklenme` timestamp NOT NULL DEFAULT current_timestamp(),
  `havaleip` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `havalebildirim`
--

INSERT INTO `havalebildirim` (`id`, `havalebayi`, `havaletarih`, `havalesaat`, `havaletutar`, `havalenot`, `banka`, `havaleeklenme`, `havaleip`) VALUES
(3, '62151849239d6', '2022-05-28', '21.14', 250.00, 'test', 1, '2022-05-28 16:09:36', '::1'),
(2, '62151849239d6', '2022-03-04', '21.14', 250.00, 'aylık taksitimi ödedim bilginize iyi çalışmalar', 1, '2022-03-05 13:30:28', '::1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `mesajlar`
--

CREATE TABLE `mesajlar` (
  `id` int(11) NOT NULL,
  `mesajisim` varchar(300) NOT NULL,
  `mesajposta` varchar(300) NOT NULL,
  `mesajkonu` varchar(300) NOT NULL DEFAULT 'YOK',
  `mesajicerik` text NOT NULL,
  `mesajdurum` tinyint(1) NOT NULL DEFAULT 2,
  `mesajip` varchar(300) NOT NULL,
  `mesajtarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `mesajlar`
--

INSERT INTO `mesajlar` (`id`, `mesajisim`, `mesajposta`, `mesajkonu`, `mesajicerik`, `mesajdurum`, `mesajip`, `mesajtarih`) VALUES
(1, 'selim', 'selim@w.cn', 'test', 'test ediyorum dikkate alınmasın lütfen test ediyorum dikkate alınmasın lütfen test ediyorum dikkate alınmasın lütfen', 1, '::1', '2022-03-08 15:57:37'),
(2, 'selim', 'selim@w.cn', 'test', 'test ediyorum dikkate alınmasın lütfen test ediyorum dikkate alınmasın lütfen test ediyorum dikkate alınmasın lütfen test ediyorum dikkate alınmasın lütfen', 1, '::1', '2022-03-08 15:58:05'),
(4, 'Yavuz Selim ŞAHİN', 'softwarencoder@yavuz-selim.com', 'iş birliği', 'test ediyorum lütfen dikkate almayınız test ediyorum lütfen dikkate almayınız test ediyorum lütfen dikkate almayınız test ediyorum lütfen dikkate almayınız', 1, '::1', '2022-03-23 15:52:51');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sayfalar`
--

CREATE TABLE `sayfalar` (
  `id` int(11) NOT NULL,
  `baslik` varchar(300) NOT NULL,
  `sef` varchar(300) NOT NULL,
  `icerik` text NOT NULL,
  `kapak` varchar(200) DEFAULT NULL,
  `durum` tinyint(1) NOT NULL DEFAULT 1,
  `tarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `ekleyen` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sayfalar`
--

INSERT INTO `sayfalar` (`id`, `baslik`, `sef`, `icerik`, `kapak`, `durum`, `tarih`, `ekleyen`) VALUES
(2, 'Misyon / Vizyon', 'misyon-vizyon', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'b2b.webp', 1, '2022-03-08 16:07:55', 1),
(3, 'Gizlilik Sözleşmesi', 'gizlilik-sozlesmesi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'b2b.webp', 1, '2022-03-08 16:07:55', 1),
(4, 'Mesafeli Satış Sözleşmesi', 'mesafeli-satis-sozlesmesi', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\n', 'b2b.webp', 1, '2022-03-08 16:07:55', 1),
(5, 'Üyelik Sözleşmesi', 'uyelik-sozlesmesi', '<h2><strong>SİTE KULLANIM ŞARTLARI</strong></h2>\r\n\r\n<p>L&uuml;tfen sitemizi kullanmadan evvel bu &lsquo;site kullanım şartları&rsquo;nı dikkatlice okuyunuz.&nbsp;</p>\r\n\r\n<p>Bu alışveriş sitesini kullanan ve alışveriş yapan m&uuml;şterilerimiz aşağıdaki şartları kabul etmiş varsayılmaktadır:</p>\r\n\r\n<p>Sitemizdeki web sayfaları ve ona bağlı t&uuml;m sayfalar (&lsquo;site&rsquo;) &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip; adresindeki &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;.firmasının (Firma) malıdır ve onun tarafından işletilir. Sizler (&lsquo;Kullanıcı&rsquo;) sitede sunulan t&uuml;m hizmetleri kullanırken aşağıdaki şartlara tabi olduğunuzu, sitedeki hizmetten yararlanmakla ve kullanmaya devam etmekle; Bağlı olduğunuz yasalara g&ouml;re s&ouml;zleşme imzalama hakkına, yetkisine ve hukuki ehliyetine sahip ve 18 yaşın &uuml;zerinde olduğunuzu, bu s&ouml;zleşmeyi okuduğunuzu, anladığınızı ve s&ouml;zleşmede yazan şartlarla bağlı olduğunuzu kabul etmiş sayılırsınız.&nbsp;</p>\r\n\r\n<p>İşbu s&ouml;zleşme taraflara s&ouml;zleşme konusu site ile ilgili hak ve y&uuml;k&uuml;ml&uuml;l&uuml;kler y&uuml;kler ve taraflar işbu s&ouml;zleşmeyi kabul ettiklerinde bahsi ge&ccedil;en hak ve y&uuml;k&uuml;ml&uuml;l&uuml;kleri eksiksiz, doğru, zamanında, işbu s&ouml;zleşmede talep edilen şartlar d&acirc;hilinde yerine getireceklerini beyan ederler.</p>\r\n\r\n<h2><strong>1. SORUMLULUKLAR</strong></h2>\r\n\r\n<p>a.Firma, fiyatlar ve sunulan &uuml;r&uuml;n ve hizmetler &uuml;zerinde değişiklik yapma hakkını her zaman saklı tutar.&nbsp;</p>\r\n\r\n<p>b.Firma, &uuml;yenin s&ouml;zleşme konusu hizmetlerden, teknik arızalar dışında yararlandırılacağını kabul ve taahh&uuml;t eder.</p>\r\n\r\n<p>c.Kullanıcı, sitenin kullanımında tersine m&uuml;hendislik yapmayacağını ya da bunların kaynak kodunu bulmak veya elde etmek amacına y&ouml;nelik herhangi bir başka işlemde bulunmayacağını aksi halde ve 3. Kişiler nezdinde doğacak zararlardan sorumlu olacağını, hakkında hukuki ve cezai işlem yapılacağını peşinen kabul eder.&nbsp;</p>\r\n\r\n<p>d.Kullanıcı, site i&ccedil;indeki faaliyetlerinde, sitenin herhangi bir b&ouml;l&uuml;m&uuml;nde veya iletişimlerinde genel ahlaka ve adaba aykırı, kanuna aykırı, 3. Kişilerin haklarını zedeleyen, yanıltıcı, saldırgan, m&uuml;stehcen, pornografik, kişilik haklarını zedeleyen, telif haklarına aykırı, yasa dışı faaliyetleri teşvik eden i&ccedil;erikler &uuml;retmeyeceğini, paylaşmayacağını kabul eder. Aksi halde oluşacak zarardan tamamen kendisi sorumludur ve bu durumda &lsquo;Site&rsquo; yetkilileri, bu t&uuml;r hesapları askıya alabilir, sona erdirebilir, yasal s&uuml;re&ccedil; başlatma hakkını saklı tutar. Bu sebeple yargı mercilerinden etkinlik veya kullanıcı hesapları ile ilgili bilgi talepleri gelirse paylaşma hakkını saklı tutar.</p>\r\n\r\n<p>e.Sitenin &uuml;yelerinin birbirleri veya &uuml;&ccedil;&uuml;nc&uuml; şahıslarla olan ilişkileri kendi sorumluluğundadır.&nbsp;</p>\r\n', 'uyelik-sozlesmesi-6282c49b586ff.webp', 1, '2022-04-19 21:38:00', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sepet`
--

CREATE TABLE `sepet` (
  `id` int(11) NOT NULL,
  `sepetbayi` varchar(200) NOT NULL,
  `sepeturun` varchar(200) NOT NULL,
  `sepetadet` int(11) NOT NULL,
  `birimfiyat` double(15,2) NOT NULL,
  `toplamfiyat` double(15,2) NOT NULL,
  `kdv` int(11) NOT NULL DEFAULT 18,
  `sepettarih` date NOT NULL,
  `sepetsilinme` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `sepet`
--

INSERT INTO `sepet` (`id`, `sepetbayi`, `sepeturun`, `sepetadet`, `birimfiyat`, `toplamfiyat`, `kdv`, `sepettarih`, `sepetsilinme`) VALUES
(38, '62151849239d6', 'YAVUZB2B-002', 5, 1500.00, 8850.00, 18, '2022-05-28', '2022-06-04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `id` int(11) NOT NULL,
  `siparisbayi` varchar(200) NOT NULL,
  `siparisisim` varchar(300) NOT NULL,
  `siparistel` varchar(100) NOT NULL,
  `siparistarih` date NOT NULL,
  `siparissaat` varchar(200) NOT NULL,
  `siparisdurum` int(11) NOT NULL DEFAULT 2,
  `siparisnot` text NOT NULL,
  `siparistutar` double(15,2) NOT NULL,
  `siparisodeme` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = havale 2 = kredi kartı',
  `sipariskodu` varchar(200) NOT NULL,
  `siparisadres` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`id`, `siparisbayi`, `siparisisim`, `siparistel`, `siparistarih`, `siparissaat`, `siparisdurum`, `siparisnot`, `siparistutar`, `siparisodeme`, `sipariskodu`, `siparisadres`) VALUES
(5, '62151849239d6', 'Yavuz Av BAyisi12', '54533311221', '2022-03-14', '19:16', 2, 'test', 28320.00, 1, '622f6a706753f', 3),
(6, '62151849239d6', 'Yavuz Av BAyisi12', '54533311221', '2022-03-16', '20:42', 2, 'test', 9440.00, 1, '6232216dea5f3', 3),
(7, '62151849239d6', 'Yavuz Av BAyisi12', '54533311221', '2022-03-17', '19:29', 2, 'test ediyorum', 4720.00, 1, '623361f37d12e', 3),
(8, '62151849239d6', 'Yavuz Av BAyisi12', '54533311221', '2022-03-17', '19:42', 2, 'test', 70800.00, 1, '623364eb8bfec', 2),
(9, '62151849239d6', 'Yavuz Av BAyisi12', '54533311221', '2022-03-19', '16:15', 1, 'test', 19116.00, 1, '6235d77f6eb05', 1),
(10, '62151849239d6', 'bardak tekstil', '99987', '2022-05-28', '19:02', 2, 'kırılmadan gelsin lütfen', 15930.00, 1, '6292479fa83bc', 2),
(11, '62151849239d6', 'bardak tekstil', '99987', '2022-05-28', '19:03', 2, 'test', 15930.00, 1, '629247c5a3642', 2),
(12, '62151849239d6', 'bardak tekstil', '99987', '2022-05-28', '19:03', 2, '', 15930.00, 2, '629247d9f229f', 3),
(13, '62151849239d6', 'bardak tekstil', '231232323', '2022-05-28', '19:05', 2, '', 15930.00, 1, '6292486246f5c', 2),
(14, '62151849239d6', 'bardak tekstil', '99987', '2022-05-28', '19:06', 2, '', 15930.00, 1, '6292488ce308f', 2),
(15, '62151849239d6', 'bardak tekstil', '99987', '2022-05-28', '19:08', 2, 'kırılmadan gelsin lütfen', 9292.50, 1, '629248e405c4a', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis_urunler`
--

CREATE TABLE `siparis_urunler` (
  `id` int(11) NOT NULL,
  `sipkodu` varchar(200) NOT NULL,
  `sipurun` varchar(200) NOT NULL,
  `sipbirim` double(15,2) NOT NULL,
  `sipadet` int(11) NOT NULL,
  `siptoplam` double(15,2) NOT NULL,
  `sipurunadi` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `siparis_urunler`
--

INSERT INTO `siparis_urunler` (`id`, `sipkodu`, `sipurun`, `sipbirim`, `sipadet`, `siptoplam`, `sipurunadi`) VALUES
(1, '622f6a706753f', 'YAVUZB2B-001', 6000.00, 4, 28320.00, 'Lenovo V15-IIL Intel Core i5'),
(2, '6232216dea5f3', 'YAVUZB2B-001', 6000.00, 1, 7080.00, 'Lenovo V15-IIL Intel Core i5'),
(3, '6232216dea5f3', 'YAVUZB2B-002', 2000.00, 1, 2360.00, 'Lenovo V15-IIL Intel Core i52'),
(4, '623361f37d12e', 'YAVUZB2B-002', 2000.00, 2, 4720.00, 'asus'),
(5, '623364eb8bfec', 'YAVUZB2B-001', 6000.00, 10, 70800.00, 'Lenovo V15-IIL Intel Core i5'),
(6, '6235d77f6eb05', 'YAVUZB2B-001', 5400.00, 3, 19116.00, 'Lenovo V15-IIL Intel Core i5'),
(7, '6292479fa83bc', 'YAVUZB2B-001', 4500.00, 3, 15930.00, 'Lenovo V15-IIL Intel Core i5'),
(8, '629247c5a3642', 'YAVUZB2B-001', 4500.00, 3, 15930.00, 'Lenovo V15-IIL Intel Core i5'),
(9, '629247d9f229f', 'YAVUZB2B-001', 4500.00, 3, 15930.00, 'Lenovo V15-IIL Intel Core i5'),
(10, '6292486246f5c', 'YAVUZB2B-001', 4500.00, 3, 15930.00, 'Lenovo V15-IIL Intel Core i5'),
(11, '6292488ce308f', 'YAVUZB2B-001', 4500.00, 3, 15930.00, 'Lenovo V15-IIL Intel Core i5'),
(12, '629248e405c4a', '0001', 2625.00, 3, 9292.50, 'Anker Soundcore Life Q20 Kablosuz Kulaklık');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `id` int(11) NOT NULL,
  `urunkat` int(11) NOT NULL,
  `urunbaslik` varchar(300) NOT NULL,
  `urunsef` varchar(300) NOT NULL,
  `urunicerik` text NOT NULL,
  `urunkapak` varchar(300) NOT NULL,
  `urunbanner` varchar(300) NOT NULL,
  `urunfiyat` double(15,2) NOT NULL,
  `urunkodu` varchar(200) NOT NULL,
  `urunstok` int(11) NOT NULL,
  `urunkeyw` varchar(300) NOT NULL,
  `urundesc` varchar(300) NOT NULL,
  `uruntarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `urunekleyen` int(11) NOT NULL,
  `urunvitrin` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = vitrin 2=vitrin değil',
  `urundurum` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = aktif 2= pasif'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`id`, `urunkat`, `urunbaslik`, `urunsef`, `urunicerik`, `urunkapak`, `urunbanner`, `urunfiyat`, `urunkodu`, `urunstok`, `urunkeyw`, `urundesc`, `uruntarih`, `urunekleyen`, `urunvitrin`, `urundurum`) VALUES
(1, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i5', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-001', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(2, 1, 'asus', 'lenovo-v15-iil-intel-core-i52', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo.webp', 'lenovo.webp', 2000.00, 'YAVUZB2B-002', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(4, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i53', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-0013', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(5, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i54', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-0014', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(6, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i56', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-0015', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(7, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i57', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-0016', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(8, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i58', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-00187', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(9, 1, 'Lenovo V15-IIL Intel Core i5', 'lenovo-v15-iil-intel-core-i59', '1920 x 1080 piksel olan ekran çözünürlüğü seviyesi ile dikkat çeken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile görevlerini yerine getiren bu ürün, hem hızlı hem de güvenli bir kullanım gerçekleştirmek isteyen kullanıcılar için geliştirilmiştir. 15.6 inçlik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından çeşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile çalıştığı için yüksek görüntü kalitesi yaratan bu ürün, oyunları gelişmiş ekran çözünürlüğü desteği ile oynayabilmeniz için idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı için Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.', 'lenovo2.webp', 'lenovo.webp', 6000.00, 'YAVUZB2B-00113', 100, 'Lenovo V15-IIL Intel Core i5', 'Lenovo V15-IIL Intel Core i5', '2022-03-05 15:45:10', 1, 1, 1),
(10, 4, 'Monster Notebook Yeni Nesil', 'monster-notebook-yeni-nesil', '<p>21920 x 1080 piksel olan ekran &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml; seviyesi ile dikkat &ccedil;eken Lenovo V15-IIL, Full HD kalitesinde film ve dizi izleyerek bilgisayarınızla sinema keyfi yaşayabilmenizi sağlar. Windows 10 Home işletim sistemi ile g&ouml;revlerini yerine getiren bu &uuml;r&uuml;n, hem hızlı hem de g&uuml;venli bir kullanım ger&ccedil;ekleştirmek isteyen kullanıcılar i&ccedil;in geliştirilmiştir. 15.6 in&ccedil;lik son derece geniş bir ekran alanına sahip olan bilgisayar, ofis programlarından &ccedil;eşitli bilgisayar oyunlarına kadar farklı uygulamaları rahatlıkla kullanabilmenizi sağlar. Intel HD Graphics ekran kartı ile &ccedil;alıştığı i&ccedil;in y&uuml;ksek g&ouml;r&uuml;nt&uuml; kalitesi yaratan bu &uuml;r&uuml;n, oyunları gelişmiş ekran &ccedil;&ouml;z&uuml;n&uuml;rl&uuml;ğ&uuml; desteği ile oynayabilmeniz i&ccedil;in idealdir. 1035G1 işlemcisi Intel Core i5 teknolojisini size ulaştırdığı i&ccedil;in Lenovo bilgisayarınızla hızlı bir kullanım deneyimi elde edebilirsiniz. Donma ve bekleme gibi can sıkıcı sorunları aşmanıza yardım eden taşınabilir bilgisayar, 3.6 GHz maksimum işlemci hızına sahiptir.</p>\r\n', 'lenovo-v15-iil-intel-core-i510-626d476b76472.webp', 'monster-notebook-yeni-nesil-626d49eb6ab34.webp', 5700.00, 'YAVUZB2B-0011214', 150, 'Lenovo V15-IIL Intel Core i52', 'Lenovo V15-IIL Intel Core i52', '2022-03-05 15:45:10', 1, 1, 1),
(11, 1, 'Anker Soundcore Life Q20 Kablosuz Kulaklık', 'anker-soundcore-life-q20-kablosuz-kulaklik', '<p>Y&uuml;ksek &Ccedil;&ouml;z&uuml;n&uuml;rl&uuml;kl&uuml; Ses Sertifikalı: &Ouml;zel, b&uuml;y&uuml;k boyutlu 40 mm dinamik s&uuml;r&uuml;c&uuml;ler Y&uuml;ksek &Ccedil;&ouml;z&uuml;n&uuml;rl&uuml;kl&uuml; Ses &uuml;retir - yalnızca olağan&uuml;st&uuml; ses &uuml;retebilen ses cihazlarına verilen bir sertifika. Life Q20 aktif g&uuml;r&uuml;lt&uuml; &ouml;nleyici kulaklık, m&uuml;ziğinizi olağan&uuml;st&uuml; netlik ve ayrıntı i&ccedil;in 40 kHz&#39;e kadar ulaşan genişletilmiş y&uuml;ksek frekanslarla yeniden &uuml;retir.</p>\r\n\r\n<p>Ortam g&uuml;r&uuml;lt&uuml;s&uuml;n&uuml;% 90&#39;a kadar azaltın: M&uuml;hendislerden oluşan ekibimiz, yaşam q20&#39;nin 4 yerleşik ANC mikrofonu ve Dijital aktif g&uuml;r&uuml;lt&uuml; iptal algoritmasına ince ayar yapmak i&ccedil;in ger&ccedil;ek hayat senaryolarında 100.000&#39;den fazla test ger&ccedil;ekleştirdi. Sonu&ccedil; olarak, hibrit aktif g&uuml;r&uuml;lt&uuml; iptali, arabalar ve u&ccedil;ak motorları gibi daha geniş bir aralıktaki d&uuml;ş&uuml;k ve orta frekanslı sesleri algılayabilir ve iptal edebilir.</p>\r\n\r\n<p>% 100 daha g&uuml;&ccedil;l&uuml; bas: &Ouml;zel bas y&uuml;kseltme teknolojimiz, Bas &ccedil;ıkışını anında g&uuml;&ccedil;lendirmek i&ccedil;in d&uuml;ş&uuml;k frekansların ger&ccedil;ek zamanlı analizini ger&ccedil;ekleştirir. G&uuml;&ccedil;lendirilmiş bir dinleme deneyimi i&ccedil;in EDM ve hip-hop gibi bas ağırlıklı t&uuml;rleri dinlerken oynat d&uuml;ğmesine iki kez basın.</p>\r\n\r\n<p>40 saatlik oynatma s&uuml;resi: Kablosuz aktif g&uuml;r&uuml;lt&uuml; iptal modunda (% 60 ses seviyesinde) 40 saate kadar kesintisiz oynatma s&uuml;resi, standart m&uuml;zik modunda 60 saate kadar uzatılır. Tek bir şarj, 600&#39;den fazla şarkıyı veya film m&uuml;ziğini birden fazla uzun mesafeli u&ccedil;uşu dinlemek i&ccedil;in yeterli meyve suyu sağlar. Aceleniz olduğunda, life Q20 aktif g&uuml;r&uuml;lt&uuml; &ouml;nleyici kulaklıkları 5 dakika şarj edin ve 4 saat dinleme s&uuml;resi elde edin.</p>\r\n\r\n<p>Evrensel Rahatlık: Hafızalı k&ouml;p&uuml;k kulaklık kapakları, kulaklarınızın etrafında nazik&ccedil;e kalıplanırken, kafa bandının d&ouml;nen bağlantıları, kulak kapaklarının a&ccedil;ısını başınızın şekline uyacak şekilde otomatik olarak ayarlar. Bu, Life Q20 aktif g&uuml;r&uuml;lt&uuml; &ouml;nleyici kulaklıkların maksimum konfor ve g&uuml;venli bir sızdırmazlık sağlamasını sağlar.</p>\r\n', 'nker-soundcore-life-q20-kablosuz-kulaklik-625f319636e4d.webp', 'nker-soundcore-life-q20-kablosuz-kulaklik-625f319636e4d.webp', 3500.00, '0001', 1000, 'Anker Soundcore Life Q20 Kablosuz Kulaklık', 'Anker Soundcore Life Q20 Kablosuz Kulaklık', '2022-04-19 22:03:03', 1, 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_kategoriler`
--

CREATE TABLE `urun_kategoriler` (
  `id` int(11) NOT NULL,
  `katbaslik` varchar(300) NOT NULL,
  `katsef` varchar(300) NOT NULL,
  `katkeyw` varchar(300) NOT NULL,
  `katdesc` varchar(300) NOT NULL,
  `katdurum` tinyint(1) NOT NULL DEFAULT 1,
  `kattarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `katekleyen` int(11) NOT NULL,
  `silinmeyen_kat` tinyint(1) NOT NULL DEFAULT 2,
  `katresim` varchar(300) DEFAULT NULL,
  `siralama` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urun_kategoriler`
--

INSERT INTO `urun_kategoriler` (`id`, `katbaslik`, `katsef`, `katkeyw`, `katdesc`, `katdurum`, `kattarih`, `katekleyen`, `silinmeyen_kat`, `katresim`, `siralama`) VALUES
(1, 'Lenovo', 'lenovo', 'lenovo', 'lenovo', 1, '2022-03-05 15:43:27', 1, 1, 'lenovobanner.webp', 5),
(4, 'Monster', 'monster', 'monster', 'monster', 1, '2022-03-05 15:43:27', 1, 2, 'asusbanner.webp', 4),
(6, 'Msi', 'msi', 'msi', 'msi', 1, '2022-03-05 15:43:27', 1, 2, 'asusbanner.webp', 3),
(7, 'Acer', 'acer', 'acer', 'acer', 1, '2022-03-05 15:43:27', 1, 2, 'asusbanner.webp', 2),
(8, 'Apple', 'apple', 'apple', 'apple', 1, '2022-03-05 15:43:27', 1, 2, 'asusbanner.webp', 0),
(12, 'teknolojik oyun bilgisayarları', 'teknolojik-oyun-bilgisayarlari', 'oyun bilgisayarları', 'güçlü oyun bilgisayarları', 1, '2022-04-19 21:09:46', 1, 2, 'teknolojik-oyun-bilgisayarlari-626d426bd9ae0.webp', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_ozellikler`
--

CREATE TABLE `urun_ozellikler` (
  `id` int(11) NOT NULL,
  `ozellikurun` varchar(200) NOT NULL,
  `ozellikbaslik` varchar(300) NOT NULL,
  `ozellikicerik` text NOT NULL,
  `ozellikekleyen` int(11) NOT NULL,
  `ozelliktarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `ozellikdurum` tinyint(1) NOT NULL DEFAULT 1,
  `siralama` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urun_ozellikler`
--

INSERT INTO `urun_ozellikler` (`id`, `ozellikurun`, `ozellikbaslik`, `ozellikicerik`, `ozellikekleyen`, `ozelliktarih`, `ozellikdurum`, `siralama`) VALUES
(1, 'YAVUZB2B-001', 'İşlemci', 'İntel i9', 1, '2022-03-06 13:43:31', 1, 1),
(2, 'YAVUZB2B-001', 'Ram', '8 GB', 1, '2022-03-06 13:43:31', 1, 2),
(3, 'YAVUZB2B-001', 'Ekran Kartı', 'GTX 3060', 1, '2022-03-06 13:43:31', 1, 3),
(4, 'YAVUZB2B-001', 'Kasa', 'Cooler Master', 1, '2022-03-06 13:43:31', 1, 4),
(5, 'YAVUZB2B-001', 'Ekran Çözünürlüğü', '1920x1080', 1, '2022-03-06 13:43:31', 1, 0),
(7, 'YAVUZB2B-0011214', 'Ram', '32GB DDR4 3200MHZ', 1, '2022-04-30 15:23:32', 1, 1),
(8, 'YAVUZB2B-0011214', 'Harddisk', '512GB M2 SSD NVME (3600/3200)', 1, '2022-04-30 15:23:54', 1, 2),
(9, 'YAVUZB2B-0011214', 'Ekran', '1920x1080 FULL HD 4K', 1, '2022-04-30 15:24:24', 1, 0),
(11, '0001', 'Gürültü Engelleyici', 'Var', 1, '2022-05-28 15:54:55', 1, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_resimler`
--

CREATE TABLE `urun_resimler` (
  `id` int(11) NOT NULL,
  `resimurun` varchar(200) NOT NULL,
  `resimdosya` varchar(300) NOT NULL,
  `resimtarih` timestamp NOT NULL DEFAULT current_timestamp(),
  `resimekleyen` int(11) NOT NULL,
  `resimdurum` tinyint(1) NOT NULL DEFAULT 1,
  `kapak` tinyint(1) NOT NULL DEFAULT 2,
  `siralama` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urun_resimler`
--

INSERT INTO `urun_resimler` (`id`, `resimurun`, `resimdosya`, `resimtarih`, `resimekleyen`, `resimdurum`, `kapak`, `siralama`) VALUES
(1, 'YAVUZB2B-001', 'lenovo.webp', '2022-03-08 15:20:33', 1, 1, 2, 1),
(2, 'YAVUZB2B-001', 'lenovo2.webp', '2022-03-08 15:21:33', 1, 1, 2, 1),
(3, 'YAVUZB2B-002', 'lenovo.webp', '2022-03-08 15:20:33', 1, 1, 2, 1),
(4, 'YAVUZB2B-002', 'lenovo2.webp', '2022-03-08 15:21:33', 1, 1, 2, 1),
(5, '0001', 'nker-soundcore-life-q20-kablosuz-kulaklik-625f319636e4d.webp', '2022-03-08 15:21:33', 1, 1, 2, 1),
(6, 'YAVUZB2B-0011214', '-626d4c874cc0d.webp', '2022-04-30 14:49:44', 1, 1, 2, 1),
(8, '0001', 'nker-soundcore-life-q20-kablosuz-kulaklik-625f319636e4d.webp', '2022-03-08 15:21:33', 1, 1, 2, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urun_yorumlar`
--

CREATE TABLE `urun_yorumlar` (
  `id` int(11) NOT NULL,
  `yorumbayi` varchar(200) NOT NULL,
  `yorumurun` varchar(200) NOT NULL,
  `yorumisim` varchar(300) NOT NULL,
  `yorumicerik` text NOT NULL,
  `yorumdurum` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = aktif 2 = pasif',
  `yorumip` varchar(300) NOT NULL,
  `yorumtarih` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `urun_yorumlar`
--

INSERT INTO `urun_yorumlar` (`id`, `yorumbayi`, `yorumurun`, `yorumisim`, `yorumicerik`, `yorumdurum`, `yorumip`, `yorumtarih`) VALUES
(1, '62151849239d6', 'YAVUZB2B-001', 'Yavuz Av BAyisi12', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.', 1, '127.0.0.1', '2022-03-06 14:14:01'),
(2, '62151849239d6', 'YAVUZB2B-001', 'Yavuz Av BAyisi12', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.', 1, '127.0.0.1', '2022-03-06 14:14:01'),
(4, '62151849239d6', 'YAVUZB2B-001', 'Yavuz Av BAyisi12', 'Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır. Lorem Ipsum, dizgi ve baskı endüstrisinde kullanılan mıgır metinlerdir. Lorem Ipsum, adı bilinmeyen bir matbaacının bir hurufat numune kitabı oluşturmak üzere bir yazı galerisini alarak karıştırdığı 1500\'lerden beri endüstri standardı sahte metinler olarak kullanılmıştır.', 2, '::1', '2022-03-06 14:27:22');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Tablo için indeksler `adminlog`
--
ALTER TABLE `adminlog`
  ADD PRIMARY KEY (`alogid`);

--
-- Tablo için indeksler `ayarlar`
--
ALTER TABLE `ayarlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `bankalar`
--
ALTER TABLE `bankalar`
  ADD PRIMARY KEY (`bankaid`);

--
-- Tablo için indeksler `bayiler`
--
ALTER TABLE `bayiler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `bayilog`
--
ALTER TABLE `bayilog`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `bayi_adresler`
--
ALTER TABLE `bayi_adresler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `durumkodlari`
--
ALTER TABLE `durumkodlari`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `havalebildirim`
--
ALTER TABLE `havalebildirim`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `mesajlar`
--
ALTER TABLE `mesajlar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sayfalar`
--
ALTER TABLE `sayfalar`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `sepet`
--
ALTER TABLE `sepet`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `siparis_urunler`
--
ALTER TABLE `siparis_urunler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun_kategoriler`
--
ALTER TABLE `urun_kategoriler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun_ozellikler`
--
ALTER TABLE `urun_ozellikler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun_resimler`
--
ALTER TABLE `urun_resimler`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `urun_yorumlar`
--
ALTER TABLE `urun_yorumlar`
  ADD PRIMARY KEY (`id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `adminlog`
--
ALTER TABLE `adminlog`
  MODIFY `alogid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Tablo için AUTO_INCREMENT değeri `ayarlar`
--
ALTER TABLE `ayarlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Tablo için AUTO_INCREMENT değeri `bankalar`
--
ALTER TABLE `bankalar`
  MODIFY `bankaid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `bayiler`
--
ALTER TABLE `bayiler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `bayilog`
--
ALTER TABLE `bayilog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Tablo için AUTO_INCREMENT değeri `bayi_adresler`
--
ALTER TABLE `bayi_adresler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `durumkodlari`
--
ALTER TABLE `durumkodlari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `havalebildirim`
--
ALTER TABLE `havalebildirim`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `mesajlar`
--
ALTER TABLE `mesajlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `sayfalar`
--
ALTER TABLE `sayfalar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `sepet`
--
ALTER TABLE `sepet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `siparis_urunler`
--
ALTER TABLE `siparis_urunler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Tablo için AUTO_INCREMENT değeri `urun_kategoriler`
--
ALTER TABLE `urun_kategoriler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Tablo için AUTO_INCREMENT değeri `urun_ozellikler`
--
ALTER TABLE `urun_ozellikler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `urun_resimler`
--
ALTER TABLE `urun_resimler`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `urun_yorumlar`
--
ALTER TABLE `urun_yorumlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

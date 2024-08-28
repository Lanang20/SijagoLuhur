-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2024 at 09:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sijago_luhur`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add tempat', 6, 'add_tempat'),
(22, 'Can change tempat', 6, 'change_tempat'),
(23, 'Can delete tempat', 6, 'delete_tempat'),
(24, 'Can view tempat', 6, 'view_tempat'),
(25, 'Can add role', 7, 'add_role'),
(26, 'Can change role', 7, 'change_role'),
(27, 'Can delete role', 7, 'delete_role'),
(28, 'Can view role', 7, 'view_role'),
(29, 'Can add fasilitas', 8, 'add_fasilitas'),
(30, 'Can change fasilitas', 8, 'change_fasilitas'),
(31, 'Can delete fasilitas', 8, 'delete_fasilitas'),
(32, 'Can view fasilitas', 8, 'view_fasilitas'),
(33, 'Can add event', 9, 'add_event'),
(34, 'Can change event', 9, 'change_event'),
(35, 'Can delete event', 9, 'delete_event'),
(36, 'Can view event', 9, 'view_event'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2024-07-16 07:35:12.357084', '1', 'GOR Mahesa Jenar', 1, '[{\"added\": {}}]', 6, 1),
(2, '2024-07-16 07:35:27.984473', '2', 'GOR Goentoer Darjono', 1, '[{\"added\": {}}]', 6, 1),
(3, '2024-07-16 07:35:42.445837', '1', 'Administrator GOR Mahesa Jenar', 1, '[{\"added\": {}}]', 7, 1),
(4, '2024-07-16 07:35:49.779185', '2', 'Administrator GOR Goentoer Darjono', 1, '[{\"added\": {}}]', 7, 1),
(5, '2024-07-16 07:36:24.283914', '2', 'AdminGorMahesa', 1, '[{\"added\": {}}]', 10, 1),
(6, '2024-07-16 07:37:03.804888', '2', 'AdminGorMahesa', 2, '[]', 10, 1),
(7, '2024-07-16 07:38:14.330813', '2', 'AdminGorMahesa', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 10, 1),
(8, '2024-07-16 07:45:11.396032', '2', 'AdminGorMahesa', 2, '[{\"changed\": {\"fields\": [\"User permissions\"]}}]', 10, 1),
(9, '2024-07-16 07:51:39.001611', '1', 'Kegiatan Olahraga', 1, '[{\"added\": {}}]', 8, 2),
(10, '2024-07-16 07:53:03.755875', '1', 'Konser', 1, '[{\"added\": {}}]', 9, 2),
(11, '2024-07-16 08:54:10.458290', '1', 'Kegiatan Olahraga', 2, '[]', 8, 1),
(12, '2024-07-16 08:54:39.864059', '1', 'Kegiatan Olahraga', 2, '[{\"changed\": {\"fields\": [\"Rincian\", \"Keterangan\"]}}]', 8, 1),
(13, '2024-07-17 01:42:06.174220', '3', 'Buper Munjuluhur', 1, '[{\"added\": {}}]', 6, 1),
(14, '2024-07-17 01:42:37.294186', '3', 'Administrator Buper Munjuluhur', 1, '[{\"added\": {}}]', 7, 1),
(15, '2024-07-17 01:48:38.358824', '3', 'AdminBuperMunjuluhur', 1, '[{\"added\": {}}]', 10, 1),
(16, '2024-07-17 01:50:16.470596', '2', 'Pesta Siaga', 1, '[{\"added\": {}}]', 9, 3),
(17, '2024-07-22 03:40:49.081075', '5', 'GOR', 1, '[{\"added\": {}}]', 6, 1),
(18, '2024-07-22 03:41:32.292947', '4', 'Administrator GOR', 1, '[{\"added\": {}}]', 7, 1),
(19, '2024-07-22 04:19:18.103207', '4', 'Administrator GOR', 3, '', 7, 1),
(20, '2024-07-22 04:19:25.353913', '5', 'GOR', 3, '', 6, 1),
(21, '2024-07-22 07:24:25.051594', '4', 'GOR Sasana Krida Perwira', 2, '[{\"changed\": {\"fields\": [\"Foto\"]}}]', 6, 1),
(22, '2024-07-22 07:37:10.984464', '2', 'Pesta Siaga', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 9, 1),
(23, '2024-07-22 07:37:16.021612', '1', 'Konser', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 9, 1),
(24, '2024-07-22 07:37:45.836269', '2', 'Pesta Siaga', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 9, 1),
(25, '2024-07-22 07:38:24.027169', '2', 'Pesta Siaga', 2, '[]', 9, 1),
(26, '2024-07-22 07:41:45.461731', '2', 'Pesta Siaga', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 9, 1),
(27, '2024-07-22 07:43:55.501445', '3', 'Buper Munjuluhur', 2, '[{\"changed\": {\"fields\": [\"Foto\"]}}]', 6, 1),
(28, '2024-07-22 07:44:06.250124', '2', 'GOR Goentoer Darjono', 2, '[{\"changed\": {\"fields\": [\"Foto\"]}}]', 6, 1),
(29, '2024-07-22 07:44:15.999387', '1', 'GOR Mahesa Jenar', 2, '[{\"changed\": {\"fields\": [\"Foto\"]}}]', 6, 1),
(30, '2024-07-31 04:52:27.803586', '4', 'test', 1, '[{\"added\": {}}]', 10, 1),
(31, '2024-07-31 04:52:45.654357', '4', 'test', 3, '', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(9, 'jadwal', 'event'),
(8, 'jadwal', 'fasilitas'),
(7, 'jadwal', 'role'),
(6, 'jadwal', 'tempat'),
(10, 'jadwal', 'user'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'jadwal', '0001_initial', '2024-07-16 07:33:38.866996'),
(2, 'contenttypes', '0001_initial', '2024-07-16 07:33:38.903002'),
(3, 'admin', '0001_initial', '2024-07-16 07:33:38.992869'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-07-16 07:33:38.997869'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-07-16 07:33:39.006864'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-07-16 07:33:39.071092'),
(7, 'auth', '0001_initial', '2024-07-16 07:33:39.237467'),
(8, 'auth', '0002_alter_permission_name_max_length', '2024-07-16 07:33:39.286210'),
(9, 'auth', '0003_alter_user_email_max_length', '2024-07-16 07:33:39.295207'),
(10, 'auth', '0004_alter_user_username_opts', '2024-07-16 07:33:39.306209'),
(11, 'auth', '0005_alter_user_last_login_null', '2024-07-16 07:33:39.312203'),
(12, 'auth', '0006_require_contenttypes_0002', '2024-07-16 07:33:39.314208'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2024-07-16 07:33:39.321208'),
(14, 'auth', '0008_alter_user_username_max_length', '2024-07-16 07:33:39.327208'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2024-07-16 07:33:39.333209'),
(16, 'auth', '0010_alter_group_name_max_length', '2024-07-16 07:33:39.349208'),
(17, 'auth', '0011_update_proxy_permissions', '2024-07-16 07:33:39.361207'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2024-07-16 07:33:39.366632'),
(19, 'jadwal', '0002_alter_user_options_alter_user_managers_and_more', '2024-07-16 07:33:40.119240'),
(20, 'sessions', '0001_initial', '2024-07-16 07:33:40.162540'),
(21, 'jadwal', '0003_event_status_tempat_foto', '2024-07-22 07:13:11.352803'),
(22, 'jadwal', '0004_alter_event_status', '2024-07-29 03:05:54.038758');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('98hs3e4oecy5altxaz9p08no2fh2dr8u', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYzk8:ghw4Xj8n9abRfkbqCWsFkR6HCPFU-1w_LaC7EyaONoE', '2024-08-14 03:11:12.777356'),
('c7frc56a2lfqwqvc1owwyzxax3m5iij7', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sasM7:yzk_UUHZnL8oNOa9W823th1ssb_EJ3EM_hnHvodKs8k', '2024-08-19 07:42:11.929864'),
('d49lwz7gtfip24fwgreaoo3aziwiesx8', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYiIL:S8z5uW5SF9fzpxbmdmCjOlz6txJ2HoKn3skn8_8fews', '2024-08-13 08:33:21.112823'),
('f88bb0lla34tpu3683pjqxw0ssmtkf9b', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZOrL:FGKwPewbVs2EYESCkCvmdkNV404PgfoxaUrMrRDZBPE', '2024-08-15 06:00:19.446488'),
('iey6j84ldlk3i65zf2dwtg1z51luhjau', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sdfiz:EALWQgvRHcIw8srduvNaky1mLZpJEszUDN-iiy9Oey8', '2024-08-27 00:49:21.527422'),
('jnoqie3ixwqtvrhd4qtonc2mnnnib7rr', '.eJxVjDsOwjAQBe_iGln-fyjpOYO19q5xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWlCdmaanX63DOVBfQd4h36beZn7ukyZ7wo_6ODXGel5Ody_gwajfevog7CBqoCQTSVrJIViitTWO5BUUAntDEayqloZslOgEW0uOvoIAOz9Ad2ROAk:1sYzmh:Q7d1ZM3TWk7j-TtVAxfbANd2tv1eEYsvk_vB-_V2uC8', '2024-08-14 03:13:51.994724'),
('k4a9zn5zyy8l4r38ddss1i2f3rlr1558', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZNb6:md7Ix-LBVUpx3Cki91QwlSGjX3bjam775cAghoarPqc', '2024-08-15 04:39:28.123862'),
('ktq7it6mnm51j9punbytskqs1i3hjpms', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZKp8:xVc83Wu4HVQ17QUk9vQJo6kPTYARS00eMoBQdf9vW1s', '2024-08-15 01:41:46.116995'),
('lbi5y2g1h7bpzph0oinva8vxbj7no24z', '.eJxVjDsOwjAQBe_iGln-fyjpOYO19q5xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWlCdmaanX63DOVBfQd4h36beZn7ukyZ7wo_6ODXGel5Ody_gwajfevog7CBqoCQTSVrJIViitTWO5BUUAntDEayqloZslOgEW0uOvoIAOz9Ad2ROAk:1sYgfB:o8bAY9DEE3pETcpVmCusmaVAodpT9hKeXin96ERTPng', '2024-08-13 06:48:49.951950'),
('lcn9rgwb1mseghbo6vf8m92e0yqmnha5', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYeky:xS4TdfgXm1emdEIRPjk5kSljl6oNjg2Bpus5klXqQ0w', '2024-08-13 04:46:40.494838'),
('mle6prjowcw30c6khdz809kuu52y5kfa', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYxW9:BauAwOSc0qwyIknO74XWPMDgTHWqiLErZSY0O3cWKkE', '2024-08-14 00:48:37.919922'),
('nj9rofeie1z2b4x1szfdhjtt93301dcr', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sarJb:SivOTpDb-PiFgiumoK3RS30BOsrRw60wDDkq9E4ibR8', '2024-08-19 06:35:31.220763'),
('nw4ny1am3gte0qcrmxy1c51nyth1prcj', '.eJxVjDsOwjAQBe_iGln-fyjpOYO19q5xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWlCdmaanX63DOVBfQd4h36beZn7ukyZ7wo_6ODXGel5Ody_gwajfevog7CBqoCQTSVrJIViitTWO5BUUAntDEayqloZslOgEW0uOvoIAOz9Ad2ROAk:1sYijZ:-ZL35CS0Bdbzh1zTdZa6XWOsjTwKaEGmq9TgJBeo-84', '2024-08-13 09:01:29.345573'),
('okilot7kb83qed2c1j6v9vt9xjrbflpy', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYem3:iSA_T8zAFdNYVrmGB5GrjYl_HI3cEyPtSPmXyexte40', '2024-08-13 04:47:47.660627'),
('ox6eafk7yrh25k1am3tac7eweze9mdcx', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYeoZ:TOakF_n-IcclKvGnMtaz2fnSIhE6ZCJe1oRY4A2xJGQ', '2024-08-13 04:50:23.104725'),
('pesp77sxlirpgm50xd0otaxxw5o0383o', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sVnbK:PhDYrtlWp2T_uB8hi9jaOLFcEp9o-Go3A0Wo8gTc9qA', '2024-08-05 07:36:54.605706'),
('pj4f3itrq3k4wrohc16trj3lsd53vmgg', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sdJZ0:wTf2tEpfUbka2jgivm9g29HdpbYZjrCZUm_259aWc10', '2024-08-26 01:09:34.529647'),
('qinbsn4o7wbexdh7jtndv331mb0z38gf', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZKY4:fJpuRwldZleKGdU-pxN3DJBWMPks0EQW3LM7roPwpcU', '2024-08-15 01:24:08.386566'),
('rago4ducurcd2dv3s101ce6rjunob9s3', '.eJxVjDsOwjAQBe_iGln-fyjpOYO19q5xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWlCdmaanX63DOVBfQd4h36beZn7ukyZ7wo_6ODXGel5Ody_gwajfevog7CBqoCQTSVrJIViitTWO5BUUAntDEayqloZslOgEW0uOvoIAOz9Ad2ROAk:1sYe1Z:qLLCgFF-VVmGq047P3DBIi-gkNRYfA5ylZhJcBN9j0Y', '2024-08-13 03:59:45.586155'),
('rqgvnurheq4mibx6zy48tgmv3dgwf1bu', '.eJxVjDsOwjAQBe_iGln-fyjpOYO19q5xADlSnFSIu0OkFNC-mXkvlmBbW9oGLWlCdmaanX63DOVBfQd4h36beZn7ukyZ7wo_6ODXGel5Ody_gwajfevog7CBqoCQTSVrJIViitTWO5BUUAntDEayqloZslOgEW0uOvoIAOz9Ad2ROAk:1sYeVu:rKuug0ZbB_5bym3wtMa1p8FT9AM4aemjJ485UAJeNTw', '2024-08-13 04:31:06.616619'),
('sh4u3uuijo48jix31y69z9iw315l3onp', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZ8ub:1mRqsbXusEXCgiYJ5t-MCfP6HtpiPPL0V5Q2HKfzJi0', '2024-08-14 12:58:37.584464'),
('sk0kjs9u6sch1s76tdctvpvb3nmbtx1m', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZPQZ:dQYtUkNNYebu_5LCgSSx2y2OmMO38ZsagQgFDZ0JU6A', '2024-08-15 06:36:43.451019'),
('thu9df8tdmue1uzqv0brmjtufr4zchnr', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZMoh:7WHAVALzo9ra_lfrpFb51bltxueRaOtD4V82b9V34b8', '2024-08-15 03:49:27.642843'),
('ue90nxgi0z6arkrqdcihyew2w6nq6lw1', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZKtN:8fQY9cfxwFUitbT672gLu2QiEV4rGFZA51-q2RDD9DA', '2024-08-15 01:46:09.503383'),
('upky431u9k0kach05hk9pca06gn8k9xt', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sbrhD:hF1WLe2SHfhlhEpBrp0OGYEwJN_zhYU1TSiTLNvC-x0', '2024-08-22 01:12:03.543688'),
('uuvwmlkqq77go643alk4898hz50omwnj', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sarLc:AcN5oFhsaqhu2BoFaaTFm4Q0FiG_CIFs_yGMQ-s9xMU', '2024-08-19 06:37:36.408351'),
('wkikq4mn2ufw6ee9ifg4l8vh89shyxse', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sYewd:lg5hq4G3cyckRjXhIOzuhNHEW_6yuWksMbNHvVvzQC4', '2024-08-13 04:58:43.978665'),
('xfd4bauzyys4ixmb39mqpgawux7yi75s', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZ09k:6ZZsXAMEgdNIfktv7m6cR9_tUjRJ3_374NWtq91Wm8M', '2024-08-14 03:37:40.858336'),
('ykyl9go1n5voywaog1munlmdxd19tcki', '.eJxVjEEOwiAQRe_C2hCGKS24dO8ZCDCDVA0kpV0Z765NutDtf-_9l_BhW4vfOi9-JnEWIE6_WwzpwXUHdA_11mRqdV3mKHdFHrTLayN-Xg7376CEXr71mJ2acEhoRo4uIJALlthoAkzMOiWwGlQGxxAJjXaZMU8ushpitizeH-gKOGg:1sZ9Cs:xNkAhPnitw1alL_oGEYlVQByNhWtRFRoVdiwbfDFdKA', '2024-08-14 13:17:30.055896');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_event`
--

CREATE TABLE `jadwal_event` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal_mulai` datetime(6) NOT NULL,
  `tanggal_selesai` datetime(6) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `id_tempat_id` bigint(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_event`
--

INSERT INTO `jadwal_event` (`id`, `nama`, `tanggal_mulai`, `tanggal_selesai`, `deskripsi`, `id_tempat_id`, `status`) VALUES
(1, 'Konser', '2024-09-05 06:00:00.000000', '2024-09-06 06:00:00.000000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 'disetujui'),
(11, 'Pengajian', '2024-08-05 20:15:00.000000', '2024-08-06 06:15:00.000000', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 3, 'disetujui'),
(12, 'Perpisahan', '2024-08-06 05:15:00.000000', '2024-08-07 06:20:00.000000', 'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 4, 'disetujui'),
(14, 'Pesta Siaga', '2024-08-25 06:35:00.000000', '2024-08-28 18:25:00.000000', 'Kegiatan Kemah Tahunan', 3, 'disetujui');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_fasilitas`
--

CREATE TABLE `jadwal_fasilitas` (
  `id` bigint(20) NOT NULL,
  `objek_retribusi` varchar(255) NOT NULL,
  `rincian` longtext NOT NULL,
  `keterangan` longtext NOT NULL,
  `id_tempat_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_fasilitas`
--

INSERT INTO `jadwal_fasilitas` (`id`, `objek_retribusi`, `rincian`, `keterangan`, `id_tempat_id`) VALUES
(1, 'Kegiatan Olahraga', '1. Pembinaan (0,00) (Dengan Surat izin Bupati Khusus Tingkat/Wilayah dalam Kabupaten Purbalingga)\r\n2. Non Pembinaan. Per hari:\r\n    a. Tingkat Nasional (750.000,00)\r\n    b. Tingkat Provinsi (500.000,00)\r\n    c. Tingkat Kabupaten (400.000,00)\r\n    d. Tingkat Kecamatan (300.000,00)\r\n3. Kegiatan olah raga rutin (bulu tangkis, tenis meja, sepak takraw dan sasana tinju). Per lapangan, per klub, Per bulan:\r\n    – Pukul 06.30 s.d. 09.00 WIB (40.000,00)\r\n    – Pukul 09.00 s.d. 12.00 WIB (40.000,00)\r\n    – Pukul 12.00 s.d. 15.00 WIB (50.000,00)\r\n    – Pukul 15.00 s.d. 18.00 WIB (50.000,00)\r\n    – Pukul 18.30 s.d. 21.30 WIB (60.000,00)\r\n4. Kegiatan olah raga non rutin (bulu tangkis, tenis meja). Per lapangan, per klub:\r\n    – Pukul 06.30 s.d. 09.00 WIB (10.000,00)\r\n    – Pukul 09.00 s.d. 12.00 WIB (10.000,00)\r\n    – Pukul 12.00 s.d. 15.00 WIB (10.000,00)\r\n    – Pukul 15.00 s.d. 18.00 WIB (10.000,00)\r\n    – Pukul 18.30 s.d. 21.30 WIB (10.000,00)', '-', 1),
(7, 'Kegiatan Non Olah Raga', 'Per Hari:\r\n1. Pertunjukan musik komersial (2.000.000,00)\r\n2. Pertunjukan musik non komersial (1.250.000,00)\r\n3. Rapat-rapat Umum (750.000,00)\r\n4. Resepsi (1.000.000,00)', '-', 1),
(8, 'Panggung Hiburan', '350.000,00 per hari.', '-', 1),
(9, 'Masuk Lokasi', 'Per orang termasuk asuransi: (3.000,00)', 'TARIF RETRIBUSI TEMPAT REKREASI/TARIF MASUK', 3),
(10, 'Penggunaan Lokasi', 'Per Hari:\r\n- Untuk Kerperluan Bisnis (750.000,00)\r\n- Untuk Kerperluan Non Bisnis (400.000,00)', 'TARIF RETRIBUSI FASILITAS TEMPAT REKREASI', 3),
(11, 'Penggunaan Aula Besar', 'Per Hari:\r\n- Untuk Keperluan Bisnis (750.000,00)\r\n- Untuk Keperluan Non Bisnis (300.000,00)', 'TARIF RETRIBUSI FASILITAS TEMPAT REKREASI', 3),
(12, 'Penggunaan Aula Kecil', 'Per Hari:\r\n- Untuk Keperluan Bisnis (200.000,00)\r\n- Untuk Keperluan Non Bisnis (100.000,00)', 'TARIF RETRIBUSI FASILITAS TEMPAT REKREASI', 3),
(13, 'Kegiatan Olahraga', '1. Pembinaan (0,00) (Dengan Surat izin Bupati Khusus Tingkat/Wilayah dalam Kabupaten Purbalingga)\r\n2. Non Pembinaan. Per hari:\r\n    a. Tingkat Nasional (1.500.000,00)\r\n    b. Tingkat Provinsi (1.000.000,00)\r\n    c. Tingkat Kabupaten (750.000,00)\r\n    d. Tingkat Kecamatan (500.000,00)', 'STADION GOENTOER DARJONO', 2),
(14, 'Kegiatan Non Olahraga (Upacara yang berkaitan dengan olahraga)', 'Dengan Surat izin Bupati Khusus Tingkat/Wilayah dalam Kabupaten Purbalingga. Per hari:\r\n2.000.000,00', 'STADION GOENTOER DARJONO', 2),
(15, 'Kegiatan Olahraga Pembinaan', 'Tarif (0,00), dengan Surat izin Bupati Khusus Tingkat/Wilayah dalam Kabupaten Purbalingga.', 'TEMPAT PARKIR GOR', 2),
(16, 'Kegiatan Non Olahraga di Parkir Barat/ Timur Selatan/ Timur Utara', '1. Kegiatan non Olahraga. Per hari:\r\n     - Barat (750.000,00)\r\n     - Timur Selatan (1.250.000,00)\r\n     - Timur Utara (1.000.000,00)\r\n2. Kegiatan Komersial/ Pertunjukan. Per hari: (2.000.000,00)\r\n3. Kegiatan Pasar Murah dan Sejenisnya. Per hari: (2.500.000,00)', 'TEMPAT PARKIR GOR', 2),
(17, 'Sewa Mess', 'Per Bed Per Hari: (50.000,00)', 'TEMPAT PARKIR GOR', 2);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_role`
--

CREATE TABLE `jadwal_role` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `id_tempat_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_role`
--

INSERT INTO `jadwal_role` (`id`, `nama`, `id_tempat_id`) VALUES
(1, 'Administrator GOR Mahesa Jenar', 1),
(2, 'Administrator GOR Goentoer Darjono', 2),
(3, 'Administrator Buper Munjuluhur', 3),
(7, 'Administrator GOR Sasana Krida Perwira', 4);

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_tempat`
--

CREATE TABLE `jadwal_tempat` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `deskripsi` longtext NOT NULL,
  `foto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_tempat`
--

INSERT INTO `jadwal_tempat` (`id`, `nama`, `deskripsi`, `foto`) VALUES
(1, 'GOR Mahesa Jenar', 'Nama Fasilitas	: Gedung Olahraga Mahesa Jenar\r\nAlamat		: Jl. Wirasaba, Purbalingga Kulon, Kec. Purbalingga, Kab. Purbalingga\r\nPeruntukan	: –\r\nKapasitas	: –\r\nKeterangan	: –', 'foto_tempat/GorMahesa.jpg'),
(2, 'GOR Goentoer Darjono', 'Nama Fasilitas	: Gedung Olahraga Goentoer Darjono\r\nAlamat		: Purbalingga Kidul, Kec. Purbalingga, Kabupaten Purbalingga\r\nPeruntukan	: –\r\nKapasitas	: –\r\nKeterangan	: –', 'foto_tempat/GorGoentoer.jpg'),
(3, 'Buper Munjuluhur', 'Nama Fasilitas	: BUMI PERKEMAHAN MUJULUHUR\r\nAlamat		: Desa Karangbanjar, Kecamatan Bojongsari, Kabupaten Purbalingga\r\nPeruntukan	: –\r\nKapasitas	: –\r\nKeterangan	: –', 'foto_tempat/BuperMunjuluhur.jpg'),
(4, 'GOR Sasana Krida Perwira', 'Nama Fasilitas	: Gedung Olahraga Sasana Krida Perwira\r\nAlamat		: Area Sawah, Purbalingga Kidul, Kec. Purbalingga, Kab. Purbalingga.\r\nPeruntukan	: –\r\nKapasitas	: –\r\nKeterangan	: –', 'foto_tempat/GorSasana.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_user`
--

CREATE TABLE `jadwal_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(128) NOT NULL,
  `id_role_id` bigint(20) DEFAULT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `last_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_user`
--

INSERT INTO `jadwal_user` (`id`, `username`, `password`, `id_role_id`, `date_joined`, `email`, `first_name`, `is_active`, `is_staff`, `is_superuser`, `last_login`, `last_name`) VALUES
(1, 'superadmin', 'pbkdf2_sha256$720000$ckpxpk4zFs5Za4C4EoepHl$0RfhMWqY9LvTEXLlcVdx+PgqjVcq8PU0mQUOcUjn8Y4=', NULL, '2024-07-16 07:34:08.516729', '', '', 1, 1, 1, '2024-08-13 06:54:01.453508', ''),
(2, 'AdminGorMahesa', 'pbkdf2_sha256$720000$SMUTsyksWX7m2AJdnZH2Z8$iOmZyToObuOk/TooZMYFAY8kiRWdF7nFO4MY8jSnjKc=', 1, '2024-07-16 07:36:23.000000', '', '', 1, 1, 0, '2024-08-13 06:30:24.048068', ''),
(3, 'AdminBuperMunjuluhur', 'pbkdf2_sha256$720000$Sf5wBqu0lUUy682nVvdD5U$ZkhvYmJKrjNlULwypUVPvxjXQqJK0WTvdDJJedHteCc=', 3, '2024-07-17 01:48:37.724848', '', '', 1, 1, 0, '2024-08-02 02:00:20.026625', '');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_user_groups`
--

CREATE TABLE `jadwal_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_user_user_permissions`
--

CREATE TABLE `jadwal_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal_user_user_permissions`
--

INSERT INTO `jadwal_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(6, 2, 29),
(7, 2, 30),
(8, 2, 31),
(1, 2, 32),
(2, 2, 33),
(3, 2, 34),
(4, 2, 35),
(5, 2, 36),
(14, 3, 29),
(15, 3, 30),
(16, 3, 31),
(9, 3, 32),
(10, 3, 33),
(11, 3, 34),
(12, 3, 35),
(13, 3, 36);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_jadwal_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `jadwal_event`
--
ALTER TABLE `jadwal_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_event_id_tempat_id_ea93c42a_fk_jadwal_tempat_id` (`id_tempat_id`);

--
-- Indexes for table `jadwal_fasilitas`
--
ALTER TABLE `jadwal_fasilitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_fasilitas_id_tempat_id_715d07e7_fk_jadwal_tempat_id` (`id_tempat_id`);

--
-- Indexes for table `jadwal_role`
--
ALTER TABLE `jadwal_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jadwal_role_id_tempat_id_8cae459f_fk_jadwal_tempat_id` (`id_tempat_id`);

--
-- Indexes for table `jadwal_tempat`
--
ALTER TABLE `jadwal_tempat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jadwal_user`
--
ALTER TABLE `jadwal_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jadwal_user_username_68ec8054_uniq` (`username`),
  ADD KEY `jadwal_user_id_role_id_2a272c9c_fk_jadwal_role_id` (`id_role_id`);

--
-- Indexes for table `jadwal_user_groups`
--
ALTER TABLE `jadwal_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jadwal_user_groups_user_id_group_id_dcb2028c_uniq` (`user_id`,`group_id`),
  ADD KEY `jadwal_user_groups_group_id_e68e23bf_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `jadwal_user_user_permissions`
--
ALTER TABLE `jadwal_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `jadwal_user_user_permissions_user_id_permission_id_f023beca_uniq` (`user_id`,`permission_id`),
  ADD KEY `jadwal_user_user_per_permission_id_ec2b8a97_fk_auth_perm` (`permission_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jadwal_event`
--
ALTER TABLE `jadwal_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `jadwal_fasilitas`
--
ALTER TABLE `jadwal_fasilitas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `jadwal_role`
--
ALTER TABLE `jadwal_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jadwal_tempat`
--
ALTER TABLE `jadwal_tempat`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `jadwal_user`
--
ALTER TABLE `jadwal_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jadwal_user_groups`
--
ALTER TABLE `jadwal_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jadwal_user_user_permissions`
--
ALTER TABLE `jadwal_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_jadwal_user_id` FOREIGN KEY (`user_id`) REFERENCES `jadwal_user` (`id`);

--
-- Constraints for table `jadwal_event`
--
ALTER TABLE `jadwal_event`
  ADD CONSTRAINT `jadwal_event_id_tempat_id_ea93c42a_fk_jadwal_tempat_id` FOREIGN KEY (`id_tempat_id`) REFERENCES `jadwal_tempat` (`id`);

--
-- Constraints for table `jadwal_fasilitas`
--
ALTER TABLE `jadwal_fasilitas`
  ADD CONSTRAINT `jadwal_fasilitas_id_tempat_id_715d07e7_fk_jadwal_tempat_id` FOREIGN KEY (`id_tempat_id`) REFERENCES `jadwal_tempat` (`id`);

--
-- Constraints for table `jadwal_role`
--
ALTER TABLE `jadwal_role`
  ADD CONSTRAINT `jadwal_role_id_tempat_id_8cae459f_fk_jadwal_tempat_id` FOREIGN KEY (`id_tempat_id`) REFERENCES `jadwal_tempat` (`id`);

--
-- Constraints for table `jadwal_user`
--
ALTER TABLE `jadwal_user`
  ADD CONSTRAINT `jadwal_user_id_role_id_2a272c9c_fk_jadwal_role_id` FOREIGN KEY (`id_role_id`) REFERENCES `jadwal_role` (`id`);

--
-- Constraints for table `jadwal_user_groups`
--
ALTER TABLE `jadwal_user_groups`
  ADD CONSTRAINT `jadwal_user_groups_group_id_e68e23bf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `jadwal_user_groups_user_id_730f3d60_fk_jadwal_user_id` FOREIGN KEY (`user_id`) REFERENCES `jadwal_user` (`id`);

--
-- Constraints for table `jadwal_user_user_permissions`
--
ALTER TABLE `jadwal_user_user_permissions`
  ADD CONSTRAINT `jadwal_user_user_per_permission_id_ec2b8a97_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `jadwal_user_user_permissions_user_id_e83378c7_fk_jadwal_user_id` FOREIGN KEY (`user_id`) REFERENCES `jadwal_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

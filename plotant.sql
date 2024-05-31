-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2024 at 02:14 PM
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
-- Database: `plotant`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_subscription`
--

CREATE TABLE `accounts_subscription` (
  `id` bigint(20) NOT NULL,
  `plan_id` int(11) NOT NULL,
  `plan_name` varchar(255) NOT NULL,
  `project_create` int(11) NOT NULL,
  `add_files` int(11) NOT NULL,
  `file_size` int(11) NOT NULL,
  `multifields` varchar(255) NOT NULL,
  `chart_plots` varchar(255) NOT NULL,
  `color_selection` tinyint(1) NOT NULL,
  `custom_theme` tinyint(1) NOT NULL,
  `graph_limit` int(11) NOT NULL,
  `logs` tinyint(1) NOT NULL,
  `chart_download` varchar(255) NOT NULL,
  `shares` int(11) NOT NULL,
  `pdf_download` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_subscription`
--

INSERT INTO `accounts_subscription` (`id`, `plan_id`, `plan_name`, `project_create`, `add_files`, `file_size`, `multifields`, `chart_plots`, `color_selection`, `custom_theme`, `graph_limit`, `logs`, `chart_download`, `shares`, `pdf_download`) VALUES
(1, 1, 'Basic', 1, 4, 5, 'B', 'B,L,P', 0, 0, 6, 1, 'J', 1, 0),
(2, 2, 'Pro', 5, 15, 20, 'A', 'A', 1, 1, 150, 1, 'J-PD-PN', 5, 1),
(3, 3, 'Premium', 10, 200, 500, 'A', 'A', 1, 1, 1000, 1, 'J-PD-PN-E', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `id` bigint(20) NOT NULL,
  `google` int(11) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(128) NOT NULL,
  `plan` int(11) NOT NULL,
  `project_create` int(11) NOT NULL,
  `add_files` int(11) NOT NULL,
  `file_size` int(11) NOT NULL,
  `multifields` varchar(255) NOT NULL,
  `chart_plots` varchar(255) NOT NULL,
  `graph_limit` int(11) NOT NULL,
  `chart_download` varchar(255) NOT NULL,
  `shares` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add subscription', 7, 'add_subscription'),
(26, 'Can change subscription', 7, 'change_subscription'),
(27, 'Can delete subscription', 7, 'delete_subscription'),
(28, 'Can view subscription', 7, 'view_subscription'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add logs', 9, 'add_logs'),
(34, 'Can change logs', 9, 'change_logs'),
(35, 'Can delete logs', 9, 'delete_logs'),
(36, 'Can view logs', 9, 'view_logs'),
(37, 'Can add working', 10, 'add_working'),
(38, 'Can change working', 10, 'change_working'),
(39, 'Can delete working', 10, 'delete_working'),
(40, 'Can view working', 10, 'view_working'),
(41, 'Can add graph data', 11, 'add_graphdata'),
(42, 'Can change graph data', 11, 'change_graphdata'),
(43, 'Can delete graph data', 11, 'delete_graphdata'),
(44, 'Can view graph data', 11, 'view_graphdata'),
(45, 'Can add project', 12, 'add_project'),
(46, 'Can change project', 12, 'change_project'),
(47, 'Can delete project', 12, 'delete_project'),
(48, 'Can view project', 12, 'view_project'),
(49, 'Can add notification', 13, 'add_notification'),
(50, 'Can change notification', 13, 'change_notification'),
(51, 'Can delete notification', 13, 'delete_notification'),
(52, 'Can view notification', 13, 'view_notification'),
(53, 'Can add file', 14, 'add_file'),
(54, 'Can change file', 14, 'change_file'),
(55, 'Can delete file', 14, 'delete_file'),
(56, 'Can view file', 14, 'view_file'),
(57, 'Can add associate', 15, 'add_associate'),
(58, 'Can change associate', 15, 'change_associate'),
(59, 'Can delete associate', 15, 'delete_associate'),
(60, 'Can view associate', 15, 'view_associate'),
(61, 'Can add archived', 16, 'add_archived'),
(62, 'Can change archived', 16, 'change_archived'),
(63, 'Can delete archived', 16, 'delete_archived'),
(64, 'Can view archived', 16, 'view_archived'),
(65, 'Can add trash', 17, 'add_trash'),
(66, 'Can change trash', 17, 'change_trash'),
(67, 'Can delete trash', 17, 'delete_trash'),
(68, 'Can view trash', 17, 'view_trash'),
(69, 'Can add crontab', 18, 'add_crontabschedule'),
(70, 'Can change crontab', 18, 'change_crontabschedule'),
(71, 'Can delete crontab', 18, 'delete_crontabschedule'),
(72, 'Can view crontab', 18, 'view_crontabschedule'),
(73, 'Can add interval', 19, 'add_intervalschedule'),
(74, 'Can change interval', 19, 'change_intervalschedule'),
(75, 'Can delete interval', 19, 'delete_intervalschedule'),
(76, 'Can view interval', 19, 'view_intervalschedule'),
(77, 'Can add periodic task', 20, 'add_periodictask'),
(78, 'Can change periodic task', 20, 'change_periodictask'),
(79, 'Can delete periodic task', 20, 'delete_periodictask'),
(80, 'Can view periodic task', 20, 'view_periodictask'),
(81, 'Can add periodic tasks', 21, 'add_periodictasks'),
(82, 'Can change periodic tasks', 21, 'change_periodictasks'),
(83, 'Can delete periodic tasks', 21, 'delete_periodictasks'),
(84, 'Can view periodic tasks', 21, 'view_periodictasks'),
(85, 'Can add solar event', 22, 'add_solarschedule'),
(86, 'Can change solar event', 22, 'change_solarschedule'),
(87, 'Can delete solar event', 22, 'delete_solarschedule'),
(88, 'Can view solar event', 22, 'view_solarschedule'),
(89, 'Can add clocked', 23, 'add_clockedschedule'),
(90, 'Can change clocked', 23, 'change_clockedschedule'),
(91, 'Can delete clocked', 23, 'delete_clockedschedule'),
(92, 'Can view clocked', 23, 'view_clockedschedule');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int(11) NOT NULL,
  `clocked_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int(11) NOT NULL,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int(11) NOT NULL,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_periodictask`
--

CREATE TABLE `django_celery_beat_periodictask` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) UNSIGNED NOT NULL,
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `solar_id` int(11) DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT NULL,
  `headers` longtext NOT NULL,
  `clocked_id` int(11) DEFAULT NULL,
  `expire_seconds` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_periodictasks`
--

CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_solarschedule`
--

CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int(11) NOT NULL,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(7, 'accounts', 'subscription'),
(8, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(23, 'django_celery_beat', 'clockedschedule'),
(18, 'django_celery_beat', 'crontabschedule'),
(19, 'django_celery_beat', 'intervalschedule'),
(20, 'django_celery_beat', 'periodictask'),
(21, 'django_celery_beat', 'periodictasks'),
(22, 'django_celery_beat', 'solarschedule'),
(16, 'project', 'archived'),
(15, 'project', 'associate'),
(14, 'project', 'file'),
(11, 'project', 'graphdata'),
(9, 'project', 'logs'),
(13, 'project', 'notification'),
(12, 'project', 'project'),
(17, 'project', 'trash'),
(10, 'project', 'working'),
(6, 'sessions', 'session');

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
(1, 'accounts', '0001_initial', '2024-06-09 17:11:37.000000'),
(2, 'accounts', '0002_alter_user_project_create', '2024-06-09 17:11:37.000000'),
(3, 'contenttypes', '0001_initial', '2024-06-09 17:11:37.000000'),
(4, 'auth', '0001_initial', '2024-06-09 17:11:37.000000'),
(5, 'admin', '0001_initial', '2024-06-09 17:11:37.000000'),
(6, 'admin', '0002_logentry_remove_auto_add', '2024-06-09 17:11:38.000000'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2024-06-09 17:11:38.000000'),
(8, 'contenttypes', '0002_remove_content_type_name', '2024-06-09 17:11:38.000000'),
(9, 'auth', '0002_alter_permission_name_max_length', '2024-06-09 17:11:38.000000'),
(10, 'auth', '0003_alter_user_email_max_length', '2024-06-09 17:11:38.000000'),
(11, 'auth', '0004_alter_user_username_opts', '2024-06-09 17:11:38.000000'),
(12, 'auth', '0005_alter_user_last_login_null', '2024-06-09 17:11:38.000000'),
(13, 'auth', '0006_require_contenttypes_0002', '2024-06-09 17:11:38.000000'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2024-06-09 17:11:38.000000'),
(15, 'auth', '0008_alter_user_username_max_length', '2024-06-09 17:11:38.000000'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2024-06-09 17:11:38.000000'),
(17, 'auth', '0010_alter_group_name_max_length', '2024-06-09 17:11:38.000000'),
(18, 'auth', '0011_update_proxy_permissions', '2024-06-09 17:11:38.000000'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2024-06-09 17:11:38.000000'),
(20, 'django_celery_beat', '0001_initial', '2024-06-09 17:11:38.000000'),
(21, 'django_celery_beat', '0002_auto_20161118_0346', '2024-06-09 17:11:38.000000'),
(22, 'django_celery_beat', '0003_auto_20161209_0049', '2024-06-09 17:11:38.000000'),
(23, 'django_celery_beat', '0004_auto_20170221_0000', '2024-06-09 17:11:38.000000'),
(24, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2024-06-09 17:11:38.000000'),
(25, 'django_celery_beat', '0006_auto_20180322_0932', '2024-06-09 17:11:38.000000'),
(26, 'django_celery_beat', '0007_auto_20180521_0826', '2024-06-09 17:11:38.000000'),
(27, 'django_celery_beat', '0008_auto_20180914_1922', '2024-06-09 17:11:38.000000'),
(28, 'django_celery_beat', '0006_auto_20180210_1226', '2024-06-09 17:11:38.000000'),
(29, 'django_celery_beat', '0006_periodictask_priority', '2024-06-09 17:11:38.000000'),
(30, 'django_celery_beat', '0009_periodictask_headers', '2024-06-09 17:11:39.000000'),
(31, 'django_celery_beat', '0010_auto_20190429_0326', '2024-06-09 17:11:39.000000'),
(32, 'django_celery_beat', '0011_auto_20190508_0153', '2024-06-09 17:11:39.000000'),
(33, 'django_celery_beat', '0012_periodictask_expire_seconds', '2024-06-09 17:11:39.000000'),
(34, 'django_celery_beat', '0013_auto_20200609_0727', '2024-06-09 17:11:39.000000'),
(35, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2024-06-09 17:11:39.000000'),
(36, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2024-06-09 17:11:39.000000'),
(37, 'django_celery_beat', '0016_alter_crontabschedule_timezone', '2024-06-09 17:11:39.000000'),
(38, 'django_celery_beat', '0017_alter_crontabschedule_month_of_year', '2024-06-09 17:11:39.000000'),
(39, 'django_celery_beat', '0018_improve_crontab_helptext', '2024-06-09 17:11:39.000000'),
(40, 'project', '0001_initial', '2024-06-09 17:11:40.000000'),
(41, 'sessions', '0001_initial', '2024-06-09 17:11:40.000000');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_archived`
--

CREATE TABLE `project_archived` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `modifydate` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_associate`
--

CREATE TABLE `project_associate` (
  `id` bigint(20) NOT NULL,
  `role` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `modifydate` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_file`
--

CREATE TABLE `project_file` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_graphdata`
--

CREATE TABLE `project_graphdata` (
  `id` bigint(20) NOT NULL,
  `graphName` varchar(100) DEFAULT NULL,
  `xAxis` varchar(100) DEFAULT NULL,
  `yAxis` varchar(100) DEFAULT NULL,
  `parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parameters`)),
  `barColors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`barColors`)),
  `selectedLabels` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`selectedLabels`)),
  `xLabelColor` varchar(100) DEFAULT NULL,
  `yLabelColor` varchar(100) DEFAULT NULL,
  `graphHeadSize` int(11) DEFAULT NULL,
  `graphHeadWeight` varchar(100) DEFAULT NULL,
  `xLabelSize` int(11) DEFAULT NULL,
  `xLabelWeight` varchar(100) DEFAULT NULL,
  `yLabelSize` int(11) DEFAULT NULL,
  `yLabelWeight` varchar(100) DEFAULT NULL,
  `graphHeading` varchar(100) DEFAULT NULL,
  `barBorders` int(11) DEFAULT NULL,
  `condition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`condition`)),
  `conditionalParameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditionalParameters`)),
  `yAxisConditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`yAxisConditions`)),
  `yAxisValue` varchar(100) DEFAULT NULL,
  `textureColor` varchar(100) DEFAULT NULL,
  `textureBg` varchar(100) DEFAULT NULL,
  `legends` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `colorStatesTexture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colorStatesTexture`)),
  `colorStatesBgTexture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colorStatesBgTexture`)),
  `dictionaryState` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dictionaryState`)),
  `borderColor` varchar(100) DEFAULT NULL,
  `dlSize` int(11) DEFAULT NULL,
  `dlWeight` varchar(100) DEFAULT NULL,
  `dlColor` varchar(100) DEFAULT NULL,
  `stepped` tinyint(1) DEFAULT NULL,
  `dataLabelsConfig` tinyint(1) DEFAULT NULL,
  `smoothness` tinyint(1) DEFAULT NULL,
  `fontFamily` varchar(100) DEFAULT NULL,
  `project_id` varchar(100) DEFAULT NULL,
  `file_id` int(11) DEFAULT NULL,
  `stepSize` varchar(100) DEFAULT NULL,
  `legendPosition` varchar(100) DEFAULT NULL,
  `greyShadeCheck` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_logs`
--

CREATE TABLE `project_logs` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `accessType` varchar(255) DEFAULT NULL,
  `project_id` bigint(20) DEFAULT NULL,
  `file_id` bigint(20) DEFAULT NULL,
  `graph_id` bigint(20) DEFAULT NULL,
  `graphName` varchar(100) DEFAULT NULL,
  `xAxis` varchar(100) DEFAULT NULL,
  `yAxis` varchar(100) DEFAULT NULL,
  `parameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`parameters`)),
  `barColors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`barColors`)),
  `selectedLabels` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`selectedLabels`)),
  `xLabelColor` varchar(100) DEFAULT NULL,
  `yLabelColor` varchar(100) DEFAULT NULL,
  `graphHeadSize` int(11) DEFAULT NULL,
  `graphHeadWeight` varchar(100) DEFAULT NULL,
  `xLabelSize` int(11) DEFAULT NULL,
  `xLabelWeight` varchar(100) DEFAULT NULL,
  `yLabelSize` int(11) DEFAULT NULL,
  `yLabelWeight` varchar(100) DEFAULT NULL,
  `graphHeading` varchar(100) DEFAULT NULL,
  `barBorders` int(11) DEFAULT NULL,
  `condition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`condition`)),
  `conditionalParameters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditionalParameters`)),
  `yAxisConditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`yAxisConditions`)),
  `yAxisValue` varchar(100) DEFAULT NULL,
  `textureColor` varchar(100) DEFAULT NULL,
  `textureBg` varchar(100) DEFAULT NULL,
  `legends` varchar(100) DEFAULT NULL,
  `reference` varchar(100) DEFAULT NULL,
  `colorStatesTexture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colorStatesTexture`)),
  `colorStatesBgTexture` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`colorStatesBgTexture`)),
  `dictionaryState` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`dictionaryState`)),
  `borderColor` varchar(100) DEFAULT NULL,
  `dlSize` int(11) DEFAULT NULL,
  `dlWeight` varchar(100) DEFAULT NULL,
  `dlColor` varchar(100) DEFAULT NULL,
  `stepped` tinyint(1) DEFAULT NULL,
  `dataLabelsConfig` tinyint(1) DEFAULT NULL,
  `smoothness` tinyint(1) DEFAULT NULL,
  `fontFamily` varchar(100) DEFAULT NULL,
  `stepSize` varchar(100) DEFAULT NULL,
  `legendPosition` varchar(100) DEFAULT NULL,
  `greyShadeCheck` tinyint(1) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_notification`
--

CREATE TABLE `project_notification` (
  `id` bigint(20) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `read` varchar(255) NOT NULL,
  `toast` varchar(255) NOT NULL,
  `acceptance` varchar(255) DEFAULT NULL,
  `pre_accept` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `receiver_id` bigint(20) DEFAULT NULL,
  `sender_id` bigint(20) DEFAULT NULL,
  `project_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_project`
--

CREATE TABLE `project_project` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL,
  `modified_date` datetime(6) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_trash`
--

CREATE TABLE `project_trash` (
  `id` bigint(20) NOT NULL,
  `project` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `projectcreatedate` datetime(6) NOT NULL,
  `filecreatedate` varchar(255) DEFAULT NULL,
  `modifydate` varchar(255) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_working`
--

CREATE TABLE `project_working` (
  `id` bigint(20) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_subscription`
--
ALTER TABLE `accounts_subscription`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

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
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  ADD KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  ADD KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  ADD KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`);

--
-- Indexes for table `django_celery_beat_periodictasks`
--
ALTER TABLE `django_celery_beat_periodictasks`
  ADD PRIMARY KEY (`ident`);

--
-- Indexes for table `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`);

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
-- Indexes for table `project_archived`
--
ALTER TABLE `project_archived`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_archived_user_id_4b23fcf0_fk_accounts_user_id` (`user_id`),
  ADD KEY `project_archived_project_id_51b9ff9e_fk_project_project_id` (`project_id`);

--
-- Indexes for table `project_associate`
--
ALTER TABLE `project_associate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_associate_user_id_a7d3eb74_fk_accounts_user_id` (`user_id`),
  ADD KEY `project_associate_project_id_e7311483_fk_project_project_id` (`project_id`);

--
-- Indexes for table `project_file`
--
ALTER TABLE `project_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_file_project_id_59c19387_fk_project_project_id` (`project_id`);

--
-- Indexes for table `project_graphdata`
--
ALTER TABLE `project_graphdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_graphdata_user_id_e5850740_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `project_logs`
--
ALTER TABLE `project_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_notification`
--
ALTER TABLE `project_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_notification_receiver_id_30be0c2d_fk_accounts_user_id` (`receiver_id`),
  ADD KEY `project_notification_sender_id_fc2387f0_fk_accounts_user_id` (`sender_id`),
  ADD KEY `project_notification_project_id_3a64c624_fk_project_project_id` (`project_id`);

--
-- Indexes for table `project_project`
--
ALTER TABLE `project_project`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_project_user_id_8710107a_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `project_trash`
--
ALTER TABLE `project_trash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_trash_user_id_56fcb390_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `project_working`
--
ALTER TABLE `project_working`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_subscription`
--
ALTER TABLE `accounts_subscription`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `project_archived`
--
ALTER TABLE `project_archived`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_associate`
--
ALTER TABLE `project_associate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_file`
--
ALTER TABLE `project_file`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_graphdata`
--
ALTER TABLE `project_graphdata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_logs`
--
ALTER TABLE `project_logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_notification`
--
ALTER TABLE `project_notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_project`
--
ALTER TABLE `project_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_trash`
--
ALTER TABLE `project_trash`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_working`
--
ALTER TABLE `project_working`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`);

--
-- Constraints for table `project_archived`
--
ALTER TABLE `project_archived`
  ADD CONSTRAINT `project_archived_project_id_51b9ff9e_fk_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`),
  ADD CONSTRAINT `project_archived_user_id_4b23fcf0_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `project_associate`
--
ALTER TABLE `project_associate`
  ADD CONSTRAINT `project_associate_project_id_e7311483_fk_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`),
  ADD CONSTRAINT `project_associate_user_id_a7d3eb74_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `project_file`
--
ALTER TABLE `project_file`
  ADD CONSTRAINT `project_file_project_id_59c19387_fk_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`);

--
-- Constraints for table `project_graphdata`
--
ALTER TABLE `project_graphdata`
  ADD CONSTRAINT `project_graphdata_user_id_e5850740_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `project_notification`
--
ALTER TABLE `project_notification`
  ADD CONSTRAINT `project_notification_project_id_3a64c624_fk_project_project_id` FOREIGN KEY (`project_id`) REFERENCES `project_project` (`id`),
  ADD CONSTRAINT `project_notification_receiver_id_30be0c2d_fk_accounts_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `accounts_user` (`id`),
  ADD CONSTRAINT `project_notification_sender_id_fc2387f0_fk_accounts_user_id` FOREIGN KEY (`sender_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `project_project`
--
ALTER TABLE `project_project`
  ADD CONSTRAINT `project_project_user_id_8710107a_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `project_trash`
--
ALTER TABLE `project_trash`
  ADD CONSTRAINT `project_trash_user_id_56fcb390_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

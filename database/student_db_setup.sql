-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 06, 2022 at 01:11 PM
-- Server version: 10.6.8-MariaDB-log
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `student`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance_list`
--

CREATE TABLE `attendance_list` (
  `id` int(30) NOT NULL,
  `class_subject_id` int(30) NOT NULL,
  `doc` date NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance_list`
--

INSERT INTO `attendance_list` (`id`, `class_subject_id`, `doc`, `date_created`) VALUES
(1, 1, '2020-10-28', '2020-10-28 20:06:37'),
(2, 3, '2022-06-29', '2022-06-30 01:53:25'),
(3, 4, '2022-06-30', '2022-06-30 07:21:34'),
(4, 5, '2022-07-22', '2022-07-22 15:37:30'),
(5, 10, '2022-08-08', '2022-08-08 14:58:31'),
(6, 6, '2022-08-09', '2022-08-09 14:11:55'),
(7, 6, '2022-08-09', '2022-08-09 14:16:01'),
(8, 6, '2022-08-08', '2022-08-09 14:16:51'),
(9, 6, '2022-08-10', '2022-08-09 14:22:34'),
(10, 6, '2022-08-11', '2022-08-09 14:22:59'),
(11, 6, '2022-08-12', '2022-08-09 14:23:33'),
(12, 6, '2022-08-14', '2022-08-09 14:25:20'),
(13, 7, '2022-08-25', '2022-08-24 15:42:53'),
(14, 7, '2022-08-25', '2022-08-24 15:45:36'),
(15, 9, '2022-08-30', '2022-08-30 11:10:39'),
(16, 6, '2022-09-07', '2022-09-07 09:43:24'),
(17, 7, '2022-09-07', '2022-09-07 09:56:43'),
(18, 6, '2022-09-07', '2022-09-07 10:12:58'),
(19, 6, '2022-09-07', '2022-09-07 10:31:28'),
(20, 6, '2022-09-08', '2022-09-08 11:18:58'),
(21, 6, '2022-09-09', '2022-09-08 11:19:28'),
(22, 6, '2022-09-13', '2022-09-13 23:54:18'),
(23, 6, '2022-09-14', '2022-09-13 23:55:07'),
(24, 6, '2022-09-16', '2022-09-14 00:01:26'),
(25, 6, '2022-09-12', '2022-09-14 00:02:17'),
(26, 6, '2022-09-13', '2022-09-14 00:08:14'),
(27, 6, '2022-09-08', '2022-09-14 01:19:36'),
(28, 6, '2022-09-29', '2022-09-29 12:18:57'),
(29, 6, '2022-09-29', '2022-09-29 12:20:42'),
(30, 6, '2022-09-28', '2022-09-29 12:24:36'),
(31, 6, '2022-09-29', '2022-09-29 12:26:23'),
(32, 6, '2022-09-29', '2022-09-29 12:26:51'),
(33, 6, '2022-09-25', '2022-09-29 12:27:15'),
(34, 6, '2022-09-25', '2022-09-29 12:27:56'),
(35, 7, '2022-09-26', '2022-09-29 12:30:46'),
(36, 9, '2022-10-31', '2022-10-31 14:48:41'),
(37, 7, '2022-10-31', '2022-10-31 15:09:58'),
(38, 7, '2022-10-31', '2022-10-31 15:16:26'),
(39, 6, '2022-10-31', '2022-10-31 15:21:50'),
(40, 9, '2022-10-31', '2022-10-31 15:26:02'),
(41, 9, '2022-10-31', '2022-10-31 15:26:16'),
(42, 7, '2022-10-31', '2022-10-31 15:32:37'),
(43, 6, '2022-10-31', '2022-10-31 15:50:02'),
(44, 6, '2022-10-31', '2022-10-31 15:50:56');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_record`
--

CREATE TABLE `attendance_record` (
  `id` int(30) NOT NULL,
  `attendance_id` int(30) NOT NULL,
  `student_id` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '0=absent,1=present,2=late',
  `remark_absent` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `attendance_record`
--

INSERT INTO `attendance_record` (`id`, `attendance_id`, `student_id`, `type`, `remark_absent`, `date_created`) VALUES
(1, 1, 1, 1, NULL, '2020-10-28 20:06:37'),
(2, 1, 2, 2, NULL, '2020-10-28 20:06:37'),
(3, 2, 3, 1, NULL, '2022-06-30 01:53:25'),
(4, 3, 4, 1, NULL, '2022-06-30 07:21:34'),
(5, 4, 4, 1, NULL, '2022-07-22 15:37:30'),
(6, 4, 5, 1, NULL, '2022-07-22 15:37:30'),
(7, 4, 6, 0, NULL, '2022-07-22 15:37:30'),
(8, 4, 7, 2, NULL, '2022-07-22 15:37:30'),
(9, 5, 54, 1, NULL, '2022-08-08 14:58:31'),
(10, 5, 55, 1, NULL, '2022-08-08 14:58:31'),
(11, 5, 56, 1, NULL, '2022-08-08 14:58:31'),
(12, 5, 57, 1, NULL, '2022-08-08 14:58:31'),
(13, 5, 58, 1, NULL, '2022-08-08 14:58:31'),
(14, 5, 59, 1, NULL, '2022-08-08 14:58:31'),
(15, 5, 60, 1, NULL, '2022-08-08 14:58:31'),
(16, 5, 61, 1, NULL, '2022-08-08 14:58:31'),
(17, 5, 62, 1, NULL, '2022-08-08 14:58:31'),
(18, 5, 63, 1, NULL, '2022-08-08 14:58:31'),
(19, 5, 64, 1, NULL, '2022-08-08 14:58:31'),
(20, 5, 65, 1, NULL, '2022-08-08 14:58:31'),
(21, 5, 66, 1, NULL, '2022-08-08 14:58:31'),
(22, 6, 54, 1, NULL, '2022-08-09 14:11:55'),
(23, 6, 55, 0, NULL, '2022-08-09 14:11:55'),
(24, 6, 56, 1, NULL, '2022-08-09 14:11:55'),
(25, 6, 57, 1, NULL, '2022-08-09 14:11:55'),
(26, 6, 58, 0, NULL, '2022-08-09 14:11:55'),
(27, 6, 59, 1, NULL, '2022-08-09 14:11:55'),
(28, 6, 60, 1, NULL, '2022-08-09 14:11:55'),
(29, 6, 61, 2, NULL, '2022-08-09 14:11:55'),
(30, 6, 62, 1, NULL, '2022-08-09 14:11:55'),
(31, 6, 63, 1, NULL, '2022-08-09 14:11:55'),
(32, 6, 64, 0, NULL, '2022-08-09 14:11:55'),
(33, 6, 65, 1, NULL, '2022-08-09 14:11:55'),
(34, 6, 66, 1, NULL, '2022-08-09 14:11:55'),
(35, 7, 54, 1, NULL, '2022-08-09 14:16:01'),
(36, 7, 55, 1, NULL, '2022-08-09 14:16:01'),
(37, 7, 56, 1, NULL, '2022-08-09 14:16:01'),
(38, 7, 57, 1, NULL, '2022-08-09 14:16:01'),
(39, 7, 58, 1, NULL, '2022-08-09 14:16:01'),
(40, 7, 59, 1, NULL, '2022-08-09 14:16:01'),
(41, 7, 60, 1, NULL, '2022-08-09 14:16:01'),
(42, 7, 61, 1, NULL, '2022-08-09 14:16:01'),
(43, 7, 62, 1, NULL, '2022-08-09 14:16:01'),
(44, 7, 63, 1, NULL, '2022-08-09 14:16:01'),
(45, 7, 64, 1, NULL, '2022-08-09 14:16:01'),
(46, 7, 65, 1, NULL, '2022-08-09 14:16:01'),
(47, 7, 66, 1, NULL, '2022-08-09 14:16:01'),
(48, 8, 54, 1, NULL, '2022-08-09 14:16:51'),
(49, 8, 55, 1, NULL, '2022-08-09 14:16:51'),
(50, 8, 56, 1, NULL, '2022-08-09 14:16:51'),
(51, 8, 57, 1, NULL, '2022-08-09 14:16:51'),
(52, 8, 58, 1, NULL, '2022-08-09 14:16:51'),
(53, 8, 59, 1, NULL, '2022-08-09 14:16:51'),
(54, 8, 60, 1, NULL, '2022-08-09 14:16:51'),
(55, 8, 61, 1, NULL, '2022-08-09 14:16:51'),
(56, 8, 62, 1, NULL, '2022-08-09 14:16:51'),
(57, 8, 63, 1, NULL, '2022-08-09 14:16:51'),
(58, 8, 64, 1, NULL, '2022-08-09 14:16:51'),
(59, 8, 65, 1, NULL, '2022-08-09 14:16:51'),
(60, 8, 66, 1, NULL, '2022-08-09 14:16:51'),
(61, 9, 54, 2, NULL, '2022-08-09 14:22:34'),
(62, 9, 55, 1, NULL, '2022-08-09 14:22:34'),
(63, 9, 56, 2, NULL, '2022-08-09 14:22:34'),
(64, 9, 57, 2, NULL, '2022-08-09 14:22:34'),
(65, 9, 58, 1, NULL, '2022-08-09 14:22:34'),
(66, 9, 59, 1, NULL, '2022-08-09 14:22:34'),
(67, 9, 60, 1, NULL, '2022-08-09 14:22:34'),
(68, 9, 61, 2, NULL, '2022-08-09 14:22:34'),
(69, 9, 62, 1, NULL, '2022-08-09 14:22:34'),
(70, 9, 63, 1, NULL, '2022-08-09 14:22:34'),
(71, 9, 64, 1, NULL, '2022-08-09 14:22:34'),
(72, 9, 65, 0, NULL, '2022-08-09 14:22:34'),
(73, 9, 66, 1, NULL, '2022-08-09 14:22:34'),
(74, 10, 54, 2, NULL, '2022-08-09 14:22:59'),
(75, 10, 55, 0, NULL, '2022-08-09 14:22:59'),
(76, 10, 56, 0, NULL, '2022-08-09 14:22:59'),
(77, 10, 57, 1, NULL, '2022-08-09 14:22:59'),
(78, 10, 58, 2, NULL, '2022-08-09 14:22:59'),
(79, 10, 59, 1, NULL, '2022-08-09 14:22:59'),
(80, 10, 60, 1, NULL, '2022-08-09 14:22:59'),
(81, 10, 61, 1, NULL, '2022-08-09 14:22:59'),
(82, 10, 62, 0, NULL, '2022-08-09 14:22:59'),
(83, 10, 63, 0, NULL, '2022-08-09 14:22:59'),
(84, 10, 64, 1, NULL, '2022-08-09 14:22:59'),
(85, 10, 65, 1, NULL, '2022-08-09 14:22:59'),
(86, 10, 66, 1, NULL, '2022-08-09 14:22:59'),
(87, 11, 54, 2, NULL, '2022-08-09 14:23:33'),
(88, 11, 55, 2, NULL, '2022-08-09 14:23:33'),
(89, 11, 56, 1, NULL, '2022-08-09 14:23:33'),
(90, 11, 57, 1, NULL, '2022-08-09 14:23:33'),
(91, 11, 58, 1, NULL, '2022-08-09 14:23:33'),
(92, 11, 59, 1, NULL, '2022-08-09 14:23:33'),
(93, 11, 60, 1, NULL, '2022-08-09 14:23:33'),
(94, 11, 61, 1, NULL, '2022-08-09 14:23:33'),
(95, 11, 62, 1, NULL, '2022-08-09 14:23:33'),
(96, 11, 63, 1, NULL, '2022-08-09 14:23:33'),
(97, 11, 64, 1, NULL, '2022-08-09 14:23:33'),
(98, 11, 65, 1, NULL, '2022-08-09 14:23:33'),
(99, 11, 66, 1, NULL, '2022-08-09 14:23:33'),
(100, 12, 54, 0, NULL, '2022-08-09 14:25:20'),
(101, 12, 55, 1, NULL, '2022-08-09 14:25:20'),
(102, 12, 56, 1, NULL, '2022-08-09 14:25:20'),
(103, 12, 57, 1, NULL, '2022-08-09 14:25:20'),
(104, 12, 58, 1, NULL, '2022-08-09 14:25:20'),
(105, 12, 59, 1, NULL, '2022-08-09 14:25:20'),
(106, 12, 60, 1, NULL, '2022-08-09 14:25:20'),
(107, 12, 61, 1, NULL, '2022-08-09 14:25:20'),
(108, 12, 62, 0, NULL, '2022-08-09 14:25:20'),
(109, 12, 63, 1, NULL, '2022-08-09 14:25:20'),
(110, 12, 64, 1, NULL, '2022-08-09 14:25:20'),
(111, 12, 65, 1, NULL, '2022-08-09 14:25:20'),
(112, 12, 66, 1, NULL, '2022-08-09 14:25:20'),
(113, 17, 54, 2, '', '2022-09-07 09:56:43'),
(114, 17, 55, 2, '', '2022-09-07 09:56:43'),
(115, 17, 56, 2, '', '2022-09-07 09:56:43'),
(116, 17, 57, 2, '', '2022-09-07 09:56:43'),
(117, 17, 58, 2, '', '2022-09-07 09:56:43'),
(118, 17, 59, 2, '', '2022-09-07 09:56:43'),
(119, 17, 60, 2, '', '2022-09-07 09:56:43'),
(120, 17, 61, 1, '', '2022-09-07 09:56:43'),
(121, 17, 62, 1, '', '2022-09-07 09:56:43'),
(122, 17, 63, 1, '', '2022-09-07 09:56:43'),
(123, 17, 64, 1, '', '2022-09-07 09:56:43'),
(124, 17, 65, 1, '', '2022-09-07 09:56:43'),
(125, 17, 66, 1, '', '2022-09-07 09:56:43'),
(126, 18, 54, 1, '', '2022-09-07 10:12:58'),
(127, 18, 55, 1, '', '2022-09-07 10:12:58'),
(128, 18, 56, 1, '', '2022-09-07 10:12:58'),
(129, 18, 57, 1, '', '2022-09-07 10:12:58'),
(130, 18, 58, 1, '', '2022-09-07 10:12:58'),
(131, 18, 59, 1, '', '2022-09-07 10:12:58'),
(132, 18, 60, 1, '', '2022-09-07 10:12:58'),
(133, 18, 61, 1, '', '2022-09-07 10:12:58'),
(134, 18, 62, 1, '', '2022-09-07 10:12:58'),
(135, 18, 63, 1, '', '2022-09-07 10:12:58'),
(136, 18, 64, 1, '', '2022-09-07 10:12:58'),
(137, 18, 65, 1, '', '2022-09-07 10:12:58'),
(138, 18, 66, 1, '', '2022-09-07 10:12:58'),
(139, 19, 54, 1, NULL, '2022-09-07 10:31:28'),
(140, 19, 55, 1, NULL, '2022-09-07 10:31:28'),
(141, 19, 56, 1, NULL, '2022-09-07 10:31:28'),
(142, 19, 57, 1, NULL, '2022-09-07 10:31:28'),
(143, 19, 58, 2, NULL, '2022-09-07 10:31:28'),
(144, 19, 59, 2, NULL, '2022-09-07 10:31:28'),
(145, 19, 60, 2, NULL, '2022-09-07 10:31:28'),
(146, 19, 61, 0, NULL, '2022-09-07 10:31:28'),
(147, 19, 62, 0, NULL, '2022-09-07 10:31:28'),
(148, 19, 63, 1, NULL, '2022-09-07 10:31:28'),
(149, 19, 64, 1, NULL, '2022-09-07 10:31:28'),
(150, 19, 65, 1, NULL, '2022-09-07 10:31:28'),
(151, 19, 66, 1, NULL, '2022-09-07 10:31:28'),
(152, 20, 54, 1, NULL, '2022-09-08 11:18:58'),
(153, 20, 55, 1, NULL, '2022-09-08 11:18:58'),
(154, 20, 56, 1, NULL, '2022-09-08 11:18:58'),
(155, 20, 57, 1, NULL, '2022-09-08 11:18:58'),
(156, 20, 58, 1, NULL, '2022-09-08 11:18:58'),
(157, 20, 59, 1, NULL, '2022-09-08 11:18:58'),
(158, 20, 60, 1, NULL, '2022-09-08 11:18:58'),
(159, 20, 61, 1, NULL, '2022-09-08 11:18:58'),
(160, 20, 62, 1, NULL, '2022-09-08 11:18:58'),
(161, 20, 63, 2, NULL, '2022-09-08 11:18:58'),
(162, 20, 64, 1, NULL, '2022-09-08 11:18:58'),
(163, 20, 65, 1, NULL, '2022-09-08 11:18:58'),
(164, 20, 66, 1, NULL, '2022-09-08 11:18:58'),
(165, 21, 54, 1, NULL, '2022-09-08 11:19:28'),
(166, 21, 55, 1, NULL, '2022-09-08 11:19:28'),
(167, 21, 56, 1, NULL, '2022-09-08 11:19:28'),
(168, 21, 57, 1, NULL, '2022-09-08 11:19:28'),
(169, 21, 58, 1, NULL, '2022-09-08 11:19:28'),
(170, 21, 59, 1, NULL, '2022-09-08 11:19:28'),
(171, 21, 60, 1, NULL, '2022-09-08 11:19:28'),
(172, 21, 61, 1, NULL, '2022-09-08 11:19:28'),
(173, 21, 62, 1, NULL, '2022-09-08 11:19:28'),
(174, 21, 63, 1, NULL, '2022-09-08 11:19:28'),
(175, 21, 64, 1, NULL, '2022-09-08 11:19:28'),
(176, 21, 65, 1, NULL, '2022-09-08 11:19:28'),
(177, 21, 66, 1, NULL, '2022-09-08 11:19:28'),
(178, 22, 54, 0, NULL, '2022-09-13 23:54:18'),
(179, 22, 55, 0, NULL, '2022-09-13 23:54:18'),
(180, 22, 56, 0, NULL, '2022-09-13 23:54:18'),
(181, 22, 57, 0, NULL, '2022-09-13 23:54:18'),
(182, 22, 58, 0, NULL, '2022-09-13 23:54:18'),
(183, 22, 59, 0, NULL, '2022-09-13 23:54:18'),
(184, 22, 60, 0, NULL, '2022-09-13 23:54:18'),
(185, 22, 61, 2, NULL, '2022-09-13 23:54:18'),
(186, 22, 62, 0, NULL, '2022-09-13 23:54:18'),
(187, 22, 63, 0, NULL, '2022-09-13 23:54:18'),
(188, 22, 64, 0, NULL, '2022-09-13 23:54:18'),
(189, 22, 65, 0, NULL, '2022-09-13 23:54:18'),
(190, 22, 66, 0, NULL, '2022-09-13 23:54:18'),
(191, 23, 54, 1, NULL, '2022-09-13 23:55:07'),
(192, 23, 55, 0, NULL, '2022-09-13 23:55:07'),
(193, 23, 56, 2, NULL, '2022-09-13 23:55:07'),
(194, 23, 57, 1, NULL, '2022-09-13 23:55:07'),
(195, 23, 58, 1, NULL, '2022-09-13 23:55:07'),
(196, 23, 59, 1, NULL, '2022-09-13 23:55:07'),
(197, 23, 60, 1, NULL, '2022-09-13 23:55:07'),
(198, 23, 61, 1, NULL, '2022-09-13 23:55:07'),
(199, 23, 62, 1, NULL, '2022-09-13 23:55:07'),
(200, 23, 63, 1, NULL, '2022-09-13 23:55:07'),
(201, 23, 64, 1, NULL, '2022-09-13 23:55:07'),
(202, 23, 65, 1, NULL, '2022-09-13 23:55:07'),
(203, 23, 66, 1, NULL, '2022-09-13 23:55:07'),
(204, 24, 54, 0, NULL, '2022-09-14 00:01:26'),
(205, 24, 55, 1, NULL, '2022-09-14 00:01:26'),
(206, 24, 56, 1, NULL, '2022-09-14 00:01:26'),
(207, 24, 57, 1, NULL, '2022-09-14 00:01:26'),
(208, 24, 58, 1, NULL, '2022-09-14 00:01:26'),
(209, 24, 59, 1, NULL, '2022-09-14 00:01:26'),
(210, 24, 60, 1, NULL, '2022-09-14 00:01:26'),
(211, 24, 61, 1, NULL, '2022-09-14 00:01:26'),
(212, 24, 62, 1, NULL, '2022-09-14 00:01:26'),
(213, 24, 63, 1, NULL, '2022-09-14 00:01:26'),
(214, 24, 64, 1, NULL, '2022-09-14 00:01:26'),
(215, 24, 65, 1, NULL, '2022-09-14 00:01:26'),
(216, 24, 66, 1, NULL, '2022-09-14 00:01:26'),
(217, 25, 54, 0, NULL, '2022-09-14 00:02:17'),
(218, 25, 55, 1, NULL, '2022-09-14 00:02:17'),
(219, 25, 56, 1, NULL, '2022-09-14 00:02:17'),
(220, 25, 57, 1, NULL, '2022-09-14 00:02:17'),
(221, 25, 58, 1, NULL, '2022-09-14 00:02:17'),
(222, 25, 59, 1, NULL, '2022-09-14 00:02:17'),
(223, 25, 60, 1, NULL, '2022-09-14 00:02:17'),
(224, 25, 61, 1, NULL, '2022-09-14 00:02:17'),
(225, 25, 62, 1, NULL, '2022-09-14 00:02:17'),
(226, 25, 63, 1, NULL, '2022-09-14 00:02:17'),
(227, 25, 64, 1, NULL, '2022-09-14 00:02:17'),
(228, 25, 65, 1, NULL, '2022-09-14 00:02:17'),
(229, 25, 66, 1, NULL, '2022-09-14 00:02:17'),
(230, 26, 54, 0, NULL, '2022-09-14 00:08:14'),
(231, 26, 55, 1, NULL, '2022-09-14 00:08:14'),
(232, 26, 56, 1, NULL, '2022-09-14 00:08:14'),
(233, 26, 57, 1, NULL, '2022-09-14 00:08:14'),
(234, 26, 58, 1, NULL, '2022-09-14 00:08:14'),
(235, 26, 59, 1, NULL, '2022-09-14 00:08:14'),
(236, 26, 60, 1, NULL, '2022-09-14 00:08:14'),
(237, 26, 61, 1, NULL, '2022-09-14 00:08:14'),
(238, 26, 62, 1, NULL, '2022-09-14 00:08:14'),
(239, 26, 63, 1, NULL, '2022-09-14 00:08:14'),
(240, 26, 64, 1, NULL, '2022-09-14 00:08:14'),
(241, 26, 65, 1, NULL, '2022-09-14 00:08:14'),
(242, 26, 66, 1, NULL, '2022-09-14 00:08:14'),
(243, 27, 54, 0, NULL, '2022-09-14 01:19:36'),
(244, 27, 55, 1, NULL, '2022-09-14 01:19:36'),
(245, 27, 56, 1, NULL, '2022-09-14 01:19:36'),
(246, 27, 57, 1, NULL, '2022-09-14 01:19:36'),
(247, 27, 58, 1, NULL, '2022-09-14 01:19:36'),
(248, 27, 59, 1, NULL, '2022-09-14 01:19:36'),
(249, 27, 60, 1, NULL, '2022-09-14 01:19:36'),
(250, 27, 61, 1, NULL, '2022-09-14 01:19:36'),
(251, 27, 62, 1, NULL, '2022-09-14 01:19:36'),
(252, 27, 63, 1, NULL, '2022-09-14 01:19:36'),
(253, 27, 64, 1, NULL, '2022-09-14 01:19:36'),
(254, 27, 65, 1, NULL, '2022-09-14 01:19:36'),
(255, 27, 66, 1, NULL, '2022-09-14 01:19:36'),
(256, 28, 54, 0, NULL, '2022-09-29 12:18:57'),
(257, 28, 55, 1, NULL, '2022-09-29 12:18:59'),
(258, 28, 56, 0, NULL, '2022-09-29 12:18:59'),
(259, 28, 57, 2, NULL, '2022-09-29 12:18:59'),
(260, 28, 58, 1, NULL, '2022-09-29 12:18:59'),
(261, 28, 59, 1, NULL, '2022-09-29 12:18:59'),
(262, 28, 60, 1, NULL, '2022-09-29 12:18:59'),
(263, 28, 61, 1, NULL, '2022-09-29 12:18:59'),
(264, 28, 62, 1, NULL, '2022-09-29 12:18:59'),
(265, 28, 63, 0, NULL, '2022-09-29 12:18:59'),
(266, 28, 64, 1, NULL, '2022-09-29 12:18:59'),
(267, 28, 65, 1, NULL, '2022-09-29 12:18:59'),
(268, 28, 66, 0, NULL, '2022-09-29 12:18:59'),
(269, 29, 54, 1, NULL, '2022-09-29 12:20:42'),
(270, 29, 55, 1, NULL, '2022-09-29 12:20:42'),
(271, 29, 56, 1, NULL, '2022-09-29 12:20:42'),
(272, 29, 57, 1, NULL, '2022-09-29 12:20:42'),
(273, 29, 58, 1, NULL, '2022-09-29 12:20:42'),
(274, 29, 59, 1, NULL, '2022-09-29 12:20:42'),
(275, 29, 60, 1, NULL, '2022-09-29 12:20:42'),
(276, 29, 61, 1, NULL, '2022-09-29 12:20:42'),
(277, 29, 62, 1, NULL, '2022-09-29 12:20:42'),
(278, 29, 63, 1, NULL, '2022-09-29 12:20:42'),
(279, 29, 64, 1, NULL, '2022-09-29 12:20:42'),
(280, 29, 65, 1, NULL, '2022-09-29 12:20:42'),
(281, 29, 66, 1, NULL, '2022-09-29 12:20:42'),
(282, 30, 54, 0, NULL, '2022-09-29 12:24:36'),
(283, 30, 55, 0, NULL, '2022-09-29 12:24:38'),
(284, 30, 56, 0, NULL, '2022-09-29 12:24:40'),
(285, 30, 57, 0, NULL, '2022-09-29 12:24:40'),
(286, 30, 58, 0, NULL, '2022-09-29 12:24:40'),
(287, 30, 59, 0, NULL, '2022-09-29 12:24:40'),
(288, 30, 60, 0, NULL, '2022-09-29 12:24:40'),
(289, 30, 61, 0, NULL, '2022-09-29 12:24:40'),
(290, 30, 62, 0, NULL, '2022-09-29 12:24:40'),
(291, 30, 63, 0, NULL, '2022-09-29 12:24:42'),
(292, 30, 64, 0, NULL, '2022-09-29 12:24:42'),
(293, 30, 65, 0, NULL, '2022-09-29 12:24:42'),
(294, 30, 66, 0, NULL, '2022-09-29 12:24:42'),
(295, 31, 54, 1, NULL, '2022-09-29 12:26:23'),
(296, 31, 55, 1, NULL, '2022-09-29 12:26:23'),
(297, 31, 56, 1, NULL, '2022-09-29 12:26:23'),
(298, 31, 57, 1, NULL, '2022-09-29 12:26:23'),
(299, 31, 58, 1, NULL, '2022-09-29 12:26:23'),
(300, 31, 59, 1, NULL, '2022-09-29 12:26:23'),
(301, 31, 60, 1, NULL, '2022-09-29 12:26:23'),
(302, 31, 61, 1, NULL, '2022-09-29 12:26:23'),
(303, 31, 62, 1, NULL, '2022-09-29 12:26:23'),
(304, 31, 63, 1, NULL, '2022-09-29 12:26:23'),
(305, 31, 64, 1, NULL, '2022-09-29 12:26:23'),
(306, 31, 65, 1, NULL, '2022-09-29 12:26:23'),
(307, 31, 66, 1, NULL, '2022-09-29 12:26:23'),
(308, 32, 54, 2, NULL, '2022-09-29 12:26:51'),
(309, 32, 55, 2, NULL, '2022-09-29 12:26:51'),
(310, 32, 56, 2, NULL, '2022-09-29 12:26:51'),
(311, 32, 57, 2, NULL, '2022-09-29 12:26:51'),
(312, 32, 58, 2, NULL, '2022-09-29 12:26:51'),
(313, 32, 59, 2, NULL, '2022-09-29 12:26:51'),
(314, 32, 60, 2, NULL, '2022-09-29 12:26:51'),
(315, 32, 61, 2, NULL, '2022-09-29 12:26:51'),
(316, 32, 62, 2, NULL, '2022-09-29 12:26:51'),
(317, 32, 63, 2, NULL, '2022-09-29 12:26:51'),
(318, 32, 64, 2, NULL, '2022-09-29 12:26:51'),
(319, 32, 65, 2, NULL, '2022-09-29 12:26:51'),
(320, 32, 66, 2, NULL, '2022-09-29 12:26:51'),
(321, 33, 54, 0, NULL, '2022-09-29 12:27:16'),
(322, 33, 55, 1, NULL, '2022-09-29 12:27:18'),
(323, 33, 56, 0, NULL, '2022-09-29 12:27:18'),
(324, 33, 57, 2, NULL, '2022-09-29 12:27:20'),
(325, 33, 58, 1, NULL, '2022-09-29 12:27:20'),
(326, 33, 59, 0, NULL, '2022-09-29 12:27:20'),
(327, 33, 60, 1, NULL, '2022-09-29 12:27:20'),
(328, 33, 61, 0, NULL, '2022-09-29 12:27:20'),
(329, 33, 62, 0, NULL, '2022-09-29 12:27:20'),
(330, 33, 63, 2, NULL, '2022-09-29 12:27:22'),
(331, 33, 64, 1, NULL, '2022-09-29 12:27:22'),
(332, 33, 65, 1, NULL, '2022-09-29 12:27:22'),
(333, 33, 66, 0, NULL, '2022-09-29 12:27:22'),
(334, 34, 54, 1, NULL, '2022-09-29 12:27:56'),
(335, 34, 55, 1, NULL, '2022-09-29 12:27:56'),
(336, 34, 56, 1, NULL, '2022-09-29 12:27:56'),
(337, 34, 57, 1, NULL, '2022-09-29 12:27:56'),
(338, 34, 58, 1, NULL, '2022-09-29 12:27:56'),
(339, 34, 59, 1, NULL, '2022-09-29 12:27:56'),
(340, 34, 60, 0, NULL, '2022-09-29 12:27:56'),
(341, 34, 61, 0, NULL, '2022-09-29 12:27:56'),
(342, 34, 62, 0, NULL, '2022-09-29 12:27:56'),
(343, 34, 63, 0, NULL, '2022-09-29 12:27:58'),
(344, 34, 64, 0, NULL, '2022-09-29 12:28:00'),
(345, 34, 65, 0, NULL, '2022-09-29 12:28:00'),
(346, 34, 66, 0, NULL, '2022-09-29 12:28:00'),
(347, 35, 54, 0, NULL, '2022-09-29 12:30:46'),
(348, 35, 55, 1, NULL, '2022-09-29 12:30:48'),
(349, 35, 56, 1, NULL, '2022-09-29 12:30:48'),
(350, 35, 57, 1, NULL, '2022-09-29 12:30:48'),
(351, 35, 58, 1, NULL, '2022-09-29 12:30:48'),
(352, 35, 59, 1, NULL, '2022-09-29 12:30:48'),
(353, 35, 60, 1, NULL, '2022-09-29 12:30:48'),
(354, 35, 61, 1, NULL, '2022-09-29 12:30:48'),
(355, 35, 62, 1, NULL, '2022-09-29 12:30:48'),
(356, 35, 63, 1, NULL, '2022-09-29 12:30:48'),
(357, 35, 64, 1, NULL, '2022-09-29 12:30:48'),
(358, 35, 65, 1, NULL, '2022-09-29 12:30:48'),
(359, 35, 66, 1, NULL, '2022-09-29 12:30:48'),
(360, 36, 54, 0, NULL, '2022-10-31 14:48:41'),
(361, 37, 62, 0, NULL, '2022-10-31 15:09:58'),
(362, 38, 54, 0, NULL, '2022-10-31 15:16:26'),
(363, 39, 54, 1, NULL, '2022-10-31 15:21:50'),
(364, 40, 55, 0, NULL, '2022-10-31 15:26:02'),
(365, 41, 55, 0, NULL, '2022-10-31 15:26:16'),
(366, 42, 54, 0, NULL, '2022-10-31 15:32:37'),
(367, 42, 55, 0, NULL, '2022-10-31 15:32:37');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(30) NOT NULL,
  `course_id` int(30) NOT NULL,
  `level` varchar(50) NOT NULL,
  `section` varchar(100) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Active, 0=Inactive',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `course_id`, `level`, `section`, `status`, `date_created`) VALUES
(1, 2, '1', 'B', 1, '2020-10-28 10:48:45'),
(2, 2, '1', 'A', 1, '2020-10-28 10:52:58'),
(8, 6, '5', '2', 0, '2022-06-30 07:18:54'),
(13, 6, '2', 'test', 1, '2022-10-31 16:12:10'),
(14, 13, '2', 'test', 1, '2022-11-06 21:01:35');

-- --------------------------------------------------------

--
-- Table structure for table `class_subject`
--

CREATE TABLE `class_subject` (
  `id` int(30) NOT NULL,
  `class_id` int(30) NOT NULL,
  `subject_id` int(30) NOT NULL,
  `faculty_id` int(30) NOT NULL,
  `student_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `class_subject`
--

INSERT INTO `class_subject` (`id`, `class_id`, `subject_id`, `faculty_id`, `student_ids`, `date_created`) VALUES
(1, 2, 1, 1, '', '0000-00-00 00:00:00'),
(2, 1, 2, 1, '', '0000-00-00 00:00:00'),
(3, 3, 5, 2, '', '2022-06-30 01:39:44'),
(4, 8, 5, 2, '', '2022-06-30 07:19:20'),
(5, 8, 4, 1, '', '2022-07-22 15:35:29'),
(6, 8, 5, 11, '', '2022-08-04 14:46:51'),
(7, 8, 4, 13, '', '2022-08-05 09:10:37'),
(8, 8, 15, 14, '', '2022-08-05 09:11:07'),
(9, 8, 14, 12, '', '2022-08-05 09:11:57'),
(10, 8, 17, 15, '', '2022-08-05 09:14:30');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(30) NOT NULL,
  `course` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `course`, `description`, `date_created`) VALUES
(6, 'DTV', 'BUILDING INFORMATION MODELLING', '2022-06-30 01:13:57'),
(13, 'BTW', 'Physics & Math', '2022-11-06 21:00:50');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(30) NOT NULL,
  `id_no` varchar(50) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `address` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `id_no`, `name`, `email`, `contact`, `address`, `date_created`) VALUES
(11, '01', 'Azrizan bin Mohamed', 'azrizanmohamed@ewt.edu.my', '0127252222', 'Sample Only', '2022-08-04 14:04:22'),
(12, '02', 'Muhammad Fooad bin Abd Razak', 'Fooad@ewt.edu.my', '01162622222', 'Address', '2022-08-04 14:10:13'),
(13, '03', 'Izzati binti Yahya', 'izzati.yahya@ewt.edu.my', '0176900333', 'Sample Only', '2022-08-04 14:14:30'),
(14, '04', 'Khairol bin Kamaruddin', 'khairol.kamaruddin@ewt.edu.my', '0167122232', 'Sample Only', '2022-08-05 09:08:14'),
(15, '05', 'Maslida binti Abu', 'maslida@ewt.edu.my', '017616333', 'Address 1', '2022-08-05 09:14:18'),
(16, '06', 'Abu Bakar', 'abu@ewt.edu.my', '', '', '2022-11-06 21:04:04');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(30) NOT NULL,
  `id_no` varchar(50) NOT NULL,
  `class_id` int(30) NOT NULL,
  `name` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `email` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `id_no`, `class_id`, `name`, `date_created`, `email`) VALUES
(1, '06232015', 2, 'Ahmad Karim', '2020-10-28 11:53:24', NULL),
(2, '123456', 2, 'Yasin Rahmad', '2020-10-28 15:20:57', NULL),
(3, '333661222826', 3, 'Muhamad Syahmi Najmi', '2022-06-30 01:37:34', NULL),
(54, '01', 8, 'Muhammad Niqmad bin Abdul Halim', '2022-08-04 14:30:16', 'niqmad@gmail.com'),
(55, '02', 8, 'Muhammad Amirul Syafiq bin Zakaria', '2022-08-04 14:31:56', 'ndark4@gmail.com'),
(56, '03', 8, 'Muhammad Danial bin Suhaimi', '2022-08-04 14:32:33', 'danials@gmail.com'),
(57, '04', 8, 'Muhammad Quayyum bin Abdul Rahman', '2022-08-04 14:33:01', 'quayy@gmail.com'),
(58, '05', 8, 'Mohammad Danial Fakhri bin Abdul Rahman', '2022-08-04 14:33:45', 'm.dania@gmail.com'),
(59, '06', 8, 'Natasha Amira binti Mazlan', '2022-08-04 14:34:35', 'natasha@gmail.com'),
(60, '07 ', 8, 'Mohammad Akram bin Warimin', '2022-08-04 14:35:06', NULL),
(61, '08', 8, 'Nurazwa Shafinaz binti Ahmad', '2022-08-04 14:35:52', 'waw32@gmail.com'),
(62, '09 ', 8, 'Syazwani binti Khalidw', '2022-08-04 14:38:34', 'syazwan@gmail.com'),
(63, '10', 8, 'NurHani Aqilah binti Arif', '2022-08-04 14:39:08', 'hani@gmail.com'),
(64, '11', 8, 'Afif thalhah bin Hasani', '2022-08-04 14:39:31', NULL),
(65, '12', 8, 'Nurul Syairah binti Ismail', '2022-08-04 14:40:50', 'syairah@gmail.com'),
(66, '13', 8, 'Masturah binti Halim', '2022-08-04 14:42:50', NULL),
(67, '', 8, 'Abu Lan', '2022-11-06 21:06:29', '');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` int(30) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `subject`, `description`, `date_created`) VALUES
(4, 'DCP 51084', 'Final Year Project', '2022-06-30 01:03:01'),
(5, 'DCP 50073', 'PROJECT INTEGRATION', '2022-06-30 01:05:10'),
(14, 'DCP 52063', 'CONSTRUCTION DETAILING 2', '2022-07-27 14:25:14'),
(15, 'DCV 50142', 'BUILDING QUANTITIES AND ESTIMATING', '2022-07-27 14:26:21'),
(17, 'DUB 51022', 'DIGITAL ENTERPRISE', '2022-07-27 14:27:41'),
(36, 'TEST', '', '2022-10-31 16:24:32'),
(37, 'BHN 8898', 'Biology', '2022-11-06 21:01:16');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Student Attendance Management System', 'info@sample.comm', '+6948 8542 623', '1603344720_1602738120_pngtree-purple-hd-business-banner-image_5493.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&rsquo;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff',
  `faculty_id` int(30) NOT NULL COMMENT 'for faculty user only'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`, `faculty_id`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 0),
(2, 'Farid Jamil', 'fjamil@sample.com', '96a3be3cf272e017046d1b2674a52bd3', 3, 1),
(3, 'marwan', 'marwan@sample.com.my', 'a2ef406e2c2351e0b9e80029c909242d', 3, 2),
(4, '', 'izzati', '72a3cf87bc1f9889b8cf233b828fd153', 2, 0),
(5, 'izzati', 'izzati', '72a3cf87bc1f9889b8cf233b828fd153', 2, 0),
(6, 'syazwan', 'syazwan@gmail.com', 'e45ee7ce7e88149af8dd32b27f9512ce', 3, 3),
(7, 'Rokiyah', 'Rokiyah@gmail.com', '7d0665438e81d8eceb98c1e31fca80c1', 3, 4),
(9, 'farid', 'farid@gmail.com', 'faeac4e1eef307c2ab7b0a3821e6c667', 3, 6),
(10, 'masturah', 'masturah@gmail.com', 'd72d187df41e10ea7d9fcdc7f5909205', 3, 7),
(11, 'saiful', 'saiful@gmail.com', 'fad6f4e614a212e80c67249a666d2b09', 3, 8),
(12, 'haikal', 'haikal@gmail.com', '0a8005f5594bd67041f88c6196192646', 3, 9),
(13, 'syahirah', 'syahirah@gmail.com ', 'd3d9446802a44259755d38e6d163e820', 3, 10),
(14, 'Azrizan bin Mohamed', 'azrizanmohamed@ewt.edu.my', '96a3be3cf272e017046d1b2674a52bd3', 3, 11),
(15, 'Muhammad Fooad bin Abd Razak', 'Fooad@ewt.edu.my', 'a2ef406e2c2351e0b9e80029c909242d', 3, 12),
(16, 'Izzati binti Yahya', 'izzati.yahya@ewt.edu.my', 'e45ee7ce7e88149af8dd32b27f9512ce', 3, 13),
(17, 'Khairol bin Kamaruddin', 'khairol.kamaruddin@ewt.edu.my', '7d0665438e81d8eceb98c1e31fca80c1', 3, 14),
(18, 'Maslida binti Abu', 'maslida@ewt.edu.my', '751d31dd6b56b26b29dac2c0e1839e34', 3, 15),
(19, 'Abu Bakar', 'abu@ewt.edu.my', 'faeac4e1eef307c2ab7b0a3821e6c667', 3, 16),
(20, 'Abu Ali', 'abukaa', '0d777e9e30b918e9034ab610712c90cf', 1, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance_list`
--
ALTER TABLE `attendance_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance_record`
--
ALTER TABLE `attendance_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class_subject`
--
ALTER TABLE `class_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance_list`
--
ALTER TABLE `attendance_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `attendance_record`
--
ALTER TABLE `attendance_record`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `class_subject`
--
ALTER TABLE `class_subject`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

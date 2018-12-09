-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2015 at 01:56 PM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `syntacks`
--

-- --------------------------------------------------------

--
-- Table structure for table `ask_questions`
--

CREATE TABLE IF NOT EXISTS `ask_questions` (
  `title_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`title_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `ask_questions`
--

INSERT INTO `ask_questions` (`title_id`, `title`, `content`, `tags`, `date_time`, `username`) VALUES
(11, 'marvyn', 'asdsadsad				                ', 'Sample,java,css', '2015-03-01 15:10:52', 'sueshen'),
(12, 'edoi', 'sadasd				                ', 'Sample,html,php', '2015-03-01 15:12:03', 'bogo'),
(13, 'title', 'sdfdsfdsfsd				                ', 'Sample,tafs,raf', '2015-03-02 02:09:03', 'sueshen'),
(14, 'bogka', 'dampai				                ', 'Sample,yawa', '2015-03-02 02:49:50', 'bogo'),
(15, 'Edited', 'Edited', 'Edited', '2015-03-03 09:28:24', 'sueshen'),
(16, 'why you not post?', 'awtsut				                ', 'not posting,awtsu', '2015-03-02 22:40:19', 'sueshen'),
(17, 'why you not post?', 'awtsut				                ', 'not posting,awtsu', '2015-03-02 22:41:06', 'sueshen'),
(18, 'i love you teddy bear teddy bear', 'ertyuisrftgyuidtyuirtyuidrtyuirtyuirtyu', 'queenie', '2015-03-03 05:18:36', 'holden'),
(19, 'queenu', '				                queenu', 'queenu', '2015-03-03 05:20:43', 'holden'),
(20, '3', '				                32', 'Sample', '2015-03-03 05:21:16', 'holden'),
(21, 'hoy', 'hoy				                ', 'hoy', '2015-03-03 05:24:35', 'holden'),
(22, '2asda', '2', '2', '2015-03-03 10:28:37', 'jamis');

-- --------------------------------------------------------

--
-- Table structure for table `reply_questions`
--

CREATE TABLE IF NOT EXISTS `reply_questions` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `comments` varchar(100) NOT NULL,
  `date_reply` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `reply_questions`
--

INSERT INTO `reply_questions` (`reply_id`, `topic_id`, `user`, `comments`, `date_reply`) VALUES
(1, 15, 'sueshen', 'adadadas', '2015-03-02 21:18:39'),
(2, 15, 'sueshen', '22dasd', '2015-03-02 21:35:15'),
(3, 15, 'sueshen', '22dasd', '2015-03-02 21:36:28'),
(4, 15, 'sueshen', '22dasd', '2015-03-02 21:38:08'),
(5, 14, 'sueshen', 'dada2dasd', '2015-03-02 21:49:35'),
(6, 15, 'sueshen', 'asdasd', '2015-03-02 21:56:02'),
(7, 15, 'sueshen', 'ako', '2015-03-02 21:56:47'),
(8, 15, 'sueshen', 'sada', '2015-03-02 22:00:32'),
(9, 15, 'sueshen', '15', '2015-03-02 22:03:27'),
(10, 15, 'sueshen', '1234567', '2015-03-02 22:06:59'),
(11, 15, 'sueshen', 'dada', '2015-03-02 22:07:48'),
(12, 15, 'sueshen', 'dadas', '2015-03-02 22:09:40'),
(13, 17, 'admin', 'aa', '2015-03-03 04:59:45'),
(14, 18, 'holden', 'please sagutin mo na ako queenie lodonia. lablab na lablab kita - holdengrantcausing', '2015-03-03 05:19:29'),
(15, 15, 'sueshen', 'DADA', '2015-03-03 09:45:37'),
(16, 15, 'sueshen', 'ada', '2015-03-03 10:02:17'),
(17, 15, 'sueshen', 'dada', '2015-03-03 10:04:39'),
(18, 15, 'sueshen', 'nice', '2015-03-03 10:16:00'),
(19, 15, 'jamis', 'jamis here', '2015-03-03 10:17:55'),
(20, 22, 'jamis', 'yeyeyeyadas', '2015-03-03 10:28:25');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` varchar(10) NOT NULL DEFAULT '1',
  `role` varchar(10) NOT NULL DEFAULT 'ROLE_USER',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `enabled`, `role`) VALUES
(1, 'sueshen', 'sueshen@yahoo.com', '12', '1', 'ROLE_USER'),
(3, 'ako', 'email@yahoo.com', 'ako', '1', 'USER_ROLE'),
(4, 'user', 'user@yahoo.com', 'user', '1', 'USER_ROLE'),
(5, 'bogo', 'bogo@yahoo.com', 'bogo', '1', 'ROLE_USER'),
(6, 'admin', 'marvyn@yahoo.com', 'superadmin', '1', 'ROLE_ADMIN'),
(7, 'holden', 'holdengrantcausing@gmail.com', 'seventhgod', '1', 'ROLE_USER'),
(8, 'jamis', 'jamis@gmail.com', '12345', '1', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `role` varchar(20) DEFAULT 'ROLE_USER',
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
(1, 'sueshen', 'ROLE_USER');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

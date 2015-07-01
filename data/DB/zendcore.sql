-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2015 at 01:38 PM
-- Server version: 5.6.23-log
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `zendcore`
--
CREATE DATABASE IF NOT EXISTS `zendcore` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `zendcore`;

-- --------------------------------------------------------

--
-- Table structure for table `zf2_attributes_list`
--

CREATE TABLE IF NOT EXISTS `zf2_attributes_list` (
  `attr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `attr_group` varchar(50) NOT NULL COMMENT 'user/admin,user/blogger,user/guest,data/page,data/post,data/product',
  `attr_name` varchar(50) NOT NULL,
  `attr_input_type` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `attr_input_attrib` varchar(50) DEFAULT NULL COMMENT 'Input Attributes',
  `attr_default_value` varchar(50) NOT NULL,
  `attr_value_options` text COMMENT 'Value Option List',
  `attr_sort_weight` int(11) NOT NULL,
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Attribute list' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zf2_config_options`
--

CREATE TABLE IF NOT EXISTS `zf2_config_options` (
  `config_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `config_name` varchar(64) NOT NULL,
  `config_value` longtext NOT NULL,
  `config_status` varchar(20) NOT NULL DEFAULT 'CONSTANT' COMMENT 'AUTOLOAD,CONSTANT, ...etc',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `config_name` (`config_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `zf2_config_options`
--

INSERT INTO `zf2_config_options` (`config_id`, `config_name`, `config_value`, `config_status`) VALUES
(1, 'ApplicationPath', 'http://localhost/github/core/core', 'CONSTANT'),
(2, 'applicationName', 'zendcore', 'CONSTANT'),
(3, 'formFields', '{"input":"Input Field","textarea":"Text Area","select":"Select Field","multiselect":"Multiple Select Field"}', 'CONSTANT'),
(4, 'inputTypes', '{"text":"Text Field","email":"Email Address Field","password":"Password Field","url":"URL Field","number":"Number Field","date":"Date Field","radio":"Yes/No Field","checkbox":"Check Box Field","file":"File Select/Upload field"}', 'CONSTANT'),
(5, 'dataTypes', '{"page":"Page","post":"Post","product":"Product"}', 'CONSTANT'),
(6, 'userTypes', '{"admin":"Admin","blogger":"Blogger","guest":"Guest"}', 'CONSTANT'),
(7, 'taxoGroups', '{"main_menu":"Main Menu","blog_category":"Blog Category","product_category":"Product Category"}', 'CONSTANT');

-- --------------------------------------------------------

--
-- Table structure for table `zf2_data`
--

CREATE TABLE IF NOT EXISTS `zf2_data` (
  `data_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'data owner can be different than creater',
  `data_language` varchar(20) NOT NULL DEFAULT 'en',
  `data_type` varchar(20) NOT NULL DEFAULT 'page',
  `data_taxo_id` int(11) NOT NULL DEFAULT '0',
  `data_title` text NOT NULL,
  `data_name` varchar(200) NOT NULL DEFAULT '' COMMENT 'unique identificaion and will be used in url example abuot-us',
  `data_content` longtext NOT NULL,
  `data_status` varchar(20) NOT NULL DEFAULT 'publish' COMMENT 'draft,publish,active,inactive',
  `data_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_created_by` int(11) NOT NULL DEFAULT '1',
  `data_modified_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `data_modified_by` int(11) NOT NULL DEFAULT '1',
  `data_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`data_id`),
  KEY `data_name` (`data_name`(191)),
  KEY `lang_type_status` (`data_id`,`data_language`,`data_type`,`data_status`),
  KEY `data_parent` (`data_parent`),
  KEY `data_user` (`data_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zf2_data_attributes`
--

CREATE TABLE IF NOT EXISTS `zf2_data_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `data_attrib_id` int(11) NOT NULL,
  `data_attrib_value` longtext,
  PRIMARY KEY (`id`),
  KEY `post_id` (`data_id`),
  KEY `meta_key` (`data_attrib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zf2_taxonomy`
--

CREATE TABLE IF NOT EXISTS `zf2_taxonomy` (
  `taxo_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `taxo_group` varchar(50) NOT NULL,
  `taxo_name` varchar(32) NOT NULL DEFAULT '',
  `taxo_description` longtext NOT NULL,
  `taxo_path` varchar(200) NOT NULL,
  `taxo_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxo_is_leaf` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`taxo_id`),
  UNIQUE KEY `term_id_taxonomy` (`taxo_group`,`taxo_name`),
  KEY `taxonomy` (`taxo_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `zf2_taxonomy`
--

INSERT INTO `zf2_taxonomy` (`taxo_id`, `taxo_group`, `taxo_name`, `taxo_description`, `taxo_path`, `taxo_parent`, `taxo_is_leaf`) VALUES
(1, 'main_menu', 'Home', 'home page', '/', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `zf2_user`
--

CREATE TABLE IF NOT EXISTS `zf2_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(50) NOT NULL DEFAULT '',
  `user_pass` varchar(100) NOT NULL DEFAULT '',
  `real_name` varchar(200) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_access_token` varchar(100) NOT NULL DEFAULT '' COMMENT 'Secretkey =user_id+tokenDate+tokenCount',
  `user_registered_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_status` int(11) NOT NULL DEFAULT '0',
  `user_modified_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `user_modified_by` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `zf2_user`
--

INSERT INTO `zf2_user` (`user_id`, `user_login`, `user_pass`, `real_name`, `user_email`, `user_access_token`, `user_registered_at`, `user_status`, `user_modified_at`, `user_modified_by`) VALUES
(1, 'systemadmin', 'system@admin', 'system admin', 'system@admin.com', '', '2015-06-23 17:00:19', 0, '0000-00-00 00:00:00', 1),
(2, 'superadmin', 'super@admin', 'super admin', 'super@site.com', '', '2015-06-23 17:00:19', 0, '0000-00-00 00:00:00', 1),
(3, 'apiadmin', 'api@admin', 'api admin', 'api@admin.com', '', '2015-06-23 17:00:19', 0, '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zf2_user_attributes`
--

CREATE TABLE IF NOT EXISTS `zf2_user_attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_attrib_id` int(11) NOT NULL,
  `user_attrib_value` longtext,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`user_attrib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `zf2_user_logs`
--

CREATE TABLE IF NOT EXISTS `zf2_user_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `log` varchar(200) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `log` (`log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

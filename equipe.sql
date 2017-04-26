/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:58:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for equipe
-- ----------------------------
DROP TABLE IF EXISTS `equipe`;
CREATE TABLE `equipe` (
  `id` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `cargo` varchar(150) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:58:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for usuarios_detalhes
-- ----------------------------
DROP TABLE IF EXISTS `usuarios_detalhes`;
CREATE TABLE `usuarios_detalhes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `login_id` int(11) NOT NULL,
  `rg` varchar(50) DEFAULT NULL,
  `cpf` varchar(50) DEFAULT NULL,
  `nascimento` date DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `sexo` char(255) DEFAULT NULL,
  `cadastradoem` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_id_usuario_fk` (`login_id`),
  CONSTRAINT `login_id_usuario_fk` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

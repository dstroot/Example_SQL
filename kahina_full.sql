/*
Navicat MySQL Data Transfer

Source Server         : Locahost
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : kahina

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2016-02-16 17:59:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for acl_gerenciamento
-- ----------------------------
DROP TABLE IF EXISTS `acl_gerenciamento`;
CREATE TABLE `acl_gerenciamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo_id` int(11) NOT NULL,
  `recurso_id` int(11) NOT NULL,
  `ver` tinyint(1) NOT NULL DEFAULT '0',
  `cadastrar` tinyint(1) NOT NULL DEFAULT '0',
  `editar` tinyint(1) NOT NULL DEFAULT '0',
  `excluir` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `acl_grupo_fk` (`grupo_id`),
  KEY `acl_recurso_fk` (`recurso_id`),
  CONSTRAINT `acl_grupo_fk` FOREIGN KEY (`grupo_id`) REFERENCES `acl_grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `acl_recurso_fk` FOREIGN KEY (`recurso_id`) REFERENCES `acl_recursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_gerenciamento
-- ----------------------------

-- ----------------------------
-- Table structure for acl_grupos
-- ----------------------------
DROP TABLE IF EXISTS `acl_grupos`;
CREATE TABLE `acl_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_grupos
-- ----------------------------

-- ----------------------------
-- Table structure for acl_grupo_login
-- ----------------------------
DROP TABLE IF EXISTS `acl_grupo_login`;
CREATE TABLE `acl_grupo_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_grupo_fk` (`login_id`),
  KEY `grupo_id_fk` (`grupo_id`),
  CONSTRAINT `grupo_id_fk` FOREIGN KEY (`grupo_id`) REFERENCES `acl_grupos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `login_grupo_fk` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_grupo_login
-- ----------------------------

-- ----------------------------
-- Table structure for acl_recursos
-- ----------------------------
DROP TABLE IF EXISTS `acl_recursos`;
CREATE TABLE `acl_recursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recurso` varchar(100) NOT NULL,
  `modulo` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of acl_recursos
-- ----------------------------

-- ----------------------------
-- Table structure for blog_categorias
-- ----------------------------
DROP TABLE IF EXISTS `blog_categorias`;
CREATE TABLE `blog_categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_categorias
-- ----------------------------

-- ----------------------------
-- Table structure for blog_comentarios
-- ----------------------------
DROP TABLE IF EXISTS `blog_comentarios`;
CREATE TABLE `blog_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` text NOT NULL,
  `comentadoem` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `aprovado` tinyint(1) NOT NULL,
  `login_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_id` (`login_id`),
  CONSTRAINT `blog_comentarios_ibfk_1` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comentarios
-- ----------------------------

-- ----------------------------
-- Table structure for blog_postagem
-- ----------------------------
DROP TABLE IF EXISTS `blog_postagem`;
CREATE TABLE `blog_postagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(150) NOT NULL,
  `postagem` mediumtext NOT NULL,
  `categoria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL COMMENT 'Autor',
  `imagem` varchar(255) NOT NULL,
  `postadoem` datetime NOT NULL,
  `tags` text NOT NULL,
  `alteradoem` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `blog_postagem_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `blog_categorias` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_postagem_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios_detalhes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_postagem
-- ----------------------------

-- ----------------------------
-- Table structure for cursos
-- ----------------------------
DROP TABLE IF EXISTS `cursos`;
CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `curso` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cursos
-- ----------------------------

-- ----------------------------
-- Table structure for cursos_horarios
-- ----------------------------
DROP TABLE IF EXISTS `cursos_horarios`;
CREATE TABLE `cursos_horarios` (
  `id` int(11) NOT NULL,
  `equipe_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `dia` varchar(50) NOT NULL,
  `horario` time NOT NULL,
  `nivel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `equipe_id` (`equipe_id`),
  KEY `curso_id` (`curso_id`),
  CONSTRAINT `cursos_horarios_ibfk_1` FOREIGN KEY (`equipe_id`) REFERENCES `equipe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cursos_horarios_ibfk_2` FOREIGN KEY (`curso_id`) REFERENCES `cursos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cursos_horarios
-- ----------------------------

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

-- ----------------------------
-- Records of equipe
-- ----------------------------

-- ----------------------------
-- Table structure for eventos
-- ----------------------------
DROP TABLE IF EXISTS `eventos`;
CREATE TABLE `eventos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `evento` varchar(255) NOT NULL,
  `imagem` varchar(255) NOT NULL,
  `iniciaem` date NOT NULL,
  `finalizaem` date NOT NULL,
  `descricao` text NOT NULL,
  `horario` time NOT NULL,
  `local` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eventos
-- ----------------------------

-- ----------------------------
-- Table structure for galeria_album
-- ----------------------------
DROP TABLE IF EXISTS `galeria_album`;
CREATE TABLE `galeria_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(80) NOT NULL,
  `criadoem` datetime NOT NULL,
  `descricao` text NOT NULL,
  `fid` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of galeria_album
-- ----------------------------
INSERT INTO `galeria_album` VALUES ('2', 'Teste247', '2016-02-04 16:51:55', 'Teste610', 'FB8524625926');
INSERT INTO `galeria_album` VALUES ('3', 'Teste385', '2016-02-04 16:51:59', 'Teste300', 'FB1744900627');
INSERT INTO `galeria_album` VALUES ('5', 'Teste665', '2016-02-04 16:54:24', 'Teste554', 'FB2580330317');
INSERT INTO `galeria_album` VALUES ('6', 'Teste198', '2016-02-04 17:50:25', 'Teste888', 'FB4652812431');

-- ----------------------------
-- Table structure for galeria_fotos
-- ----------------------------
DROP TABLE IF EXISTS `galeria_fotos`;
CREATE TABLE `galeria_fotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL,
  `album_id` int(11) NOT NULL,
  `legenda` varchar(200) DEFAULT NULL,
  `capa` smallint(1) DEFAULT '0',
  `ordem` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `album_id` (`album_id`),
  CONSTRAINT `galeria_fotos_ibfk_1` FOREIGN KEY (`album_id`) REFERENCES `galeria_album` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of galeria_fotos
-- ----------------------------
INSERT INTO `galeria_fotos` VALUES ('29', 'file_201602160505.jpg', '6', null, '0', null);
INSERT INTO `galeria_fotos` VALUES ('30', 'file_201602160507.jpg', '6', null, '0', null);
INSERT INTO `galeria_fotos` VALUES ('31', 'file_201602160509.png', '6', null, '0', null);
INSERT INTO `galeria_fotos` VALUES ('32', 'file_201602160512.png', '6', null, '0', null);

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `tipoid` int(11) NOT NULL,
  `bloqueado` tinyint(4) NOT NULL DEFAULT '0',
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipologin_fk` (`tipoid`),
  CONSTRAINT `tipologin_fk` FOREIGN KEY (`tipoid`) REFERENCES `login_tipo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES ('1', 'arthr', 'e10adc3949ba59abbe56e057f20f883e', '3', '0', null);

-- ----------------------------
-- Table structure for login_recuperar
-- ----------------------------
DROP TABLE IF EXISTS `login_recuperar`;
CREATE TABLE `login_recuperar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_id` int(11) NOT NULL,
  `solicitadoem` datetime NOT NULL,
  `expiraem` datetime NOT NULL,
  `utilizado` tinyint(1) NOT NULL DEFAULT '0',
  `chave` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `login_id_fk` (`login_id`),
  CONSTRAINT `login_id_fk` FOREIGN KEY (`login_id`) REFERENCES `login` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_recuperar
-- ----------------------------

-- ----------------------------
-- Table structure for login_tipo
-- ----------------------------
DROP TABLE IF EXISTS `login_tipo`;
CREATE TABLE `login_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_tipo
-- ----------------------------
INSERT INTO `login_tipo` VALUES ('1', 'adm');
INSERT INTO `login_tipo` VALUES ('3', 'dev');
INSERT INTO `login_tipo` VALUES ('2', 'user');

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

-- ----------------------------
-- Records of usuarios_detalhes
-- ----------------------------

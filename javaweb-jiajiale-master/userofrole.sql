/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : 127.0.0.1:3306
Source Database       : apms

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-02-13 20:19:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for userofrole
-- ----------------------------
DROP TABLE IF EXISTS `userofrole`;
CREATE TABLE `userofrole` (
  `user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` char(32) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `userofrole_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`id`),
  CONSTRAINT `userofrole_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of userofrole
-- ----------------------------
INSERT INTO `userofrole` VALUES ('dd294dd6c72b903b1784ee21f42a190e', '29e8d63ee89276098e346a348ca243f3');
INSERT INTO `userofrole` VALUES ('dd294dd6c72b903b1784ee21f42a190e', 'b42211a44abb5f2bb80445f8bf848e13');

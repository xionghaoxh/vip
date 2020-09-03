/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80017
Source Host           : 127.0.0.1:3306
Source Database       : apms

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2020-02-13 20:19:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `code` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `remark` varchar(512) DEFAULT NULL,
  `create_user_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('00000000000000000000000000000000', 'administrator', '超级管理员', null, '00000000000000000000000000000000', '2018-07-18 19:28:18');
INSERT INTO `sys_role` VALUES ('29e8d63ee89276098e346a348ca243f3', 'system', '管理员', '负责系统维护的管理人员', '00000000000000000000000000000000', '2018-07-17 19:27:41');
INSERT INTO `sys_role` VALUES ('96879ea1cb0c9298f4f45e7abe3094c2', 'test', '测试角色', '仅用于测试', '00000000000000000000000000000000', '2018-08-14 08:47:07');
INSERT INTO `sys_role` VALUES ('b42211a44abb5f2bb80445f8bf848e13', 'employee', '普通员工', '企业内部的员工', '00000000000000000000000000000000', '2018-07-17 19:27:43');
INSERT INTO `sys_role` VALUES ('e764c68c915edef9eef4100ef07447fc', 'manager', '部门经理', '企业内部的某个部门的负责人', '00000000000000000000000000000000', '2018-07-17 19:27:45');

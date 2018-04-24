/*
 Navicat Premium Data Transfer

 Source Server         : pi
 Source Server Type    : MariaDB
 Source Server Version : 100123
 Source Host           : 192.168.155.2:3306
 Source Schema         : Test

 Target Server Type    : MariaDB
 Target Server Version : 100123
 File Encoding         : 65001

 Date: 20/04/2018 22:44:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for newsys
-- ----------------------------
DROP TABLE IF EXISTS `newsys`;
CREATE TABLE `newsys`  (
  `ID` int(6) NOT NULL AUTO_INCREMENT,
  `time` datetime(6) NOT NULL,
  `humidity` float(5, 0) NULL DEFAULT NULL COMMENT '%',
  `temperature` float(5, 0) NULL DEFAULT NULL COMMENT 'C',
  `light` float(5, 0) NULL DEFAULT NULL COMMENT 'lx',
  `HCSR04` int(5) NULL DEFAULT NULL,
  `sysm` float(5, 0) NULL DEFAULT NULL COMMENT '%',
  `syscu` float(5, 0) NULL DEFAULT NULL,
  `sysct` float(5, 0) NULL DEFAULT NULL COMMENT 'C',
  `备注` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

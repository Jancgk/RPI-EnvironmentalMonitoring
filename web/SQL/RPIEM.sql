/*
创建选择数据库
新建查询并粘贴以下内容执行
*/
/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : rpiem

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 24/04/2018 09:15:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_table
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table`  (
  `ID` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dht11_refreshtime` int(3) NULL DEFAULT NULL COMMENT '当为0时禁用设备',
  `gy30_refreshtime` int(3) NULL DEFAULT NULL,
  `hcsr04_refreshtime` int(3) NULL DEFAULT NULL,
  `sys_monitor` int(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sensor_dht11
-- ----------------------------
DROP TABLE IF EXISTS `sensor_dht11`;
CREATE TABLE `sensor_dht11`  (
  `ID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `humidity` float(255, 0) NULL DEFAULT NULL,
  `temperature` float(255, 0) NULL DEFAULT NULL,
  `备注` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sensor_gy30
-- ----------------------------
DROP TABLE IF EXISTS `sensor_gy30`;
CREATE TABLE `sensor_gy30`  (
  `ID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `light` float(255, 0) NULL DEFAULT NULL COMMENT 'lx',
  `备注` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sensor_hcsr04
-- ----------------------------
DROP TABLE IF EXISTS `sensor_hcsr04`;
CREATE TABLE `sensor_hcsr04`  (
  `ID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `distance` float(255, 0) NULL DEFAULT NULL COMMENT 'cm',
  `sensor_sound` int(2) NULL DEFAULT NULL COMMENT '用于激活hc-sr04传感器',
  `备注` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_monitor
-- ----------------------------
DROP TABLE IF EXISTS `sys_monitor`;
CREATE TABLE `sys_monitor`  (
  `ID` int(11) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `timestamp` bigint(20) NOT NULL,
  `time` datetime(6) NULL DEFAULT NULL,
  `distance` float(255, 0) NULL DEFAULT NULL COMMENT 'cm',
  `sensor_sound` int(2) NULL DEFAULT NULL COMMENT '用于激活hc-sr04传感器',
  `备注` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

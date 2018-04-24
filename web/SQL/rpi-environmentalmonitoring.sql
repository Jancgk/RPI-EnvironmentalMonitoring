/*
Navicat MySQL Data Transfer

Source Server         : localhost3307
Source Server Version : 50720
Source Host           : localhost:3307
Source Database       : rpi-environmentalmonitoring

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-04-22 12:44:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_table
-- ----------------------------
DROP TABLE IF EXISTS `admin_table`;
CREATE TABLE `admin_table` (
  `ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_table
-- ----------------------------
INSERT INTO `admin_table` VALUES ('00001', 'admin', 'b32946ff0b24c360f7f20e5ff137d54c');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `ID` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `time` bigint(13) NOT NULL,
  `humidity` float(5,0) NOT NULL,
  `temperature` float(5,0) NOT NULL,
  `light` float(5,0) NOT NULL,
  `HCSR04` int(5) NOT NULL,
  `sysm` float(5,0) NOT NULL,
  `syscu` float(5,0) NOT NULL,
  `sysct` float(5,0) NOT NULL,
  `备注` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('000001', '1524285875164', '50', '20', '30', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000002', '1524287270230', '55', '26', '32', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000003', '1524287285813', '56', '25', '25', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000004', '1524287385813', '54', '16', '35', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000005', '1524287485813', '66', '26', '36', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000006', '1524287585813', '55', '20', '38', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000007', '1524287685813', '50', '18', '29', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000008', '1524287785813', '35', '20', '25', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000009', '1524287985813', '70', '19', '25', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000010', '1524288085813', '60', '26', '26', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000011', '1524291085813', '55', '26', '27', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000012', '1524292085813', '35', '25', '28', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000013', '1524293085813', '40', '28', '25', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000014', '1524294085813', '44', '29', '25', '2', '2', '2', '2', 'test');
INSERT INTO `test` VALUES ('000015', '1524295085813', '50', '26', '26', '2', '2', '2', '2', 'test');

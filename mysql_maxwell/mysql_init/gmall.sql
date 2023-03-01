/*
 Navicat MySQL Data Transfer

 Source Server         : gmall
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : hadoop102:3306
 Source Schema         : gmall

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : 65001

 Date: 18/11/2020 17:26:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
USE gmall;
-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_info`;
CREATE TABLE `activity_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `activity_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `activity_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类型（1：满减，2：折扣）',
  `activity_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动描述',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_info
-- ----------------------------
INSERT INTO `activity_info` VALUES (1, '联想专场', '3101', '联想满减', '2020-10-21 18:49:12', '2020-10-31 18:49:15', NULL);
INSERT INTO `activity_info` VALUES (2, 'Apple品牌日', '3101', 'Apple品牌日', '2020-06-10 00:00:00', '2020-06-12 00:00:00', NULL);
INSERT INTO `activity_info` VALUES (3, '女神节', '3102', '满件打折', '2020-03-08 00:00:00', '2020-03-09 00:00:00', NULL);
-- ----------------------------
-- Table structure for activity_rule
-- ----------------------------


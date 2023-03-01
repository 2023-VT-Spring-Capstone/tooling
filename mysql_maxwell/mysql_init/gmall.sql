SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
USE gmall;
-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_info`;
CREATE TABLE `activity_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'event_id',
  `activity_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'event_name',
  `activity_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'event_type',
  `activity_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'event_description',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT 'start_time',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT 'end_time',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT 'create_time',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'event_table' ROW_FORMAT = Dynamic;


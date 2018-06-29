/*
 Navicat Premium Data Transfer

 Source Server         : mysql5
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : localhost:3306
 Source Schema         : magnetic_valve_data

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 25/06/2018 09:48:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for mv_cycle
-- ----------------------------
DROP TABLE IF EXISTS `mv_cycle`;
CREATE TABLE `mv_cycle`  (
  `cycle_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '周期id',
  `cycle_monday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期一',
  `cycle_tuesday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期二',
  `cycle_wednesday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期三',
  `cycle_thursday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期四',
  `cycle_friday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期五',
  `cycle_saturday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期六',
  `cycle_sunday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '星期日',
  PRIMARY KEY (`cycle_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mv_link
-- ----------------------------
DROP TABLE IF EXISTS `mv_link`;
CREATE TABLE `mv_link`  (
  `project_id` int(100) NOT NULL COMMENT '方案id',
  `valve_id` int(100) NOT NULL COMMENT '电磁阀id',
  PRIMARY KEY (`project_id`, `valve_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mv_log
-- ----------------------------
DROP TABLE IF EXISTS `mv_log`;
CREATE TABLE `mv_log`  (
  `log_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `log_action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '动作',
  `log_action_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '动作时间',
  `log_duration` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时长',
  `log_humidity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '湿度',
  `log_voice_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音模块状态',
  `valve_id` int(100) NULL DEFAULT NULL COMMENT '电磁阀id',
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `valve_id`(`valve_id`) USING BTREE,
  CONSTRAINT `mv_log_ibfk_1` FOREIGN KEY (`valve_id`) REFERENCES `mv_valve` (`valve_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mv_log
-- ----------------------------
INSERT INTO `mv_log` VALUES (2, '关闭电磁阀', '2018-06-21 15:12:03', NULL, '50%', '开启', NULL);

-- ----------------------------
-- Table structure for mv_project
-- ----------------------------
DROP TABLE IF EXISTS `mv_project`;
CREATE TABLE `mv_project`  (
  `project_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '方案id',
  `project_plant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '植物类型',
  `project_seasons` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '季节',
  `project_lovation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `project_open1` timestamp(0) NULL DEFAULT NULL COMMENT '第一个开启时间',
  `project_close1` timestamp(0) NULL DEFAULT NULL COMMENT '第一个关闭时间',
  `project_describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '描述',
  `project_specialist` tinyint(10) NULL DEFAULT NULL COMMENT '是否为专家系统',
  `cycle_id` int(100) NULL DEFAULT NULL COMMENT '周期id',
  PRIMARY KEY (`project_id`) USING BTREE,
  INDEX `cycle_id`(`cycle_id`) USING BTREE,
  CONSTRAINT `mv_project_ibfk_1` FOREIGN KEY (`cycle_id`) REFERENCES `mv_cycle` (`cycle_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mv_user
-- ----------------------------
DROP TABLE IF EXISTS `mv_user`;
CREATE TABLE `mv_user`  (
  `user_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `user_sex` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `user_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `user_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `valve_id` int(100) NULL DEFAULT NULL COMMENT '电磁阀id',
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `valve_id`(`valve_id`) USING BTREE,
  CONSTRAINT `mv_user_ibfk_1` FOREIGN KEY (`valve_id`) REFERENCES `mv_valve` (`valve_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mv_user
-- ----------------------------
INSERT INTO `mv_user` VALUES (3, 'Tom', '924cf0f4f319de107f27841ad6bdb15e', '男', '江西', 'email', '110', 1);
INSERT INTO `mv_user` VALUES (4, 'ding', '924cf0f4f319de107f27841ad6bdb15e', NULL, NULL, NULL, NULL, 1);
INSERT INTO `mv_user` VALUES (6, 'dings', '924cf0f4f319de107f27841ad6bdb15e', NULL, NULL, NULL, NULL, 1);
INSERT INTO `mv_user` VALUES (7, '丁', '924cf0f4f319de107f27841ad6bdb15e', NULL, NULL, NULL, NULL, 1);

-- ----------------------------
-- Table structure for mv_valve
-- ----------------------------
DROP TABLE IF EXISTS `mv_valve`;
CREATE TABLE `mv_valve`  (
  `valve_id` int(100) NOT NULL AUTO_INCREMENT COMMENT '电磁阀id',
  `valve_humidity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '湿度',
  `valve_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '阀门状态',
  `valve_plant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '植物类型',
  `valve_voice_state` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语音模块类型',
  PRIMARY KEY (`valve_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mv_valve
-- ----------------------------
INSERT INTO `mv_valve` VALUES (1, NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;

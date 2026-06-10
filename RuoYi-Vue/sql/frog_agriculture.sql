/*
 Navicat Premium Data Transfer

 Source Server         : ruoyi
 Source Server Type    : MySQL
 Source Server Version : 90000
 Source Host           : localhost:3306
 Source Schema         : frog_agriculture

 Target Server Type    : MySQL
 Target Server Version : 90000
 File Encoding         : 65001

 Date: 08/06/2026 20:40:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agriculture_baseinfo
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_baseinfo`;
CREATE TABLE `agriculture_baseinfo`  (
  `base_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '基地ID',
  `base_short_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地简称',
  `base_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地编号',
  `base_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地全称',
  `base_leader` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地负责人',
  `leader_tel` varchar(17) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地负责人电话',
  `base_address` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地负责人地址',
  `base_area` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地面积',
  `base_altitude` int NOT NULL DEFAULT 0 COMMENT '基地海拔',
  `base_img` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '现场图片',
  `base_des` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '基地描述',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `base_coordinate` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`base_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '基地信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_baseinfo
-- ----------------------------
INSERT INTO `agriculture_baseinfo` VALUES (2, '环湖农业', '001', '环湖农业数智水稻', '王梦', '18325209791', '重庆巴南', '50', 5, '/profile/upload/2026/06/01/微信图片_20260601181453_117_102_20260601225612A001.png', '校级项目', '综合实践', '0', 0, 0, '2023-05-17 08:22:14', 0, '2026-06-01 22:56:17', '0', '106.33,29.20');

-- ----------------------------
-- Table structure for agriculture_batch_task
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_batch_task`;
CREATE TABLE `agriculture_batch_task`  (
  `task_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `batch_id` bigint UNSIGNED NULL DEFAULT NULL COMMENT '批次ID',
  `task_head` bigint UNSIGNED NULL DEFAULT NULL COMMENT '任务负责人',
  `task_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `plan_start` datetime NULL DEFAULT NULL COMMENT '计划开始日期',
  `plan_finish` datetime NULL DEFAULT NULL COMMENT '计划结束日期',
  `actual_start` datetime NULL DEFAULT NULL COMMENT '实际开始日期',
  `actual_finish` datetime NULL DEFAULT NULL COMMENT '实际结束日期',
  `task_detail` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '任务详情',
  `task_images` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '图片资料',
  `task_videos` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL COMMENT '视频资料',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '批次任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_batch_task
-- ----------------------------
INSERT INTO `agriculture_batch_task` VALUES (1, 3, 3, '播种', '2023-06-06 00:00:00', '2023-06-20 00:00:00', '2023-08-16 00:00:00', '2023-08-18 00:00:00', '', '/profile/upload/2023/08/21/ca461769-4668-4069-99ce-deba7643ab2c.jpg,/profile/upload/2023/08/21/6440b3ed-20c1-456e-a895-c12c68e8bd64.jpg', '', '记得记得就好的好的基督教好', '0', 0, 0, NULL, 1, '2023-09-14 09:47:40', '0');
INSERT INTO `agriculture_batch_task` VALUES (2, 3, NULL, '浇水1', '2023-06-13 00:00:00', '2023-06-27 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (3, 3, NULL, '采摘', '2023-07-04 00:00:00', '2023-07-11 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (4, 4, 1, '育苗', '2023-06-06 00:00:00', '2023-06-20 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 1, '2023-08-14 09:26:44', '0');
INSERT INTO `agriculture_batch_task` VALUES (5, 4, NULL, '铺膜', '2023-06-20 00:00:00', '2023-06-27 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (6, 4, NULL, '育苗完成', '2023-07-04 00:00:00', '2023-07-11 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (7, 4, NULL, '定植', '2023-07-11 00:00:00', '2023-07-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (8, 4, NULL, '植保防护', '2023-07-18 00:00:00', '2023-07-25 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (9, 4, NULL, '授粉', '2023-08-01 00:00:00', '2023-08-08 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (10, 5, NULL, '育苗', '2023-06-06 00:00:00', '2023-06-20 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (11, 5, NULL, '铺膜', '2023-06-20 00:00:00', '2023-06-27 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (12, 5, NULL, '育苗完成', '2023-07-04 00:00:00', '2023-07-11 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (13, 5, NULL, '定植', '2023-07-11 00:00:00', '2023-07-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (14, 5, NULL, '植保防护', '2023-07-18 00:00:00', '2023-07-25 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (15, 5, NULL, '授粉', '2023-08-01 00:00:00', '2023-08-08 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (16, 5, NULL, '修剪侧蔓', '2023-08-15 00:00:00', '2023-08-22 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (17, 5, NULL, '坐果期', '2023-08-22 00:00:00', '2023-08-29 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (18, 5, NULL, '膨果期', '2023-08-29 00:00:00', '2023-09-05 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (19, 5, NULL, '结果期', '2023-09-05 00:00:00', '2023-09-12 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (20, 5, NULL, '采摘', '2023-09-12 00:00:00', '2023-09-19 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (21, 36, NULL, '育苗', '2023-06-12 00:00:00', '2023-06-26 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (22, 36, NULL, '铺膜', '2023-06-26 00:00:00', '2023-07-03 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (23, 36, NULL, '育苗完成', '2023-07-10 00:00:00', '2023-07-17 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (24, 36, NULL, '定植', '2023-07-17 00:00:00', '2023-07-24 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (25, 36, NULL, '植保防护', '2023-07-24 00:00:00', '2023-07-31 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (26, 36, NULL, '授粉', '2023-08-07 00:00:00', '2023-08-14 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (27, 36, NULL, '修剪侧蔓', '2023-08-21 00:00:00', '2023-08-28 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (28, 36, NULL, '坐果期', '2023-08-28 00:00:00', '2023-09-04 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (29, 36, NULL, '膨果期', '2023-09-04 00:00:00', '2023-09-11 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (30, 36, NULL, '结果期', '2023-09-11 00:00:00', '2023-09-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (31, 36, NULL, '采摘', '2023-09-18 00:00:00', '2023-09-25 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (32, 37, NULL, '育苗', '2023-06-16 00:00:00', '2023-06-30 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (33, 37, NULL, '铺膜', '2023-06-30 00:00:00', '2023-07-07 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (34, 37, NULL, '育苗完成', '2023-07-14 00:00:00', '2023-07-21 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (35, 37, NULL, '定植', '2023-07-21 00:00:00', '2023-07-28 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (36, 37, NULL, '植保防护', '2023-07-28 00:00:00', '2023-08-04 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (37, 37, NULL, '授粉', '2023-08-11 00:00:00', '2023-08-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (38, 37, NULL, '修剪侧蔓', '2023-08-25 00:00:00', '2023-09-01 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (39, 37, NULL, '坐果期', '2023-09-01 00:00:00', '2023-09-08 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (40, 37, NULL, '膨果期', '2023-09-08 00:00:00', '2023-09-15 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (41, 37, NULL, '结果期', '2023-09-15 00:00:00', '2023-09-22 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (42, 37, NULL, '采摘', '2023-09-22 00:00:00', '2023-09-29 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (43, 38, NULL, '育苗', '2023-06-14 00:00:00', '2023-06-28 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (44, 38, NULL, '铺膜', '2023-06-28 00:00:00', '2023-07-05 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (45, 38, NULL, '育苗完成', '2023-07-12 00:00:00', '2023-07-19 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (46, 38, NULL, '定植', '2023-07-19 00:00:00', '2023-07-26 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (47, 38, NULL, '植保防护', '2023-07-26 00:00:00', '2023-08-02 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (48, 38, NULL, '授粉', '2023-08-09 00:00:00', '2023-08-16 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (49, 38, NULL, '修剪侧蔓', '2023-08-23 00:00:00', '2023-08-30 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (50, 38, NULL, '坐果期', '2023-08-30 00:00:00', '2023-09-06 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (51, 38, NULL, '膨果期', '2023-09-06 00:00:00', '2023-09-13 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (52, 38, NULL, '结果期', '2023-09-13 00:00:00', '2023-09-20 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (53, 38, NULL, '采摘', '2023-09-20 00:00:00', '2023-09-27 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (54, 39, NULL, '育苗', '2023-06-05 00:00:00', '2023-06-19 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (55, 39, NULL, '铺膜', '2023-06-19 00:00:00', '2023-06-26 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (56, 39, NULL, '育苗完成', '2023-07-03 00:00:00', '2023-07-10 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (57, 39, NULL, '定植', '2023-07-10 00:00:00', '2023-07-17 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (58, 39, NULL, '植保防护', '2023-07-17 00:00:00', '2023-07-24 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (59, 39, NULL, '授粉', '2023-07-31 00:00:00', '2023-08-07 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (60, 39, NULL, '修剪侧蔓', '2023-08-14 00:00:00', '2023-08-21 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (61, 39, NULL, '坐果期', '2023-08-21 00:00:00', '2023-08-28 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (62, 39, NULL, '膨果期', '2023-08-28 00:00:00', '2023-09-04 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (63, 39, NULL, '结果期', '2023-09-04 00:00:00', '2023-09-11 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (64, 39, NULL, '采摘', '2023-09-11 00:00:00', '2023-09-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (65, 40, NULL, '育苗', '2023-06-13 00:00:00', '2023-06-27 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (66, 40, NULL, '铺膜', '2023-06-27 00:00:00', '2023-07-04 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (67, 40, NULL, '育苗完成', '2023-07-11 00:00:00', '2023-07-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (68, 40, NULL, '定植', '2023-07-18 00:00:00', '2023-07-25 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (69, 40, NULL, '植保防护', '2023-07-25 00:00:00', '2023-08-01 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (70, 40, NULL, '授粉', '2023-08-08 00:00:00', '2023-08-15 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (71, 40, NULL, '修剪侧蔓', '2023-08-22 00:00:00', '2023-08-29 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (72, 40, NULL, '坐果期', '2023-08-29 00:00:00', '2023-09-05 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (73, 40, NULL, '膨果期', '2023-09-05 00:00:00', '2023-09-12 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (74, 40, NULL, '结果期', '2023-09-12 00:00:00', '2023-09-19 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (75, 40, NULL, '采摘', '2023-09-19 00:00:00', '2023-09-26 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (76, 41, 1, '育苗', '2023-06-13 00:00:00', '2023-06-05 00:00:00', '2023-06-01 00:00:00', '2023-06-05 00:00:00', '哈哈2211', '/profile/iot/1/2023-0614-113757.jpeg', '/profile/upload/2023/06/14/5d36fb25-fc35-4875-8e1f-dbc34ede3a9d.mp4', '12121212我的refer问问哈哈哈哈哈哈', '2', 0, 0, NULL, 8, '2023-08-27 15:36:23', '0');
INSERT INTO `agriculture_batch_task` VALUES (77, 41, 7, '铺膜', '2023-06-27 00:00:00', '2023-07-04 00:00:00', '2023-06-05 00:00:00', NULL, '', NULL, NULL, '这里是任务的具体描述', '2', 0, 0, NULL, 1, '2023-09-25 17:48:33', '0');
INSERT INTO `agriculture_batch_task` VALUES (78, 41, 7, '育苗完成', '2023-07-11 00:00:00', '2023-07-18 00:00:00', NULL, NULL, '', NULL, NULL, '', '2', 0, 0, NULL, 1, '2023-06-14 11:44:16', '0');
INSERT INTO `agriculture_batch_task` VALUES (79, 41, 3, '定植', '2023-07-18 00:00:00', '2023-07-25 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 1, '2023-06-14 11:44:39', '0');
INSERT INTO `agriculture_batch_task` VALUES (80, 41, 7, '植保防护', '2023-07-25 00:00:00', '2023-08-01 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (81, 41, 3, '授粉', '2023-08-08 00:00:00', '2023-08-15 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 1, '2023-06-14 11:48:36', '0');
INSERT INTO `agriculture_batch_task` VALUES (82, 41, 7, '修剪侧蔓', '2023-08-22 00:00:00', '2023-08-29 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (83, 41, 7, '坐果期', '2023-08-29 00:00:00', '2023-09-05 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (84, 41, 7, '膨果期', '2023-09-05 00:00:00', '2023-09-12 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (85, 41, 7, '结果期', '2023-09-12 00:00:00', '2023-09-19 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (86, 41, 7, '采摘', '2023-09-19 00:00:00', '2023-09-26 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 0, NULL, 0, NULL, '0');
INSERT INTO `agriculture_batch_task` VALUES (87, 41, NULL, '测试测试', '2023-08-01 00:00:00', '2023-08-17 00:00:00', NULL, NULL, '', NULL, NULL, '', '0', 0, 8, '2023-08-27 14:14:30', 0, NULL, '2');
INSERT INTO `agriculture_batch_task` VALUES (88, 42, 1, '播种', '2023-09-12 00:00:00', '2023-09-12 00:00:00', NULL, NULL, '', NULL, NULL, '', '3', 0, 0, NULL, 1, '2023-09-05 13:36:36', '0');
INSERT INTO `agriculture_batch_task` VALUES (89, 42, 1, '收获', '2023-09-19 00:00:00', '2023-09-19 00:00:00', NULL, NULL, '', NULL, NULL, '', '1', 0, 0, NULL, 1, '2023-09-05 14:11:51', '0');

-- ----------------------------
-- Table structure for agriculture_crop_batch
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_crop_batch`;
CREATE TABLE `agriculture_crop_batch`  (
  `batch_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '批次ID',
  `batch_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '批次名称',
  `germplasm_id` bigint NOT NULL COMMENT '种质ID',
  `land_id` bigint NOT NULL DEFAULT 0 COMMENT '地块ID',
  `crop_area` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '种植面积（亩）',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `batch_head` bigint NOT NULL DEFAULT 0 COMMENT '负责人Id',
  PRIMARY KEY (`batch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '作物批次表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_crop_batch
-- ----------------------------
INSERT INTO `agriculture_crop_batch` VALUES (46, '006', 4, 7, 3.00, '2026-06-03 00:00:00', '', '0', 0, 0, '2026-06-03 14:27:19', 0, NULL, '0', 1);
INSERT INTO `agriculture_crop_batch` VALUES (47, '002', 5, 9, 6.00, '2026-06-02 00:00:00', '', '0', 0, 0, '2026-06-03 16:45:12', 0, NULL, '0', 102);
INSERT INTO `agriculture_crop_batch` VALUES (48, '001', 6, 8, 4.00, '2026-06-02 00:00:00', '', '0', 0, 0, '2026-06-03 16:45:47', 0, '2026-06-03 16:48:10', '0', 102);
INSERT INTO `agriculture_crop_batch` VALUES (49, '大棚西瓜实验1区', 1, 10, 6.00, '2026-06-01 00:00:00', '', '0', 0, 0, '2026-06-03 16:48:42', 0, NULL, '0', 1);

-- ----------------------------
-- Table structure for agriculture_employee
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_employee`;
CREATE TABLE `agriculture_employee`  (
  `employee_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '雇员ID',
  `employee_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '编码',
  `employee_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `employee_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '字典 agriculture_employee_type',
  `employee_tel` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `employee_sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '字典 sys_user_sex',
  `employee_address` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`employee_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '雇员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_employee
-- ----------------------------
INSERT INTO `agriculture_employee` VALUES (5, '1001', '王梦', '0', '18325209791', '0', '重庆市巴南区龙洲湾街道', '程序员', '0', 1, 0, '2026-06-01 17:28:07', 0, '2026-06-01 20:43:23', '0');
INSERT INTO `agriculture_employee` VALUES (6, '1002', '陈宇', '0', '15588877456', '0', '重庆市巴南区', '5.31临时招聘', '0', 3, 0, '2026-06-02 09:10:09', 0, NULL, '0');
INSERT INTO `agriculture_employee` VALUES (7, '1002', '郭浩铭', '1', '15564856697', '0', '重庆市江北区', '临时工6.7号完工，未发工资', '0', 3, 0, '2026-06-02 09:10:53', 0, '2026-06-03 16:02:50', '0');
INSERT INTO `agriculture_employee` VALUES (8, '1004', '罗一凡', '0', '13266458879', '0', '重庆市高新技术开发区', '跳蚤市场员工', '0', 6, 0, '2026-06-02 09:11:36', 0, '2026-06-06 11:18:27', '0');

-- ----------------------------
-- Table structure for agriculture_germplasm
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_germplasm`;
CREATE TABLE `agriculture_germplasm`  (
  `germplasm_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '种质ID',
  `crop_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '作物名称',
  `crop_en_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '作物英文名称',
  `germplasm_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '种质名称',
  `germplasm_en_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '种质英文名称',
  `germplasm_img` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '种质图片',
  `germplasm_des` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '宣传语',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`germplasm_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '种质表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_germplasm
-- ----------------------------
INSERT INTO `agriculture_germplasm` VALUES (1, '西瓜', 'watermelon', '陕西瓜', 'watermelon_SX', '/profile/agriculture/germplasm/2026/06/03/微信图片_20260603105917_300_102_20260603110141A001.png', '西瓜是一种夏季消暑的好选择，其含有丰富的水分和天然的清凉成分，能够有效地降低体温。除了降热解暑，西瓜皮还可以用来炒着吃或伴着吃，制成药材来治疗肾炎水肿、肝病黄疸等疾病，甚至可以作为美容材料用来敷脸。因此，夏季食用西瓜不仅能够解暑，还能保持身体健康。', '1', '0', 0, 1, '2023-05-18 09:35:37', 1, '2026-06-03 16:50:03', '0');
INSERT INTO `agriculture_germplasm` VALUES (4, '水稻', 'rice', '籼稻', 'indica_rice', '/profile/agriculture/germplasm/2026/06/03/微信图片_20260603112424_301_102_20260603112604A003.png', '籼稻是日常主食的优质选择，富含碳水、膳食纤维与多种微量元素，可为人体快速补充能量、维持机体正常代谢。除碾米蒸煮做主粮食用外，米糠可榨油、加工饲料，稻秆能饲用还可还田肥地，稻谷胚芽可提取营养原料。因此日常食用籼稻，既能饱腹充饥，又能补充营养、助力膳食均衡。', '水稻科', '0', 1, 0, '2026-06-03 11:26:19', 0, NULL, '0');
INSERT INTO `agriculture_germplasm` VALUES (5, '水稻', 'rice', '粳稻', 'japonica_rice', '/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155744A001.png', '粳稻是日常主食的优选品类，富含优质蛋白与B族维生素，易消化好吸收，可补充人体所需能量。除蒸煮做成米饭外，还能加工年糕、米酒、米糕等特色吃食，米糠可加工饲料、提取粮油，稻秆能饲用还可有机肥还田。因此日常食用粳稻，既能饱腹充饥，又能助力膳食均衡、养护身体健康。', '', '0', 0, 0, '2026-06-03 15:58:08', 0, NULL, '0');
INSERT INTO `agriculture_germplasm` VALUES (6, '水稻', 'rice', '糯稻', 'glutinous_rice', '/profile/agriculture/germplasm/2026/06/03/微信图片_20260603164735_309_102_20260603164757A003.png', '糯稻是制作特色美食的优质原料，籽粒支链淀粉含量充足，蒸煮后软糯黏香、口感醇厚。除蒸煮直接食用外，可加工汤圆、粽子、糍粑、米酒等风味吃食，米糠能饲喂畜禽，稻壳可做栽培基质。因此日常食用糯稻制品，既能丰富饮食种类，又可补充身体所需营养。', '', '0', 0, 0, '2026-06-03 15:59:49', 0, '2026-06-03 16:47:59', '0');

-- ----------------------------
-- Table structure for agriculture_germplasm_intro
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_germplasm_intro`;
CREATE TABLE `agriculture_germplasm_intro`  (
  `intro_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '介绍ID',
  `germplasm_id` bigint NOT NULL COMMENT '种质ID',
  `intro_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `intro_img` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `intro_des` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`intro_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '种质介绍表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_germplasm_intro
-- ----------------------------
INSERT INTO `agriculture_germplasm_intro` VALUES (1, 2, '1', '/profile/iot/1/2023-0523-215817.png', '111', '', '0', 0, 0, '2023-05-23 21:58:19', 0, NULL, '0');
INSERT INTO `agriculture_germplasm_intro` VALUES (2, 2, '121', '/profile/iot/1/2023-0523-220029.png', '1121', '', '0', 0, 0, '2023-05-23 22:00:32', 0, NULL, '0');
INSERT INTO `agriculture_germplasm_intro` VALUES (3, 1, '介绍测试', '/profile/iot/1/2023-0524-135509.png', '111', '', '0', 0, 0, '2023-05-24 13:55:12', 0, NULL, '0');

-- ----------------------------
-- Table structure for agriculture_land
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_land`;
CREATE TABLE `agriculture_land`  (
  `land_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '地块ID',
  `land_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '地块名称',
  `land_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '字典 agriculture_land_type',
  `land_area` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '地块面积',
  `stroke_weight` tinyint NOT NULL DEFAULT 0 COMMENT '边框宽度',
  `stroke_color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '边框颜色',
  `stroke_opacity` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '边框透明度',
  `land_path` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '地块路径',
  `fill_color` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '地块背景颜色',
  `fill_opacity` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '地块透明度',
  `current_batch` bigint NOT NULL DEFAULT 0 COMMENT '当前种植批次',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`land_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '地块表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_land
-- ----------------------------
INSERT INTO `agriculture_land` VALUES (7, '水稻1区', '1', 2.00, 2, '#1AC233', 0.70, '106.526079,29.344398|106.52589,29.344319|106.525922,29.34424|106.526042,29.344159|106.526167,29.344162|106.526269,29.344301', '#09DD37', 0.50, 0, '', '1', 0, 0, '2026-06-01 22:45:21', 0, '2026-06-03 15:02:49', '0');
INSERT INTO `agriculture_land` VALUES (8, '水稻实验区2', '1', 3.00, 2, '#1AC233', 0.50, '106.52569,29.343294|106.525588,29.3432|106.525572,29.343088|106.52562,29.342938|106.525642,29.342854|106.525744,29.342779|106.525862,29.342775|106.525894,29.342957|106.525894,29.343121|106.525932,29.343256|106.525835,29.343317', '#0AE63A', 0.60, 0, '', '1', 0, 0, '2026-06-02 15:45:19', 0, '2026-06-03 15:02:53', '0');
INSERT INTO `agriculture_land` VALUES (9, '旱地实验1区', '0', 6.00, 2, '#1AC233', 0.70, '106.525991,29.344148|106.526039,29.343961|106.52605,29.343835|106.525964,29.343676|106.525921,29.343648|106.526066,29.34362|106.526189,29.343611|106.526222,29.343611|106.526222,29.343737|106.526238,29.34383|106.526254,29.343952|106.526254,29.344078|106.52627,29.344148|106.526297,29.344237|106.526211,29.344279|106.526066,29.344265|106.525964,29.344247', '#F07612', 0.70, 0, '', '1', 0, 0, '2026-06-03 15:34:20', 0, '2026-06-03 16:48:49', '0');
INSERT INTO `agriculture_land` VALUES (10, '大棚1区', '2', 7.00, 2, '#1AC233', 0.80, '106.524984,29.343654|106.52478,29.343678|106.524754,29.343617|106.524764,29.343547|106.524791,29.343477|106.524823,29.343346|106.524855,29.343238|106.524893,29.343149|106.524936,29.343061|106.524984,29.342976|106.52507,29.342976|106.52521,29.343033|106.525279,29.34307|106.525231,29.343173|106.525086,29.343421|106.525,29.343598', '#C90DF3', 0.50, 0, '', '1', 0, 0, '2026-06-03 16:44:37', 0, '2026-06-03 16:45:21', '0');
INSERT INTO `agriculture_land` VALUES (11, '大棚2号', '2', 2.50, 2, '#C2A91A', 0.80, '106.525195,29.344215|106.525285,29.344124|106.525146,29.343922|106.524965,29.344048|106.525062,29.344168', '#F5D72C', 0.50, 0, '', '0', 0, 0, '2026-06-07 20:02:15', 0, '2026-06-07 20:02:32', '0');

-- ----------------------------
-- Table structure for agriculture_machine_info
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_machine_info`;
CREATE TABLE `agriculture_machine_info`  (
  `machine_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '机械ID',
  `machine_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '机械编码',
  `machine_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '机械名称',
  `machine_type_id` bigint NOT NULL DEFAULT 0 COMMENT '机械类别',
  `measure_unit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '计量单位',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`machine_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '机械信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_machine_info
-- ----------------------------
INSERT INTO `agriculture_machine_info` VALUES (1, '001', '东方红天天向上牌拖拉机', 1, '辆', '2026.5.31日购买', '0', 1, 1, '2023-06-13 09:30:20', 0, '2026-06-02 12:40:40', '0');
INSERT INTO `agriculture_machine_info` VALUES (2, '002', '飞利浦除草机', 2, '台', '6.2号购买\n陈宇，陈总购买', '0', 2, 0, '2026-06-02 12:42:05', 0, NULL, '0');

-- ----------------------------
-- Table structure for agriculture_machine_type
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_machine_type`;
CREATE TABLE `agriculture_machine_type`  (
  `machine_type_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '机械类别ID',
  `machine_type_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '机械类别名称',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`machine_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '机械类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_machine_type
-- ----------------------------
INSERT INTO `agriculture_machine_type` VALUES (1, '拖拉机', '2', '0', 0, 1, '2023-06-02 21:25:43', 1, '2026-06-06 11:18:40', '0');
INSERT INTO `agriculture_machine_type` VALUES (2, '收割机', '', '0', 1, 1, '2023-06-13 09:29:38', 0, '2026-06-06 11:18:45', '0');
INSERT INTO `agriculture_machine_type` VALUES (3, '插秧机', '', '0', 2, 1, '2023-06-13 09:29:43', 0, '2026-06-06 11:18:48', '0');
INSERT INTO `agriculture_machine_type` VALUES (4, '无人机', '', '0', 3, 8, '2023-08-26 13:41:04', 0, '2026-06-06 11:18:51', '2');
INSERT INTO `agriculture_machine_type` VALUES (5, '喷水背包', '浇灌用', '0', 5, 0, '2026-06-02 15:30:33', 0, NULL, '0');

-- ----------------------------
-- Table structure for agriculture_material_info
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_material_info`;
CREATE TABLE `agriculture_material_info`  (
  `material_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '农资ID',
  `material_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '农资编码',
  `material_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '农资名称',
  `material_type_id` bigint NOT NULL DEFAULT 0 COMMENT '农资类别',
  `measure_unit` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '计量单位',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`material_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '农资信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_material_info
-- ----------------------------
INSERT INTO `agriculture_material_info` VALUES (1, '001', '钾肥', 1, '袋', '临时工购买', '0', 0, 1, '2023-06-13 09:41:12', 0, '2026-06-07 11:20:41', '0');
INSERT INTO `agriculture_material_info` VALUES (2, '002', '磷肥', 1, '袋', '采购部6.7日采购', '0', 0, 1, '2023-06-13 09:41:29', 0, '2026-06-07 11:20:53', '0');
INSERT INTO `agriculture_material_info` VALUES (4, '004', '镰刀', 2, '把', '某公司，采购员罗一凡6.2日下午购买', '0', 0, 1, '2023-06-13 09:46:52', 0, '2026-06-03 16:06:56', '0');
INSERT INTO `agriculture_material_info` VALUES (5, '003', '氮肥', 1, '袋', '集市6.2日上午购买', '0', 0, 0, '2026-06-02 13:14:10', 0, '2026-06-03 16:04:06', '0');
INSERT INTO `agriculture_material_info` VALUES (6, '12', '除草剂', 4, '瓶', '郭浩铭6.3下午市场购买', '0', 0, 0, '2026-06-03 16:09:39', 0, NULL, '0');

-- ----------------------------
-- Table structure for agriculture_material_type
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_material_type`;
CREATE TABLE `agriculture_material_type`  (
  `material_type_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '农资类别ID',
  `material_type_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '农资类别名称',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`material_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '农资类别表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_material_type
-- ----------------------------
INSERT INTO `agriculture_material_type` VALUES (1, '肥料', '有机肥、复合肥、尿素、磷肥钾肥、叶面肥、微生物肥等', '0', 0, 1, '2023-06-13 09:40:21', 1, '2026-06-03 16:05:20', '0');
INSERT INTO `agriculture_material_type` VALUES (2, '农用物资与农机', '地膜、棚膜、育苗基质、农药喷雾器、农具、灌溉设备、小型耕种机械等', '0', 1, 1, '2023-06-13 09:40:46', 0, '2026-06-06 11:18:08', '0');
INSERT INTO `agriculture_material_type` VALUES (3, '种子种苗', '水稻、小麦、玉米、瓜果蔬菜种子、秧苗、种薯、种藕等', '0', 2, 0, '2026-06-03 16:05:06', 0, '2026-06-06 11:18:11', '0');
INSERT INTO `agriculture_material_type` VALUES (4, '农药', '杀虫剂、杀菌剂、除草剂、植物生长调节剂、灭鼠药剂等', '0', 3, 0, '2026-06-03 16:07:23', 0, '2026-06-06 11:18:14', '0');

-- ----------------------------
-- Table structure for agriculture_plant_method
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_plant_method`;
CREATE TABLE `agriculture_plant_method`  (
  `method_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '方法ID',
  `germplasm_id` bigint NOT NULL COMMENT '种质ID',
  `method_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `method_img` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `method_des` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`method_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '种植方法表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_plant_method
-- ----------------------------
INSERT INTO `agriculture_plant_method` VALUES (1, 1, '方法2222', '/profile/iot/1/2023-0523-211723.png', '是的撒的撒的', '', '0', 0, 0, '2023-05-23 20:58:40', 0, '2023-05-24 13:55:47', '0');
INSERT INTO `agriculture_plant_method` VALUES (2, 2, '方法', '/profile/iot/1/2023-0523-214207.png', '猜猜猜', '', '0', 0, 0, '2023-05-23 21:42:12', 0, '2023-05-24 13:55:34', '0');

-- ----------------------------
-- Table structure for agriculture_standard_job
-- ----------------------------
DROP TABLE IF EXISTS `agriculture_standard_job`;
CREATE TABLE `agriculture_standard_job`  (
  `job_id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '作业任务ID',
  `germplasm_id` bigint NOT NULL DEFAULT 0 COMMENT '种质ID',
  `job_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '作业任务名称',
  `cycle_unit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '作业周期单位（0代表周 1代表天）',
  `job_start` int NOT NULL DEFAULT 0 COMMENT '起始周/天',
  `job_finish` int NOT NULL DEFAULT 0 COMMENT '结束周/天',
  `remark` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '状态',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '排序',
  `create_by` bigint NOT NULL DEFAULT 0 COMMENT '创建者ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint NULL DEFAULT 0 COMMENT '修改人ID',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`job_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '标准作业任务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agriculture_standard_job
-- ----------------------------
INSERT INTO `agriculture_standard_job` VALUES (1, 2, '播种', '1', 1, 3, '', '0', 0, 1, '2023-05-25 22:15:16', 1, '2023-05-30 09:37:59', '0');
INSERT INTO `agriculture_standard_job` VALUES (2, 2, '浇水', '1', 2, 4, '', '0', 0, 1, '2023-05-30 09:38:25', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (3, 2, '采摘', '1', 5, 6, '', '0', 0, 1, '2023-05-30 09:38:47', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (4, 1, '育苗', '1', 1, 3, '', '0', 0, 1, '2023-05-30 17:40:31', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (5, 1, '铺膜', '1', 3, 4, '', '0', 0, 1, '2023-05-30 17:41:18', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (6, 1, '育苗完成', '1', 5, 6, '', '0', 0, 1, '2023-05-30 17:41:39', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (7, 1, '定植', '1', 6, 7, '', '0', 0, 1, '2023-05-30 17:41:56', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (8, 1, '植保防护', '1', 7, 8, '', '0', 0, 1, '2023-05-30 17:42:25', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (9, 1, '授粉', '1', 9, 10, '', '0', 0, 1, '2023-05-30 17:42:49', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (10, 1, '修剪侧蔓', '1', 11, 12, '', '0', 0, 1, '2023-05-30 17:45:54', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (11, 1, '坐果期', '1', 12, 13, '', '0', 0, 1, '2023-05-30 17:46:13', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (12, 1, '膨果期', '1', 13, 14, '', '0', 0, 1, '2023-05-30 17:46:37', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (13, 1, '结果期', '1', 14, 15, '', '0', 0, 1, '2023-05-30 17:46:52', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (14, 1, '采摘', '1', 15, 16, '', '0', 0, 1, '2023-05-30 17:47:29', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (15, 1, '作业流程', '0', 1, 2, '', '0', 0, 8, '2023-08-26 14:11:15', 0, NULL, '2');
INSERT INTO `agriculture_standard_job` VALUES (16, 3, '播种', '1', 1, 1, '', '0', 0, 1, '2023-09-05 12:53:54', 0, NULL, '0');
INSERT INTO `agriculture_standard_job` VALUES (17, 3, '收获', '1', 2, 2, '', '0', 0, 1, '2023-09-05 12:54:10', 0, NULL, '0');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'agriculture_employee', '雇员表', NULL, NULL, 'AgricultureEmployee', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'employee', '雇员', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-01 15:34:08', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'agriculture_baseinfo', '基地信息表', NULL, NULL, 'AgricultureBaseinfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'baseinfo', '基地信息', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-01 17:45:23', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'agriculture_land', '地块表', NULL, NULL, 'AgricultureLand', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'land', '地块', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-01 18:26:08', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'agriculture_machine_info', '机械信息表', NULL, NULL, 'AgricultureMachineInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'info', '机械信息', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-01 18:28:10', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'agriculture_machine_type', '机械类别表', NULL, NULL, 'AgricultureMachineType', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'type', '机械类别', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 09:51:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'agriculture_material_info', '农资信息表', NULL, NULL, 'AgricultureMaterialInfo', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'info', '农资信息', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 09:51:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (7, 'agriculture_material_type', '农资类别表', NULL, NULL, 'AgricultureMaterialType', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'type', '农资类别', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 09:51:59', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'agriculture_crop_batch', '作物批次表', NULL, NULL, 'AgricultureCropBatch', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'batch', '作物批次', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":0}', 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34', NULL);
INSERT INTO `gen_table` VALUES (9, 'agriculture_batch_task', '批次任务表', NULL, NULL, 'AgricultureBatchTask', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'task', '批次任务', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\"}', 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29', NULL);
INSERT INTO `gen_table` VALUES (10, 'agriculture_germplasm', '种质表', NULL, NULL, 'AgricultureGermplasm', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'germplasm', '种质', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 15:10:19', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (11, 'agriculture_germplasm_intro', '种质介绍表', NULL, NULL, 'AgricultureGermplasmIntro', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'intro', '种质介绍', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 15:10:19', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'agriculture_plant_method', '种植方法表', NULL, NULL, 'AgriculturePlantMethod', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'method', '种植方法', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 15:10:19', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (13, 'agriculture_standard_job', '标准作业任务表', NULL, NULL, 'AgricultureStandardJob', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'job', '标准作业任务', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-02 15:10:19', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (14, 'iot_things_model_template', '物模型模板', NULL, NULL, 'IotThingsModelTemplate', 'crud', 'element-ui', 'com.ruoyi.iot', 'iot', 'template', '物模型模板', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\"}', 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49', NULL);
INSERT INTO `gen_table` VALUES (15, 'iot_category', '产品分类', NULL, NULL, 'IotCategory', 'crud', 'element-ui', 'com.ruoyi.iot', 'iot', 'category', '产品分类', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":0}', 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57', NULL);
INSERT INTO `gen_table` VALUES (16, 'iot_product', '产品', NULL, NULL, 'IotProduct', 'crud', 'element-ui', 'com.ruoyi.iot', 'iot', 'product', '产品', 'ruoyi', 1, '0', '/', '{\"genView\":\"0\"}', 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'employee_id', '雇员ID', 'bigint unsigned', 'String', 'employeeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'employee_code', '编码', 'varchar(20)', 'String', 'employeeCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'employee_name', '姓名', 'varchar(10)', 'String', 'employeeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'employee_type', '字典 agriculture_employee_type', 'char(1)', 'String', 'employeeType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'employee_tel', '手机号码', 'varchar(20)', 'String', 'employeeTel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'employee_sex', '字典 sys_user_sex', 'char(1)', 'String', 'employeeSex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'employee_address', '地址', 'varchar(200)', 'String', 'employeeAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, 1, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, 1, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, 1, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, 1, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, 1, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, 1, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2026-06-01 15:34:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, 2, 'base_id', '基地ID', 'bigint unsigned', 'String', 'baseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, 2, 'base_short_name', '基地简称', 'varchar(20)', 'String', 'baseShortName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, 2, 'base_code', '基地编号', 'varchar(20)', 'String', 'baseCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, 2, 'base_name', '基地全称', 'varchar(30)', 'String', 'baseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, 2, 'base_leader', '基地负责人', 'varchar(10)', 'String', 'baseLeader', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, 2, 'leader_tel', '基地负责人电话', 'varchar(17)', 'String', 'leaderTel', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, 2, 'base_address', '基地负责人地址', 'varchar(500)', 'String', 'baseAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, 2, 'base_area', '基地面积', 'varchar(30)', 'String', 'baseArea', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, 2, 'base_altitude', '基地海拔', 'int', 'Long', 'baseAltitude', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, 2, 'base_img', '现场图片', 'varchar(500)', 'String', 'baseImg', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, 2, 'base_des', '基地描述', 'varchar(1000)', 'String', 'baseDes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, 2, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, 2, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, 2, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, 2, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, 2, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, 2, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, 2, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, 2, 'base_coordinate', NULL, 'varchar(255)', 'String', 'baseCoordinate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2026-06-01 17:45:23', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, 3, 'land_id', '地块ID', 'bigint unsigned', 'String', 'landId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, 3, 'land_name', '地块名称', 'varchar(50)', 'String', 'landName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, 3, 'land_type', '字典 agriculture_land_type', 'char(1)', 'String', 'landType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, 3, 'land_area', '地块面积', 'decimal(10,2)', 'BigDecimal', 'landArea', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, 3, 'stroke_weight', '边框宽度', 'tinyint', 'Long', 'strokeWeight', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, 3, 'stroke_color', '边框颜色', 'varchar(50)', 'String', 'strokeColor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 3, 'stroke_opacity', '边框透明度', 'decimal(10,2)', 'BigDecimal', 'strokeOpacity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 3, 'land_path', '地块路径', 'varchar(1000)', 'String', 'landPath', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 8, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, 3, 'fill_color', '地块背景颜色', 'varchar(50)', 'String', 'fillColor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, 3, 'fill_opacity', '地块透明度', 'decimal(10,2)', 'BigDecimal', 'fillOpacity', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, 3, 'current_batch', '当前种植批次', 'bigint', 'Long', 'currentBatch', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, 3, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, 3, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, 3, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, 3, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, 3, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, 3, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, 3, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2026-06-01 18:26:09', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, 4, 'machine_id', '机械ID', 'bigint unsigned', 'String', 'machineId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, 4, 'machine_code', '机械编码', 'varchar(20)', 'String', 'machineCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, 4, 'machine_name', '机械名称', 'varchar(50)', 'String', 'machineName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, 4, 'machine_type_id', '机械类别', 'bigint', 'Long', 'machineTypeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, 4, 'measure_unit', '计量单位', 'varchar(10)', 'String', 'measureUnit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, 4, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, 4, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, 4, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 4, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 4, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 4, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 4, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-01 18:28:10', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 5, 'machine_type_id', '机械类别ID', 'bigint unsigned', 'String', 'machineTypeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 5, 'machine_type_name', '机械类别名称', 'varchar(50)', 'String', 'machineTypeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 5, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 3, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 5, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 5, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 5, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 5, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 5, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 5, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 6, 'material_id', '农资ID', 'bigint unsigned', 'String', 'materialId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 6, 'material_code', '农资编码', 'varchar(20)', 'String', 'materialCode', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 6, 'material_name', '农资名称', 'varchar(50)', 'String', 'materialName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 6, 'material_type_id', '农资类别', 'bigint', 'Long', 'materialTypeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 6, 'measure_unit', '计量单位', 'varchar(10)', 'String', 'measureUnit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 6, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 6, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, 6, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, 6, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, 6, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, 6, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, 6, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, 7, 'material_type_id', '农资类别ID', 'bigint unsigned', 'String', 'materialTypeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, 7, 'material_type_name', '农资类别名称', 'varchar(50)', 'String', 'materialTypeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, 7, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 3, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, 7, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (95, 7, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (96, 7, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (97, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (98, 7, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (99, 7, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (100, 7, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2026-06-02 09:51:59', '', NULL);
INSERT INTO `gen_table_column` VALUES (101, 8, 'batch_id', '批次ID', 'bigint unsigned', 'String', 'batchId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (102, 8, 'batch_name', '批次名称', 'varchar(50)', 'String', 'batchName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (103, 8, 'germplasm_id', '种质ID', 'bigint', 'Long', 'germplasmId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (104, 8, 'land_id', '地块ID', 'bigint', 'Long', 'landId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (105, 8, 'crop_area', '种植面积（亩）', 'decimal(10,2)', 'BigDecimal', 'cropArea', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (106, 8, 'start_time', '开始时间', 'datetime', 'Date', 'startTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (107, 8, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (108, 8, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (109, 8, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (110, 8, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (111, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (112, 8, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (113, 8, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (114, 8, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (115, 8, 'batch_head', '负责人Id', 'bigint', 'Long', 'batchHead', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2026-06-02 14:53:59', '', '2026-06-02 15:53:34');
INSERT INTO `gen_table_column` VALUES (116, 9, 'task_id', '任务ID', 'bigint unsigned', 'String', 'taskId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (117, 9, 'batch_id', '批次ID', 'bigint unsigned', 'String', 'batchId', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 2, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (118, 9, 'task_head', '任务负责人', 'bigint unsigned', 'String', 'taskHead', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 3, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (119, 9, 'task_name', '任务名称', 'varchar(50)', 'String', 'taskName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (120, 9, 'plan_start', '计划开始日期', 'datetime', 'Date', 'planStart', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (121, 9, 'plan_finish', '计划结束日期', 'datetime', 'Date', 'planFinish', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (122, 9, 'actual_start', '实际开始日期', 'datetime', 'Date', 'actualStart', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (123, 9, 'actual_finish', '实际结束日期', 'datetime', 'Date', 'actualFinish', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (124, 9, 'task_detail', '任务详情', 'varchar(2000)', 'String', 'taskDetail', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 9, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (125, 9, 'task_images', '图片资料', 'text', 'String', 'taskImages', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 10, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (126, 9, 'task_videos', '视频资料', 'text', 'String', 'taskVideos', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (127, 9, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 12, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (128, 9, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (129, 9, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (130, 9, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (131, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (132, 9, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (133, 9, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (134, 9, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2026-06-02 15:10:19', '', '2026-06-02 19:39:29');
INSERT INTO `gen_table_column` VALUES (135, 10, 'germplasm_id', '种质ID', 'bigint unsigned', 'String', 'germplasmId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (136, 10, 'crop_name', '作物名称', 'varchar(50)', 'String', 'cropName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (137, 10, 'crop_en_name', '作物英文名称', 'varchar(50)', 'String', 'cropEnName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, 10, 'germplasm_name', '种质名称', 'varchar(50)', 'String', 'germplasmName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, 10, 'germplasm_en_name', '种质英文名称', 'varchar(50)', 'String', 'germplasmEnName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, 10, 'germplasm_img', '种质图片', 'varchar(100)', 'String', 'germplasmImg', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, 10, 'germplasm_des', '宣传语', 'varchar(500)', 'String', 'germplasmDes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, 10, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 8, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, 10, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, 10, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, 10, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, 10, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, 10, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, 10, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, 10, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, 11, 'intro_id', '介绍ID', 'bigint unsigned', 'String', 'introId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, 11, 'germplasm_id', '种质ID', 'bigint', 'Long', 'germplasmId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, 11, 'intro_name', '名称', 'varchar(50)', 'String', 'introName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, 11, 'intro_img', '图片', 'varchar(100)', 'String', 'introImg', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, 11, 'intro_des', '描述', 'varchar(1000)', 'String', 'introDes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, 11, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, 11, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (157, 11, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (158, 11, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (159, 11, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, 11, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, 11, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, 11, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, 12, 'method_id', '方法ID', 'bigint unsigned', 'String', 'methodId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, 12, 'germplasm_id', '种质ID', 'bigint', 'Long', 'germplasmId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, 12, 'method_name', '名称', 'varchar(50)', 'String', 'methodName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, 12, 'method_img', '图片', 'varchar(100)', 'String', 'methodImg', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (167, 12, 'method_des', '描述', 'varchar(1000)', 'String', 'methodDes', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 5, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (168, 12, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (169, 12, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (170, 12, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (171, 12, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (172, 12, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (173, 12, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (174, 12, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (175, 12, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (176, 13, 'job_id', '作业任务ID', 'bigint unsigned', 'String', 'jobId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (177, 13, 'germplasm_id', '种质ID', 'bigint', 'Long', 'germplasmId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (178, 13, 'job_name', '作业任务名称', 'varchar(50)', 'String', 'jobName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, 13, 'cycle_unit', '作业周期单位（0代表周 1代表天）', 'char(1)', 'String', 'cycleUnit', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (180, 13, 'job_start', '起始周/天', 'int', 'Long', 'jobStart', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (181, 13, 'job_finish', '结束周/天', 'int', 'Long', 'jobFinish', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (182, 13, 'remark', '备注', 'varchar(2000)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 7, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (183, 13, 'status', '状态', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, 13, 'order_num', '排序', 'int', 'Long', 'orderNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (185, 13, 'create_by', '创建者ID', 'bigint', 'Long', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, 13, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, 13, 'update_by', '修改人ID', 'bigint', 'Long', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (188, 13, 'update_time', '修改时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (189, 13, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2026-06-02 15:10:19', '', NULL);
INSERT INTO `gen_table_column` VALUES (190, 14, 'template_id', '物模型ID', 'bigint', 'Long', 'templateId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (191, 14, 'template_name', '物模型名称', 'varchar(64)', 'String', 'templateName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (192, 14, 'tenant_id', '租户ID', 'bigint', 'Long', 'tenantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (193, 14, 'tenant_name', '租户名称', 'varchar(30)', 'String', 'tenantName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (194, 14, 'identifier', '标识符，产品下唯一', 'varchar(32)', 'String', 'identifier', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (195, 14, 'type', '模型类别（1-属性，2-功能，3-事件）', 'tinyint(1)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (196, 14, 'datatype', '数据类型（integer、decimal、string、bool、array、enum）', 'varchar(64)', 'String', 'datatype', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (197, 14, 'specs', '数据定义', 'json', 'String', 'specs', '0', '0', '1', '1', '1', '1', '1', 'EQ', NULL, '', 8, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (198, 14, 'is_sys', '是否系统通用（0-否，1-是）', 'tinyint(1)', 'Integer', 'isSys', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (199, 14, 'is_Top', '是否首页显示（0-否，1-是）', 'tinyint(1)', 'Integer', 'isTop', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (200, 14, 'is_Monitor', '是否实时监测（0-否，1-是）', 'tinyint(1)', 'Integer', 'isMonitor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (201, 14, 'is_readonly', '是否只读数据(0-否，1-是)', 'tinyint(1)', 'Integer', 'isReadonly', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (202, 14, 'model_order', '排序，值越大，排序越靠前', 'int', 'Long', 'modelOrder', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (203, 14, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (204, 14, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (205, 14, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (206, 14, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (207, 14, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (208, 14, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2026-06-04 11:17:12', '', '2026-06-04 11:26:49');
INSERT INTO `gen_table_column` VALUES (209, 15, 'category_id', '产品分类ID', 'bigint', 'Long', 'categoryId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (210, 15, 'category_name', '产品分类名称', 'varchar(64)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (211, 15, 'tenant_id', '租户ID', 'bigint', 'Long', 'tenantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (212, 15, 'tenant_name', '租户名称', 'varchar(30)', 'String', 'tenantName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (213, 15, 'is_sys', '是否系统通用（0-否，1-是）', 'tinyint(1)', 'Integer', 'isSys', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (214, 15, 'parent_id', '父级ID', 'bigint', 'Long', 'parentId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (215, 15, 'order_num', '显示顺序', 'int', 'Long', 'orderNum', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (216, 15, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (217, 15, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (218, 15, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (219, 15, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (220, 15, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (221, 15, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:24:57');
INSERT INTO `gen_table_column` VALUES (222, 16, 'product_id', '产品ID', 'bigint', 'Long', 'productId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (223, 16, 'product_name', '产品名称', 'varchar(64)', 'String', 'productName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (224, 16, 'protocol_code', '协议编号', 'int', 'Long', 'protocolCode', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (225, 16, 'category_id', '产品分类ID', 'bigint', 'Long', 'categoryId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (226, 16, 'category_name', '产品分类名称', 'varchar(64)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (227, 16, 'tenant_id', '租户ID', 'bigint', 'Long', 'tenantId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (228, 16, 'tenant_name', '租户名称', 'varchar(30)', 'String', 'tenantName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (229, 16, 'is_sys', '是否系统通用（0-否，1-是）', 'tinyint(1)', 'Integer', 'isSys', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (230, 16, 'is_authorize', '是否启用授权码（0-否，1-是）', 'tinyint(1)', 'Integer', 'isAuthorize', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (231, 16, 'mqtt_account', 'mqtt账号', 'varchar(64)', 'String', 'mqttAccount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (232, 16, 'mqtt_password', 'mqtt密码', 'varchar(64)', 'String', 'mqttPassword', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (233, 16, 'mqtt_secret', '产品秘钥', 'varchar(64)', 'String', 'mqttSecret', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (234, 16, 'status', '状态（1-未发布，2-已发布）', 'tinyint(1)', 'Integer', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 13, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (235, 16, 'things_models_json', '物模型JSON（属性、功能、事件）', 'json', 'String', 'thingsModelsJson', '0', '0', '0', '1', '1', '1', '1', 'EQ', NULL, '', 14, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (236, 16, 'device_type', '设备类型（1-直连设备、2-网关设备、3-监控设备）', 'tinyint(1)', 'Integer', 'deviceType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 15, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (237, 16, 'network_method', '联网方式（1=wifi、2=蜂窝(2G/3G/4G/5G)、3=以太网、4=其他）', 'tinyint(1)', 'Integer', 'networkMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (238, 16, 'vertificate_method', '认证方式（1-简单认证、2-加密认证、3-简单+加密）', 'tinyint(1)', 'Integer', 'vertificateMethod', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (239, 16, 'img_url', '图片地址', 'varchar(255)', 'String', 'imgUrl', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (240, 16, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (241, 16, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (242, 16, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (243, 16, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (244, 16, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');
INSERT INTO `gen_table_column` VALUES (245, 16, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 24, 'admin', '2026-06-05 16:22:55', '', '2026-06-05 16:23:36');

-- ----------------------------
-- Table structure for iot_category
-- ----------------------------
DROP TABLE IF EXISTS `iot_category`;
CREATE TABLE `iot_category`  (
  `category_id` bigint NOT NULL AUTO_INCREMENT COMMENT '产品分类ID',
  `category_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '产品分类名称',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `tenant_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '租户名称',
  `is_sys` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否系统通用（0-否，1-是）',
  `parent_id` bigint NULL DEFAULT NULL COMMENT '父级ID',
  `order_num` int NULL DEFAULT NULL COMMENT '显示顺序',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`) USING BTREE,
  INDEX `iot_category_index_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `iot_category_index_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品分类' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iot_category
-- ----------------------------
INSERT INTO `iot_category` VALUES (9, '气象', 0, '系统自营', 1, NULL, 2, '0', 'admin', '2026-06-06 09:50:47', '', NULL, '一体式气象站、超声波气象站');
INSERT INTO `iot_category` VALUES (10, '土壤', 0, '系统自营', 1, NULL, 3, '0', 'admin', '2026-06-06 09:51:05', '', NULL, '土壤墒情监测站、管式土壤墒情监测仪');
INSERT INTO `iot_category` VALUES (11, '水质', 0, '系统自营', 1, NULL, 4, '0', 'admin', '2026-06-06 09:51:20', '', NULL, '水质监测站');
INSERT INTO `iot_category` VALUES (12, '设施农业', 0, '系统自营', 1, NULL, 5, '0', 'admin', '2026-06-06 09:51:34', '', NULL, '大棚、卷帘、通风');
INSERT INTO `iot_category` VALUES (13, '启闭机', 0, '系统自营', 1, NULL, 6, '0', 'admin', '2026-06-06 09:51:48', '', NULL, '高标准农田启闭机');
INSERT INTO `iot_category` VALUES (14, '其他', 0, '系统自营', 1, NULL, 7, '0', 'admin', '2026-06-06 09:52:11', '', NULL, 'other');

-- ----------------------------
-- Table structure for iot_device
-- ----------------------------
DROP TABLE IF EXISTS `iot_device`;
CREATE TABLE `iot_device`  (
  `device_id` bigint NOT NULL AUTO_INCREMENT COMMENT '设备ID',
  `device_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备名称',
  `product_id` bigint NOT NULL COMMENT '所属产品ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属产品名称',
  `serial_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '设备编号',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态:1-未激活 2-禁用 3-在线 4-离线',
  `device_type` tinyint NULL DEFAULT 1 COMMENT '设备类型:1-直连 2-网关 3-监控',
  `firmware_version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '固件版本',
  `coordinate` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '坐标(经纬度)',
  `network_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所在地址',
  `network_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入网IP',
  `location_way` tinyint NULL DEFAULT 1 COMMENT '定位方式:1-自动 2-手动',
  `land_id` bigint NULL DEFAULT NULL COMMENT '关联地块ID',
  `land_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联地块名称',
  `is_shadow` tinyint NULL DEFAULT 1 COMMENT '设备影子:0-否 1-是',
  `tenant_id` bigint NULL DEFAULT NULL COMMENT '租户ID',
  `tenant_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '租户名称',
  `active_time` datetime NULL DEFAULT NULL COMMENT '激活时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`device_id`) USING BTREE,
  UNIQUE INDEX `uk_serial_number`(`serial_number` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  INDEX `idx_land_id`(`land_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iot_device
-- ----------------------------
INSERT INTO `iot_device` VALUES (1, '气温检测设备1', 106, '气温检测', 'TEMP-001', 3, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, '2026-06-07 17:26:19', '0', NULL, '2026-06-07 17:26:19', NULL, NULL, NULL);
INSERT INTO `iot_device` VALUES (2, '土壤检测设备1', 107, '土壤检测', 'SOIL-001', 3, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, '2026-06-07 18:25:24', '0', NULL, '2026-06-07 18:25:24', NULL, NULL, NULL);
INSERT INTO `iot_device` VALUES (3, '水质检测设备1', 108, '水质检测', 'WATER-001', 3, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, '2026-06-07 18:25:24', '0', NULL, '2026-06-07 18:25:24', NULL, NULL, NULL);
INSERT INTO `iot_device` VALUES (4, '启闭机设备1', 109, '启闭机', 'GATE-001', 3, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, '2026-06-07 18:25:24', '0', NULL, '2026-06-07 18:25:24', NULL, NULL, NULL);
INSERT INTO `iot_device` VALUES (5, '设施农业设备1', 110, '设施农业', 'FARM-001', 3, 1, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, NULL, '2026-06-07 18:25:24', '0', NULL, '2026-06-07 18:25:24', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for iot_device_alert
-- ----------------------------
DROP TABLE IF EXISTS `iot_device_alert`;
CREATE TABLE `iot_device_alert`  (
  `alert_id` bigint NOT NULL AUTO_INCREMENT COMMENT '告警ID',
  `device_id` bigint NOT NULL COMMENT '设备ID',
  `device_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `alert_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '告警名称',
  `alert_level` tinyint NULL DEFAULT 1 COMMENT '告警级别:1-提示 2-一般 3-严重 4-紧急',
  `alert_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '告警内容',
  `alert_time` datetime NULL DEFAULT NULL COMMENT '告警时间',
  `alert_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '告警类型',
  `source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '告警来源(属性/功能/事件)',
  `source_identifier` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '告警来源标识符',
  `product_id` bigint NULL DEFAULT NULL COMMENT '产品ID',
  `product_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '产品名称',
  `status` tinyint NULL DEFAULT 0 COMMENT '处理状态:0-未处理 1-已确认 2-已处理',
  `handler` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理人',
  `handle_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `handle_remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '处理备注',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`alert_id`) USING BTREE,
  INDEX `idx_device_id`(`device_id` ASC) USING BTREE,
  INDEX `idx_alert_time`(`alert_time` ASC) USING BTREE,
  INDEX `idx_alert_level`(`alert_level` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备告警表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iot_device_alert
-- ----------------------------

-- ----------------------------
-- Table structure for iot_device_running_status
-- ----------------------------
DROP TABLE IF EXISTS `iot_device_running_status`;
CREATE TABLE `iot_device_running_status`  (
  `status_id` bigint NOT NULL AUTO_INCREMENT COMMENT '状态ID',
  `device_id` bigint NOT NULL COMMENT '设备ID',
  `device_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备名称',
  `serial_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '设备编号',
  `product_id` bigint NULL DEFAULT NULL COMMENT '产品ID',
  `status` tinyint NULL DEFAULT 4 COMMENT '运行状态:3-在线 4-离线',
  `rssi` int NULL DEFAULT NULL COMMENT '信号强度(dBm)',
  `online_time` datetime NULL DEFAULT NULL COMMENT '最后上线时间',
  `offline_time` datetime NULL DEFAULT NULL COMMENT '最后离线时间',
  `is_shadow` tinyint NULL DEFAULT 1 COMMENT '设备影子',
  `things_model_value` json NULL COMMENT '物模型实时值(JSON)',
  `update_time` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`status_id`) USING BTREE,
  UNIQUE INDEX `uk_device_id`(`device_id` ASC) USING BTREE,
  INDEX `idx_serial_number`(`serial_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '设备运行状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iot_device_running_status
-- ----------------------------
INSERT INTO `iot_device_running_status` VALUES (1, 1, '气温检测设备1', 'TEMP-001', 106, 3, -52, '2026-06-07 17:26:19', NULL, 1, '{\"humidity\": 68, \"temperature\": 25.6}', '2026-06-07 17:26:19');
INSERT INTO `iot_device_running_status` VALUES (2, 2, '土壤检测设备1', 'SOIL-001', 107, 3, -48, '2026-06-07 18:25:24', NULL, 1, '{\"ec\": 850, \"ph\": 6.8, \"soil_humidity\": 65, \"soil_temperature\": 22.5}', '2026-06-07 18:25:24');
INSERT INTO `iot_device_running_status` VALUES (3, 3, '水质检测设备1', 'WATER-001', 108, 3, -55, '2026-06-07 18:25:24', NULL, 1, '{\"water_ph\": 7.1, \"turbidity\": 12, \"dissolved_oxygen\": 6.5, \"water_temperature\": 18.2}', '2026-06-07 18:25:24');
INSERT INTO `iot_device_running_status` VALUES (4, 4, '启闭机设备1', 'GATE-001', 109, 3, -60, '2026-06-07 18:25:24', NULL, 1, '{\"current\": 5.2, \"opening\": 75, \"voltage\": 220.5, \"run_status\": 1}', '2026-06-07 18:25:24');
INSERT INTO `iot_device_running_status` VALUES (5, 5, '设施农业设备1', 'FARM-001', 110, 3, -42, '2026-06-07 18:25:24', NULL, 1, '{\"co2\": 420, \"light\": 65000, \"air_humidity\": 72, \"air_temperature\": 26.3}', '2026-06-07 18:25:24');

-- ----------------------------
-- Table structure for iot_product
-- ----------------------------
DROP TABLE IF EXISTS `iot_product`;
CREATE TABLE `iot_product`  (
  `product_id` bigint NOT NULL AUTO_INCREMENT COMMENT '产品ID',
  `product_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '产品名称',
  `protocol_code` int NULL DEFAULT NULL COMMENT '协议编号',
  `category_id` bigint NOT NULL COMMENT '产品分类ID',
  `category_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '产品分类名称',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `tenant_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '租户名称',
  `is_sys` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否系统通用（0-否，1-是）',
  `is_authorize` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否启用授权码（0-否，1-是）',
  `mqtt_account` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'mqtt账号',
  `mqtt_password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'mqtt密码',
  `mqtt_secret` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '产品秘钥',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态（1-未发布，2-已发布）',
  `things_models_json` json NULL COMMENT '物模型JSON（属性、功能、事件）',
  `device_type` tinyint(1) NULL DEFAULT 1 COMMENT '设备类型（1-直连设备、2-网关设备、3-监控设备）',
  `network_method` tinyint(1) NULL DEFAULT 1 COMMENT '联网方式（1=wifi、2=蜂窝(2G/3G/4G/5G)、3=以太网、4=其他）',
  `vertificate_method` tinyint(1) NULL DEFAULT 1 COMMENT '认证方式（1-简单认证、2-加密认证、3-简单+加密）',
  `img_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`product_id`) USING BTREE,
  INDEX `iot_product_index_category_id`(`category_id` ASC) USING BTREE,
  INDEX `iot_product_index_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '产品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iot_product
-- ----------------------------
INSERT INTO `iot_product` VALUES (106, '气温检测', NULL, 9, '气象', 0, '系统自营', 0, 0, 'P_baf9a4b3', '64f8d22f9d914c86', '5bd9eadab78649c5a873fe115b7d7f83', 1, '[{\"name\": \"温度\", \"unit\": \"℃\", \"specs\": {\"max\": 80, \"min\": -40}, \"datatype\": \"integer\", \"identifier\": \"temperature\"}, {\"name\": \"湿度\", \"unit\": \"%RH\", \"specs\": {\"max\": 100, \"min\": 0}, \"datatype\": \"integer\", \"identifier\": \"humidity\"}]', 1, 1, 1, '/profile/upload/2026/06/07/637280006649802924675_20260607172041A001.jpg', '0', 'admin', '2026-06-07 17:20:43', '', NULL, NULL);
INSERT INTO `iot_product` VALUES (107, '土壤检测', NULL, 10, '土壤', 0, '系统自营', 0, 0, 'P_40d912ed', '8be7707359c04a11', '9ebe7aa97c3c418ab8c2f8ac78c802b4', 1, '[{\"name\": \"土壤温度\", \"unit\": \"℃\", \"specs\": {\"max\": 60, \"min\": -20}, \"datatype\": \"number\", \"identifier\": \"soil_temperature\"}, {\"name\": \"土壤湿度\", \"unit\": \"%RH\", \"specs\": {\"max\": 100, \"min\": 0}, \"datatype\": \"integer\", \"identifier\": \"soil_humidity\"}, {\"name\": \"pH值\", \"unit\": \"\", \"specs\": {\"max\": 14, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"ph\"}, {\"name\": \"EC值\", \"unit\": \"us/cm\", \"specs\": {\"max\": 10000, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"ec\"}]', 1, 1, 1, '/profile/upload/2026/06/07/160558_479440_product_c30079_20260607181731A001.jpg', '0', 'admin', '2026-06-07 18:17:45', '', NULL, NULL);
INSERT INTO `iot_product` VALUES (108, '水质检测', NULL, 11, '水质', 0, '系统自营', 0, 0, 'P_cb3b75a3', 'a726b61d30f54304', '79149bb0cf714dd3878f4e43837dbd6c', 1, '[{\"name\": \"水温\", \"unit\": \"℃\", \"specs\": {\"max\": 50, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"water_temperature\"}, {\"name\": \"pH值\", \"unit\": \"\", \"specs\": {\"max\": 14, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"water_ph\"}, {\"name\": \"溶解氧\", \"unit\": \"mg/L\", \"specs\": {\"max\": 20, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"dissolved_oxygen\"}, {\"name\": \"浊度\", \"unit\": \"NTU\", \"specs\": {\"max\": 1000, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"turbidity\"}]', 1, 1, 3, '/profile/upload/2026/06/07/20241114091108_1633_20260607181915A002.jpg', '0', 'admin', '2026-06-07 18:19:16', '', NULL, NULL);
INSERT INTO `iot_product` VALUES (109, '启闭机', NULL, 13, '启闭机', 0, '系统自营', 0, 0, 'P_e216a2a5', '646257bac47e483f', 'c374704dbd1d4f40815840941b844885', 1, '[{\"name\": \"开度\", \"unit\": \"%\", \"specs\": {\"max\": 100, \"min\": 0}, \"datatype\": \"integer\", \"identifier\": \"opening\"}, {\"name\": \"运行状态\", \"unit\": \"\", \"specs\": {\"options\": [{\"label\": \"停止\", \"value\": 0}, {\"label\": \"开启\", \"value\": 1}, {\"label\": \"关闭\", \"value\": 2}]}, \"datatype\": \"enum\", \"identifier\": \"run_status\"}, {\"name\": \"电压\", \"unit\": \"V\", \"specs\": {\"max\": 380, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"voltage\"}, {\"name\": \"电流\", \"unit\": \"A\", \"specs\": {\"max\": 100, \"min\": 0}, \"datatype\": \"number\", \"identifier\": \"current\"}]', 1, 1, 1, '/profile/upload/2026/06/07/316252172102699_20260607182045A003.jpg', '0', 'admin', '2026-06-07 18:20:48', 'admin', '2026-06-07 18:23:39', NULL);
INSERT INTO `iot_product` VALUES (110, '设施农业', NULL, 12, '设施农业', 0, '系统自营', 0, 0, 'P_466cd650', '99e860ffe158477b', 'af1c304b7a8440139643819664c8df3e', 1, '[{\"name\": \"气温\", \"unit\": \"℃\", \"specs\": {\"max\": 60, \"min\": -20}, \"datatype\": \"number\", \"identifier\": \"air_temperature\"}, {\"name\": \"空气湿度\", \"unit\": \"%RH\", \"specs\": {\"max\": 100, \"min\": 0}, \"datatype\": \"integer\", \"identifier\": \"air_humidity\"}, {\"name\": \"光照强度\", \"unit\": \"lux\", \"specs\": {\"max\": 200000, \"min\": 0}, \"datatype\": \"integer\", \"identifier\": \"light\"}, {\"name\": \"CO2浓度\", \"unit\": \"ppm\", \"specs\": {\"max\": 5000, \"min\": 0}, \"datatype\": \"integer\", \"identifier\": \"co2\"}]', 1, 1, 1, '/profile/upload/2026/06/07/05165723viwu_20260607182157A004.jpg', '0', 'admin', '2026-06-07 18:21:59', '', NULL, NULL);

-- ----------------------------
-- Table structure for iot_things_model_template
-- ----------------------------
DROP TABLE IF EXISTS `iot_things_model_template`;
CREATE TABLE `iot_things_model_template`  (
  `template_id` bigint NOT NULL AUTO_INCREMENT COMMENT '物模型ID',
  `template_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '物模型名称',
  `tenant_id` bigint NOT NULL COMMENT '租户ID',
  `tenant_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '租户名称',
  `product_id` bigint NULL DEFAULT NULL COMMENT '产品ID',
  `identifier` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标识符，产品下唯一',
  `type` tinyint(1) NOT NULL COMMENT '模型类别（1-属性，2-功能，3-事件）',
  `datatype` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '数据类型（integer、decimal、string、bool、array、enum）',
  `specs` json NOT NULL COMMENT '数据定义',
  `is_sys` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否系统通用（0-否，1-是）',
  `is_Top` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否首页显示（0-否，1-是）',
  `is_Monitor` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否实时监测（0-否，1-是）',
  `is_readonly` tinyint(1) NULL DEFAULT 0 COMMENT '是否只读数据(0-否，1-是)',
  `model_order` int NULL DEFAULT 0 COMMENT '排序，值越大，排序越靠前',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`template_id`) USING BTREE,
  INDEX `iot_things_model_template_index_tenant_id`(`tenant_id` ASC) USING BTREE,
  INDEX `iot_things_model_template_index_model_order`(`model_order` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '物模型模板' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of iot_things_model_template
-- ----------------------------
INSERT INTO `iot_things_model_template` VALUES (32, '温度', 0, '系统', 106, 'temperature', 1, 'integer', '{\"max\": 80, \"min\": -40, \"step\": 1, \"type\": \"integer\", \"unit\": \"℃\"}', 1, 1, 1, 1, 1, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (33, '湿度', 0, '系统', 106, 'humidity', 1, 'integer', '{\"max\": 100, \"min\": 0, \"step\": 1, \"type\": \"integer\", \"unit\": \"%RH\"}', 1, 1, 1, 1, 2, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (34, '土壤温度', 0, '系统', 107, 'soil_temperature', 1, 'decimal', '{\"max\": 60, \"min\": -20, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"℃\"}', 1, 1, 1, 1, 1, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (35, '土壤湿度', 0, '系统', 107, 'soil_humidity', 1, 'integer', '{\"max\": 100, \"min\": 0, \"step\": 1, \"type\": \"integer\", \"unit\": \"%RH\"}', 1, 1, 1, 1, 2, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (36, 'pH值', 0, '系统', 107, 'ph', 1, 'decimal', '{\"max\": 14, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"\"}', 1, 1, 1, 1, 3, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (37, 'EC值', 0, '系统', 107, 'ec', 1, 'decimal', '{\"max\": 10000, \"min\": 0, \"step\": 1, \"type\": \"decimal\", \"unit\": \"us/cm\"}', 1, 1, 1, 1, 4, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (38, '水温', 0, '系统', 108, 'water_temperature', 1, 'decimal', '{\"max\": 50, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"℃\"}', 1, 1, 1, 1, 1, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (39, 'pH值', 0, '系统', 108, 'water_ph', 1, 'decimal', '{\"max\": 14, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"\"}', 1, 1, 1, 1, 2, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (40, '溶解氧', 0, '系统', 108, 'dissolved_oxygen', 1, 'decimal', '{\"max\": 20, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"mg/L\"}', 1, 1, 1, 1, 3, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (41, '浊度', 0, '系统', 108, 'turbidity', 1, 'decimal', '{\"max\": 1000, \"min\": 0, \"step\": 1, \"type\": \"decimal\", \"unit\": \"NTU\"}', 1, 1, 1, 1, 4, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (42, '开度', 0, '系统', 109, 'opening', 1, 'integer', '{\"max\": 100, \"min\": 0, \"step\": 1, \"type\": \"integer\", \"unit\": \"%\"}', 1, 1, 1, 1, 1, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (43, '运行状态', 0, '系统', 109, 'run_status', 1, 'enum', '{\"type\": \"enum\", \"enumList\": [{\"text\": \"停止\", \"value\": 0}, {\"text\": \"开启\", \"value\": 1}, {\"text\": \"关闭\", \"value\": 2}]}', 1, 1, 1, 1, 2, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (44, '电压', 0, '系统', 109, 'voltage', 1, 'decimal', '{\"max\": 380, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"V\"}', 1, 1, 1, 1, 3, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (45, '电流', 0, '系统', 109, 'current', 1, 'decimal', '{\"max\": 100, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"A\"}', 1, 1, 1, 1, 4, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (46, '气温', 0, '系统', 110, 'air_temperature', 1, 'decimal', '{\"max\": 60, \"min\": -20, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"℃\"}', 1, 1, 1, 1, 1, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (47, '空气湿度', 0, '系统', 110, 'air_humidity', 1, 'integer', '{\"max\": 100, \"min\": 0, \"step\": 1, \"type\": \"integer\", \"unit\": \"%RH\"}', 1, 1, 1, 1, 2, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (48, '光照强度', 0, '系统', 110, 'light', 1, 'integer', '{\"max\": 200000, \"min\": 0, \"step\": 1, \"type\": \"integer\", \"unit\": \"lux\"}', 1, 1, 1, 1, 3, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (49, 'CO2浓度', 0, '系统', 110, 'co2', 1, 'integer', '{\"max\": 5000, \"min\": 0, \"step\": 1, \"type\": \"integer\", \"unit\": \"ppm\"}', 1, 1, 1, 1, 4, '0', 'admin', '2026-06-07 19:15:15', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (50, 'pH值', 0, '系统', 106, 'ph', 1, 'decimal', '{\"max\": 14, \"min\": 0, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"\"}', 1, 1, 1, 1, 3, '0', 'admin', '2026-06-07 19:51:36', '', NULL, NULL);
INSERT INTO `iot_things_model_template` VALUES (51, '土壤温度', 0, '系统', 106, 'soil_temperature', 1, 'decimal', '{\"max\": 60, \"min\": -20, \"step\": 0.1, \"type\": \"decimal\", \"unit\": \"℃\"}', 1, 1, 1, 1, 1, '0', 'admin', '2026-06-07 19:51:45', '', NULL, NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-purple', 'Y', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 00:24:08', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-02 13:27:51', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (9, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2026-05-31 23:30:52', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '重财智农', 1, '王梦', '15520066888', '3284355305@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 10:14:44');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '巴南龙洲湾总公司1', 1, '王梦', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 10:15:44');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '巴南龙洲湾分公司2', 2, '王梦', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 10:15:41');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 157 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '旱地', '0', 'agriculture_land_type', NULL, 'default', 'N', '0', 'admin', '2026-06-01 22:37:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '水田', '1', 'agriculture_land_type', NULL, 'default', 'N', '0', 'admin', '2026-06-01 22:38:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '温室大棚', '2', 'agriculture_land_type', NULL, 'default', 'N', '0', 'admin', '2026-06-01 22:38:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '正式员工', '0', 'agriculture_employee_type', NULL, 'primary', 'N', '0', 'admin', '2026-06-02 08:58:42', 'admin', '2026-06-02 09:02:49', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '零时工', '1', 'agriculture_employee_type', NULL, 'info', 'N', '0', 'admin', '2026-06-02 08:59:48', 'admin', '2026-06-02 09:03:10', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '空闲中', '0', 'agriculture_land_status', NULL, 'primary', 'N', '0', 'admin', '2026-06-02 16:46:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '种植中', '1', 'agriculture_land_status', NULL, 'warning', 'N', '0', 'admin', '2026-06-02 16:46:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 0, '天', '0', 'agriculture_cycle_unit', NULL, 'primary', 'N', '0', 'admin', '2026-06-02 16:48:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '周', '1', 'agriculture_cycle_unit', NULL, 'primary', 'N', '0', 'admin', '2026-06-02 16:48:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '未分配', '0', 'agriculture_batch_task_status', NULL, 'info', 'N', '0', 'admin', '2026-06-02 16:49:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '已分配', '1', 'agriculture_batch_task_status', NULL, 'primary', 'N', '0', 'admin', '2026-06-02 16:49:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '进行中', '2', 'agriculture_batch_task_status', NULL, 'warning', 'N', '0', 'admin', '2026-06-02 16:49:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 0, '已完成', '3', 'agriculture_batch_task_status', NULL, 'danger', 'N', '0', 'admin', '2026-06-02 16:49:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 3, '已损坏', '2', 'agriculture_land_status', NULL, 'danger', 'N', '0', 'admin', '2026-06-03 14:50:17', 'admin', '2026-06-03 14:50:33', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '属性', '1', 'iot_things_type', NULL, 'primary', 'N', '0', 'admin', '2026-06-06 11:14:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '功能', '2', 'iot_things_type', NULL, 'success', 'N', '0', 'admin', '2026-06-06 11:14:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 3, '事件', '3', 'iot_things_type', NULL, 'warning', 'N', '0', 'admin', '2026-06-06 11:14:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '整数', 'integer', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:43:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 2, '小数', 'decimal', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:43:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 3, '布尔', 'bool', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:43:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 4, '枚举', 'enum', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:43:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 5, '字符串', 'string', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:43:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 6, '数组', 'array', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:44:07', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 7, '对象', 'object', 'iot_data_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:44:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 1, '是', '1', 'iot_yes_no', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:45:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 2, '否', '0', 'iot_yes_no', NULL, 'default', 'N', '0', 'admin', '2026-06-06 11:45:47', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 1, '未发布', '1', 'iot_product_status', NULL, 'info', 'N', '0', 'admin', '2026-06-06 14:42:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 2, '已发布', '2', 'iot_product_status', NULL, 'success', 'N', '0', 'admin', '2026-06-06 14:42:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 1, '直连设备', '1', 'iot_device_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:43:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 2, '网关设备', '2', 'iot_device_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:43:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 3, '监控设备', '3', 'iot_device_type', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:44:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 1, 'WIFI', '1', 'iot_network_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:44:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 2, '蜂窝(4G/5G)', '2', 'iot_network_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:45:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 3, '以太网', '3', 'iot_network_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:45:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 4, '其他', '4', 'iot_network_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:45:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 1, '简单认证', '1', 'iot_vertificate_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:46:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 2, '加密认证', '2', 'iot_vertificate_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:46:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 3, '简单+加密', '3', 'iot_vertificate_method', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:47:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 1, 'ESP8266/Arduino', '1', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:48:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (139, 2, 'ESP8266/RTOS', '2', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:48:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (140, 3, 'ESP32/Arduino', '3', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:49:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 4, 'ESP32/ESP-IDF', '4', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:49:17', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (142, 5, '树莓派/Python', '5', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:49:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 6, '安卓/Android', '6', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:49:36', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 7, '其他', '7', 'iot_device_chip', NULL, 'default', 'N', '0', 'admin', '2026-06-06 14:49:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 1, '未激活', '1', 'iot_device_status', NULL, 'warning', 'N', '0', 'admin', '2026-06-06 14:52:14', 'admin', '2026-06-06 14:52:31', NULL);
INSERT INTO `sys_dict_data` VALUES (146, 2, '禁用', '2', 'iot_device_status', NULL, 'danger', 'N', '0', 'admin', '2026-06-06 14:52:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 3, '在线', '3', 'iot_device_status', NULL, 'success', 'N', '0', 'admin', '2026-06-06 14:52:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (148, 4, '离线', '4', 'iot_device_status', NULL, 'info', 'N', '0', 'admin', '2026-06-06 14:52:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 1, '启用', '1', 'iot_is_enable', NULL, 'success', 'N', '0', 'admin', '2026-06-06 14:54:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 0, '禁用', '0', 'iot_is_enable', NULL, 'info', 'N', '0', 'admin', '2026-06-06 14:54:59', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 1, '提醒通知', '1', 'iot_alert_level', NULL, 'info', 'N', '0', 'admin', '2026-06-06 14:55:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (152, 2, '轻微问题', '2', 'iot_alert_level', NULL, 'warning', 'N', '0', 'admin', '2026-06-06 14:55:57', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (153, 3, '严重警告', '3', 'iot_alert_level', NULL, 'danger', 'N', '0', 'admin', '2026-06-06 14:56:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (154, 1, '不需要处理', '1', 'iot_process_status', NULL, 'warning', 'N', '0', 'admin', '2026-06-06 14:56:44', 'admin', '2026-06-06 15:00:27', NULL);
INSERT INTO `sys_dict_data` VALUES (155, 2, '未处理', '2', 'iot_process_status', NULL, 'primary', 'N', '0', 'admin', '2026-06-06 14:59:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 3, '已处理', '3', 'iot_process_status', NULL, 'success', 'N', '0', 'admin', '2026-06-06 15:00:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '地块类别', 'agriculture_land_type', '0', 'admin', '2026-06-01 22:35:21', 'admin', '2026-06-01 22:35:42', '用于地块管理选择地块分类');
INSERT INTO `sys_dict_type` VALUES (101, '员工类型', 'agriculture_employee_type', '0', 'admin', '2026-06-02 08:58:03', 'admin', '2026-06-02 09:02:05', '用于关联员工职称');
INSERT INTO `sys_dict_type` VALUES (102, '地块状态', 'agriculture_land_status', '0', 'admin', '2026-06-02 16:45:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '单位类型', 'agriculture_cycle_unit', '0', 'admin', '2026-06-02 16:47:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, '任务状态', 'agriculture_batch_task_status', '0', 'admin', '2026-06-02 16:49:01', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '物模型类别', 'iot_things_type', '0', 'admin', '2026-06-06 11:13:49', '', NULL, '属性、动作、事件');
INSERT INTO `sys_dict_type` VALUES (106, '数据类型', 'iot_data_type', '0', 'admin', '2026-06-06 11:42:42', '', NULL, 'integer、decimal、bool、string、enum');
INSERT INTO `sys_dict_type` VALUES (107, '是否', 'iot_yes_no', '0', 'admin', '2026-06-06 11:45:16', '', NULL, '是、否');
INSERT INTO `sys_dict_type` VALUES (108, '产品状态', 'iot_product_status', '0', 'admin', '2026-06-06 14:42:22', '', NULL, '未发布、已发布（不能修改）');
INSERT INTO `sys_dict_type` VALUES (109, '设备类型', 'iot_device_type', '0', 'admin', '2026-06-06 14:43:17', '', NULL, '直连设备、网关子设备、网关设备');
INSERT INTO `sys_dict_type` VALUES (110, '联网方式', 'iot_network_method', '0', 'admin', '2026-06-06 14:44:30', '', NULL, 'wifi、蜂窝(4G/5G)、以太网、其他');
INSERT INTO `sys_dict_type` VALUES (111, '认证方式', 'iot_vertificate_method', '0', 'admin', '2026-06-06 14:45:59', '', NULL, '1=简单认证、2=加密认证、3=简单+加密');
INSERT INTO `sys_dict_type` VALUES (112, '设备芯片', 'iot_device_chip', '0', 'admin', '2026-06-06 14:48:09', '', NULL, 'ESP8266、ESP32、树莓派');
INSERT INTO `sys_dict_type` VALUES (113, '设备状态', 'iot_device_status', '0', 'admin', '2026-06-06 14:51:58', '', NULL, '未激活、禁用、在线、离线');
INSERT INTO `sys_dict_type` VALUES (114, '是否启用', 'iot_is_enable', '0', 'admin', '2026-06-06 14:54:19', '', NULL, '启用、禁用');
INSERT INTO `sys_dict_type` VALUES (115, '告警类型', 'iot_alert_level', '0', 'admin', '2026-06-06 14:55:24', '', NULL, '1=提醒通知，2=轻微问题，3=严重警告');
INSERT INTO `sys_dict_type` VALUES (116, '处理状态', 'iot_process_status', '0', 'admin', '2026-06-06 14:56:26', '', NULL, '1=不需要处理,2=未处理,3=已处理');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-05-31 23:30:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '异常信息',
  `start_time` datetime NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 00:12:33');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码已失效', '2026-06-01 08:16:55');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 08:16:57');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 08:43:34');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 09:09:07');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-06-01 09:10:01');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 09:10:06');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 09:11:57');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 09:14:15');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 09:27:13');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '用户不存在/密码错误', '2026-06-01 10:03:09');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 10:03:20');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 10:09:43');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 10:27:02');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 10:37:19');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '验证码错误', '2026-06-01 15:33:05');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '用户不存在/密码错误', '2026-06-01 15:33:07');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 15:33:14');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '验证码已失效', '2026-06-01 16:58:28');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '用户不存在/密码错误', '2026-06-01 16:58:33');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 16:58:40');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '退出成功', '2026-06-01 17:22:39');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 17:22:51');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-01 17:25:56');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 20:42:23');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 21:28:45');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '退出成功', '2026-06-01 22:03:17');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-01 22:03:23');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-02 08:44:24');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 08:44:32');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '验证码错误', '2026-06-02 08:52:20');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-02 08:52:26');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '验证码错误', '2026-06-02 08:54:33');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 08:54:36');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 10:50:08');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 12:33:05');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 13:25:00');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 13:25:04');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 14:22:11');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 19:37:25');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 20:59:41');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 20:59:43');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-02 21:19:58');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 21:20:00');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-02 22:06:02');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-03 10:08:35');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-03 14:26:38');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-03 16:13:56');
INSERT INTO `sys_logininfor` VALUES (148, 'test01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-03 16:14:02');
INSERT INTO `sys_logininfor` VALUES (149, 'test01', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-03 16:14:29');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-03 16:14:35');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-03 22:06:14');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '退出成功', '2026-06-03 22:06:36');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-03 22:06:43');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-03 22:06:47');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-03 22:06:51');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-03 22:06:55');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '用户不存在/密码错误', '2026-06-04 09:18:20');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-04 09:18:22');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-04 11:16:54');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-04 17:26:58');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-04 17:27:01');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-04 22:08:22');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-04 22:42:38');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-05 09:15:28');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-05 14:59:16');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-05 15:45:51');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-05 17:21:49');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 09:10:11');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-06 09:24:35');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 09:24:36');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '用户不存在/密码错误', '2026-06-06 09:25:21');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-06 09:25:24');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-06 14:37:52');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '退出成功', '2026-06-06 15:16:23');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-06 15:16:28');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '退出成功', '2026-06-06 15:29:31');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-06 15:31:38');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '1', '用户不存在/密码错误', '2026-06-06 16:42:30');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Edge 148', 'Windows >=10', '0', '登录成功', '2026-06-06 16:42:32');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-06 17:11:22');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-06 18:37:13');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '1', '用户不存在/密码错误', '2026-06-07 11:19:00');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-07 11:19:01');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 148', 'Windows10', '0', '登录成功', '2026-06-07 15:27:42');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-07 16:56:44');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-07 18:06:25');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Curl 8.16.0', '', '1', '用户不存在/密码错误', '2026-06-07 19:41:51');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 100, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 10:59:56', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 100, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 11:00:23', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 100, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 11:00:10', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-05-31 23:30:52', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-05-31 23:30:52', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-05-31 23:30:52', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-05-31 23:30:52', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-05-31 23:30:52', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-05-31 23:30:52', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-05-31 23:30:52', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-05-31 23:30:52', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-05-31 23:30:52', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-05-31 23:30:52', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-05-31 23:30:52', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-05-31 23:30:52', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-05-31 23:30:52', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-05-31 23:30:52', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-05-31 23:30:52', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-05-31 23:30:52', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-05-31 23:30:52', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-05-31 23:30:52', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-05-31 23:30:52', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-05-31 23:30:52', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '湖区农场', 0, 10, 'agriculture', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'table', 'admin', '2026-06-01 10:59:28', 'admin', '2026-06-01 11:35:22', '');
INSERT INTO `sys_menu` VALUES (2002, '设备', 0, 20, 'iot', NULL, NULL, '', 1, 0, 'M', '0', '0', '', 'iot', 'admin', '2026-06-01 11:04:32', 'admin', '2026-06-04 09:28:44', '');
INSERT INTO `sys_menu` VALUES (2003, '基地信息', 2001, 80, 'baseinfo', 'agriculture/baseinfo/index', '', '', 1, 0, 'C', '0', '0', 'agriculture:baseinfo:list', 'star', 'admin', '2026-06-01 11:36:31', 'admin', '2026-06-01 11:37:52', '');
INSERT INTO `sys_menu` VALUES (2004, '基地信息查询', 2003, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:baseinfo:query', '#', 'admin', '2026-06-01 11:37:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '基地信息新增', 2003, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:baseinfo:add', '#', 'admin', '2026-06-01 12:15:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '基地信息修改', 2003, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:baseinfo:edit', '#', 'admin', '2026-06-01 12:16:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '基地信息删除', 2003, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:baseinfo:remove', '#', 'admin', '2026-06-01 12:16:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '基地信息导出', 2003, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:baseinfo:export', '#', 'admin', '2026-06-01 12:17:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '员工管理', 2001, 20, 'employee', 'agriculture/employee/index', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:employee:list', 'peoples', 'admin', '2026-06-01 12:31:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '雇员查询', 2009, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:employee:query', '#', 'admin', '2026-06-01 12:32:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '雇员新增', 2009, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:employee:add', '#', 'admin', '2026-06-01 17:29:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '雇员修改', 2009, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:employee:edit', '#', 'admin', '2026-06-01 17:30:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '雇员删除', 2009, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:employee:remove', '#', 'admin', '2026-06-01 17:31:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '雇员导出', 2009, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:employee:export', '#', 'admin', '2026-06-01 17:31:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '农机信息', 2001, 30, 'machineInfo', 'agriculture/machineInfo/index', NULL, 'MachineInfo', 1, 0, 'C', '0', '0', 'agriculture:machineInfo:list', 'machine', 'admin', '2026-06-01 20:45:40', 'admin', '2026-06-02 08:54:57', '');
INSERT INTO `sys_menu` VALUES (2028, '农机信息查询', 2027, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineInfo:query', '#', 'admin', '2026-06-01 20:46:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '农机信息新增', 2027, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineInfo:add', '#', 'admin', '2026-06-01 20:46:26', 'admin', '2026-06-01 20:46:45', '');
INSERT INTO `sys_menu` VALUES (2030, '农机信息修改', 2027, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineInfo:edit', '#', 'admin', '2026-06-01 20:47:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '农机信息删除', 2027, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineInfo:remove', '#', 'admin', '2026-06-01 20:47:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, '农机信息导出', 2027, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineInfo:export', '#', 'admin', '2026-06-01 20:47:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '地块管理', 2001, 100, 'land', 'agriculture/land/index', NULL, 'Land', 1, 0, 'C', '0', '0', 'agriculture:land:list', 'land', 'admin', '2026-06-01 20:49:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '地块管理查询', 2033, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:land:query', '#', 'admin', '2026-06-01 20:51:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '地块管理新增', 2033, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:land:add', '#', 'admin', '2026-06-01 20:51:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '地块管理修改', 2033, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:land:edit', '#', 'admin', '2026-06-01 20:52:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '地块管理删除', 2033, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:land:remove', '#', 'admin', '2026-06-01 20:52:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '地块管理导出', 2033, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:land:export', '#', 'admin', '2026-06-01 20:52:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '农机类别', 2001, 40, 'machineType', 'agriculture/machineType/index', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:machineType:list', 'cate', 'admin', '2026-06-02 09:17:04', 'admin', '2026-06-02 09:19:07', '');
INSERT INTO `sys_menu` VALUES (2041, '农机类别查询', 2040, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineType:query', '#', 'admin', '2026-06-02 09:17:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '农机类别新增', 2040, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineType:add', '#', 'admin', '2026-06-02 09:17:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '农机类别修改', 2040, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineType:edit', '#', 'admin', '2026-06-02 09:18:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '农机类别删除', 2040, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineType:remove', '#', 'admin', '2026-06-02 09:18:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '农机类别导出', 2040, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:machineType:export', '#', 'admin', '2026-06-02 09:18:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '农资类别', 2001, 60, 'materialType', 'agriculture/materialType/index', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:materialType:list', '1', 'admin', '2026-06-02 09:19:49', 'admin', '2026-06-02 09:20:10', '');
INSERT INTO `sys_menu` VALUES (2047, '农资信息', 2001, 50, 'materialInfo', 'agriculture/materialInfo/index', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:materialInfo:list', 'material', 'admin', '2026-06-02 09:20:50', 'admin', '2026-06-02 10:53:19', '');
INSERT INTO `sys_menu` VALUES (2048, '农资信息查询', 2047, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialInfo:query', '#', 'admin', '2026-06-02 09:47:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2049, '农资信息新增', 2047, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialInfo:add', '#', 'admin', '2026-06-02 09:47:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2050, '农资信息修改', 2047, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialInfo:edit', '#', 'admin', '2026-06-02 09:47:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2051, '农资信息删除', 2047, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialInfo:remove', '#', 'admin', '2026-06-02 09:47:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '农资信息导出', 2047, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialInfo:export', '#', 'admin', '2026-06-02 09:48:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2053, '农资类别查询', 2046, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialType:query', '#', 'admin', '2026-06-02 09:48:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2054, '农资类别新增', 2047, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialType:add', '#', 'admin', '2026-06-02 09:48:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2055, '农资类别修改', 2046, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialType:edit', '#', 'admin', '2026-06-02 09:49:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2056, '农资类别新增', 2046, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialType:add', '#', 'admin', '2026-06-02 09:49:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '农资类别删除', 2046, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialType:remove', '#', 'admin', '2026-06-02 09:49:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '农资类别导出', 2046, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:materialType:export', '#', 'admin', '2026-06-02 09:49:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '种植系统', 2001, 65, 'germplasm', 'agriculture/germplasm/index', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:germplasm:list', 'emi', 'admin', '2026-06-02 13:47:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '种植查询', 2059, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:germplasm:query', '#', 'admin', '2026-06-02 13:47:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2061, '种植新增', 2059, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:germplasm:add', '#', 'admin', '2026-06-02 13:48:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2062, '种植修改', 2059, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:germplasm:edit', '#', 'admin', '2026-06-02 13:48:37', 'admin', '2026-06-02 13:49:03', '');
INSERT INTO `sys_menu` VALUES (2063, '种植删除', 2059, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:germplasm:remove', '#', 'admin', '2026-06-02 13:48:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2064, '种质导出', 2059, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:germplasm:export', '#', 'admin', '2026-06-02 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2065, '种植方法', 2059, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:method:list', '#', 'admin', '2026-06-02 13:50:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2066, '新增', 2065, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:method:add', '#', 'admin', '2026-06-02 13:54:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2067, '修改', 2065, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:method:edit', '#', 'admin', '2026-06-02 13:54:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2068, '删除', 2065, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:method:remove', '#', 'admin', '2026-06-02 13:54:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2069, '种植介绍', 2059, 7, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:intro:list', '#', 'admin', '2026-06-02 13:55:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2070, '作业流程', 2059, 8, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:standardJob:list', '#', 'admin', '2026-06-02 13:56:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2071, '新增', 2069, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:intro:add', '#', 'admin', '2026-06-02 14:22:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2072, '修改', 2069, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:intro:edit', '#', 'admin', '2026-06-02 14:23:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2073, '删除', 2069, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:intro:remove', '#', 'admin', '2026-06-02 14:23:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2074, '新增', 2070, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:standardJob:add', '#', 'admin', '2026-06-02 14:23:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2075, '修改', 2070, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:standardJob:edit', '#', 'admin', '2026-06-02 14:23:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2076, '删除', 2070, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:standardJob:remove', '#', 'admin', '2026-06-02 14:24:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '作物批次', 2001, 70, 'batch', 'agriculture/batch/index', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:batch:list', 'clipboard', 'admin', '2026-06-02 15:22:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '作物批次查询', 2077, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batch:query', '#', 'admin', '2026-06-02 15:23:20', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '作物批次新增', 2077, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batch:add,agriculture:batchTask:add', '#', 'admin', '2026-06-02 15:23:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '作物批次修改', 2077, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batch:edit', '#', 'admin', '2026-06-02 15:23:56', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '作物批次删除', 2077, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batch:remove', '#', 'admin', '2026-06-02 15:24:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '作物批次导出', 2077, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batch:export', '#', 'admin', '2026-06-02 15:24:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2083, '查看批次任务', 2077, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:list', '#', 'admin', '2026-06-02 15:24:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '新增', 2083, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:add', '#', 'admin', '2026-06-02 15:24:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '修改', 2083, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:query,agriculture:batchTask:edit', '#', 'admin', '2026-06-02 15:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2086, '删除', 2083, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:remove', '#', 'admin', '2026-06-02 15:25:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2087, '通用物模型', 2002, 20, 'template', 'iot/template/index', NULL, '', 1, 0, 'C', '0', '0', 'iot:template:list', 'model', 'admin', '2026-06-04 09:45:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2088, '通用物模型查询', 2087, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:template:query', '#', 'admin', '2026-06-04 09:46:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '通用物模型新增', 2087, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:template:add', '#', 'admin', '2026-06-04 09:46:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '通用物模型修改', 2087, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:template:edit', '#', 'admin', '2026-06-04 09:46:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2091, '通用物模型删除', 2087, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:template:remove', '#', 'admin', '2026-06-04 09:46:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2092, '通用物模型导出', 2087, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:template:export', '#', 'admin', '2026-06-04 09:47:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2099, '产品分类', 2002, 30, 'category', 'iot/category/index', NULL, '', 1, 0, 'C', '0', '0', 'iot:category:list', 'category', 'admin', '2026-06-05 15:47:27', 'admin', '2026-06-05 15:48:22', '');
INSERT INTO `sys_menu` VALUES (2100, '产品分类查询', 2099, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:category:query', '#', 'admin', '2026-06-05 15:47:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2101, '产品分类新增', 2099, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:category:add', '#', 'admin', '2026-06-05 15:48:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2102, '产品分类修改', 2099, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:category:edit', '#', 'admin', '2026-06-05 15:49:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2103, '产品分类删除', 2099, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:category:remove', '#', 'admin', '2026-06-05 15:49:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2104, '产品分类导出', 2099, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:category:export', '#', 'admin', '2026-06-05 15:49:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2105, '产品管理', 2002, 40, 'product', 'iot/product/index', NULL, '', 1, 0, 'C', '0', '0', 'iot:product:list', 'product', 'admin', '2026-06-05 15:50:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2106, '产品新增按钮', 2105, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:add', '#', 'admin', '2026-06-05 16:09:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2107, '产品修改按钮', 2105, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:query,iot:product:edit', '#', 'admin', '2026-06-05 16:09:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2108, '产品删除', 2105, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:remove', '#', 'admin', '2026-06-05 16:10:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2109, '产品导出', 2105, 50, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:export', '#', 'admin', '2026-06-05 16:10:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2110, '产品信息', 2002, 45, 'product-edit', 'iot/product/product-edit', NULL, '', 1, 0, 'C', '1', '0', NULL, 'subscribe1', 'admin', '2026-06-06 10:01:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2111, '基本信息', 2110, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:query', '#', 'admin', '2026-06-06 10:02:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2112, '基本信息-新增', 2111, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:add', '#', 'admin', '2026-06-06 10:02:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2113, '基本信息-修改', 2111, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:edit', '#', 'admin', '2026-06-06 10:02:45', 'admin', '2026-06-06 10:03:07', '');
INSERT INTO `sys_menu` VALUES (2114, '产品模型', 2110, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicemodel:list', '#', 'admin', '2026-06-06 10:07:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2115, '产品模型-新增', 2114, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicemodel:add', '#', 'admin', '2026-06-06 10:08:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2116, '产品模型-修改', 2114, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicemodel:query,iot:devicemodel:edit', '#', 'admin', '2026-06-06 10:08:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2117, '产品模型-删除', 2114, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicemodel:remove', '#', 'admin', '2026-06-06 10:08:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2118, '产品模型-导入通用物模型', 2114, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:template:list,iot:devicemodel:add', '#', 'admin', '2026-06-06 10:09:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2119, '固件管理', 2110, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:list', '#', 'admin', '2026-06-06 10:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2120, '固件管理-新增', 2119, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:add', '#', 'admin', '2026-06-06 10:09:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2121, '固件管理-删除', 2119, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:remove', '#', 'admin', '2026-06-06 10:09:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2122, '固件管理-修改', 2119, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:edit', '#', 'admin', '2026-06-06 10:10:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2123, '设备授权', 2110, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:authorize:list', '#', 'admin', '2026-06-06 10:20:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2124, '设备授权-新增', 2123, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:authorize:add', '#', 'admin', '2026-06-06 10:20:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2125, '设备授权-修改', 2123, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:authorize:query,iot:authorize:edit', '#', 'admin', '2026-06-06 10:20:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, '设备授权-删除', 2123, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:authorize:remove', '#', 'admin', '2026-06-06 10:20:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, '设备授权-导出', 2123, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:authorize:export', '#', 'admin', '2026-06-06 10:21:12', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, '告警配置', 2110, 50, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:list', '#', 'admin', '2026-06-06 10:23:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, '告警配置-新增', 2128, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:add', '#', 'admin', '2026-06-06 10:23:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '告警配置-修改', 2128, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:query,iot:alert:edit', '#', 'admin', '2026-06-06 10:23:38', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '告警配置-删除', 2128, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:remove', '#', 'admin', '2026-06-06 10:23:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2132, '发布/取消发布', 2110, 60, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:product:ispublish', '#', 'admin', '2026-06-06 10:24:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '产品固件', 2002, 50, 'firmware', 'iot/firmware/index', NULL, '', 1, 0, 'C', '0', '0', 'iot:firmware:list', 'firmware', 'admin', '2026-06-06 17:16:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '产品固件查询', 2133, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:query', '#', 'admin', '2026-06-06 17:17:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '产品固件新增', 2133, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:add', '#', 'admin', '2026-06-06 17:17:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '产品固件修改', 2133, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:edit', '#', 'admin', '2026-06-06 17:18:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '产品固件删除', 2133, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:remove', '#', 'admin', '2026-06-06 17:18:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2138, '产品固件导出', 2133, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:firmware:export', '#', 'admin', '2026-06-06 17:18:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '设备分组', 2002, 60, 'group', 'iot/group/index', NULL, '', 1, 0, 'C', '0', '0', 'iot:group:list', 'group', 'admin', '2026-06-06 17:21:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '设备分组查询', 2139, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:group:query', '#', 'admin', '2026-06-06 17:21:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '设备分组新增', 2139, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:group:add', '#', 'admin', '2026-06-06 17:21:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '设备分组修改', 2139, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:group:edit', '#', 'admin', '2026-06-06 17:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2143, '设备分组删除', 2139, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:group:remove', '#', 'admin', '2026-06-06 17:22:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2144, '设备分组导出', 2139, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:group:export', '#', 'admin', '2026-06-06 17:22:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, '设备管理', 2002, 70, 'device', 'iot/device/index', NULL, '', 1, 0, 'C', '0', '0', 'iot:device:list,agriculture:land:list,iot:group:list', 'device', 'admin', '2026-06-06 17:23:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2146, '查询按钮', 2145, 1, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:query', '#', 'admin', '2026-06-06 17:23:55', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '新增按钮', 2145, 2, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:add', '#', 'admin', '2026-06-06 17:24:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '编辑按钮', 2145, 3, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:edit', '#', 'admin', '2026-06-06 17:24:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2149, ' 删除按钮', 2145, 4, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:remove', '#', 'admin', '2026-06-06 17:24:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2150, '导出按钮', 2145, 5, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:export', '#', 'admin', '2026-06-06 17:24:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '运行状态按钮', 2145, 6, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:view', '#', 'admin', '2026-06-06 17:25:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2152, '设备运行状态', 2002, 75, 'device-view', 'iot/device/device-running-status', NULL, '', 1, 0, 'C', '0', '0', '', 'monitor-a', 'admin', '2026-06-06 17:28:16', 'admin', '2026-06-06 18:46:12', '');
INSERT INTO `sys_menu` VALUES (2153, '采集数据', 2152, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:device:query,iot:devicemodel:query', '#', 'admin', '2026-06-06 18:40:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2154, '采集数据-更改节点排版按钮', 2153, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:layout:add', '#', 'admin', '2026-06-06 18:40:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2155, '采集数据-实时数据按钮', 2153, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'device:view:monitor', '#', 'admin', '2026-06-06 18:40:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2156, '定时任务', 2152, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:list', '#', 'admin', '2026-06-06 18:41:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2157, '定时任务-新增按钮', 2156, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:add', '#', 'admin', '2026-06-06 18:41:17', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2158, '定时任务-修改按钮', 2156, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:edit', '#', 'admin', '2026-06-06 18:41:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2159, '定时任务-定时详细按钮', 2156, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:query', '#', 'admin', '2026-06-06 18:41:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2160, '定时任务-删除按钮', 2156, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:remove', '#', 'admin', '2026-06-06 18:42:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2161, '定时任务-执行一次按钮', 2156, 50, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:runonce', '#', 'admin', '2026-06-06 18:42:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2162, '定时任务-启用', 2156, 60, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejob:status', '#', 'admin', '2026-06-06 18:42:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2163, '定时任务-日志', 2156, 70, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicejoblog:list,iot:devicejoblog:export', '#', 'admin', '2026-06-06 18:43:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2164, '设备用户', 2152, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:deviceshare:list', '#', 'admin', '2026-06-06 18:43:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2165, '设备用户-分享按钮', 2164, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:deviceshare:add', '#', 'admin', '2026-06-06 18:43:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '设备用户-备注按钮', 2164, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:deviceshare:edit,iot:deviceshare:remark,iot:deviceshare:query', '#', 'admin', '2026-06-06 18:44:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2167, '设备用户-取消分享按钮', 2164, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:deviceshare:remove', '#', 'admin', '2026-06-06 18:44:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '设备日志', 2152, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicelog:list', '#', 'admin', '2026-06-06 18:44:41', 'admin', '2026-06-06 18:45:28', '');
INSERT INTO `sys_menu` VALUES (2169, '数据分析', 2152, 50, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:devicelog:list', '#', 'admin', '2026-06-06 18:44:55', 'admin', '2026-06-06 18:45:34', '');
INSERT INTO `sys_menu` VALUES (2170, '设备告警', 2002, 80, 'alertLog', 'iot/device/device-alert', NULL, '', 1, 0, 'C', '0', '0', 'iot:alert:list', 'alert', 'admin', '2026-06-06 18:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '设备告警查询', 2170, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:query', '#', 'admin', '2026-06-06 18:46:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '设备告警新增', 2170, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:add', '#', 'admin', '2026-06-06 18:47:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2173, '设备告警修改', 2170, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:edit', '#', 'admin', '2026-06-06 18:47:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2174, '设备告警删除', 2170, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:remove', '#', 'admin', '2026-06-06 18:47:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2175, '设备告警导出', 2170, 50, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'iot:alert:export', '#', 'admin', '2026-06-06 18:47:52', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2176, '任务管理', 2001, 110, 'task', 'agriculture/taskManager/index.vue', NULL, '', 1, 0, 'C', '0', '0', 'agriculture:batch:list,agriculture:batchTask:list', 'clipboard', 'admin', '2026-06-07 11:32:18', 'admin', '2026-06-07 11:47:39', '');
INSERT INTO `sys_menu` VALUES (2177, '任务处理按钮', 2176, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:query', '#', 'admin', '2026-06-07 11:33:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '任务基本信息视频图片附件修改', 2177, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:edit', '#', 'admin', '2026-06-07 11:33:38', 'admin', '2026-06-07 11:39:29', '');
INSERT INTO `sys_menu` VALUES (2179, '任务信息', 2177, 15, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:batchTask:query,agriculture:taskEmployee:list,agriculture:log:list', '#', 'admin', '2026-06-07 11:34:54', 'admin', '2026-06-07 11:39:48', '');
INSERT INTO `sys_menu` VALUES (2180, '人员', 2179, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:taskEmployee:add,agriculture:taskEmployee:remove', '#', 'admin', '2026-06-07 11:35:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2181, '人工工时', 2177, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costEmployee:list', '#', 'admin', '2026-06-07 11:35:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2182, '新增', 2181, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costEmployee:add', '#', 'admin', '2026-06-07 11:36:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2183, '修改', 2181, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costEmployee:query,agriculture:costEmployee:edit', '#', 'admin', '2026-06-07 11:36:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2184, '删除', 2181, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costEmployee:remove', '#', 'admin', '2026-06-07 11:36:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2185, '机械工时', 2177, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMachine:list', '#', 'admin', '2026-06-07 11:36:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2186, '新增', 2185, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMachine:add', '#', 'admin', '2026-06-07 11:37:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2187, '修改', 2185, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMachine:query,agriculture:costMachine:edit', '#', 'admin', '2026-06-07 11:37:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2188, '删除', 2185, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMachine:remove', '#', 'admin', '2026-06-07 11:37:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2189, '农资用量', 2177, 40, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMaterial:list', '#', 'admin', '2026-06-07 11:38:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '新增', 2189, 10, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMaterial:add', '#', 'admin', '2026-06-07 11:38:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '修改', 2189, 20, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMaterial:query,agriculture:costMaterial:edit', '#', 'admin', '2026-06-07 11:38:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2192, '删除', 2189, 30, '', NULL, NULL, '', 1, 0, 'F', '0', '0', 'agriculture:costMaterial:remove', '#', 'admin', '2026-06-07 11:38:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (10, '正式启动重财智农项目开发', '2', 0x3C703E3C7370616E20636C6173733D22716C2D73697A652D6C61726765223EE9A284E7A59DE9A1B9E79BAEE8BF9BE8A18CE9A1BAE588A93C2F7370616E3E3C2F703E, '0', 'admin', '2026-06-02 13:29:11', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE COMMENT '同一用户同一公告只记录一次'
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '公告已读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_read
-- ----------------------------
INSERT INTO `sys_notice_read` VALUES (4, 10, 1, '2026-06-02 22:07:31');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 660 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":1,\"configKey\":\"sys.index.skinName\",\"configName\":\"主框架页-默认皮肤样式名称\",\"configType\":\"Y\",\"configValue\":\"skin-purple\",\"createBy\":\"admin\",\"createTime\":\"2026-05-31 23:30:52\",\"params\":{},\"remark\":\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 00:24:08', 29);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-06-01 08:18:51', 19);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-31 23:30:52\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 08:19:22', 35);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-06-01 08:19:24', 6);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-31 23:30:52\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 08:19:38', 11);
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-06-01 08:19:43', 6);
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"重财智农\",\"email\":\"3284355305@qq.com\",\"leader\":\"王梦\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"phone\":\"15520066888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:14:44', 35);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"巴南龙洲湾总公司\",\"email\":\"ry@qq.com\",\"leader\":\"王梦\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"重财智农\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:15:23', 28);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"巴南龙洲湾分公司2\",\"email\":\"ry@qq.com\",\"leader\":\"王梦\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"重财智农\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:15:41', 19);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"巴南龙洲湾总公司1\",\"email\":\"ry@qq.com\",\"leader\":\"王梦\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"重财智农\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:15:44', 20);
INSERT INTO `sys_oper_log` VALUES (110, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:43:44', 212);
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"index\",\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"首页\",\"menuType\":\"C\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"index\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:57:32', 21);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农场\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"agriculture\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:59:28', 9);
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-31 23:30:52\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 10:59:56', 10);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-31 23:30:52\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:00:10', 8);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-05-31 23:30:52\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":100,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:00:23', 9);
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-06-01 11:01:18', 9);
INSERT INTO `sys_oper_log` VALUES (117, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-05-31 23:30:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:02:28', 48);
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:02:34', 8);
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备\",\"menuType\":\"M\",\"orderNum\":20,\"params\":{},\"parentId\":0,\"path\":\"iot\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:04:32', 11);
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-01 10:59:28\",\"icon\":\"table\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"湖区农场\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"agriculture\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:35:22', 48);
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/baseinfo/index\",\"createBy\":\"admin\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基地信息\",\"menuType\":\"C\",\"orderNum\":80,\"params\":{},\"parentId\":2001,\"path\":\"baseinfo\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:36:31', 10);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基地信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"agriculture:baseinfo:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:37:27', 8);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/baseinfo/index\",\"createTime\":\"2026-06-01 11:36:31\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"基地信息\",\"menuType\":\"C\",\"orderNum\":80,\"params\":{},\"parentId\":2001,\"path\":\"baseinfo\",\"perms\":\"agriculture:baseinfo:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:37:52', 9);
INSERT INTO `sys_oper_log` VALUES (124, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"王梦\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:57:13', 8);
INSERT INTO `sys_oper_log` VALUES (125, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2026-05-31 23:30:52\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2026-05-31 23:30:52\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"王梦2\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"pwdUpdateDate\":\"2026-05-31 23:30:52\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 11:57:42', 18);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2000', '127.0.0.1', '内网IP', '2000 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:09:56', 14);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基地信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"perms\":\"agriculture:baseinfo:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:15:12', 12);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基地信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"perms\":\"agriculture:baseinfo:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:16:26', 9);
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基地信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"perms\":\"agriculture:baseinfo:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:16:50', 6);
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基地信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2003,\"perms\":\"agriculture:baseinfo:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:17:09', 11);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/employee/index\",\"createBy\":\"admin\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2001,\"path\":\"employee\",\"perms\":\"agriculture:employee:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:31:33', 13);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"雇员查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2009,\"perms\":\"agriculture:employee:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 12:32:38', 9);
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_employee\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 15:34:08', 105);
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_employee\"}', NULL, 0, NULL, '2026-06-01 15:34:46', 325);
INSERT INTO `sys_oper_log` VALUES (135, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/employee/index\",\"createTime\":\"2026-06-01 12:31:33\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2001,\"path\":\"employee\",\"perms\":\"agriculture:employee:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'员工管理\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-01 17:17:49', 19);
INSERT INTO `sys_oper_log` VALUES (136, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/employee/index\",\"createTime\":\"2026-06-01 12:31:33\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2001,\"path\":\"employee\",\"perms\":\"agriculture:employee:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'员工管理\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-01 17:17:55', 6);
INSERT INTO `sys_oper_log` VALUES (137, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/employee/index\",\"createTime\":\"2026-06-01 12:31:33\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2001,\"path\":\"employee\",\"perms\":\"agriculture:employee:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'员工管理\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-01 17:18:00', 6);
INSERT INTO `sys_oper_log` VALUES (138, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/employee/index\",\"createTime\":\"2026-06-01 12:31:33\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2001,\"path\":\"employee\",\"perms\":\"agriculture:employee:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'员工管理\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-01 17:18:07', 5);
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/employee/index\",\"createTime\":\"2026-06-01 12:31:33\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2009,\"menuName\":\"员工管理\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2001,\"path\":\"employee\",\"perms\":\"agriculture:employee:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'员工管理\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-01 17:19:45', 7);
INSERT INTO `sys_oper_log` VALUES (140, '雇员', 1, 'com.ruoyi.controller.system.AgricultureEmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-01 17:28:07\",\"delFlag\":\"3\",\"employeeAddress\":\"重庆市巴南区龙洲湾街道\",\"employeeCode\":\"1001\",\"employeeId\":\"5\",\"employeeName\":\"王梦\",\"employeeTel\":\"18325209791\",\"orderNum\":1,\"params\":{},\"remark\":\"程序员\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 17:28:07', 14);
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"雇员新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2009,\"perms\":\"agriculture:employee:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 17:29:33', 9);
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"雇员修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2009,\"perms\":\"agriculture:employee:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 17:30:45', 7);
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"雇员删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2009,\"perms\":\"agriculture:employee:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 17:31:13', 11);
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"雇员导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2009,\"perms\":\"agriculture:employee:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 17:31:43', 10);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_baseinfo\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 17:45:23', 98);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_baseinfo\"}', NULL, 0, NULL, '2026-06-01 17:45:26', 131);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_baseinfo\"}', NULL, 0, NULL, '2026-06-01 17:45:49', 32);
INSERT INTO `sys_oper_log` VALUES (148, '基地信息', 2, 'com.ruoyi.controller.system.AgricultureBaseinfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/baseinfo', '127.0.0.1', '内网IP', '{\"baseAddress\":\"重庆巴南\",\"baseAltitude\":5,\"baseArea\":\"50\",\"baseCode\":\"001\",\"baseCoordinate\":\"106.33,29.20\",\"baseDes\":\"校级项目\",\"baseId\":\"2\",\"baseImg\":\"/profile/iot/1/2023-0517-082150.png\",\"baseLeader\":\"王梦\",\"baseName\":\"环湖农业数智水稻\",\"baseShortName\":\"环湖农业\",\"createBy\":\"0\",\"createTime\":\"2023-05-17 08:22:14\",\"delFlag\":\"0\",\"leaderTel\":\"18325209791\",\"orderNum\":0,\"params\":{},\"remark\":\"综合实践\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 18:13:27\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 18:13:27', 68);
INSERT INTO `sys_oper_log` VALUES (149, '基地信息', 2, 'com.ruoyi.controller.system.AgricultureBaseinfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/baseinfo', '127.0.0.1', '内网IP', '{\"baseAddress\":\"重庆巴南\",\"baseAltitude\":5,\"baseArea\":\"50\",\"baseCode\":\"001\",\"baseCoordinate\":\"106.33,29.20\",\"baseDes\":\"校级项目\",\"baseId\":\"2\",\"baseImg\":\"/profile/upload/2026/06/01/微信图片_20260601181453_117_102_20260601181538A001.png\",\"baseLeader\":\"王梦\",\"baseName\":\"环湖农业数智水稻\",\"baseShortName\":\"环湖农业\",\"createBy\":\"0\",\"createTime\":\"2023-05-17 08:22:14\",\"delFlag\":\"0\",\"leaderTel\":\"18325209791\",\"orderNum\":0,\"params\":{},\"remark\":\"综合实践\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 18:15:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 18:15:40', 7);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_land\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 18:26:09', 80);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_land\"}', NULL, 0, NULL, '2026-06-01 18:26:11', 140);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_machine_info\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 18:28:10', 42);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_machine_info,agriculture_land\"}', NULL, 0, NULL, '2026-06-01 18:28:17', 92);
INSERT INTO `sys_oper_log` VALUES (154, '雇员', 2, 'com.ruoyi.controller.system.AgricultureEmployeeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-01 17:28:07\",\"delFlag\":\"0\",\"employeeAddress\":\"重庆市巴南区龙洲湾街道\",\"employeeCode\":\"1001\",\"employeeId\":\"5\",\"employeeName\":\"王梦\",\"employeeSex\":\"0\",\"employeeTel\":\"18325209791\",\"employeeType\":\"0\",\"orderNum\":1,\"params\":{},\"remark\":\"程序员\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 20:43:22\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:43:22', 17);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/machineInfo/index\",\"createBy\":\"admin\",\"icon\":\"machine\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机信息\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":2001,\"path\":\"machineInfo\",\"perms\":\"agriculture:machineInfo:list\",\"routeName\":\"MachineInfo\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:45:40', 21);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"perms\":\"agriculture:machineInfo:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:46:00', 6);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2028,\"perms\":\"agriculture:machineInfo:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:46:26', 7);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-01 20:46:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2029,\"menuName\":\"农机信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2027,\"path\":\"\",\"perms\":\"agriculture:machineInfo:add\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:46:45', 9);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2027,\"perms\":\"agriculture:machineInfo:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:47:06', 7);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2027,\"perms\":\"agriculture:machineInfo:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:47:32', 30);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2027,\"perms\":\"agriculture:machineInfo:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:47:51', 8);
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/machineInfo/index\",\"createTime\":\"2026-06-01 20:45:40\",\"icon\":\"machine\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"农业机器信息\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":2001,\"path\":\"machineInfo\",\"perms\":\"agriculture:machineInfo:list\",\"routeName\":\"MachineInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:48:09', 6);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/land/index\",\"createBy\":\"admin\",\"icon\":\"land\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块管理\",\"menuType\":\"C\",\"orderNum\":100,\"params\":{},\"parentId\":2001,\"path\":\"land\",\"perms\":\"agriculture:land:list\",\"routeName\":\"Land\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:49:20', 8);
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块管理查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"agriculture:land:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:51:20', 9);
INSERT INTO `sys_oper_log` VALUES (165, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块管理新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2033,\"perms\":\"agriculture:land:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:51:58', 10);
INSERT INTO `sys_oper_log` VALUES (166, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块管理修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2033,\"perms\":\"agriculture:land:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:52:15', 6);
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块管理删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2033,\"perms\":\"agriculture:land:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:52:27', 7);
INSERT INTO `sys_oper_log` VALUES (168, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块管理导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2033,\"perms\":\"agriculture:land:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:52:43', 15);
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/machineInfo/index\",\"createTime\":\"2026-06-01 20:45:40\",\"icon\":\"machine\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"农业机器信息\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":2001,\"path\":\"machineInfo\",\"perms\":\"agriculture:machineInfo:list\",\"routeName\":\"MachineInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 20:56:33', 12);
INSERT INTO `sys_oper_log` VALUES (170, '机械信息', 2, 'com.ruoyi.controller.system.AgricultureMachineInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:30:20\",\"delFlag\":\"0\",\"machineCode\":\"001\",\"machineId\":\"1\",\"machineName\":\"铲子\",\"machineTypeId\":1,\"measureUnit\":\"辆\",\"orderNum\":1,\"params\":{},\"remark\":\"购买的\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 21:00:32\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:00:32', 38);
INSERT INTO `sys_oper_log` VALUES (171, '机械信息', 2, 'com.ruoyi.controller.system.AgricultureMachineInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:30:20\",\"delFlag\":\"0\",\"machineCode\":\"001\",\"machineId\":\"1\",\"machineName\":\"铲子\",\"machineTypeId\":1,\"measureUnit\":\"辆\",\"orderNum\":1,\"params\":{},\"remark\":\"2026.5.31日购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 21:00:51\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:00:51', 9);
INSERT INTO `sys_oper_log` VALUES (172, '机械信息', 2, 'com.ruoyi.controller.system.AgricultureMachineInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/info', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:30:20\",\"delFlag\":\"0\",\"machineCode\":\"001\",\"machineId\":\"1\",\"machineName\":\"铲子\",\"machineTypeId\":1,\"measureUnit\":\"把\",\"orderNum\":1,\"params\":{},\"remark\":\"2026.5.31日购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 21:00:58\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:00:58', 7);
INSERT INTO `sys_oper_log` VALUES (173, '地块', 3, 'com.ruoyi.controller.system.AgricultureLandController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/land/1', '127.0.0.1', '内网IP', '[\"1\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:54:52', 169);
INSERT INTO `sys_oper_log` VALUES (174, '地块', 3, 'com.ruoyi.controller.system.AgricultureLandController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/land/2', '127.0.0.1', '内网IP', '[\"2\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:54:54', 7);
INSERT INTO `sys_oper_log` VALUES (175, '地块', 3, 'com.ruoyi.controller.system.AgricultureLandController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/land/3', '127.0.0.1', '内网IP', '[\"3\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:54:56', 5);
INSERT INTO `sys_oper_log` VALUES (176, '地块', 3, 'com.ruoyi.controller.system.AgricultureLandController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/land/4', '127.0.0.1', '内网IP', '[\"4\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:54:58', 4);
INSERT INTO `sys_oper_log` VALUES (177, '地块', 3, 'com.ruoyi.controller.system.AgricultureLandController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/land/5', '127.0.0.1', '内网IP', '[\"5\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:54:59', 3);
INSERT INTO `sys_oper_log` VALUES (178, '地块', 3, 'com.ruoyi.controller.system.AgricultureLandController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/land/6', '127.0.0.1', '内网IP', '[\"6\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 21:55:01', 5);
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/landcate/index\",\"createBy\":\"admin\",\"icon\":\"2\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"地块类别\",\"menuType\":\"C\",\"orderNum\":95,\"params\":{},\"parentId\":2001,\"path\":\"landcate\",\"perms\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:28:28', 68);
INSERT INTO `sys_oper_log` VALUES (180, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"地块类别\",\"dictType\":\"agriculture_land_type\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:35:21', 55);
INSERT INTO `sys_oper_log` VALUES (181, '字典类型', 2, 'com.ruoyi.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-01 22:35:21\",\"dictId\":100,\"dictName\":\"地块类别\",\"dictType\":\"agriculture_land_type\",\"params\":{},\"remark\":\"用于地块管理选择地块分类\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:35:42', 52);
INSERT INTO `sys_oper_log` VALUES (182, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"旱地\",\"dictSort\":1,\"dictType\":\"agriculture_land_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:37:45', 13);
INSERT INTO `sys_oper_log` VALUES (183, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"水田\",\"dictSort\":2,\"dictType\":\"agriculture_land_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:38:07', 10);
INSERT INTO `sys_oper_log` VALUES (184, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"温室大棚\",\"dictSort\":3,\"dictType\":\"agriculture_land_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:38:25', 10);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2039', '127.0.0.1', '内网IP', '2039 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:44:15', 37);
INSERT INTO `sys_oper_log` VALUES (186, '地块', 1, 'com.ruoyi.controller.system.AgricultureLandController.add()', 'POST', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-01 22:45:20\",\"fillColor\":\"#09DD37\",\"fillOpacity\":0.5,\"landArea\":2,\"landId\":\"7\",\"landName\":\"水稻1区\",\"landPath\":\"106.526079,29.344398|106.52589,29.344319|106.525922,29.34424|106.526042,29.344159|106.526167,29.344162|106.526269,29.344301\",\"landType\":\"1\",\"params\":{},\"status\":\"0\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.7,\"strokeWeight\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:45:21', 81);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2026-06-01 22:54:41', 5);
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2026', '127.0.0.1', '内网IP', '2026 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:54:49', 7);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2025', '127.0.0.1', '内网IP', '2025 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:54:53', 10);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2024', '127.0.0.1', '内网IP', '2024 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:54:56', 10);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2023', '127.0.0.1', '内网IP', '2023 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:54:58', 11);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2022', '127.0.0.1', '内网IP', '2022 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:01', 10);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2021', '127.0.0.1', '内网IP', '2021 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:03', 9);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2016', '127.0.0.1', '内网IP', '2016 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:32', 10);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2015', '127.0.0.1', '内网IP', '2015 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:34', 9);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2014', '127.0.0.1', '内网IP', '2014 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:37', 9);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2013', '127.0.0.1', '内网IP', '2013 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:39', 8);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2012', '127.0.0.1', '内网IP', '2012 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:42', 8);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2011', '127.0.0.1', '内网IP', '2011 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:55:45', 7);
INSERT INTO `sys_oper_log` VALUES (200, '基地信息', 2, 'com.ruoyi.controller.system.AgricultureBaseinfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/baseinfo', '127.0.0.1', '内网IP', '{\"baseAddress\":\"重庆巴南\",\"baseAltitude\":5,\"baseArea\":\"50\",\"baseCode\":\"001\",\"baseCoordinate\":\"106.33,29.20\",\"baseDes\":\"校级项目\",\"baseId\":\"2\",\"baseImg\":\"/profile/upload/2026/06/01/微信图片_20260601181453_117_102_20260601225612A001.png\",\"baseLeader\":\"王梦\",\"baseName\":\"环湖农业数智水稻\",\"baseShortName\":\"环湖农业\",\"createBy\":\"0\",\"createTime\":\"2023-05-17 08:22:14\",\"delFlag\":\"0\",\"leaderTel\":\"18325209791\",\"orderNum\":0,\"params\":{},\"remark\":\"综合实践\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-01 22:56:16\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-01 22:56:17', 53);
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/machineInfo/index\",\"createTime\":\"2026-06-01 20:45:40\",\"icon\":\"machine\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"农机信息\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":2001,\"path\":\"machineInfo\",\"perms\":\"agriculture:machineInfo:list\",\"routeName\":\"MachineInfo\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 08:54:57', 48);
INSERT INTO `sys_oper_log` VALUES (202, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"员工类型\",\"dictType\":\"agriculture_employee_type\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 08:58:03', 9);
INSERT INTO `sys_oper_log` VALUES (203, '字典类型', 2, 'com.ruoyi.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-02 08:58:03\",\"dictId\":101,\"dictName\":\"员工类型\",\"dictType\":\"agriculture_employee_type\",\"params\":{},\"remark\":\"用于关联员工职称\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 08:58:23', 26);
INSERT INTO `sys_oper_log` VALUES (204, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"农民\",\"dictSort\":1,\"dictType\":\"agriculture_employee_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 08:58:42', 3);
INSERT INTO `sys_oper_log` VALUES (205, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"除草工\",\"dictSort\":2,\"dictType\":\"agriculture_employee_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 08:59:48', 11);
INSERT INTO `sys_oper_log` VALUES (206, '字典类型', 2, 'com.ruoyi.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-02 08:58:03\",\"dictId\":101,\"dictName\":\"员工类型\",\"dictType\":\"agriculture_employee_type\",\"params\":{},\"remark\":\"用于关联员工职称\",\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:02:05', 18);
INSERT INTO `sys_oper_log` VALUES (207, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-02 08:58:42\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"正式员工\",\"dictSort\":0,\"dictType\":\"agriculture_employee_type\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:02:49', 6);
INSERT INTO `sys_oper_log` VALUES (208, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-02 08:59:48\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"零时工\",\"dictSort\":0,\"dictType\":\"agriculture_employee_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:03:11', 9);
INSERT INTO `sys_oper_log` VALUES (209, '雇员', 1, 'com.ruoyi.controller.system.AgricultureEmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 09:10:08\",\"employeeAddress\":\"重庆市巴南区\",\"employeeCode\":\"1002\",\"employeeId\":\"6\",\"employeeName\":\"陈宇\",\"employeeSex\":\"0\",\"employeeTel\":\"15588877456\",\"employeeType\":\"0\",\"orderNum\":3,\"params\":{},\"remark\":\"5.31临时招聘\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:10:08', 20);
INSERT INTO `sys_oper_log` VALUES (210, '雇员', 1, 'com.ruoyi.controller.system.AgricultureEmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 09:10:53\",\"employeeAddress\":\"重庆市江北区\",\"employeeCode\":\"1002\",\"employeeId\":\"7\",\"employeeName\":\"郭浩铭\",\"employeeSex\":\"0\",\"employeeTel\":\"15564856697\",\"employeeType\":\"1\",\"orderNum\":3,\"params\":{},\"remark\":\"临时工6.7号完工\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:10:53', 6);
INSERT INTO `sys_oper_log` VALUES (211, '雇员', 1, 'com.ruoyi.controller.system.AgricultureEmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 09:11:35\",\"employeeAddress\":\"重庆市高新技术开发区\",\"employeeCode\":\"1004\",\"employeeId\":\"8\",\"employeeName\":\"罗一凡\",\"employeeSex\":\"0\",\"employeeTel\":\"13266458879\",\"employeeType\":\"0\",\"orderNum\":0,\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:11:35', 6);
INSERT INTO `sys_oper_log` VALUES (212, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/machineType/index\",\"createBy\":\"admin\",\"icon\":\"cate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机类别\",\"menuType\":\"C\",\"orderNum\":90,\"params\":{},\"parentId\":2001,\"path\":\"machineType\",\"perms\":\"agriculture:machineType:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:17:04', 15);
INSERT INTO `sys_oper_log` VALUES (213, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机类别查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2040,\"perms\":\"agriculture:machineType:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:17:26', 9);
INSERT INTO `sys_oper_log` VALUES (214, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机类别新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2040,\"perms\":\"agriculture:machineType:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:17:43', 8);
INSERT INTO `sys_oper_log` VALUES (215, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机类别修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2040,\"perms\":\"agriculture:machineType:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:18:03', 12);
INSERT INTO `sys_oper_log` VALUES (216, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机类别删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2040,\"perms\":\"agriculture:machineType:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:18:17', 8);
INSERT INTO `sys_oper_log` VALUES (217, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农机类别导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2040,\"perms\":\"agriculture:machineType:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:18:31', 7);
INSERT INTO `sys_oper_log` VALUES (218, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/machineType/index\",\"createTime\":\"2026-06-02 09:17:04\",\"icon\":\"cate\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2040,\"menuName\":\"农机类别\",\"menuType\":\"C\",\"orderNum\":40,\"params\":{},\"parentId\":2001,\"path\":\"machineType\",\"perms\":\"agriculture:machineType:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:19:07', 8);
INSERT INTO `sys_oper_log` VALUES (219, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/materialType/index\",\"createBy\":\"admin\",\"icon\":\"1\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别\",\"menuType\":\"C\",\"orderNum\":50,\"params\":{},\"parentId\":2001,\"path\":\"materialType\",\"perms\":\"agriculture:materialType:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:19:49', 6);
INSERT INTO `sys_oper_log` VALUES (220, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/materialType/index\",\"createTime\":\"2026-06-02 09:19:49\",\"icon\":\"1\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2046,\"menuName\":\"农资类别\",\"menuType\":\"C\",\"orderNum\":60,\"params\":{},\"parentId\":2001,\"path\":\"materialType\",\"perms\":\"agriculture:materialType:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:20:10', 11);
INSERT INTO `sys_oper_log` VALUES (221, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/materialInfo/index\",\"createBy\":\"admin\",\"icon\":\"material\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资信息\",\"menuType\":\"C\",\"orderNum\":50,\"params\":{},\"parentId\":2001,\"path\":\"materialInfo\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:20:50', 14);
INSERT INTO `sys_oper_log` VALUES (222, '个人信息', 2, 'com.ruoyi.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"3284355305@qq.com\",\"nickName\":\"王梦\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:23:18', 10);
INSERT INTO `sys_oper_log` VALUES (223, '用户头像', 2, 'com.ruoyi.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/06/02/438e8b25ed3e44079d53824ad79df24f.png\",\"code\":200}', 0, NULL, '2026-06-02 09:28:01', 174);
INSERT INTO `sys_oper_log` VALUES (224, '个人信息', 2, 'com.ruoyi.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"3284355305@qq.com\",\"nickName\":\"王梦\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:46:21', 33);
INSERT INTO `sys_oper_log` VALUES (225, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资信息查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2047,\"perms\":\"agriculture:materialInfo:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:47:05', 12);
INSERT INTO `sys_oper_log` VALUES (226, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资信息新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2047,\"perms\":\"agriculture:materialInfo:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:47:23', 8);
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资信息修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2047,\"perms\":\"agriculture:materialInfo:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:47:38', 7);
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资信息删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2047,\"perms\":\"agriculture:materialInfo:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:47:53', 10);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资信息导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2047,\"perms\":\"agriculture:materialInfo:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:48:13', 8);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2046,\"perms\":\"agriculture:materialType:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:48:37', 9);
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2047,\"perms\":\"agriculture:materialType:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:48:48', 11);
INSERT INTO `sys_oper_log` VALUES (232, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2046,\"perms\":\"agriculture:materialType:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:49:06', 9);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2046,\"perms\":\"agriculture:materialType:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:49:29', 6);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2046,\"perms\":\"agriculture:materialType:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:49:45', 9);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资类别导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2046,\"perms\":\"agriculture:materialType:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:49:56', 9);
INSERT INTO `sys_oper_log` VALUES (236, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_machine_type,agriculture_material_info,agriculture_material_type\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 09:51:59', 101);
INSERT INTO `sys_oper_log` VALUES (237, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_material_info,agriculture_machine_type,agriculture_material_type\"}', NULL, 0, NULL, '2026-06-02 09:52:10', 461);
INSERT INTO `sys_oper_log` VALUES (238, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/materialInfo/index\",\"createTime\":\"2026-06-02 09:20:50\",\"icon\":\"material\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2047,\"menuName\":\"农资信息\",\"menuType\":\"C\",\"orderNum\":50,\"params\":{},\"parentId\":2001,\"path\":\"materialInfo\",\"perms\":\"agriculture:materialInfo:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 10:53:19', 31);
INSERT INTO `sys_oper_log` VALUES (239, '机械信息', 2, 'com.ruoyi.controller.system.AgricultureMachineInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/machine', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:30:20\",\"delFlag\":\"0\",\"machineCode\":\"001\",\"machineId\":\"1\",\"machineName\":\"铲子\",\"machineTypeId\":\"1\",\"machineTypeName\":\"拖拉机\",\"measureUnit\":\"把\",\"orderNum\":1,\"params\":{},\"remark\":\"2026.5.31日购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 12:40:10\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 12:40:10', 14);
INSERT INTO `sys_oper_log` VALUES (240, '机械信息', 2, 'com.ruoyi.controller.system.AgricultureMachineInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/machine', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:30:20\",\"delFlag\":\"0\",\"machineCode\":\"001\",\"machineId\":\"1\",\"machineName\":\"东方红天天向上牌拖拉机\",\"machineTypeId\":\"1\",\"machineTypeName\":\"拖拉机\",\"measureUnit\":\"辆\",\"orderNum\":1,\"params\":{},\"remark\":\"2026.5.31日购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 12:40:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 12:40:40', 6);
INSERT INTO `sys_oper_log` VALUES (241, '机械信息', 1, 'com.ruoyi.controller.system.AgricultureMachineInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/machine', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 12:42:05\",\"machineCode\":\"002\",\"machineId\":\"2\",\"machineName\":\"飞利浦除草机\",\"machineTypeId\":\"2\",\"measureUnit\":\"台\",\"orderNum\":2,\"params\":{},\"remark\":\"6.2号购买\\n陈宇，陈总购买\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 12:42:05', 7);
INSERT INTO `sys_oper_log` VALUES (242, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_material_type\"}', NULL, 0, NULL, '2026-06-02 12:45:06', 239);
INSERT INTO `sys_oper_log` VALUES (243, '农资信息', 1, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 13:14:10\",\"delFlag\":\"0\",\"materialCode\":\"003\",\"materialId\":\"5\",\"materialName\":\"氮肥\",\"materialTypeId\":\"1\",\"measureUnit\":\"袋\",\"orderNum\":1,\"params\":{},\"remark\":\"集市6.2日上午购买\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:14:10', 45);
INSERT INTO `sys_oper_log` VALUES (244, '角色管理', 2, 'com.ruoyi.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-05-31 23:30:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2004,2005,2006,2007,2008,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:22:57', 49);
INSERT INTO `sys_oper_log` VALUES (245, '角色管理', 1, 'com.ruoyi.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2027,2028,2029,2030,2031,2032,2040,2041,2042,2043,2044,2045,2047,2048,2049,2054,2050,2051,2052,2046,2053,2056,2055,2057,2058,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":3,\"status\":\"0\"} ', '{\"msg\":\"新增角色\'普通角色\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2026-06-02 13:27:08', 1);
INSERT INTO `sys_oper_log` VALUES (246, '角色管理', 1, 'com.ruoyi.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2027,2028,2029,2030,2031,2032,2040,2041,2042,2043,2044,2045,2047,2048,2049,2054,2050,2051,2052,2046,2053,2056,2055,2057,2058,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"普通角色2\",\"roleSort\":3,\"status\":\"0\"} ', '{\"msg\":\"新增角色\'普通角色2\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2026-06-02 13:27:18', 6);
INSERT INTO `sys_oper_log` VALUES (247, '参数管理', 2, 'com.ruoyi.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/config', '127.0.0.1', '内网IP', '{\"configId\":4,\"configKey\":\"sys.account.captchaEnabled\",\"configName\":\"账号自助-验证码开关\",\"configType\":\"Y\",\"configValue\":\"false\",\"createBy\":\"admin\",\"createTime\":\"2026-05-31 23:30:52\",\"params\":{},\"remark\":\"是否开启验证码功能（true开启，false关闭）\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:27:51', 20);
INSERT INTO `sys_oper_log` VALUES (248, '通知公告', 1, 'com.ruoyi.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', '研发部门', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"isRead\":false,\"noticeContent\":\"<p><span class=\\\"ql-size-large\\\">预祝项目进行顺利</span></p>\",\"noticeTitle\":\"正式启动重财智农项目开发\",\"noticeType\":\"2\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:29:11', 17);
INSERT INTO `sys_oper_log` VALUES (249, '通知公告', 3, 'com.ruoyi.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:29:23', 11);
INSERT INTO `sys_oper_log` VALUES (250, '通知公告', 3, 'com.ruoyi.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:29:37', 9);
INSERT INTO `sys_oper_log` VALUES (251, '通知公告', 3, 'com.ruoyi.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/notice/1', '127.0.0.1', '内网IP', '[1] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:29:39', 9);
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/germplasm/index\",\"createBy\":\"admin\",\"icon\":\"emi\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种植系统\",\"menuType\":\"C\",\"orderNum\":65,\"params\":{},\"parentId\":2001,\"path\":\"germplasm\",\"perms\":\"agriculture:germplasm:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:47:33', 30);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种植查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:germplasm:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:47:54', 5);
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种植新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:germplasm:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:48:16', 7);
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种质修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:germplasm:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:48:37', 4);
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种植删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:germplasm:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:48:56', 7);
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-02 13:48:37\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2062,\"menuName\":\"种植修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2059,\"path\":\"\",\"perms\":\"agriculture:germplasm:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:49:03', 8);
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种质导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:germplasm:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:49:21', 7);
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种植方法\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:method:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:50:17', 9);
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2065,\"perms\":\"agriculture:method:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:54:29', 11);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2065,\"perms\":\"agriculture:method:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:54:47', 5);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2065,\"perms\":\"agriculture:method:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:54:59', 8);
INSERT INTO `sys_oper_log` VALUES (263, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"种植介绍\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:intro:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:55:48', 9);
INSERT INTO `sys_oper_log` VALUES (264, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作业流程\",\"menuType\":\"F\",\"orderNum\":8,\"params\":{},\"parentId\":2059,\"perms\":\"agriculture:standardJob:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 13:56:48', 2);
INSERT INTO `sys_oper_log` VALUES (265, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2069,\"perms\":\"agriculture:intro:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:22:39', 17);
INSERT INTO `sys_oper_log` VALUES (266, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2069,\"perms\":\"agriculture:intro:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:23:04', 7);
INSERT INTO `sys_oper_log` VALUES (267, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2069,\"perms\":\"agriculture:intro:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:23:18', 7);
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2070,\"perms\":\"agriculture:standardJob:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:23:39', 9);
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2070,\"perms\":\"agriculture:standardJob:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:23:53', 7);
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2070,\"perms\":\"agriculture:standardJob:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:24:05', 7);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_crop_batch\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 14:53:59', 73);
INSERT INTO `sys_oper_log` VALUES (272, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"AgricultureCropBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":101,\"columnName\":\"batch_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BatchName\",\"columnComment\":\"批次名称\",\"columnId\":102,\"columnName\":\"batch_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"GermplasmId\",\"columnComment\":\"种质ID\",\"columnId\":103,\"columnName\":\"germplasm_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"germplasmId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"LandId\",\"columnComment\":\"地块ID\",\"columnId\":104,\"columnName\":\"land_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isReq', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:09:22', 103);
INSERT INTO `sys_oper_log` VALUES (273, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_crop_batch\"}', NULL, 0, NULL, '2026-06-02 15:09:34', 309);
INSERT INTO `sys_oper_log` VALUES (274, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_standard_job,agriculture_plant_method,agriculture_germplasm_intro,agriculture_germplasm,agriculture_batch_task\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:10:19', 194);
INSERT INTO `sys_oper_log` VALUES (275, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_crop_batch,agriculture_standard_job,agriculture_plant_method,agriculture_germplasm_intro,agriculture_germplasm,agriculture_batch_task\"}', NULL, 0, NULL, '2026-06-02 15:10:28', 262);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/batch/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作物批次\",\"menuType\":\"C\",\"orderNum\":70,\"params\":{},\"parentId\":2001,\"path\":\"batch\",\"perms\":\"agriculture:batch:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:22:12', 37);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作物批次查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2077,\"perms\":\"agriculture:batch:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:23:20', 6);
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作物批次新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2077,\"perms\":\"agriculture:batch:add,agriculture:batchTask:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:23:38', 7);
INSERT INTO `sys_oper_log` VALUES (279, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作物批次修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2077,\"perms\":\"agriculture:batch:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:23:56', 11);
INSERT INTO `sys_oper_log` VALUES (280, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作物批次删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2077,\"perms\":\"agriculture:batch:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:24:10', 8);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"作物批次导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2077,\"perms\":\"agriculture:batch:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:24:22', 7);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看批次任务\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2077,\"perms\":\"agriculture:batchTask:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:24:43', 6);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2083,\"perms\":\"agriculture:batchTask:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:24:57', 6);
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2083,\"perms\":\"agriculture:batchTask:query,agriculture:batchTask:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:25:10', 6);
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2083,\"perms\":\"agriculture:batchTask:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:25:23', 8);
INSERT INTO `sys_oper_log` VALUES (286, '机械类别', 1, 'com.ruoyi.controller.system.AgricultureMachineTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/machine/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 15:30:33\",\"delFlag\":\"0\",\"machineTypeId\":\"5\",\"machineTypeName\":\"喷水背包\",\"orderNum\":5,\"params\":{},\"remark\":\"浇灌用\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:30:33', 11);
INSERT INTO `sys_oper_log` VALUES (287, '地块', 1, 'com.ruoyi.controller.system.AgricultureLandController.add()', 'POST', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-02 15:45:19\",\"fillColor\":\"#0AE63A\",\"fillOpacity\":0.6,\"landArea\":3,\"landId\":\"8\",\"landName\":\"水稻实验区2\",\"landPath\":\"106.52569,29.343294|106.525588,29.3432|106.525572,29.343088|106.52562,29.342938|106.525642,29.342854|106.525744,29.342779|106.525862,29.342775|106.525894,29.342957|106.525894,29.343121|106.525932,29.343256|106.525835,29.343317\",\"landType\":\"1\",\"params\":{},\"status\":\"0\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.5,\"strokeWeight\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:45:19', 157);
INSERT INTO `sys_oper_log` VALUES (288, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"batch\",\"className\":\"AgricultureCropBatch\",\"columns\":[{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":101,\"columnName\":\"batch_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2026-06-02 15:09:22\",\"usableColumn\":false},{\"capJavaField\":\"BatchName\",\"columnComment\":\"批次名称\",\"columnId\":102,\"columnName\":\"batch_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"batchName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2026-06-02 15:09:22\",\"usableColumn\":false},{\"capJavaField\":\"GermplasmId\",\"columnComment\":\"种质ID\",\"columnId\":103,\"columnName\":\"germplasm_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"germplasmId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2026-06-02 15:09:22\",\"usableColumn\":false},{\"capJavaField\":\"LandId\",\"columnComment\":\"地块ID\",\"columnId\":104,\"columnName\":\"land_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 14:53:59\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 15:53:34', 117);
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_crop_batch\"}', NULL, 0, NULL, '2026-06-02 16:01:38', 134);
INSERT INTO `sys_oper_log` VALUES (290, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":0,\"batchId\":\"3\",\"batchName\":\"番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄\",\"createBy\":\"1\",\"createTime\":\"2023-05-30 15:07:17\",\"cropArea\":100,\"delFlag\":\"0\",\"germplasmId\":2,\"landId\":7,\"orderNum\":0,\"params\":{},\"remark\":\"测试\",\"startTime\":\"2023-05-30\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 16:11:39\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:11:39', 53);
INSERT INTO `sys_oper_log` VALUES (291, '作物批次', 5, 'com.ruoyi.controller.system.AgricultureCropBatchController.export()', 'POST', 1, 'admin', '研发部门', '/system/batch/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-06-02 16:20:52', 1012);
INSERT INTO `sys_oper_log` VALUES (292, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"dictName\":\"地块类别\",\"dictType\":\"agriculture_land_type\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"新增字典\'地块类别\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2026-06-02 16:45:27', 13);
INSERT INTO `sys_oper_log` VALUES (293, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"dictName\":\"地块类别\",\"dictType\":\"agriculture_land_type\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"新增字典\'地块类别\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2026-06-02 16:45:32', 2);
INSERT INTO `sys_oper_log` VALUES (294, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"地块状态\",\"dictType\":\"agriculture_land_status\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:45:48', 13);
INSERT INTO `sys_oper_log` VALUES (295, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"空闲中\",\"dictSort\":0,\"dictType\":\"agriculture_land_status\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:46:24', 12);
INSERT INTO `sys_oper_log` VALUES (296, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"种植中\",\"dictSort\":0,\"dictType\":\"agriculture_land_status\",\"dictValue\":\"1\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:46:38', 10);
INSERT INTO `sys_oper_log` VALUES (297, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"单位类型\",\"dictType\":\"agriculture_cycle_unit\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:47:42', 7);
INSERT INTO `sys_oper_log` VALUES (298, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"天\",\"dictSort\":0,\"dictType\":\"agriculture_cycle_unit\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:48:02', 7);
INSERT INTO `sys_oper_log` VALUES (299, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"周\",\"dictSort\":0,\"dictType\":\"agriculture_cycle_unit\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:48:14', 9);
INSERT INTO `sys_oper_log` VALUES (300, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"任务状态\",\"dictType\":\"agriculture_batch_task_status\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:49:01', 11);
INSERT INTO `sys_oper_log` VALUES (301, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未分配\",\"dictSort\":0,\"dictType\":\"agriculture_batch_task_status\",\"dictValue\":\"0\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:49:19', 8);
INSERT INTO `sys_oper_log` VALUES (302, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已分配\",\"dictSort\":0,\"dictType\":\"agriculture_batch_task_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:49:30', 6);
INSERT INTO `sys_oper_log` VALUES (303, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"进行中\",\"dictSort\":0,\"dictType\":\"agriculture_batch_task_status\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:49:42', 9);
INSERT INTO `sys_oper_log` VALUES (304, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":0,\"dictType\":\"agriculture_batch_task_status\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 16:49:53', 7);
INSERT INTO `sys_oper_log` VALUES (305, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"dictName\":\"系统开关\",\"dictType\":\"sys_normal_disable\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"新增字典\'系统开关\'失败，字典类型已存在\",\"code\":500}', 0, NULL, '2026-06-02 16:52:34', 3);
INSERT INTO `sys_oper_log` VALUES (306, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"task\",\"className\":\"AgricultureBatchTask\",\"columns\":[{\"capJavaField\":\"TaskId\",\"columnComment\":\"任务ID\",\"columnId\":116,\"columnName\":\"task_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 15:10:19\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"taskId\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BatchId\",\"columnComment\":\"批次ID\",\"columnId\":117,\"columnName\":\"batch_id\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 15:10:19\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"batchId\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskHead\",\"columnComment\":\"任务负责人\",\"columnId\":118,\"columnName\":\"task_head\",\"columnType\":\"bigint unsigned\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 15:10:19\",\"dictType\":\"\",\"edit\":true,\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"taskHead\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TaskName\",\"columnComment\":\"任务名称\",\"columnId\":119,\"columnName\":\"task_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-02 15:10:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"taskName', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 19:39:29', 112);
INSERT INTO `sys_oper_log` VALUES (307, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"agriculture_batch_task\"}', NULL, 0, NULL, '2026-06-02 19:39:34', 342);
INSERT INTO `sys_oper_log` VALUES (308, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:46:52\",\"delFlag\":\"0\",\"materialCode\":\"004\",\"materialId\":\"4\",\"materialName\":\"大镰刀\",\"materialTypeId\":\"2\",\"materialTypeName\":\"镰刀\",\"measureUnit\":\"把\",\"orderNum\":0,\"params\":{},\"remark\":\"某公司，采购员罗一凡6.2日下午购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 20:20:57\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 20:20:57', 34);
INSERT INTO `sys_oper_log` VALUES (309, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"3\",\"batchName\":\"番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄\",\"createBy\":\"1\",\"createTime\":\"2023-05-30 15:07:17\",\"cropArea\":100,\"delFlag\":\"0\",\"germplasmId\":1,\"landId\":7,\"orderNum\":0,\"params\":{},\"remark\":\"测试\",\"startTime\":\"2023-05-30\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 20:50:30\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 20:50:31', 50);
INSERT INTO `sys_oper_log` VALUES (310, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"43\",\"batchName\":\"003\",\"createTime\":\"2026-06-02 20:50:49\",\"cropArea\":3,\"germplasmId\":1,\"landId\":7,\"params\":{},\"startTime\":\"2026-06-03\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 20:50:49', 15);
INSERT INTO `sys_oper_log` VALUES (311, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"43\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 20:50:50\",\"cropArea\":3,\"delFlag\":\"0\",\"germplasmId\":2,\"landId\":7,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-03\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 20:51:14\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 20:51:14', 7);
INSERT INTO `sys_oper_log` VALUES (312, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"3\",\"batchName\":\"番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄\",\"createBy\":\"1\",\"createTime\":\"2023-05-30 15:07:17\",\"cropArea\":100,\"delFlag\":\"0\",\"germplasmId\":1,\"landId\":7,\"orderNum\":0,\"params\":{},\"remark\":\"测试\",\"startTime\":\"2023-05-30\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 21:00:10\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:00:10', 10);
INSERT INTO `sys_oper_log` VALUES (313, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"3\",\"batchName\":\"番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄番茄\",\"createBy\":\"1\",\"createTime\":\"2023-05-30 15:07:17\",\"cropArea\":100,\"delFlag\":\"0\",\"germplasmId\":2,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"测试\",\"startTime\":\"2023-05-30\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 21:00:38\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:00:38', 8);
INSERT INTO `sys_oper_log` VALUES (314, '种质', 2, 'com.ruoyi.controller.system.AgricultureGermplasmController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-05-18 09:35:37\",\"cropEnName\":\"watermelon\",\"cropName\":\"西瓜\",\"delFlag\":\"0\",\"germplasmDes\":\"西瓜是一种夏季消暑的好选择，其含有丰富的水分和天然的清凉成分，能够有效地降低体温。除了降热解暑，西瓜皮还可以用来炒着吃或伴着吃，制成药材来治疗肾炎水肿、肝病黄疸等疾病，甚至可以作为美容材料用来敷脸。因此，夏季食用西瓜不仅能够解暑，还能保持身体健康。\",\"germplasmEnName\":\"watermelon\",\"germplasmId\":\"1\",\"germplasmImg\":\"/profile/iot/1/2023-0803-095310.png\",\"germplasmName\":\"西瓜瓜瓜\",\"orderNum\":0,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2026-06-02 21:00:56\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:00:56', 18);
INSERT INTO `sys_oper_log` VALUES (315, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":2,\"batchId\":\"44\",\"batchName\":\"003\",\"createTime\":\"2026-06-02 21:02:03\",\"cropArea\":2,\"germplasmId\":1,\"landId\":7,\"params\":{},\"startTime\":\"2026-06-01\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:03', 9);
INSERT INTO `sys_oper_log` VALUES (316, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/3', '127.0.0.1', '内网IP', '[\"3\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:19', 17);
INSERT INTO `sys_oper_log` VALUES (317, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/4', '127.0.0.1', '内网IP', '[\"4\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:21', 4);
INSERT INTO `sys_oper_log` VALUES (318, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/5', '127.0.0.1', '内网IP', '[\"5\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:24', 5);
INSERT INTO `sys_oper_log` VALUES (319, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/6', '127.0.0.1', '内网IP', '[\"6\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:25', 3);
INSERT INTO `sys_oper_log` VALUES (320, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/7', '127.0.0.1', '内网IP', '[\"7\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:29', 6);
INSERT INTO `sys_oper_log` VALUES (321, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/8', '127.0.0.1', '内网IP', '[\"8\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:31', 4);
INSERT INTO `sys_oper_log` VALUES (322, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/9', '127.0.0.1', '内网IP', '[\"9\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:33', 6);
INSERT INTO `sys_oper_log` VALUES (323, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/10', '127.0.0.1', '内网IP', '[\"10\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:34', 5);
INSERT INTO `sys_oper_log` VALUES (324, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/11', '127.0.0.1', '内网IP', '[\"11\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:37', 4);
INSERT INTO `sys_oper_log` VALUES (325, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/12', '127.0.0.1', '内网IP', '[\"12\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:38', 5);
INSERT INTO `sys_oper_log` VALUES (326, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/13', '127.0.0.1', '内网IP', '[\"13\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:41', 4);
INSERT INTO `sys_oper_log` VALUES (327, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/14', '127.0.0.1', '内网IP', '[\"14\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:42', 10);
INSERT INTO `sys_oper_log` VALUES (328, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/15', '127.0.0.1', '内网IP', '[\"15\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:44', 3);
INSERT INTO `sys_oper_log` VALUES (329, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/16', '127.0.0.1', '内网IP', '[\"16\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:45', 5);
INSERT INTO `sys_oper_log` VALUES (330, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/17', '127.0.0.1', '内网IP', '[\"17\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:48', 3);
INSERT INTO `sys_oper_log` VALUES (331, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/18', '127.0.0.1', '内网IP', '[\"18\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:49', 5);
INSERT INTO `sys_oper_log` VALUES (332, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/19', '127.0.0.1', '内网IP', '[\"19\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:51', 7);
INSERT INTO `sys_oper_log` VALUES (333, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/20', '127.0.0.1', '内网IP', '[\"20\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:53', 6);
INSERT INTO `sys_oper_log` VALUES (334, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/21', '127.0.0.1', '内网IP', '[\"21\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:54', 5);
INSERT INTO `sys_oper_log` VALUES (335, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/22', '127.0.0.1', '内网IP', '[\"22\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:56', 4);
INSERT INTO `sys_oper_log` VALUES (336, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/23', '127.0.0.1', '内网IP', '[\"23\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:02:58', 5);
INSERT INTO `sys_oper_log` VALUES (337, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/24', '127.0.0.1', '内网IP', '[\"24\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:00', 6);
INSERT INTO `sys_oper_log` VALUES (338, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/25', '127.0.0.1', '内网IP', '[\"25\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:03', 5);
INSERT INTO `sys_oper_log` VALUES (339, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/26', '127.0.0.1', '内网IP', '[\"26\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:05', 4);
INSERT INTO `sys_oper_log` VALUES (340, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/28', '127.0.0.1', '内网IP', '[\"28\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:08', 7);
INSERT INTO `sys_oper_log` VALUES (341, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/29', '127.0.0.1', '内网IP', '[\"29\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:10', 5);
INSERT INTO `sys_oper_log` VALUES (342, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/30', '127.0.0.1', '内网IP', '[\"30\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:12', 5);
INSERT INTO `sys_oper_log` VALUES (343, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/31', '127.0.0.1', '内网IP', '[\"31\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:14', 5);
INSERT INTO `sys_oper_log` VALUES (344, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/32', '127.0.0.1', '内网IP', '[\"32\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:36', 5);
INSERT INTO `sys_oper_log` VALUES (345, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/33', '127.0.0.1', '内网IP', '[\"33\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:39', 4);
INSERT INTO `sys_oper_log` VALUES (346, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/34', '127.0.0.1', '内网IP', '[\"34\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:41', 4);
INSERT INTO `sys_oper_log` VALUES (347, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/35', '127.0.0.1', '内网IP', '[\"35\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:44', 5);
INSERT INTO `sys_oper_log` VALUES (348, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/37', '127.0.0.1', '内网IP', '[\"37\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:51', 4);
INSERT INTO `sys_oper_log` VALUES (349, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/36', '127.0.0.1', '内网IP', '[\"36\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:53', 5);
INSERT INTO `sys_oper_log` VALUES (350, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/27', '127.0.0.1', '内网IP', '[\"27\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:55', 5);
INSERT INTO `sys_oper_log` VALUES (351, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/38', '127.0.0.1', '内网IP', '[\"38\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:03:57', 4);
INSERT INTO `sys_oper_log` VALUES (352, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/39', '127.0.0.1', '内网IP', '[\"39\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:04:30', 5);
INSERT INTO `sys_oper_log` VALUES (353, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/40', '127.0.0.1', '内网IP', '[\"40\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:04:32', 6);
INSERT INTO `sys_oper_log` VALUES (354, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/41', '127.0.0.1', '内网IP', '[\"41\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:04:35', 4);
INSERT INTO `sys_oper_log` VALUES (355, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/42', '127.0.0.1', '内网IP', '[\"42\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:04:37', 6);
INSERT INTO `sys_oper_log` VALUES (356, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"43\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 20:50:50\",\"cropArea\":3,\"delFlag\":\"0\",\"germplasmId\":2,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-03\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 21:05:12\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:05:12', 11);
INSERT INTO `sys_oper_log` VALUES (357, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"43\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 20:50:50\",\"cropArea\":3,\"delFlag\":\"0\",\"germplasmId\":1,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-03\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 21:09:04\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:09:04', 5);
INSERT INTO `sys_oper_log` VALUES (358, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"45\",\"batchName\":\"0012\",\"createTime\":\"2026-06-02 21:09:41\",\"cropArea\":3,\"germplasmId\":2,\"landId\":7,\"params\":{},\"startTime\":\"2026-06-01\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:09:41', 6);
INSERT INTO `sys_oper_log` VALUES (359, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"43\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 20:50:50\",\"cropArea\":3,\"delFlag\":\"0\",\"germplasmId\":2,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-03\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-02 21:18:45\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-02 21:18:45', 6);
INSERT INTO `sys_oper_log` VALUES (360, '种质图片上传', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.uploadGermplasmImage()', 'POST', 1, 'admin', '研发部门', '/system/germplasm/upload', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"fileName\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603105917_300_102_20260603110141A001.png\",\"code\":200,\"newFileName\":\"微信图片_20260603105917_300_102_20260603110141A001.png\",\"url\":\"http://localhost:8099/profile/agriculture/germplasm/2026/06/03/微信图片_20260603105917_300_102_20260603110141A001.png\",\"originalFilename\":\"微信图片_20260603105917_300_102.png\"}', 0, NULL, '2026-06-03 11:01:42', 168);
INSERT INTO `sys_oper_log` VALUES (361, '种质', 2, 'com.ruoyi.controller.system.AgricultureGermplasmController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-05-18 09:35:37\",\"cropEnName\":\"watermelon\",\"cropName\":\"西瓜\",\"delFlag\":\"0\",\"germplasmDes\":\"西瓜是一种夏季消暑的好选择，其含有丰富的水分和天然的清凉成分，能够有效地降低体温。除了降热解暑，西瓜皮还可以用来炒着吃或伴着吃，制成药材来治疗肾炎水肿、肝病黄疸等疾病，甚至可以作为美容材料用来敷脸。因此，夏季食用西瓜不仅能够解暑，还能保持身体健康。\",\"germplasmEnName\":\"watermelon\",\"germplasmId\":\"1\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603105917_300_102_20260603110141A001.png\",\"germplasmName\":\"西瓜瓜瓜\",\"orderNum\":0,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2026-06-03 11:01:44\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 11:01:44', 30);
INSERT INTO `sys_oper_log` VALUES (362, '种质', 2, 'com.ruoyi.controller.system.AgricultureGermplasmController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-05-18 09:35:37\",\"cropEnName\":\"watermelon\",\"cropName\":\"西瓜\",\"delFlag\":\"0\",\"germplasmDes\":\"西瓜是一种夏季消暑的好选择，其含有丰富的水分和天然的清凉成分，能够有效地降低体温。除了降热解暑，西瓜皮还可以用来炒着吃或伴着吃，制成药材来治疗肾炎水肿、肝病黄疸等疾病，甚至可以作为美容材料用来敷脸。因此，夏季食用西瓜不仅能够解暑，还能保持身体健康。\",\"germplasmEnName\":\"watermelon\",\"germplasmId\":\"1\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603105917_300_102_20260603110141A001.png\",\"germplasmName\":\"西瓜\",\"orderNum\":0,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2026-06-03 11:02:22\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 11:02:22', 8);
INSERT INTO `sys_oper_log` VALUES (363, '种质图片上传', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.uploadGermplasmImage()', 'POST', 1, 'admin', '研发部门', '/system/germplasm/upload', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"fileName\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603112424_301_102_20260603112435A002.png\",\"code\":200,\"newFileName\":\"微信图片_20260603112424_301_102_20260603112435A002.png\",\"url\":\"http://localhost:8099/profile/agriculture/germplasm/2026/06/03/微信图片_20260603112424_301_102_20260603112435A002.png\",\"originalFilename\":\"微信图片_20260603112424_301_102.png\"}', 0, NULL, '2026-06-03 11:24:35', 14);
INSERT INTO `sys_oper_log` VALUES (364, '种质图片上传', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.uploadGermplasmImage()', 'POST', 1, 'admin', '研发部门', '/system/germplasm/upload', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"fileName\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603112424_301_102_20260603112604A003.png\",\"code\":200,\"newFileName\":\"微信图片_20260603112424_301_102_20260603112604A003.png\",\"url\":\"http://localhost:8099/profile/agriculture/germplasm/2026/06/03/微信图片_20260603112424_301_102_20260603112604A003.png\",\"originalFilename\":\"微信图片_20260603112424_301_102.png\"}', 0, NULL, '2026-06-03 11:26:04', 9);
INSERT INTO `sys_oper_log` VALUES (365, '种质', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.add()', 'POST', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 11:26:19\",\"cropEnName\":\"rice\",\"cropName\":\"水稻\",\"delFlag\":\"0\",\"germplasmDes\":\"籼稻是日常主食的优质选择，富含碳水、膳食纤维与多种微量元素，可为人体快速补充能量、维持机体正常代谢。除碾米蒸煮做主粮食用外，米糠可榨油、加工饲料，稻秆能饲用还可还田肥地，稻谷胚芽可提取营养原料。因此日常食用籼稻，既能饱腹充饥，又能补充营养、助力膳食均衡。\",\"germplasmEnName\":\"indica_rice\",\"germplasmId\":\"4\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603112424_301_102_20260603112604A003.png\",\"germplasmName\":\"籼稻\",\"orderNum\":1,\"params\":{},\"remark\":\"水稻科\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 11:26:19', 10);
INSERT INTO `sys_oper_log` VALUES (366, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"46\",\"batchName\":\"006\",\"createTime\":\"2026-06-03 14:27:19\",\"cropArea\":3,\"germplasmId\":4,\"landId\":7,\"params\":{},\"startTime\":\"2026-06-03\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:27:19', 23);
INSERT INTO `sys_oper_log` VALUES (367, '字典类型', 9, 'com.ruoyi.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:35:27', 40);
INSERT INTO `sys_oper_log` VALUES (368, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":2,\"batchId\":\"44\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 21:02:04\",\"cropArea\":2,\"delFlag\":\"0\",\"germplasmId\":1,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-01\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 14:45:26\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:45:26', 10);
INSERT INTO `sys_oper_log` VALUES (369, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/45', '127.0.0.1', '内网IP', '[\"45\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:46:16', 13);
INSERT INTO `sys_oper_log` VALUES (370, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/43', '127.0.0.1', '内网IP', '[\"43\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:46:18', 4);
INSERT INTO `sys_oper_log` VALUES (371, '种质', 3, 'com.ruoyi.controller.system.AgricultureGermplasmController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/germplasm/3', '127.0.0.1', '内网IP', '[\"3\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:46:25', 6);
INSERT INTO `sys_oper_log` VALUES (372, '种质', 3, 'com.ruoyi.controller.system.AgricultureGermplasmController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/germplasm/2', '127.0.0.1', '内网IP', '[\"2\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:46:28', 7);
INSERT INTO `sys_oper_log` VALUES (373, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已损坏\",\"dictSort\":3,\"dictType\":\"agriculture_land_status\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:50:17', 10);
INSERT INTO `sys_oper_log` VALUES (374, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-03 14:50:17\",\"default\":false,\"dictCode\":113,\"dictLabel\":\"已损坏\",\"dictSort\":3,\"dictType\":\"agriculture_land_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 14:50:33', 10);
INSERT INTO `sys_oper_log` VALUES (375, '地块', 2, 'com.ruoyi.controller.system.AgricultureLandController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-01 22:45:21\",\"currentBatch\":0,\"delFlag\":\"0\",\"fillColor\":\"#09DD37\",\"fillOpacity\":0.5,\"landArea\":2,\"landId\":\"7\",\"landName\":\"水稻1区\",\"landPath\":\"106.526079,29.344398|106.52589,29.344319|106.525922,29.34424|106.526042,29.344159|106.526167,29.344162|106.526269,29.344301\",\"landType\":\"1\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"1\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.7,\"strokeWeight\":2,\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 15:02:48\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:02:48', 21);
INSERT INTO `sys_oper_log` VALUES (376, '地块', 2, 'com.ruoyi.controller.system.AgricultureLandController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-02 15:45:19\",\"currentBatch\":0,\"delFlag\":\"0\",\"fillColor\":\"#0AE63A\",\"fillOpacity\":0.6,\"landArea\":3,\"landId\":\"8\",\"landName\":\"水稻实验区2\",\"landPath\":\"106.52569,29.343294|106.525588,29.3432|106.525572,29.343088|106.52562,29.342938|106.525642,29.342854|106.525744,29.342779|106.525862,29.342775|106.525894,29.342957|106.525894,29.343121|106.525932,29.343256|106.525835,29.343317\",\"landType\":\"1\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"1\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.5,\"strokeWeight\":2,\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 15:02:53\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:02:53', 5);
INSERT INTO `sys_oper_log` VALUES (377, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":2,\"batchId\":\"44\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 21:02:04\",\"cropArea\":2,\"delFlag\":\"0\",\"germplasmId\":1,\"landId\":7,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-01\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 15:19:34\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:19:34', 24);
INSERT INTO `sys_oper_log` VALUES (378, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":2,\"batchId\":\"44\",\"batchName\":\"003\",\"createBy\":\"0\",\"createTime\":\"2026-06-02 21:02:04\",\"cropArea\":2,\"delFlag\":\"0\",\"germplasmId\":1,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-01\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 15:19:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:19:40', 7);
INSERT INTO `sys_oper_log` VALUES (379, '地块', 1, 'com.ruoyi.controller.system.AgricultureLandController.add()', 'POST', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 15:34:20\",\"fillColor\":\"#F07612\",\"fillOpacity\":0.7,\"landArea\":6,\"landId\":\"9\",\"landName\":\"旱地实验1区\",\"landPath\":\"106.525991,29.344148|106.526039,29.343961|106.52605,29.343835|106.525964,29.343676|106.525921,29.343648|106.526066,29.34362|106.526189,29.343611|106.526222,29.343611|106.526222,29.343737|106.526238,29.34383|106.526254,29.343952|106.526254,29.344078|106.52627,29.344148|106.526297,29.344237|106.526211,29.344279|106.526066,29.344265|106.525964,29.344247\",\"landType\":\"0\",\"params\":{},\"status\":\"0\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.7,\"strokeWeight\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:34:20', 17);
INSERT INTO `sys_oper_log` VALUES (380, '种质图片上传', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.uploadGermplasmImage()', 'POST', 1, 'admin', '研发部门', '/system/germplasm/upload', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"fileName\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155744A001.png\",\"code\":200,\"newFileName\":\"微信图片_20260603155731_302_102_20260603155744A001.png\",\"url\":\"http://localhost:8099/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155744A001.png\",\"originalFilename\":\"微信图片_20260603155731_302_102.png\"}', 0, NULL, '2026-06-03 15:57:44', 163);
INSERT INTO `sys_oper_log` VALUES (381, '种质', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.add()', 'POST', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 15:58:08\",\"cropEnName\":\"rice\",\"cropName\":\"水稻\",\"germplasmDes\":\"粳稻是日常主食的优选品类，富含优质蛋白与B族维生素，易消化好吸收，可补充人体所需能量。除蒸煮做成米饭外，还能加工年糕、米酒、米糕等特色吃食，米糠可加工饲料、提取粮油，稻秆能饲用还可有机肥还田。因此日常食用粳稻，既能饱腹充饥，又能助力膳食均衡、养护身体健康。\",\"germplasmEnName\":\"japonica_rice\",\"germplasmId\":\"5\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155744A001.png\",\"germplasmName\":\"粳稻\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:58:08', 13);
INSERT INTO `sys_oper_log` VALUES (382, '种质图片上传', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.uploadGermplasmImage()', 'POST', 1, 'admin', '研发部门', '/system/germplasm/upload', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"fileName\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155907A002.png\",\"code\":200,\"newFileName\":\"微信图片_20260603155731_302_102_20260603155907A002.png\",\"url\":\"http://localhost:8099/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155907A002.png\",\"originalFilename\":\"微信图片_20260603155731_302_102.png\"}', 0, NULL, '2026-06-03 15:59:07', 13);
INSERT INTO `sys_oper_log` VALUES (383, '种质', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.add()', 'POST', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 15:59:48\",\"cropEnName\":\"rice\",\"cropName\":\"水稻\",\"germplasmDes\":\"糯稻是制作特色美食的优质原料，籽粒支链淀粉含量充足，蒸煮后软糯黏香、口感醇厚。除蒸煮直接食用外，可加工汤圆、粽子、糍粑、米酒等风味吃食，米糠能饲喂畜禽，稻壳可做栽培基质。因此日常食用糯稻制品，既能丰富饮食种类，又可补充身体所需营养。\",\"germplasmEnName\":\"glutinous_rice\",\"germplasmId\":\"6\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603155731_302_102_20260603155907A002.png\",\"germplasmName\":\"糯稻\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 15:59:48', 7);
INSERT INTO `sys_oper_log` VALUES (384, '雇员', 2, 'com.ruoyi.controller.system.AgricultureEmployeeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-02 09:10:53\",\"delFlag\":\"0\",\"employeeAddress\":\"重庆市江北区\",\"employeeCode\":\"1002\",\"employeeId\":\"7\",\"employeeName\":\"郭浩铭\",\"employeeSex\":\"0\",\"employeeTel\":\"15564856697\",\"employeeType\":\"1\",\"orderNum\":3,\"params\":{},\"remark\":\"临时工6.7号完工，未发工资\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:02:50\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:02:50', 29);
INSERT INTO `sys_oper_log` VALUES (385, '雇员', 2, 'com.ruoyi.controller.system.AgricultureEmployeeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-02 09:11:36\",\"delFlag\":\"0\",\"employeeAddress\":\"重庆市高新技术开发区\",\"employeeCode\":\"1004\",\"employeeId\":\"8\",\"employeeName\":\"罗一凡\",\"employeeSex\":\"0\",\"employeeTel\":\"13266458879\",\"employeeType\":\"0\",\"orderNum\":0,\"params\":{},\"remark\":\"跳蚤市场员工\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:03:27\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:03:28', 1);
INSERT INTO `sys_oper_log` VALUES (386, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-02 13:14:10\",\"delFlag\":\"0\",\"materialCode\":\"003\",\"materialId\":\"5\",\"materialName\":\"氮肥\",\"materialTypeId\":\"1\",\"materialTypeName\":\"肥料\",\"measureUnit\":\"袋\",\"orderNum\":0,\"params\":{},\"remark\":\"集市6.2日上午购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:04:06\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:04:06', 19);
INSERT INTO `sys_oper_log` VALUES (387, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:41:12\",\"delFlag\":\"0\",\"materialCode\":\"001\",\"materialId\":\"1\",\"materialName\":\"钾肥\",\"materialTypeId\":\"1\",\"materialTypeName\":\"肥料\",\"measureUnit\":\"袋\",\"orderNum\":3,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:04:11\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:04:11', 10);
INSERT INTO `sys_oper_log` VALUES (388, '农资类别', 1, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 16:05:06\",\"delFlag\":\"0\",\"materialTypeId\":\"3\",\"materialTypeName\":\"种子种苗\",\"orderNum\":0,\"params\":{},\"remark\":\"水稻、小麦、玉米、瓜果蔬菜种子、秧苗、种薯、种藕等\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:05:06', 5);
INSERT INTO `sys_oper_log` VALUES (389, '农资类别', 2, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:40:21\",\"delFlag\":\"0\",\"materialTypeId\":\"1\",\"materialTypeName\":\"肥料\",\"orderNum\":0,\"params\":{},\"remark\":\"有机肥、复合肥、尿素、磷肥钾肥、叶面肥、微生物肥等\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2026-06-03 16:05:20\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:05:20', 5);
INSERT INTO `sys_oper_log` VALUES (390, '农资类别', 2, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:40:46\",\"delFlag\":\"0\",\"materialTypeId\":\"2\",\"materialTypeName\":\"农用物资与农机\",\"orderNum\":0,\"params\":{},\"remark\":\"地膜、棚膜、育苗基质、农药喷雾器、农具、灌溉设备、小型耕种机械等\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:06:35\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:06:35', 7);
INSERT INTO `sys_oper_log` VALUES (391, '农资信息', 3, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/material/3', '127.0.0.1', '内网IP', '[\"3\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:06:52', 12);
INSERT INTO `sys_oper_log` VALUES (392, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:46:52\",\"delFlag\":\"0\",\"materialCode\":\"004\",\"materialId\":\"4\",\"materialName\":\"镰刀\",\"materialTypeId\":\"2\",\"materialTypeName\":\"农用物资与农机\",\"measureUnit\":\"把\",\"orderNum\":0,\"params\":{},\"remark\":\"某公司，采购员罗一凡6.2日下午购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:06:56\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:06:56', 2);
INSERT INTO `sys_oper_log` VALUES (393, '农资类别', 1, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 16:07:23\",\"delFlag\":\"0\",\"materialTypeId\":\"4\",\"materialTypeName\":\"农药\",\"orderNum\":0,\"params\":{},\"remark\":\"杀虫剂、杀菌剂、除草剂、植物生长调节剂、灭鼠药剂等\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:07:23', 6);
INSERT INTO `sys_oper_log` VALUES (394, '农资信息', 1, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.add()', 'POST', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 16:09:38\",\"delFlag\":\"0\",\"materialCode\":\"12\",\"materialId\":\"6\",\"materialName\":\"除草剂\",\"materialTypeId\":\"4\",\"measureUnit\":\"瓶\",\"orderNum\":0,\"params\":{},\"remark\":\"郭浩铭6.3下午市场购买\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:09:38', 7);
INSERT INTO `sys_oper_log` VALUES (395, '用户管理', 1, 'com.ruoyi.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":104,\"nickName\":\"知足常乐\",\"params\":{},\"postIds\":[3],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"陈宇\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:11:46', 128);
INSERT INTO `sys_oper_log` VALUES (396, '用户管理', 3, 'com.ruoyi.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/100', '127.0.0.1', '内网IP', '[100] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:12:21', 7);
INSERT INTO `sys_oper_log` VALUES (397, '用户管理', 1, 'com.ruoyi.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":106,\"nickName\":\"test01\",\"params\":{},\"postIds\":[3],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"陈宇\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:12:54', 83);
INSERT INTO `sys_oper_log` VALUES (398, '用户管理', 3, 'com.ruoyi.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/101', '127.0.0.1', '内网IP', '[101] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:13:07', 7);
INSERT INTO `sys_oper_log` VALUES (399, '用户管理', 1, 'com.ruoyi.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"陈宇\",\"params\":{},\"postIds\":[3],\"roleIds\":[2],\"sex\":\"0\",\"status\":\"0\",\"userId\":102,\"userName\":\"test01\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:13:33', 91);
INSERT INTO `sys_oper_log` VALUES (400, '角色管理', 2, 'com.ruoyi.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2026-05-31 23:30:52\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2003,2004,2005,2006,2007,2008,2002,1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:13:50', 39);
INSERT INTO `sys_oper_log` VALUES (401, '用户管理', 3, 'com.ruoyi.controller.system.SysUserController.remove()', 'DELETE', 1, 'test01', '测试部门', '/system/user/102', '127.0.0.1', '内网IP', '[102] ', '{\"msg\":\"当前用户不能删除\",\"code\":500}', 0, NULL, '2026-06-03 16:14:21', 0);
INSERT INTO `sys_oper_log` VALUES (402, '用户管理', 3, 'com.ruoyi.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/user/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:15:52', 8);
INSERT INTO `sys_oper_log` VALUES (403, '作物批次', 3, 'com.ruoyi.controller.system.AgricultureCropBatchController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/batch/44', '127.0.0.1', '内网IP', '[\"44\"] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:43:33', 8);
INSERT INTO `sys_oper_log` VALUES (404, '地块', 1, 'com.ruoyi.controller.system.AgricultureLandController.add()', 'POST', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-03 16:44:37\",\"fillColor\":\"#C90DF3\",\"fillOpacity\":0.5,\"landArea\":7,\"landId\":\"10\",\"landName\":\"大棚1区\",\"landPath\":\"106.524984,29.343654|106.52478,29.343678|106.524754,29.343617|106.524764,29.343547|106.524791,29.343477|106.524823,29.343346|106.524855,29.343238|106.524893,29.343149|106.524936,29.343061|106.524984,29.342976|106.52507,29.342976|106.52521,29.343033|106.525279,29.34307|106.525231,29.343173|106.525086,29.343421|106.525,29.343598\",\"landType\":\"2\",\"params\":{},\"status\":\"0\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.8,\"strokeWeight\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:44:37', 9);
INSERT INTO `sys_oper_log` VALUES (405, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":102,\"batchId\":\"47\",\"batchName\":\"002\",\"createTime\":\"2026-06-03 16:45:12\",\"cropArea\":6,\"germplasmId\":5,\"landId\":9,\"params\":{},\"startTime\":\"2026-06-02\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:45:12', 7);
INSERT INTO `sys_oper_log` VALUES (406, '地块', 2, 'com.ruoyi.controller.system.AgricultureLandController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-03 16:44:37\",\"currentBatch\":0,\"delFlag\":\"0\",\"fillColor\":\"#C90DF3\",\"fillOpacity\":0.5,\"landArea\":7,\"landId\":\"10\",\"landName\":\"大棚1区\",\"landPath\":\"106.524984,29.343654|106.52478,29.343678|106.524754,29.343617|106.524764,29.343547|106.524791,29.343477|106.524823,29.343346|106.524855,29.343238|106.524893,29.343149|106.524936,29.343061|106.524984,29.342976|106.52507,29.342976|106.52521,29.343033|106.525279,29.34307|106.525231,29.343173|106.525086,29.343421|106.525,29.343598\",\"landType\":\"2\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"1\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.8,\"strokeWeight\":2,\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:45:21\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:45:21', 9);
INSERT INTO `sys_oper_log` VALUES (407, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":102,\"batchId\":\"48\",\"batchName\":\"001\",\"createTime\":\"2026-06-03 16:45:46\",\"cropArea\":4,\"germplasmId\":6,\"landId\":8,\"params\":{},\"startTime\":\"2026-06-02\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:45:46', 7);
INSERT INTO `sys_oper_log` VALUES (408, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":102,\"batchId\":\"48\",\"batchName\":\"001\",\"createBy\":\"0\",\"createTime\":\"2026-06-03 16:45:47\",\"cropArea\":4,\"delFlag\":\"0\",\"germplasmId\":5,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-02\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:46:06\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:46:06', 6);
INSERT INTO `sys_oper_log` VALUES (409, '种质图片上传', 1, 'com.ruoyi.controller.system.AgricultureGermplasmController.uploadGermplasmImage()', 'POST', 1, 'admin', '研发部门', '/system/germplasm/upload', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"fileName\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603164735_309_102_20260603164757A003.png\",\"code\":200,\"newFileName\":\"微信图片_20260603164735_309_102_20260603164757A003.png\",\"url\":\"http://localhost:8099/profile/agriculture/germplasm/2026/06/03/微信图片_20260603164735_309_102_20260603164757A003.png\",\"originalFilename\":\"微信图片_20260603164735_309_102.png\"}', 0, NULL, '2026-06-03 16:47:57', 15);
INSERT INTO `sys_oper_log` VALUES (410, '种质', 2, 'com.ruoyi.controller.system.AgricultureGermplasmController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-03 15:59:49\",\"cropEnName\":\"rice\",\"cropName\":\"水稻\",\"delFlag\":\"0\",\"germplasmDes\":\"糯稻是制作特色美食的优质原料，籽粒支链淀粉含量充足，蒸煮后软糯黏香、口感醇厚。除蒸煮直接食用外，可加工汤圆、粽子、糍粑、米酒等风味吃食，米糠能饲喂畜禽，稻壳可做栽培基质。因此日常食用糯稻制品，既能丰富饮食种类，又可补充身体所需营养。\",\"germplasmEnName\":\"glutinous_rice\",\"germplasmId\":\"6\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603164735_309_102_20260603164757A003.png\",\"germplasmName\":\"糯稻\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:47:58\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:47:58', 7);
INSERT INTO `sys_oper_log` VALUES (411, '作物批次', 2, 'com.ruoyi.controller.system.AgricultureCropBatchController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":102,\"batchId\":\"48\",\"batchName\":\"001\",\"createBy\":\"0\",\"createTime\":\"2026-06-03 16:45:47\",\"cropArea\":4,\"delFlag\":\"0\",\"germplasmId\":6,\"landId\":8,\"orderNum\":0,\"params\":{},\"remark\":\"\",\"startTime\":\"2026-06-02\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:48:09\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:48:09', 3);
INSERT INTO `sys_oper_log` VALUES (412, '作物批次', 1, 'com.ruoyi.controller.system.AgricultureCropBatchController.add()', 'POST', 1, 'admin', '研发部门', '/system/batch', '127.0.0.1', '内网IP', '{\"batchHead\":1,\"batchId\":\"49\",\"batchName\":\"大棚西瓜实验1区\",\"createTime\":\"2026-06-03 16:48:41\",\"cropArea\":6,\"germplasmId\":1,\"landId\":10,\"params\":{},\"startTime\":\"2026-06-01\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:48:41', 5);
INSERT INTO `sys_oper_log` VALUES (413, '地块', 2, 'com.ruoyi.controller.system.AgricultureLandController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-03 15:34:20\",\"currentBatch\":0,\"delFlag\":\"0\",\"fillColor\":\"#F07612\",\"fillOpacity\":0.7,\"landArea\":6,\"landId\":\"9\",\"landName\":\"旱地实验1区\",\"landPath\":\"106.525991,29.344148|106.526039,29.343961|106.52605,29.343835|106.525964,29.343676|106.525921,29.343648|106.526066,29.34362|106.526189,29.343611|106.526222,29.343611|106.526222,29.343737|106.526238,29.34383|106.526254,29.343952|106.526254,29.344078|106.52627,29.344148|106.526297,29.344237|106.526211,29.344279|106.526066,29.344265|106.525964,29.344247\",\"landType\":\"0\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"1\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.7,\"strokeWeight\":2,\"updateBy\":\"0\",\"updateTime\":\"2026-06-03 16:48:49\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:48:49', 7);
INSERT INTO `sys_oper_log` VALUES (414, '种质', 2, 'com.ruoyi.controller.system.AgricultureGermplasmController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/germplasm', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-05-18 09:35:37\",\"cropEnName\":\"watermelon\",\"cropName\":\"西瓜\",\"delFlag\":\"0\",\"germplasmDes\":\"西瓜是一种夏季消暑的好选择，其含有丰富的水分和天然的清凉成分，能够有效地降低体温。除了降热解暑，西瓜皮还可以用来炒着吃或伴着吃，制成药材来治疗肾炎水肿、肝病黄疸等疾病，甚至可以作为美容材料用来敷脸。因此，夏季食用西瓜不仅能够解暑，还能保持身体健康。\",\"germplasmEnName\":\"watermelon_SX\",\"germplasmId\":\"1\",\"germplasmImg\":\"/profile/agriculture/germplasm/2026/06/03/微信图片_20260603105917_300_102_20260603110141A001.png\",\"germplasmName\":\"陕西瓜\",\"orderNum\":0,\"params\":{},\"remark\":\"1\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2026-06-03 16:50:03\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-03 16:50:03', 5);
INSERT INTO `sys_oper_log` VALUES (415, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-01 11:04:32\",\"icon\":\"iot\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"设备\",\"menuType\":\"M\",\"orderNum\":20,\"params\":{},\"parentId\":0,\"path\":\"iot\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:28:44', 41);
INSERT INTO `sys_oper_log` VALUES (416, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createBy\":\"admin\",\"icon\":\"model\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通用物模型\",\"menuType\":\"C\",\"orderNum\":20,\"params\":{},\"parentId\":2002,\"path\":\"template\",\"perms\":\"iot:template:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:45:41', 42);
INSERT INTO `sys_oper_log` VALUES (417, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通用物模型查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2087,\"perms\":\"iot:template:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:46:03', 11);
INSERT INTO `sys_oper_log` VALUES (418, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通用物模型新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2087,\"perms\":\"iot:template:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:46:15', 11);
INSERT INTO `sys_oper_log` VALUES (419, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通用物模型修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2087,\"perms\":\"iot:template:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:46:34', 7);
INSERT INTO `sys_oper_log` VALUES (420, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通用物模型删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2087,\"perms\":\"iot:template:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:46:50', 8);
INSERT INTO `sys_oper_log` VALUES (421, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通用物模型导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2087,\"perms\":\"iot:template:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 09:47:03', 10);
INSERT INTO `sys_oper_log` VALUES (422, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"iot_things_model_template\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 11:17:12', 125);
INSERT INTO `sys_oper_log` VALUES (423, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"template\",\"className\":\"IotThingsModelTemplate\",\"columns\":[{\"capJavaField\":\"TemplateId\",\"columnComment\":\"物模型ID\",\"columnId\":190,\"columnName\":\"template_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-04 11:17:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"templateId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TemplateName\",\"columnComment\":\"物模型名称\",\"columnId\":191,\"columnName\":\"template_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-04 11:17:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"templateName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TenantId\",\"columnComment\":\"租户ID\",\"columnId\":192,\"columnName\":\"tenant_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-04 11:17:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"tenantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TenantName\",\"columnComment\":\"租户名称\",\"columnId\":193,\"columnName\":\"tenant_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-04 11:17:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isL', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-04 11:26:49', 104);
INSERT INTO `sys_oper_log` VALUES (424, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"iot_things_model_template\"}', NULL, 0, NULL, '2026-06-04 11:26:55', 54);
INSERT INTO `sys_oper_log` VALUES (425, '物模型模板', 1, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/iot/template', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-04 23:04:33\",\"datatype\":\"object\",\"identifier\":\"category\",\"isMonitor\":0,\"isReadonly\":0,\"isTop\":1,\"modelOrder\":11,\"params\":{},\"specs\":\"{\\\"type\\\":\\\"object\\\",\\\"params\\\":[{\\\"name\\\":\\\"光照\\\",\\\"id\\\":\\\"category_light\\\",\\\"order\\\":1,\\\"datatype\\\":{\\\"type\\\":\\\"decimal\\\",\\\"min\\\":0,\\\"max\\\":100,\\\"unit\\\":\\\"mm\\\",\\\"step\\\":1,\\\"enumList\\\":[{\\\"value\\\":\\\"\\\",\\\"text\\\":\\\"\\\"}],\\\"arrayType\\\":\\\"int\\\"},\\\"isTop\\\":1,\\\"isMonitor\\\":1,\\\"isReadonly\\\":0},{\\\"name\\\":\\\"空气湿度\\\",\\\"id\\\":\\\"category_humidity\\\",\\\"order\\\":2,\\\"datatype\\\":{\\\"type\\\":\\\"decimal\\\",\\\"min\\\":0,\\\"max\\\":100,\\\"unit\\\":\\\"%\\\",\\\"step\\\":0.1,\\\"enumList\\\":[{\\\"value\\\":\\\"\\\",\\\"text\\\":\\\"\\\"}],\\\"arrayType\\\":\\\"int\\\"},\\\"isTop\\\":1,\\\"isMonitor\\\":1,\\\"isReadonly\\\":0},{\\\"name\\\":\\\"空气温度-只读\\\",\\\"id\\\":\\\"category_temperature\\\",\\\"order\\\":3,\\\"datatype\\\":{\\\"type\\\":\\\"decimal\\\",\\\"min\\\":-20,\\\"max\\\":120,\\\"unit\\\":\\\"℃\\\",\\\"step\\\":0.1,\\\"enumList\\\":[{\\\"value\\\":\\\"\\\",\\\"text\\\":\\\"\\\"}],\\\"arrayType\\\":\\\"int\\\"},\\\"isTop\\\":1,\\\"isMonitor\\\":0,\\\"isReadonly\\\":1},{\\\"name\\\":\\\"上报监测数据\\\",\\\"id\\\":\\\"category_report_monitor\\\",\\\"order\\\":6,\\\"datatype\\\":{\\\"type\\\":\\\"integer\\\",\\\"min\\\":1,\\\"max\\\":20,\\\"unit\\\":\\\"次数\\\",\\\"step\\\":1,\\\"enumList\\\":[{\\\"value\\\":\\\"\\\",\\\"text\\\":\\\"\\\"}],\\\"arrayType\\\":\\\"int\\\"},\\\"isTop\\\":1,\\\"isMonitor\\\":0,\\\"isReadonly\\\":0},{\\\"name\\\":\\\"运行档位\\\",\\\"id\\\":\\\"category_gear\\\",\\\"order\\\":5,\\\"datatype\\\":{\\\"type\\\":\\\"enum\\\",\\\"enumList\\\":[{\\\"value\\\":\\\"0\\\",\\\"text\\\":\\\"低速档位\\\"},{\\\"value\\\":\\\"1\\\",\\\"text\\\":\\\"中速档位\\\"},{\\\"value\\\":\\\"2\\\",\\\"text\\\":\\\"中高速档位\\\"},{\\\"value\\\":\\\"3\\\",\\\"text\\\":\\\"高速档位\\\"},{\\\"value\\\":\\\"4\\\",\\\"text\\\":\\\"最高速档位\\\"}]},\\\"isTop\\\":1,\\\"isMonitor\\\":0,\\\"isReadonly\\\":0},{\\\"name\\\":\\\"设备开关\\\",\\\"id\\\":\\\"category_switch\\\",\\\"order\\\":4,\\\"datatype\\\":{\\\"type\\\":\\\"bool\\\",\\\"falseText\\\":\\\"关闭\\\",\\\"trueText\\\":\\\"打开\\\"},\\\"isTop\\\":1,\\\"isMonitor\\\":0,\\\"isReadonly\\\":0}]}\",\"templateName\":\"功能分组\",\"type\":2} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\Program Files (x86)\\githubdesk_events\\ZHNY\\RuoYi-Vue\\ruoyi-iot\\target\\classes\\mapper\\iot\\IotThingsModelTemplateMapper.xml]\r\n### The error may involve com.ruoyi.iot.mapper.IotThingsModelTemplateMapper.insertIotThingsModelTemplate-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into iot_things_model_template          ( template_name,                                       identifier,             type,             datatype,             specs,                          is_Top,             is_Monitor,             is_readonly,             model_order,                          create_by,             create_time )           values ( ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\n; Field \'tenant_id\' doesn\'t have a default value', '2026-06-04 23:04:34', 814);
INSERT INTO `sys_oper_log` VALUES (426, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/category/index\",\"createBy\":\"admin\",\"icon\":\"category\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"category\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":2002,\"path\":\"category\",\"perms\":\"iot:category:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:47:27', 107);
INSERT INTO `sys_oper_log` VALUES (427, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品分类查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2099,\"perms\":\"iot:category:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:47:45', 12);
INSERT INTO `sys_oper_log` VALUES (428, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/category/index\",\"createTime\":\"2026-06-05 15:47:27\",\"icon\":\"category\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2099,\"menuName\":\"产品分类\",\"menuType\":\"C\",\"orderNum\":30,\"params\":{},\"parentId\":2002,\"path\":\"category\",\"perms\":\"iot:category:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:48:22', 21);
INSERT INTO `sys_oper_log` VALUES (429, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品分类新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2099,\"perms\":\"iot:category:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:48:39', 13);
INSERT INTO `sys_oper_log` VALUES (430, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品分类修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2099,\"perms\":\"iot:category:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:49:11', 11);
INSERT INTO `sys_oper_log` VALUES (431, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品分类删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2099,\"perms\":\"iot:category:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:49:24', 14);
INSERT INTO `sys_oper_log` VALUES (432, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品分类导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2099,\"perms\":\"iot:category:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:49:44', 11);
INSERT INTO `sys_oper_log` VALUES (433, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/product/index\",\"createBy\":\"admin\",\"icon\":\"product\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品管理\",\"menuType\":\"C\",\"orderNum\":40,\"params\":{},\"parentId\":2002,\"path\":\"product\",\"perms\":\"iot:product:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 15:50:35', 19);
INSERT INTO `sys_oper_log` VALUES (434, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品新增按钮\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2105,\"perms\":\"iot:product:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:09:33', 12);
INSERT INTO `sys_oper_log` VALUES (435, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品修改按钮\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2105,\"perms\":\"iot:product:query,iot:product:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:09:55', 10);
INSERT INTO `sys_oper_log` VALUES (436, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品删除\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2105,\"perms\":\"iot:product:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:10:11', 12);
INSERT INTO `sys_oper_log` VALUES (437, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品导出\",\"menuType\":\"F\",\"orderNum\":50,\"params\":{},\"parentId\":2105,\"perms\":\"iot:product:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:10:30', 15);
INSERT INTO `sys_oper_log` VALUES (438, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"iot_product,iot_category\",\"tplWebType\":\"element-ui\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:22:55', 413);
INSERT INTO `sys_oper_log` VALUES (439, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"iot_category,iot_product\"}', NULL, 0, NULL, '2026-06-05 16:22:59', 403);
INSERT INTO `sys_oper_log` VALUES (440, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"IotCategory\",\"columns\":[{\"capJavaField\":\"CategoryId\",\"columnComment\":\"产品分类ID\",\"columnId\":209,\"columnName\":\"category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryName\",\"columnComment\":\"产品分类名称\",\"columnId\":210,\"columnName\":\"category_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TenantId\",\"columnComment\":\"租户ID\",\"columnId\":211,\"columnName\":\"tenant_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"tenantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TenantName\",\"columnComment\":\"租户名称\",\"columnId\":212,\"columnName\":\"tenant_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:23:24', 53);
INSERT INTO `sys_oper_log` VALUES (441, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"product\",\"className\":\"IotProduct\",\"columns\":[{\"capJavaField\":\"ProductId\",\"columnComment\":\"产品ID\",\"columnId\":222,\"columnName\":\"product_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"productId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProductName\",\"columnComment\":\"产品名称\",\"columnId\":223,\"columnName\":\"product_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"productName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"ProtocolCode\",\"columnComment\":\"协议编号\",\"columnId\":224,\"columnName\":\"protocol_code\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"protocolCode\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CategoryId\",\"columnComment\":\"产品分类ID\",\"columnId\":225,\"columnName\":\"category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:23:36', 61);
INSERT INTO `sys_oper_log` VALUES (442, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"category\",\"className\":\"IotCategory\",\"columns\":[{\"capJavaField\":\"CategoryId\",\"columnComment\":\"产品分类ID\",\"columnId\":209,\"columnName\":\"category_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"categoryId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-06-05 16:23:24\",\"usableColumn\":false},{\"capJavaField\":\"CategoryName\",\"columnComment\":\"产品分类名称\",\"columnId\":210,\"columnName\":\"category_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"categoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-06-05 16:23:24\",\"usableColumn\":false},{\"capJavaField\":\"TenantId\",\"columnComment\":\"租户ID\",\"columnId\":211,\"columnName\":\"tenant_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"tenantId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"updateTime\":\"2026-06-05 16:23:24\",\"usableColumn\":false},{\"capJavaField\":\"TenantName\",\"columnComment\":\"租户名称\",\"columnId\":212,\"columnName\":\"tenant_name\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-05 16:22:55\",\"dictType\":\"\",\"edit\":true,\"html', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-05 16:24:57', 37);
INSERT INTO `sys_oper_log` VALUES (443, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"iot_category,iot_product\"}', NULL, 0, NULL, '2026-06-05 16:25:01', 104);
INSERT INTO `sys_oper_log` VALUES (444, '产品分类', 2, 'com.ruoyi.iot.controller.IotCategoryController.edit()', 'PUT', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":2,\"categoryName\":\"气象\",\"createBy\":\"\",\"createTime\":\"2021-12-18 14:46:52\",\"delFlag\":\"0\",\"isSys\":1,\"orderNum\":1,\"params\":{},\"parentId\":0,\"remark\":\"一体式气象站、超声波气象站\",\"tenantId\":1,\"tenantName\":\"admin\",\"updateBy\":\"\",\"updateTime\":\"2026-06-06 09:31:15\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:31:16', 36);
INSERT INTO `sys_oper_log` VALUES (445, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"气象\",\"createTime\":\"2026-06-06 09:32:10\",\"orderNum\":1,\"params\":{},\"remark\":\"一体式气象站、超声波气象站\"} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\IDEA_Code\\zhny\\RuoYi-Vue\\ruoyi-iot\\target\\classes\\mapper\\iot\\IotCategoryMapper.xml]\r\n### The error may involve com.ruoyi.iot.mapper.IotCategoryMapper.insertIotCategory-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into iot_category          ( category_name,                                                                 order_num,                                       create_time,                                       remark )           values ( ?,                                                                 ?,                                       ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\n; Field \'tenant_id\' doesn\'t have a default value', '2026-06-06 09:32:11', 600);
INSERT INTO `sys_oper_log` VALUES (446, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryName\":\"气象\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:48:03\",\"isSys\":1,\"orderNum\":1,\"params\":{},\"remark\":\"一体式气象站、超声波气象站\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', NULL, 1, 'Cannot invoke \"com.ruoyi.iot.mapper.IotCategoryMapper.insertIotCategory(com.ruoyi.iot.domain.IotCategory)\" because \"this.iotCategoryMapper\" is null', '2026-06-06 09:48:03', 18);
INSERT INTO `sys_oper_log` VALUES (447, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":8,\"categoryName\":\"132\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:50:01\",\"isSys\":1,\"orderNum\":1,\"params\":{},\"remark\":\"132\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:50:01', 148);
INSERT INTO `sys_oper_log` VALUES (448, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/8', '127.0.0.1', '内网IP', '[8] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:50:35', 11);
INSERT INTO `sys_oper_log` VALUES (449, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":9,\"categoryName\":\"气象\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:50:47\",\"isSys\":1,\"orderNum\":2,\"params\":{},\"remark\":\"一体式气象站、超声波气象站\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:50:47', 6);
INSERT INTO `sys_oper_log` VALUES (450, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:50:52', 6);
INSERT INTO `sys_oper_log` VALUES (451, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":10,\"categoryName\":\"土壤\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:51:04\",\"isSys\":1,\"orderNum\":3,\"params\":{},\"remark\":\"土壤墒情监测站、管式土壤墒情监测仪\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:04', 9);
INSERT INTO `sys_oper_log` VALUES (452, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/3', '127.0.0.1', '内网IP', '[3] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:08', 5);
INSERT INTO `sys_oper_log` VALUES (453, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"categoryName\":\"水质\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:51:19\",\"isSys\":1,\"orderNum\":4,\"params\":{},\"remark\":\"水质监测站\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:19', 7);
INSERT INTO `sys_oper_log` VALUES (454, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/4', '127.0.0.1', '内网IP', '[4] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:22', 4);
INSERT INTO `sys_oper_log` VALUES (455, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"categoryName\":\"设施农业\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:51:34\",\"isSys\":1,\"orderNum\":5,\"params\":{},\"remark\":\"大棚、卷帘、通风\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:34', 8);
INSERT INTO `sys_oper_log` VALUES (456, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/5', '127.0.0.1', '内网IP', '[5] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:37', 6);
INSERT INTO `sys_oper_log` VALUES (457, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"categoryName\":\"启闭机\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:51:47\",\"isSys\":1,\"orderNum\":6,\"params\":{},\"remark\":\"高标准农田启闭机\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:47', 6);
INSERT INTO `sys_oper_log` VALUES (458, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/6', '127.0.0.1', '内网IP', '[6] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:51:51', 5);
INSERT INTO `sys_oper_log` VALUES (459, '产品分类', 1, 'com.ruoyi.iot.controller.IotCategoryController.add()', 'POST', 1, 'admin', '研发部门', '/iot/category', '127.0.0.1', '内网IP', '{\"categoryId\":14,\"categoryName\":\"其他\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 09:52:11\",\"isSys\":1,\"orderNum\":7,\"params\":{},\"remark\":\"other\",\"tenantId\":0,\"tenantName\":\"系统自营\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:52:11', 7);
INSERT INTO `sys_oper_log` VALUES (460, '产品分类', 3, 'com.ruoyi.iot.controller.IotCategoryController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/category/7', '127.0.0.1', '内网IP', '[7] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 09:52:18', 5);
INSERT INTO `sys_oper_log` VALUES (461, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/product/product-edit\",\"createBy\":\"admin\",\"icon\":\"subscribe1\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品信息\",\"menuType\":\"C\",\"orderNum\":45,\"params\":{},\"parentId\":2002,\"path\":\"product-edit\",\"status\":\"0\",\"visible\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:01:17', 17);
INSERT INTO `sys_oper_log` VALUES (462, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基本信息\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2110,\"perms\":\"iot:product:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:02:04', 13);
INSERT INTO `sys_oper_log` VALUES (463, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基本信息-新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2111,\"perms\":\"iot:product:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:02:30', 11);
INSERT INTO `sys_oper_log` VALUES (464, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"基本信息-修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2110,\"perms\":\"iot:product:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:02:45', 7);
INSERT INTO `sys_oper_log` VALUES (465, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-06 10:02:45\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2113,\"menuName\":\"基本信息-修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2111,\"path\":\"\",\"perms\":\"iot:product:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:03:07', 16);
INSERT INTO `sys_oper_log` VALUES (466, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品模型\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2110,\"perms\":\"iot:devicemodel:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:07:47', 11);
INSERT INTO `sys_oper_log` VALUES (467, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品模型-新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2114,\"perms\":\"iot:devicemodel:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:08:07', 8);
INSERT INTO `sys_oper_log` VALUES (468, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品模型-修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2114,\"perms\":\"iot:devicemodel:query,iot:devicemodel:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:08:24', 9);
INSERT INTO `sys_oper_log` VALUES (469, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品模型-删除\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2114,\"perms\":\"iot:devicemodel:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:08:38', 6);
INSERT INTO `sys_oper_log` VALUES (470, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品模型-导入通用物模型\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2114,\"perms\":\"iot:template:list,iot:devicemodel:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:09:00', 10);
INSERT INTO `sys_oper_log` VALUES (471, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"固件管理\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2110,\"perms\":\"iot:firmware:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:09:25', 9);
INSERT INTO `sys_oper_log` VALUES (472, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"固件管理-新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2119,\"perms\":\"iot:firmware:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:09:38', 15);
INSERT INTO `sys_oper_log` VALUES (473, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"固件管理-删除\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2119,\"perms\":\"iot:firmware:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:09:49', 6);
INSERT INTO `sys_oper_log` VALUES (474, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"固件管理-修改\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2119,\"perms\":\"iot:firmware:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:10:02', 7);
INSERT INTO `sys_oper_log` VALUES (475, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备授权\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2110,\"perms\":\"iot:authorize:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:20:06', 11);
INSERT INTO `sys_oper_log` VALUES (476, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备授权-新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2123,\"perms\":\"iot:authorize:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:20:23', 9);
INSERT INTO `sys_oper_log` VALUES (477, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备授权-修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2123,\"perms\":\"iot:authorize:query,iot:authorize:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:20:39', 10);
INSERT INTO `sys_oper_log` VALUES (478, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备授权-删除\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2123,\"perms\":\"iot:authorize:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:20:57', 11);
INSERT INTO `sys_oper_log` VALUES (479, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备授权-导出\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2123,\"perms\":\"iot:authorize:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:21:12', 10);
INSERT INTO `sys_oper_log` VALUES (480, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"告警配置\",\"menuType\":\"F\",\"orderNum\":50,\"params\":{},\"parentId\":2110,\"perms\":\"iot:alert:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:23:01', 7);
INSERT INTO `sys_oper_log` VALUES (481, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"告警配置-新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2128,\"perms\":\"iot:alert:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:23:18', 10);
INSERT INTO `sys_oper_log` VALUES (482, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"告警配置-修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2128,\"perms\":\"iot:alert:query,iot:alert:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:23:38', 9);
INSERT INTO `sys_oper_log` VALUES (483, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"告警配置-删除\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2128,\"perms\":\"iot:alert:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:23:54', 16);
INSERT INTO `sys_oper_log` VALUES (484, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"发布/取消发布\",\"menuType\":\"F\",\"orderNum\":60,\"params\":{},\"parentId\":2110,\"perms\":\"iot:product:ispublish\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:24:15', 9);
INSERT INTO `sys_oper_log` VALUES (485, '物模型模板', 1, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/iot/template', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 10:38:53\",\"datatype\":\"integer\",\"identifier\":\"1\",\"isMonitor\":1,\"isReadonly\":1,\"isTop\":1,\"modelOrder\":1,\"params\":{},\"specs\":\"{\\\"type\\\":\\\"integer\\\",\\\"min\\\":1,\\\"max\\\":2,\\\"unit\\\":\\\"12\\\",\\\"step\\\":23}\",\"templateName\":\"1\",\"type\":1} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\IDEA_Code\\zhny\\RuoYi-Vue\\ruoyi-iot\\target\\classes\\mapper\\iot\\IotThingsModelTemplateMapper.xml]\r\n### The error may involve com.ruoyi.iot.mapper.IotThingsModelTemplateMapper.insertIotThingsModelTemplate-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into iot_things_model_template          ( template_name,                                       identifier,             type,             datatype,             specs,                          is_Top,             is_Monitor,             is_readonly,             model_order,                          create_by,             create_time )           values ( ?,                                       ?,             ?,             ?,             ?,                          ?,             ?,             ?,             ?,                          ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\n; Field \'tenant_id\' doesn\'t have a default value', '2026-06-06 10:38:53', 593);
INSERT INTO `sys_oper_log` VALUES (486, '物模型模板', 1, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/iot/template', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 10:56:37\",\"datatype\":\"integer\",\"identifier\":\"123\",\"isMonitor\":1,\"isReadonly\":1,\"isTop\":1,\"modelOrder\":2,\"params\":{},\"specs\":\"{\\\"type\\\":\\\"integer\\\",\\\"min\\\":1,\\\"max\\\":3,\\\"unit\\\":\\\"123\\\",\\\"step\\\":1}\",\"templateId\":27,\"templateName\":\"123\",\"tenantId\":0,\"tenantName\":\"系统自营\",\"type\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 10:56:37', 167);
INSERT INTO `sys_oper_log` VALUES (487, '物模型模板', 1, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/iot/template', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 11:10:54\",\"datatype\":\"object\",\"identifier\":\"category\",\"isMonitor\":0,\"isReadonly\":0,\"isTop\":1,\"modelOrder\":1,\"params\":{},\"specs\":\"{\\\"type\\\":\\\"object\\\",\\\"params\\\":[{\\\"name\\\":\\\"光照\\\",\\\"id\\\":\\\"category_light\\\",\\\"order\\\":1,\\\"datatype\\\":{\\\"type\\\":\\\"decimal\\\",\\\"min\\\":0,\\\"max\\\":100,\\\"unit\\\":\\\"mm\\\",\\\"step\\\":1},\\\"isTop\\\":1,\\\"isMonitor\\\":1,\\\"isReadonly\\\":0}]}\",\"templateId\":28,\"templateName\":\"功能分组\",\"tenantId\":0,\"tenantName\":\"系统自营\",\"type\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:10:54', 11);
INSERT INTO `sys_oper_log` VALUES (488, '物模型模板', 3, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/template/27', '127.0.0.1', '内网IP', '[27] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:11:01', 18);
INSERT INTO `sys_oper_log` VALUES (489, '物模型模板', 1, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/iot/template', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 11:12:58\",\"datatype\":\"array\",\"identifier\":\"device\",\"isMonitor\":0,\"isReadonly\":0,\"isTop\":1,\"modelOrder\":2,\"params\":{},\"specs\":\"{\\\"type\\\":\\\"array\\\",\\\"arrayType\\\":\\\"object\\\",\\\"arrayCount\\\":5,\\\"params\\\":[{\\\"name\\\":\\\"二氧化碳\\\",\\\"id\\\":\\\"device_co2\\\",\\\"order\\\":0,\\\"datatype\\\":{\\\"type\\\":\\\"integer\\\",\\\"min\\\":100,\\\"max\\\":6000,\\\"unit\\\":\\\"ppm\\\",\\\"step\\\":1},\\\"isTop\\\":1,\\\"isMonitor\\\":1,\\\"isReadonly\\\":0},{\\\"name\\\":\\\"空气温度-只读\\\",\\\"id\\\":\\\"device_temperature\\\",\\\"order\\\":4,\\\"datatype\\\":{\\\"type\\\":\\\"decimal\\\",\\\"min\\\":-20,\\\"max\\\":120,\\\"unit\\\":\\\"℃\\\",\\\"step\\\":0.1},\\\"isTop\\\":1,\\\"isMonitor\\\":0,\\\"isReadonly\\\":1}]}\",\"templateId\":29,\"templateName\":\"子设备\",\"tenantId\":0,\"tenantName\":\"系统自营\",\"type\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:12:58', 8);
INSERT INTO `sys_oper_log` VALUES (490, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"物模型类别\",\"dictType\":\"iot_things_type\",\"params\":{},\"remark\":\"属性、动作、事件\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:13:49', 19);
INSERT INTO `sys_oper_log` VALUES (491, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"属性\",\"dictSort\":1,\"dictType\":\"iot_things_type\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:14:11', 8);
INSERT INTO `sys_oper_log` VALUES (492, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"功能\",\"dictSort\":2,\"dictType\":\"iot_things_type\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:14:29', 12);
INSERT INTO `sys_oper_log` VALUES (493, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"事件\",\"dictSort\":3,\"dictType\":\"iot_things_type\",\"dictValue\":\"3\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:14:42', 9);
INSERT INTO `sys_oper_log` VALUES (494, '农资类别', 2, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:40:46\",\"delFlag\":\"0\",\"materialTypeId\":\"2\",\"materialTypeName\":\"农用物资与农机\",\"orderNum\":1,\"params\":{},\"remark\":\"地膜、棚膜、育苗基质、农药喷雾器、农具、灌溉设备、小型耕种机械等\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:08\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:08', 14);
INSERT INTO `sys_oper_log` VALUES (495, '农资类别', 2, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-03 16:05:06\",\"delFlag\":\"0\",\"materialTypeId\":\"3\",\"materialTypeName\":\"种子种苗\",\"orderNum\":2,\"params\":{},\"remark\":\"水稻、小麦、玉米、瓜果蔬菜种子、秧苗、种薯、种藕等\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:10\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:10', 5);
INSERT INTO `sys_oper_log` VALUES (496, '农资类别', 2, 'com.ruoyi.controller.system.AgricultureMaterialTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material/type', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-03 16:07:23\",\"delFlag\":\"0\",\"materialTypeId\":\"4\",\"materialTypeName\":\"农药\",\"orderNum\":3,\"params\":{},\"remark\":\"杀虫剂、杀菌剂、除草剂、植物生长调节剂、灭鼠药剂等\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:13\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:13', 4);
INSERT INTO `sys_oper_log` VALUES (497, '雇员', 2, 'com.ruoyi.controller.system.AgricultureEmployeeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-02 09:11:36\",\"delFlag\":\"0\",\"employeeAddress\":\"重庆市高新技术开发区\",\"employeeCode\":\"1004\",\"employeeId\":\"8\",\"employeeName\":\"罗一凡\",\"employeeSex\":\"0\",\"employeeTel\":\"13266458879\",\"employeeType\":\"0\",\"orderNum\":6,\"params\":{},\"remark\":\"跳蚤市场员工\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:27\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:27', 10);
INSERT INTO `sys_oper_log` VALUES (498, '机械类别', 2, 'com.ruoyi.controller.system.AgricultureMachineTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/machine/type', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-02 21:25:43\",\"delFlag\":\"0\",\"machineTypeId\":\"1\",\"machineTypeName\":\"拖拉机\",\"orderNum\":0,\"params\":{},\"remark\":\"2\",\"status\":\"0\",\"updateBy\":\"1\",\"updateTime\":\"2026-06-06 11:18:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:40', 10);
INSERT INTO `sys_oper_log` VALUES (499, '机械类别', 2, 'com.ruoyi.controller.system.AgricultureMachineTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/machine/type', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:29:38\",\"delFlag\":\"0\",\"machineTypeId\":\"2\",\"machineTypeName\":\"收割机\",\"orderNum\":1,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:45\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:45', 4);
INSERT INTO `sys_oper_log` VALUES (500, '机械类别', 2, 'com.ruoyi.controller.system.AgricultureMachineTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/machine/type', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:29:43\",\"delFlag\":\"0\",\"machineTypeId\":\"3\",\"machineTypeName\":\"插秧机\",\"orderNum\":2,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:48\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:48', 5);
INSERT INTO `sys_oper_log` VALUES (501, '机械类别', 2, 'com.ruoyi.controller.system.AgricultureMachineTypeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/machine/type', '127.0.0.1', '内网IP', '{\"createBy\":\"8\",\"createTime\":\"2023-08-26 13:41:04\",\"delFlag\":\"2\",\"machineTypeId\":\"4\",\"machineTypeName\":\"无人机\",\"orderNum\":3,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:18:50\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:18:50', 4);
INSERT INTO `sys_oper_log` VALUES (502, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:41:12\",\"delFlag\":\"0\",\"materialCode\":\"001\",\"materialId\":\"1\",\"materialName\":\"钾肥\",\"materialTypeId\":\"1\",\"materialTypeName\":\"肥料\",\"measureUnit\":\"袋\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-06 11:19:00\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:19:00', 11);
INSERT INTO `sys_oper_log` VALUES (503, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"数据类型\",\"dictType\":\"iot_data_type\",\"params\":{},\"remark\":\"integer、decimal、bool、string、enum\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:42:42', 9);
INSERT INTO `sys_oper_log` VALUES (504, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"整数\",\"dictSort\":1,\"dictType\":\"iot_data_type\",\"dictValue\":\"integer\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:43:04', 6);
INSERT INTO `sys_oper_log` VALUES (505, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"小数\",\"dictSort\":2,\"dictType\":\"iot_data_type\",\"dictValue\":\"decimal\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:43:14', 7);
INSERT INTO `sys_oper_log` VALUES (506, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"布尔\",\"dictSort\":3,\"dictType\":\"iot_data_type\",\"dictValue\":\"bool\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:43:25', 13);
INSERT INTO `sys_oper_log` VALUES (507, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"枚举\",\"dictSort\":4,\"dictType\":\"iot_data_type\",\"dictValue\":\"enum\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:43:37', 7);
INSERT INTO `sys_oper_log` VALUES (508, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"字符串\",\"dictSort\":5,\"dictType\":\"iot_data_type\",\"dictValue\":\"string\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:43:56', 9);
INSERT INTO `sys_oper_log` VALUES (509, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"数组\",\"dictSort\":6,\"dictType\":\"iot_data_type\",\"dictValue\":\"array\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:44:07', 8);
INSERT INTO `sys_oper_log` VALUES (510, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"对象\",\"dictSort\":7,\"dictType\":\"iot_data_type\",\"dictValue\":\"object\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:44:19', 8);
INSERT INTO `sys_oper_log` VALUES (511, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否\",\"dictType\":\"iot_yes_no\",\"params\":{},\"remark\":\"是、否\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:45:16', 6);
INSERT INTO `sys_oper_log` VALUES (512, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"iot_yes_no\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:45:37', 7);
INSERT INTO `sys_oper_log` VALUES (513, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":2,\"dictType\":\"iot_yes_no\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 11:45:47', 8);
INSERT INTO `sys_oper_log` VALUES (514, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"产品状态\",\"dictType\":\"iot_product_status\",\"params\":{},\"remark\":\"未发布、已发布（不能修改）\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:42:22', 10);
INSERT INTO `sys_oper_log` VALUES (515, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未发布\",\"dictSort\":1,\"dictType\":\"iot_product_status\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:42:42', 12);
INSERT INTO `sys_oper_log` VALUES (516, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已发布\",\"dictSort\":2,\"dictType\":\"iot_product_status\",\"dictValue\":\"2\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:42:54', 11);
INSERT INTO `sys_oper_log` VALUES (517, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"设备类型\",\"dictType\":\"iot_device_type\",\"params\":{},\"remark\":\"直连设备、网关子设备、网关设备\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:43:17', 10);
INSERT INTO `sys_oper_log` VALUES (518, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"直连设备\",\"dictSort\":1,\"dictType\":\"iot_device_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:43:37', 14);
INSERT INTO `sys_oper_log` VALUES (519, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"网关设备\",\"dictSort\":2,\"dictType\":\"iot_device_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:43:48', 8);
INSERT INTO `sys_oper_log` VALUES (520, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"监控设备\",\"dictSort\":3,\"dictType\":\"iot_device_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:44:01', 13);
INSERT INTO `sys_oper_log` VALUES (521, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"联网方式\",\"dictType\":\"iot_network_method\",\"params\":{},\"remark\":\"wifi、蜂窝(4G/5G)、以太网、其他\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:44:30', 10);
INSERT INTO `sys_oper_log` VALUES (522, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"WIFI\",\"dictSort\":1,\"dictType\":\"iot_network_method\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:44:54', 12);
INSERT INTO `sys_oper_log` VALUES (523, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"蜂窝(4G/5G)\",\"dictSort\":2,\"dictType\":\"iot_network_method\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:45:09', 10);
INSERT INTO `sys_oper_log` VALUES (524, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"以太网\",\"dictSort\":3,\"dictType\":\"iot_network_method\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:45:20', 9);
INSERT INTO `sys_oper_log` VALUES (525, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其他\",\"dictSort\":4,\"dictType\":\"iot_network_method\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:45:30', 11);
INSERT INTO `sys_oper_log` VALUES (526, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"认证方式\",\"dictType\":\"iot_vertificate_method\",\"params\":{},\"remark\":\"1=简单认证、2=加密认证、3=简单+加密\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:45:59', 9);
INSERT INTO `sys_oper_log` VALUES (527, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"简单认证\",\"dictSort\":1,\"dictType\":\"iot_vertificate_method\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:46:13', 6);
INSERT INTO `sys_oper_log` VALUES (528, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"加密认证\",\"dictSort\":2,\"dictType\":\"iot_vertificate_method\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:46:21', 8);
INSERT INTO `sys_oper_log` VALUES (529, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"简单+加密\",\"dictSort\":3,\"dictType\":\"iot_vertificate_method\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:47:44', 11);
INSERT INTO `sys_oper_log` VALUES (530, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"设备芯片\",\"dictType\":\"iot_device_chip\",\"params\":{},\"remark\":\"ESP8266、ESP32、树莓派\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:48:09', 7);
INSERT INTO `sys_oper_log` VALUES (531, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"ESP8266/Arduino\",\"dictSort\":1,\"dictType\":\"iot_device_chip\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:48:28', 7);
INSERT INTO `sys_oper_log` VALUES (532, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"ESP8266/RTOS\",\"dictSort\":2,\"dictType\":\"iot_device_chip\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:48:40', 10);
INSERT INTO `sys_oper_log` VALUES (533, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"ESP32/Arduino\",\"dictSort\":3,\"dictType\":\"iot_device_chip\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:49:03', 12);
INSERT INTO `sys_oper_log` VALUES (534, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"ESP32/ESP-IDF\",\"dictSort\":4,\"dictType\":\"iot_device_chip\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:49:17', 10);
INSERT INTO `sys_oper_log` VALUES (535, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"树莓派/Python\",\"dictSort\":5,\"dictType\":\"iot_device_chip\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:49:26', 9);
INSERT INTO `sys_oper_log` VALUES (536, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"安卓/Android\",\"dictSort\":6,\"dictType\":\"iot_device_chip\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:49:36', 9);
INSERT INTO `sys_oper_log` VALUES (537, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"其他\",\"dictSort\":7,\"dictType\":\"iot_device_chip\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:49:45', 8);
INSERT INTO `sys_oper_log` VALUES (538, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"设备状态\",\"dictType\":\"iot_device_status\",\"params\":{},\"remark\":\"未激活、禁用、在线、离线\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:51:58', 9);
INSERT INTO `sys_oper_log` VALUES (539, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未激活\",\"dictSort\":0,\"dictType\":\"iot_device_status\",\"dictValue\":\"1\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:52:14', 7);
INSERT INTO `sys_oper_log` VALUES (540, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"禁用\",\"dictSort\":2,\"dictType\":\"iot_device_status\",\"dictValue\":\"2\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:52:27', 10);
INSERT INTO `sys_oper_log` VALUES (541, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 14:52:14\",\"default\":false,\"dictCode\":145,\"dictLabel\":\"未激活\",\"dictSort\":1,\"dictType\":\"iot_device_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:52:31', 14);
INSERT INTO `sys_oper_log` VALUES (542, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"在线\",\"dictSort\":3,\"dictType\":\"iot_device_status\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:52:42', 10);
INSERT INTO `sys_oper_log` VALUES (543, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"离线\",\"dictSort\":4,\"dictType\":\"iot_device_status\",\"dictValue\":\"4\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:52:52', 9);
INSERT INTO `sys_oper_log` VALUES (544, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"是否启用\",\"dictType\":\"iot_is_enable\",\"params\":{},\"remark\":\"启用、禁用\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:54:19', 11);
INSERT INTO `sys_oper_log` VALUES (545, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"启用\",\"dictSort\":1,\"dictType\":\"iot_is_enable\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:54:45', 7);
INSERT INTO `sys_oper_log` VALUES (546, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"禁用\",\"dictSort\":0,\"dictType\":\"iot_is_enable\",\"dictValue\":\"0\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:54:59', 9);
INSERT INTO `sys_oper_log` VALUES (547, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"告警类型\",\"dictType\":\"iot_alert_level\",\"params\":{},\"remark\":\"1=提醒通知，2=轻微问题，3=严重警告\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:55:24', 7);
INSERT INTO `sys_oper_log` VALUES (548, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"提醒通知\",\"dictSort\":1,\"dictType\":\"iot_alert_level\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:55:44', 3);
INSERT INTO `sys_oper_log` VALUES (549, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"轻微问题\",\"dictSort\":2,\"dictType\":\"iot_alert_level\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:55:57', 9);
INSERT INTO `sys_oper_log` VALUES (550, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"严重警告\",\"dictSort\":3,\"dictType\":\"iot_alert_level\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:56:09', 9);
INSERT INTO `sys_oper_log` VALUES (551, '字典类型', 1, 'com.ruoyi.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"处理状态\",\"dictType\":\"iot_process_status\",\"params\":{},\"remark\":\"1=不需要处理,2=未处理,3=已处理\",\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:56:26', 6);
INSERT INTO `sys_oper_log` VALUES (552, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不需要处理\",\"dictSort\":1,\"dictType\":\"iot_process_status\",\"dictValue\":\"1\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:56:44', 7);
INSERT INTO `sys_oper_log` VALUES (553, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未处理\",\"dictSort\":2,\"dictType\":\"iot_process_status\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:59:18', 4);
INSERT INTO `sys_oper_log` VALUES (554, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 14:56:44\",\"default\":false,\"dictCode\":154,\"dictLabel\":\"不需要处理\",\"dictSort\":1,\"dictType\":\"iot_process_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:59:27', 9);
INSERT INTO `sys_oper_log` VALUES (555, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 14:56:44\",\"default\":false,\"dictCode\":154,\"dictLabel\":\"不需要处理\",\"dictSort\":1,\"dictType\":\"iot_process_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:59:37', 10);
INSERT INTO `sys_oper_log` VALUES (556, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 14:56:44\",\"default\":false,\"dictCode\":154,\"dictLabel\":\"不需要处理\",\"dictSort\":1,\"dictType\":\"iot_process_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 14:59:44', 9);
INSERT INTO `sys_oper_log` VALUES (557, '字典数据', 1, 'com.ruoyi.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已处理\",\"dictSort\":3,\"dictType\":\"iot_process_status\",\"dictValue\":\"3\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:00:22', 8);
INSERT INTO `sys_oper_log` VALUES (558, '字典数据', 2, 'com.ruoyi.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-06 14:56:44\",\"default\":false,\"dictCode\":154,\"dictLabel\":\"不需要处理\",\"dictSort\":1,\"dictType\":\"iot_process_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:00:27', 10);
INSERT INTO `sys_oper_log` VALUES (559, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createTime\":\"2026-06-04 11:31:43\",\"icon\":\"model\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"物模型模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"template\",\"perms\":\"iot:template:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'物模型模板\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 15:07:04', 30);
INSERT INTO `sys_oper_log` VALUES (560, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createTime\":\"2026-06-04 11:31:43\",\"icon\":\"model\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"物模型模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"template\",\"perms\":\"iot:template:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'物模型模板\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 15:07:08', 0);
INSERT INTO `sys_oper_log` VALUES (561, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createTime\":\"2026-06-04 11:31:43\",\"icon\":\"model\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"物模型模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"template\",\"perms\":\"iot:template:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"修改菜单\'物模型模板\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 15:07:13', 5);
INSERT INTO `sys_oper_log` VALUES (562, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createTime\":\"2026-06-04 11:31:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"物模型模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"template\",\"perms\":\"iot:template:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"1\"} ', '{\"msg\":\"修改菜单\'物模型模板\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 15:08:31', 7);
INSERT INTO `sys_oper_log` VALUES (563, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createTime\":\"2026-06-04 11:31:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"物模型模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"template\",\"perms\":\"iot:template:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"1\"} ', '{\"msg\":\"修改菜单\'物模型模板\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 15:08:32', 3);
INSERT INTO `sys_oper_log` VALUES (564, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/template/index\",\"createTime\":\"2026-06-04 11:31:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2093,\"menuName\":\"物模型模板\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":3,\"path\":\"template\",\"perms\":\"iot:template:list\",\"routeName\":\"\",\"status\":\"0\",\"visible\":\"1\"} ', '{\"msg\":\"修改菜单\'物模型模板\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 15:08:42', 8);
INSERT INTO `sys_oper_log` VALUES (565, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2093', '127.0.0.1', '内网IP', '2093 ', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2026-06-06 15:08:45', 7);
INSERT INTO `sys_oper_log` VALUES (566, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2098', '127.0.0.1', '内网IP', '2098 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:08:50', 79);
INSERT INTO `sys_oper_log` VALUES (567, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2097', '127.0.0.1', '内网IP', '2097 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:09:00', 7);
INSERT INTO `sys_oper_log` VALUES (568, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2096', '127.0.0.1', '内网IP', '2096 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:09:02', 8);
INSERT INTO `sys_oper_log` VALUES (569, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2095', '127.0.0.1', '内网IP', '2095 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:09:04', 8);
INSERT INTO `sys_oper_log` VALUES (570, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2094', '127.0.0.1', '内网IP', '2094 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:09:06', 8);
INSERT INTO `sys_oper_log` VALUES (571, '菜单管理', 3, 'com.ruoyi.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2093', '127.0.0.1', '内网IP', '2093 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:09:08', 8);
INSERT INTO `sys_oper_log` VALUES (572, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":9,\"categoryName\":\"气象\",\"createTime\":\"2026-06-06 15:51:57\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/06/微信图片_20260606154746_393_102_20260606154759A001.png\",\"isAuthorize\":0,\"networkMethod\":1,\"params\":{},\"productId\":0,\"productName\":\"气象站\",\"remark\":\"气温测试模型01\",\"vertificateMethod\":3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\IDEA_Code\\zhny\\RuoYi-Vue\\ruoyi-iot\\target\\classes\\mapper\\iot\\IotProductMapper.xml]\r\n### The error may involve com.ruoyi.iot.mapper.IotProductMapper.insertIotProduct-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into iot_product          ( product_name,                          category_id,             category_name,                                                    is_authorize,                                                                              device_type,             network_method,             vertificate_method,             img_url,                                       create_time,                                       remark )           values ( ?,                          ?,             ?,                                                    ?,                                                                              ?,             ?,             ?,             ?,                                       ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\n; Field \'tenant_id\' doesn\'t have a default value', '2026-06-06 15:51:58', 805);
INSERT INTO `sys_oper_log` VALUES (573, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":9,\"categoryName\":\"气象\",\"createTime\":\"2026-06-06 15:54:26\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/06/微信图片_20260606154746_393_102_20260606154759A001.png\",\"isAuthorize\":0,\"networkMethod\":1,\"params\":{},\"productId\":0,\"productName\":\"气象站\",\"remark\":\"气温测试模型01\",\"vertificateMethod\":3} ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\r\n### The error may exist in file [H:\\IDEA_Code\\zhny\\RuoYi-Vue\\ruoyi-iot\\target\\classes\\mapper\\iot\\IotProductMapper.xml]\r\n### The error may involve com.ruoyi.iot.mapper.IotProductMapper.insertIotProduct-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into iot_product          ( product_name,                          category_id,             category_name,                                                    is_authorize,                                                                              device_type,             network_method,             vertificate_method,             img_url,                                       create_time,                                       remark )           values ( ?,                          ?,             ?,                                                    ?,                                                                              ?,             ?,             ?,             ?,                                       ?,                                       ? )\r\n### Cause: java.sql.SQLException: Field \'tenant_id\' doesn\'t have a default value\n; Field \'tenant_id\' doesn\'t have a default value', '2026-06-06 15:54:26', 6);
INSERT INTO `sys_oper_log` VALUES (574, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":9,\"categoryName\":\"气象\",\"createBy\":\"admin\",\"createTime\":\"2026-06-06 15:55:19\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/06/微信图片_20260606154746_393_102_20260606154759A001.png\",\"isAuthorize\":0,\"mqttAccount\":\"P_1e4aef19\",\"mqttPassword\":\"6b4f4a40334e4426\",\"mqttSecret\":\"68a9298038564075b0f8ef8c7305088c\",\"networkMethod\":1,\"params\":{},\"productId\":105,\"productName\":\"气象站\",\"remark\":\"气温测试模型01\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"vertificateMethod\":3} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 15:55:19', 175);
INSERT INTO `sys_oper_log` VALUES (575, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/firmware/index\",\"createBy\":\"admin\",\"icon\":\"firmware\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品固件\",\"menuType\":\"C\",\"orderNum\":50,\"params\":{},\"parentId\":2002,\"path\":\"firmware\",\"perms\":\"iot:firmware:list\",\"query\":\"\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:16:33', 49);
INSERT INTO `sys_oper_log` VALUES (576, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品固件查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2133,\"perms\":\"iot:firmware:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:17:04', 13);
INSERT INTO `sys_oper_log` VALUES (577, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品固件新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2133,\"perms\":\"iot:firmware:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:17:22', 11);
INSERT INTO `sys_oper_log` VALUES (578, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品固件修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2133,\"perms\":\"iot:firmware:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:18:27', 10);
INSERT INTO `sys_oper_log` VALUES (579, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品固件删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2133,\"perms\":\"iot:firmware:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:18:41', 13);
INSERT INTO `sys_oper_log` VALUES (580, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"产品固件导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2133,\"perms\":\"iot:firmware:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:18:54', 7);
INSERT INTO `sys_oper_log` VALUES (581, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/group/index\",\"createBy\":\"admin\",\"icon\":\"group\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分组\",\"menuType\":\"C\",\"orderNum\":60,\"params\":{},\"parentId\":2002,\"path\":\"group\",\"perms\":\"iot:group:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:21:16', 10);
INSERT INTO `sys_oper_log` VALUES (582, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分组查询\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2139,\"perms\":\"iot:group:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:21:33', 11);
INSERT INTO `sys_oper_log` VALUES (583, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分组新增\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2139,\"perms\":\"iot:group:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:21:51', 7);
INSERT INTO `sys_oper_log` VALUES (584, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分组修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2139,\"perms\":\"iot:group:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:22:09', 11);
INSERT INTO `sys_oper_log` VALUES (585, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分组删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2139,\"perms\":\"iot:group:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:22:31', 9);
INSERT INTO `sys_oper_log` VALUES (586, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备分组导出\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2139,\"perms\":\"iot:group:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:22:45', 9);
INSERT INTO `sys_oper_log` VALUES (587, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/device/index\",\"createBy\":\"admin\",\"icon\":\"device\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备管理\",\"menuType\":\"C\",\"orderNum\":70,\"params\":{},\"parentId\":2002,\"path\":\"device\",\"perms\":\"iot:device:list,agriculture:land:list,iot:group:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:23:23', 11);
INSERT INTO `sys_oper_log` VALUES (588, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查询按钮\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2145,\"perms\":\"iot:device:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:23:55', 9);
INSERT INTO `sys_oper_log` VALUES (589, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增按钮\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2145,\"perms\":\"iot:device:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:24:13', 13);
INSERT INTO `sys_oper_log` VALUES (590, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"编辑按钮\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2145,\"perms\":\"iot:device:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:24:25', 7);
INSERT INTO `sys_oper_log` VALUES (591, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\" 删除按钮\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2145,\"perms\":\"iot:device:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:24:37', 12);
INSERT INTO `sys_oper_log` VALUES (592, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出按钮\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2145,\"perms\":\"iot:device:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:24:54', 7);
INSERT INTO `sys_oper_log` VALUES (593, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"运行状态按钮\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2145,\"perms\":\"iot:device:view\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:25:10', 10);
INSERT INTO `sys_oper_log` VALUES (594, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/device/device-view\",\"createBy\":\"admin\",\"icon\":\"eye\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备运行状态\",\"menuType\":\"C\",\"orderNum\":70,\"params\":{},\"parentId\":2087,\"path\":\"device-view\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 17:28:16', 11);
INSERT INTO `sys_oper_log` VALUES (595, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/device/device-view\",\"icon\":\"pm25\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备运行状态\",\"menuType\":\"C\",\"orderNum\":75,\"params\":{},\"parentId\":2002,\"path\":\"device-view\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"新增菜单\'设备运行状态\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 18:38:41', 8);
INSERT INTO `sys_oper_log` VALUES (596, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/device/device-view\",\"icon\":\"pm25\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备运行状态\",\"menuType\":\"C\",\"orderNum\":75,\"params\":{},\"parentId\":2002,\"path\":\"device-view\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"新增菜单\'设备运行状态\'失败，路由名称或地址已存在\",\"code\":500}', 0, NULL, '2026-06-06 18:38:45', 4);
INSERT INTO `sys_oper_log` VALUES (597, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/device/device-view\",\"createTime\":\"2026-06-06 17:28:16\",\"icon\":\"monitor-a\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2152,\"menuName\":\"设备运行状态\",\"menuType\":\"C\",\"orderNum\":70,\"params\":{},\"parentId\":2002,\"path\":\"device-view\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:39:30', 22);
INSERT INTO `sys_oper_log` VALUES (598, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采集数据\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2152,\"perms\":\"iot:device:query,iot:devicemodel:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:40:11', 10);
INSERT INTO `sys_oper_log` VALUES (599, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采集数据-更改节点排版按钮\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2153,\"perms\":\"agriculture:layout:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:40:27', 10);
INSERT INTO `sys_oper_log` VALUES (600, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"采集数据-实时数据按钮\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2153,\"perms\":\"device:view:monitor\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:40:41', 7);
INSERT INTO `sys_oper_log` VALUES (601, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2152,\"perms\":\"iot:devicejob:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:41:04', 13);
INSERT INTO `sys_oper_log` VALUES (602, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-新增按钮\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejob:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:41:17', 11);
INSERT INTO `sys_oper_log` VALUES (603, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-修改按钮\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejob:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:41:33', 11);
INSERT INTO `sys_oper_log` VALUES (604, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-定时详细按钮\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejob:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:41:48', 11);
INSERT INTO `sys_oper_log` VALUES (605, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-删除按钮\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejob:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:42:07', 9);
INSERT INTO `sys_oper_log` VALUES (606, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-执行一次按钮\",\"menuType\":\"F\",\"orderNum\":50,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejob:runonce\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:42:22', 9);
INSERT INTO `sys_oper_log` VALUES (607, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-启用\",\"menuType\":\"F\",\"orderNum\":60,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejob:status\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:42:40', 9);
INSERT INTO `sys_oper_log` VALUES (608, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"定时任务-日志\",\"menuType\":\"F\",\"orderNum\":70,\"params\":{},\"parentId\":2156,\"perms\":\"iot:devicejoblog:list,iot:devicejoblog:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:43:09', 8);
INSERT INTO `sys_oper_log` VALUES (609, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备用户\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2152,\"perms\":\"iot:deviceshare:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:43:40', 7);
INSERT INTO `sys_oper_log` VALUES (610, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备用户-分享按钮\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2164,\"perms\":\"iot:deviceshare:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:43:58', 12);
INSERT INTO `sys_oper_log` VALUES (611, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备用户-备注按钮\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2164,\"perms\":\"iot:deviceshare:edit,iot:deviceshare:remark,iot:deviceshare:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:44:14', 9);
INSERT INTO `sys_oper_log` VALUES (612, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备用户-取消分享按钮\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2164,\"perms\":\"iot:deviceshare:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:44:28', 8);
INSERT INTO `sys_oper_log` VALUES (613, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备日志\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2164,\"perms\":\"iot:devicelog:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:44:41', 10);
INSERT INTO `sys_oper_log` VALUES (614, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"数据分析\",\"menuType\":\"F\",\"orderNum\":50,\"params\":{},\"parentId\":2164,\"perms\":\"iot:devicelog:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:44:55', 6);
INSERT INTO `sys_oper_log` VALUES (615, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-06 18:44:41\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2168,\"menuName\":\"设备日志\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2152,\"path\":\"\",\"perms\":\"iot:devicelog:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:45:28', 10);
INSERT INTO `sys_oper_log` VALUES (616, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-06 18:44:55\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2169,\"menuName\":\"数据分析\",\"menuType\":\"F\",\"orderNum\":50,\"params\":{},\"parentId\":2152,\"path\":\"\",\"perms\":\"iot:devicelog:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:45:34', 12);
INSERT INTO `sys_oper_log` VALUES (617, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/device/device-view\",\"createTime\":\"2026-06-06 17:28:16\",\"icon\":\"monitor-a\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2152,\"menuName\":\"设备运行状态\",\"menuType\":\"C\",\"orderNum\":75,\"params\":{},\"parentId\":2002,\"path\":\"device-view\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:46:12', 9);
INSERT INTO `sys_oper_log` VALUES (618, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"iot/alertLog/index\",\"createBy\":\"admin\",\"icon\":\"alert\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备告警\",\"menuType\":\"C\",\"orderNum\":80,\"params\":{},\"parentId\":2002,\"path\":\"alertLog\",\"perms\":\"iot:alert:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:46:41', 9);
INSERT INTO `sys_oper_log` VALUES (619, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备告警查询\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2170,\"perms\":\"iot:alert:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:46:59', 6);
INSERT INTO `sys_oper_log` VALUES (620, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备告警新增\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2170,\"perms\":\"iot:alert:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:47:15', 7);
INSERT INTO `sys_oper_log` VALUES (621, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备告警修改\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2170,\"perms\":\"iot:alert:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:47:27', 7);
INSERT INTO `sys_oper_log` VALUES (622, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备告警删除\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2170,\"perms\":\"iot:alert:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:47:39', 7);
INSERT INTO `sys_oper_log` VALUES (623, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"设备告警导出\",\"menuType\":\"F\",\"orderNum\":50,\"params\":{},\"parentId\":2170,\"perms\":\"iot:alert:export\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-06 18:47:52', 10);
INSERT INTO `sys_oper_log` VALUES (624, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:41:12\",\"delFlag\":\"0\",\"materialCode\":\"001\",\"materialId\":\"1\",\"materialName\":\"钾肥\",\"materialTypeId\":\"1\",\"materialTypeName\":\"肥料\",\"measureUnit\":\"袋\",\"orderNum\":0,\"params\":{},\"remark\":\"临时工购买\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-07 11:20:40\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:20:40', 16);
INSERT INTO `sys_oper_log` VALUES (625, '农资信息', 2, 'com.ruoyi.controller.system.AgricultureMaterialInfoController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/material', '127.0.0.1', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2023-06-13 09:41:29\",\"delFlag\":\"0\",\"materialCode\":\"002\",\"materialId\":\"2\",\"materialName\":\"磷肥\",\"materialTypeId\":\"1\",\"materialTypeName\":\"肥料\",\"measureUnit\":\"袋\",\"orderNum\":0,\"params\":{},\"remark\":\"采购部6.7日采购\",\"status\":\"0\",\"updateBy\":\"0\",\"updateTime\":\"2026-06-07 11:20:53\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:20:53', 10);
INSERT INTO `sys_oper_log` VALUES (626, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/taskManager/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务管理\",\"menuType\":\"C\",\"orderNum\":110,\"params\":{},\"parentId\":2001,\"path\":\"task\",\"perms\":\"agriculture:batch:list,agriculture:batchTask:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:32:18', 24);
INSERT INTO `sys_oper_log` VALUES (627, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务处理按钮\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2176,\"perms\":\"agriculture:batchTask:query\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:33:07', 10);
INSERT INTO `sys_oper_log` VALUES (628, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务基本信息视频图片附件修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2177,\"perms\":\"agriculture:batchTask:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:33:38', 8);
INSERT INTO `sys_oper_log` VALUES (629, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"任务信息\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2177,\"perms\":\"agriculture:batchTask:query,agriculture:taskEmployee:list,agriculture:log:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:34:54', 11);
INSERT INTO `sys_oper_log` VALUES (630, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"人员\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2179,\"perms\":\"agriculture:taskEmployee:add,agriculture:taskEmployee:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:35:14', 8);
INSERT INTO `sys_oper_log` VALUES (631, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"人工工时\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2177,\"perms\":\"agriculture:costEmployee:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:35:48', 10);
INSERT INTO `sys_oper_log` VALUES (632, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2181,\"perms\":\"agriculture:costEmployee:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:36:04', 9);
INSERT INTO `sys_oper_log` VALUES (633, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2181,\"perms\":\"agriculture:costEmployee:query,agriculture:costEmployee:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:36:18', 14);
INSERT INTO `sys_oper_log` VALUES (634, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2181,\"perms\":\"agriculture:costEmployee:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:36:31', 14);
INSERT INTO `sys_oper_log` VALUES (635, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"机械工时\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2177,\"perms\":\"agriculture:costMachine:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:36:54', 10);
INSERT INTO `sys_oper_log` VALUES (636, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2185,\"perms\":\"agriculture:costMachine:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:37:09', 10);
INSERT INTO `sys_oper_log` VALUES (637, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2185,\"perms\":\"agriculture:costMachine:query,agriculture:costMachine:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:37:40', 7);
INSERT INTO `sys_oper_log` VALUES (638, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2185,\"perms\":\"agriculture:costMachine:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:37:54', 11);
INSERT INTO `sys_oper_log` VALUES (639, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"农资用量\",\"menuType\":\"F\",\"orderNum\":40,\"params\":{},\"parentId\":2177,\"perms\":\"agriculture:costMaterial:list\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:38:15', 7);
INSERT INTO `sys_oper_log` VALUES (640, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2189,\"perms\":\"agriculture:costMaterial:add\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:38:27', 6);
INSERT INTO `sys_oper_log` VALUES (641, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2189,\"perms\":\"agriculture:costMaterial:query,agriculture:costMaterial:edit\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:38:40', 9);
INSERT INTO `sys_oper_log` VALUES (642, '菜单管理', 1, 'com.ruoyi.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":30,\"params\":{},\"parentId\":2189,\"perms\":\"agriculture:costMaterial:remove\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:38:53', 7);
INSERT INTO `sys_oper_log` VALUES (643, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-07 11:33:38\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2178,\"menuName\":\"任务基本信息视频图片附件修改\",\"menuType\":\"F\",\"orderNum\":10,\"params\":{},\"parentId\":2177,\"path\":\"\",\"perms\":\"agriculture:batchTask:edit\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:39:29', 9);
INSERT INTO `sys_oper_log` VALUES (644, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-07 11:34:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2179,\"menuName\":\"任务信息\",\"menuType\":\"F\",\"orderNum\":20,\"params\":{},\"parentId\":2177,\"path\":\"\",\"perms\":\"agriculture:batchTask:query,agriculture:taskEmployee:list,agriculture:log:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:39:38', 8);
INSERT INTO `sys_oper_log` VALUES (645, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2026-06-07 11:34:54\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2179,\"menuName\":\"任务信息\",\"menuType\":\"F\",\"orderNum\":15,\"params\":{},\"parentId\":2177,\"path\":\"\",\"perms\":\"agriculture:batchTask:query,agriculture:taskEmployee:list,agriculture:log:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:39:48', 11);
INSERT INTO `sys_oper_log` VALUES (646, '菜单管理', 2, 'com.ruoyi.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"agriculture/taskManager/index.vue\",\"createTime\":\"2026-06-07 11:32:18\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2176,\"menuName\":\"任务管理\",\"menuType\":\"C\",\"orderNum\":110,\"params\":{},\"parentId\":2001,\"path\":\"task\",\"perms\":\"agriculture:batch:list,agriculture:batchTask:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 11:47:39', 11);
INSERT INTO `sys_oper_log` VALUES (647, '物模型模板', 1, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.add()', 'POST', 1, 'admin', '研发部门', '/iot/template', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-07 16:09:41\",\"datatype\":\"integer\",\"identifier\":\"tempreture\",\"isMonitor\":1,\"isReadonly\":1,\"isTop\":1,\"modelOrder\":0,\"params\":{},\"specs\":\"{\\\"type\\\":\\\"integer\\\",\\\"min\\\":0,\\\"max\\\":100,\\\"unit\\\":\\\"\\\",\\\"step\\\":1}\",\"templateId\":30,\"templateName\":\"温度\",\"tenantId\":0,\"tenantName\":\"系统自营\",\"type\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 16:09:41', 229);
INSERT INTO `sys_oper_log` VALUES (648, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":9,\"categoryName\":\"气象\",\"createBy\":\"admin\",\"createTime\":\"2026-06-07 17:20:43\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/07/637280006649802924675_20260607172041A001.jpg\",\"isAuthorize\":0,\"mqttAccount\":\"P_baf9a4b3\",\"mqttPassword\":\"64f8d22f9d914c86\",\"mqttSecret\":\"5bd9eadab78649c5a873fe115b7d7f83\",\"networkMethod\":1,\"params\":{},\"productId\":106,\"productName\":\"气温检测\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"vertificateMethod\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 17:20:43', 247);
INSERT INTO `sys_oper_log` VALUES (649, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":10,\"categoryName\":\"土壤\",\"createBy\":\"admin\",\"createTime\":\"2026-06-07 18:17:45\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/07/160558_479440_product_c30079_20260607181731A001.jpg\",\"isAuthorize\":0,\"mqttAccount\":\"P_40d912ed\",\"mqttPassword\":\"8be7707359c04a11\",\"mqttSecret\":\"9ebe7aa97c3c418ab8c2f8ac78c802b4\",\"networkMethod\":1,\"params\":{},\"productId\":107,\"productName\":\"土壤检测\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"vertificateMethod\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 18:17:45', 196);
INSERT INTO `sys_oper_log` VALUES (650, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":11,\"categoryName\":\"水质\",\"createBy\":\"admin\",\"createTime\":\"2026-06-07 18:19:16\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/07/20241114091108_1633_20260607181915A002.jpg\",\"isAuthorize\":0,\"mqttAccount\":\"P_cb3b75a3\",\"mqttPassword\":\"a726b61d30f54304\",\"mqttSecret\":\"79149bb0cf714dd3878f4e43837dbd6c\",\"networkMethod\":1,\"params\":{},\"productId\":108,\"productName\":\"水质检测\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"vertificateMethod\":3} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 18:19:16', 15);
INSERT INTO `sys_oper_log` VALUES (651, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"categoryName\":\"启闭机\",\"createBy\":\"admin\",\"createTime\":\"2026-06-07 18:20:48\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/07/316252172102699_20260607182045A003.jpg\",\"isAuthorize\":0,\"mqttAccount\":\"P_e216a2a5\",\"mqttPassword\":\"646257bac47e483f\",\"mqttSecret\":\"c374704dbd1d4f40815840941b844885\",\"networkMethod\":1,\"params\":{},\"productId\":109,\"productName\":\"设施农业\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"vertificateMethod\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 18:20:48', 14);
INSERT INTO `sys_oper_log` VALUES (652, '产品', 1, 'com.ruoyi.iot.controller.IotProductController.add()', 'POST', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":12,\"categoryName\":\"设施农业\",\"createBy\":\"admin\",\"createTime\":\"2026-06-07 18:21:59\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/07/05165723viwu_20260607182157A004.jpg\",\"isAuthorize\":0,\"mqttAccount\":\"P_466cd650\",\"mqttPassword\":\"99e860ffe158477b\",\"mqttSecret\":\"af1c304b7a8440139643819664c8df3e\",\"networkMethod\":1,\"params\":{},\"productId\":110,\"productName\":\"设施农业\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"vertificateMethod\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 18:21:59', 11);
INSERT INTO `sys_oper_log` VALUES (653, '产品', 2, 'com.ruoyi.iot.controller.IotProductController.edit()', 'PUT', 1, 'admin', '研发部门', '/iot/product', '127.0.0.1', '内网IP', '{\"categoryId\":13,\"categoryName\":\"启闭机\",\"createBy\":\"admin\",\"createTime\":\"2026-06-07 18:20:48\",\"delFlag\":\"0\",\"deviceType\":1,\"imgUrl\":\"/profile/upload/2026/06/07/316252172102699_20260607182045A003.jpg\",\"isAuthorize\":0,\"isSys\":0,\"mqttAccount\":\"P_e216a2a5\",\"mqttPassword\":\"646257bac47e483f\",\"mqttSecret\":\"c374704dbd1d4f40815840941b844885\",\"networkMethod\":1,\"params\":{},\"productId\":109,\"productName\":\"启闭机\",\"status\":1,\"tenantId\":0,\"tenantName\":\"系统自营\",\"updateBy\":\"admin\",\"updateTime\":\"2026-06-07 18:23:39\",\"vertificateMethod\":1} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 18:23:39', 17);
INSERT INTO `sys_oper_log` VALUES (654, '物模型模板', 3, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/template/31', '127.0.0.1', '内网IP', '[31] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 19:44:23', 25);
INSERT INTO `sys_oper_log` VALUES (655, '物模型', 1, 'com.ruoyi.iot.controller.IotModelController.importModels()', 'POST', 1, 'admin', '研发部门', '/iot/model/import', '127.0.0.1', '内网IP', '{\"productId\":106,\"productName\":\"气温检测\",\"templateIds\":[36]} ', '{\"msg\":\"成功导入 1 条物模型\",\"code\":200}', 0, NULL, '2026-06-07 19:51:35', 35);
INSERT INTO `sys_oper_log` VALUES (656, '物模型', 1, 'com.ruoyi.iot.controller.IotModelController.importModels()', 'POST', 1, 'admin', '研发部门', '/iot/model/import', '127.0.0.1', '内网IP', '{\"productId\":106,\"productName\":\"气温检测\",\"templateIds\":[34]} ', '{\"msg\":\"成功导入 1 条物模型\",\"code\":200}', 0, NULL, '2026-06-07 19:51:44', 19);
INSERT INTO `sys_oper_log` VALUES (657, '物模型模板', 3, 'com.ruoyi.iot.controller.IotThingsModelTemplateController.remove()', 'DELETE', 1, 'admin', '研发部门', '/iot/template/30', '127.0.0.1', '内网IP', '[30] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 19:53:57', 13);
INSERT INTO `sys_oper_log` VALUES (658, '地块', 1, 'com.ruoyi.controller.system.AgricultureLandController.add()', 'POST', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createTime\":\"2026-06-07 20:02:14\",\"fillColor\":\"#094015\",\"fillOpacity\":0.5,\"landArea\":2.5,\"landId\":\"11\",\"landName\":\"大棚2号\",\"landPath\":\"106.525195,29.344215|106.525285,29.344124|106.525146,29.343922|106.524965,29.344048|106.525062,29.344168\",\"landType\":\"2\",\"params\":{},\"status\":\"0\",\"strokeColor\":\"#1AC233\",\"strokeOpacity\":0.8,\"strokeWeight\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 20:02:14', 25);
INSERT INTO `sys_oper_log` VALUES (659, '地块', 2, 'com.ruoyi.controller.system.AgricultureLandController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/land', '127.0.0.1', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2026-06-07 20:02:15\",\"currentBatch\":0,\"delFlag\":\"0\",\"fillColor\":\"#F5D72C\",\"fillOpacity\":0.5,\"landArea\":2.5,\"landId\":\"11\",\"landName\":\"大棚2号\",\"landPath\":\"106.525195,29.344215|106.525285,29.344124|106.525146,29.343922|106.524965,29.344048|106.525062,29.344168\",\"landType\":\"2\",\"orderNum\":0,\"params\":{},\"remark\":\"\",\"status\":\"0\",\"strokeColor\":\"#C2A91A\",\"strokeOpacity\":0.8,\"strokeWeight\":2,\"updateBy\":\"0\",\"updateTime\":\"2026-06-07 20:02:32\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-07 20:02:32', 15);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-05-31 23:30:52', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-05-31 23:30:52', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-05-31 23:30:52', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-03 16:13:50', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_as_cs NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '王梦', '00', '3284355305@qq.com', '15888888888', '0', '/profile/avatar/2026/06/02/438e8b25ed3e44079d53824ad79df24f.png', '$2a$10$ecuZxKnyXBdJ2CJNFPNimugN5gRm.82CJOBP8HyORn71dJlXMksKu', '0', '0', '127.0.0.1', '2026-06-07 18:06:22', '2026-06-01 10:43:44', 'admin', '2026-05-31 23:30:52', '', '2026-06-02 09:46:21', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '王梦2', '00', 'ry@qq.com', '15666666666', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2026-05-31 23:30:52', '2026-05-31 23:30:52', 'admin', '2026-05-31 23:30:52', 'admin', '2026-06-01 11:57:42', '测试员');
INSERT INTO `sys_user` VALUES (100, 104, '陈宇', '知足常乐', '00', '', '', '0', '', '$2a$10$h0QPgNq6YFo.0EulrmFpcOnrGe4CVhOecyGZh.jNgv.WdiUoNl4oO', '0', '2', '', NULL, NULL, 'admin', '2026-06-03 16:11:46', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (101, 106, '陈宇', 'test01', '00', '', '', '0', '', '$2a$10$n3xqkcDuIo3reFTy99bRDuNN6u1sfwQjw0L.aicM.Mq2tPrjBfTNm', '0', '2', '', NULL, NULL, 'admin', '2026-06-03 16:12:54', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 105, 'test01', '陈宇', '00', '', '', '0', '', '$2a$10$42jXZV8P5SxXoqN1T86c3OVeTSK3/HYBfE33AkmjQE6Du6dmKyQEm', '0', '0', '127.0.0.1', '2026-06-03 16:14:02', NULL, 'admin', '2026-06-03 16:13:33', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (102, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_as_cs COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (102, 2);

SET FOREIGN_KEY_CHECKS = 1;

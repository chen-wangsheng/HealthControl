/*
 Navicat Premium Data Transfer

 Source Server         : xt
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : healthcontrol

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/09/2025 11:01:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for appuser
-- ----------------------------
DROP TABLE IF EXISTS `appuser`;
CREATE TABLE `appuser`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `UserName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '账号',
  `Email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `Birth` datetime(0) NULL DEFAULT NULL COMMENT '出生年月',
  `PhoneNumber` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `RoleType` int(11) NULL DEFAULT NULL COMMENT '角色',
  `ImageUrls` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `Password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `Gender` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '性别',
  `OpenId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'OpenId',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appuser
-- ----------------------------
INSERT INTO `appuser` VALUES (1, '2025-09-16 21:11:19', 'admin', NULL, '管理员', NULL, NULL, 1, NULL, 'MD521232f297a57a5a743894a0e4a801fc3', NULL, NULL);
INSERT INTO `appuser` VALUES (2, '2026-4-19 11:00:30', 'vance123', '1648312586@qq.com', '张三', '2000-2-1 00:00:00', '18900000000', 2, 'http://localhost:7245/285820412/20180729102659_uvbvc.jpg', 'MD50192023a7bbd73250516f069df18b500', NULL, NULL);

-- ----------------------------
-- Table structure for collectrecord
-- ----------------------------
DROP TABLE IF EXISTS `collectrecord`;
CREATE TABLE `collectrecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收藏记录主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `CollectUserId` int(11) NULL DEFAULT NULL COMMENT '收藏人',
  `CollectType` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '收藏类型',
  `RelativeId` int(11) NULL DEFAULT NULL COMMENT '关联资源Id',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `CollectUserId`(`CollectUserId`) USING BTREE,
  CONSTRAINT `collectrecord_ibfk_1` FOREIGN KEY (`CollectUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '收藏记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of collectrecord
-- ----------------------------
INSERT INTO `collectrecord` VALUES (7, '2025-09-20 09:50:03', 2, '健康知识', 15);
INSERT INTO `collectrecord` VALUES (8, '2025-09-20 09:54:48', 2, '健康知识', 6);
INSERT INTO `collectrecord` VALUES (9, '2025-09-20 09:54:52', 2, '健康知识', 5);
INSERT INTO `collectrecord` VALUES (10, '2025-09-20 09:57:01', 2, '食谱', 10);
INSERT INTO `collectrecord` VALUES (12, '2025-09-20 10:00:07', 2, '食谱', 8);

-- ----------------------------
-- Table structure for dietrecord
-- ----------------------------
DROP TABLE IF EXISTS `dietrecord`;
CREATE TABLE `dietrecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '饮食记录主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `FoodId` int(11) NULL DEFAULT NULL COMMENT '记录食物',
  `RecordUserId` int(11) NULL DEFAULT NULL COMMENT '记录人',
  `FoodUnitId` int(11) NULL DEFAULT NULL COMMENT '食物单位',
  `RecordTime` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `RecordValue` int(11) NULL DEFAULT NULL COMMENT '记录值',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `RecordUserId`(`RecordUserId`) USING BTREE,
  INDEX `FoodId`(`FoodId`) USING BTREE,
  INDEX `FoodUnitId`(`FoodUnitId`) USING BTREE,
  CONSTRAINT `dietrecord_ibfk_1` FOREIGN KEY (`RecordUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `dietrecord_ibfk_2` FOREIGN KEY (`FoodId`) REFERENCES `food` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `dietrecord_ibfk_3` FOREIGN KEY (`FoodUnitId`) REFERENCES `foodunit` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '饮食记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dietrecord
-- ----------------------------
INSERT INTO `dietrecord` VALUES (1, '2025-09-18 15:18:24', 20, 2, 37, '2025-09-18 15:18:22', 1);
INSERT INTO `dietrecord` VALUES (2, '2025-09-18 15:18:29', 18, 2, 33, '2025-09-25 15:18:26', 1);
INSERT INTO `dietrecord` VALUES (3, '2025-09-18 15:32:22', 16, 2, 30, '2025-09-18 07:32:15', 1);
INSERT INTO `dietrecord` VALUES (4, '2025-09-22 09:57:12', 20, 2, 37, '2025-09-22 09:57:09', 1);

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食物主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '食物名称',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `FoodTypeId` int(11) NULL DEFAULT NULL COMMENT '食物类型',
  `Calories` double(20, 8) NULL DEFAULT NULL COMMENT '热量',
  `Protein` double(20, 8) NULL DEFAULT NULL COMMENT '蛋白质',
  `Carbohydrates` double(20, 8) NULL DEFAULT NULL COMMENT '糖水化合物',
  `Fat` double(20, 8) NULL DEFAULT NULL COMMENT '脂肪',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FoodTypeId`(`FoodTypeId`) USING BTREE,
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`FoodTypeId`) REFERENCES `foodtype` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '食物表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '2025-09-18 15:10:00', '白米饭', 'http://localhost:7245/316588588/0.jpg', 1, 1.16000000, 0.02600000, 0.25900000, 0.01000000);
INSERT INTO `food` VALUES (2, '2025-09-18 15:11:00', '全麦面包', 'http://localhost:7245/596178693/0.jpg', 1, 2.46000000, 0.13200000, 0.41000000, 0.04200000);
INSERT INTO `food` VALUES (3, '2025-09-18 15:12:00', '燕麦片', 'http://localhost:7245/974590728/5.jpg', 1, 3.67000000, 0.13150000, 0.58700000, 0.06900000);
INSERT INTO `food` VALUES (4, '2025-09-18 15:13:00', '西兰花', 'http://localhost:7245/778943160/0.jpg', 2, 0.34000000, 0.02800000, 0.07000000, 0.01000000);
INSERT INTO `food` VALUES (5, '2025-09-18 15:14:00', '胡萝卜', 'http://localhost:7245/495669287/13.jpg', 2, 0.41000000, 0.01000000, 0.09600000, 0.01000000);
INSERT INTO `food` VALUES (6, '2025-09-18 15:15:00', '菠菜', 'http://localhost:7245/802731524/1.jpg', 2, 0.23000000, 0.02900000, 0.03600000, 0.01000000);
INSERT INTO `food` VALUES (7, '2025-09-18 15:16:00', '苹果', 'http://localhost:7245/644901846/3.jpg', 3, 0.52000000, 0.01000000, 0.13800000, 0.01000000);
INSERT INTO `food` VALUES (8, '2025-09-18 15:17:00', '香蕉', 'http://localhost:7245/976129038/0.jpg', 3, 0.89000000, 0.01100000, 0.22800000, 0.01000000);
INSERT INTO `food` VALUES (9, '2025-09-18 15:18:00', '橙子', 'http://localhost:7245/117765125/0.jpg', 3, 0.47000000, 0.01000000, 0.11800000, 0.01000000);
INSERT INTO `food` VALUES (10, '2025-09-18 15:19:00', '鸡胸肉', 'http://localhost:7245/238904420/2.jpg', 4, 1.65000000, 0.31000000, 0.01000000, 0.03600000);
INSERT INTO `food` VALUES (11, '2025-09-18 15:20:00', '猪瘦肉', 'http://localhost:7245/994288723/15.jpg', 4, 1.43000000, 0.20300000, 0.01000000, 0.06200000);
INSERT INTO `food` VALUES (12, '2025-09-18 15:21:00', '三文鱼', 'http://localhost:7245/269133748/3.jpg', 4, 2.08000000, 0.25400000, 0.01000000, 0.12400000);
INSERT INTO `food` VALUES (13, '2025-09-18 15:22:00', '鸡蛋', 'http://localhost:7245/870746080/0.jpg', 5, 1.55000000, 0.13300000, 0.01100000, 0.10600000);
INSERT INTO `food` VALUES (14, '2025-09-18 15:23:00', '牛奶', 'http://localhost:7245/320124258/1.jpg', 5, 0.54000000, 0.03400000, 0.05000000, 0.03200000);
INSERT INTO `food` VALUES (15, '2025-09-18 15:24:00', '酸奶', 'http://localhost:7245/751779703/1.jpg', 5, 0.59000000, 0.03500000, 0.04700000, 0.03300000);
INSERT INTO `food` VALUES (16, '2025-09-18 15:25:00', '黄豆', 'http://localhost:7245/208774812/3.jpg', 6, 4.21000000, 0.35000000, 0.25000000, 0.16000000);
INSERT INTO `food` VALUES (17, '2025-09-18 15:26:00', '豆腐', 'http://localhost:7245/18157527/8.jpg', 6, 0.76000000, 0.08100000, 0.04300000, 0.04800000);
INSERT INTO `food` VALUES (18, '2025-09-18 15:27:00', '杏仁', 'http://localhost:7245/719171913/1.jpg', 7, 5.79000000, 0.21150000, 0.21550000, 0.49930000);
INSERT INTO `food` VALUES (19, '2025-09-18 15:28:00', '核桃', 'http://localhost:7245/186575359/0.jpg', 7, 6.54000000, 0.15230000, 0.13710000, 0.65210000);
INSERT INTO `food` VALUES (20, '2025-09-18 15:29:00', '绿茶', 'http://localhost:7245/463236290/0.jpg', 8, 0.01000000, 0.01000000, 0.01000000, 0.01000000);

-- ----------------------------
-- Table structure for foodtype
-- ----------------------------
DROP TABLE IF EXISTS `foodtype`;
CREATE TABLE `foodtype`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食物类型主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `Sort` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '食物类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foodtype
-- ----------------------------
INSERT INTO `foodtype` VALUES (1, '2025-09-18 15:00:00', '谷物类', 1);
INSERT INTO `foodtype` VALUES (2, '2025-09-18 15:01:00', '蔬菜类', 2);
INSERT INTO `foodtype` VALUES (3, '2025-09-18 15:02:00', '水果类', 3);
INSERT INTO `foodtype` VALUES (4, '2025-09-18 15:03:00', '肉类', 4);
INSERT INTO `foodtype` VALUES (5, '2025-09-18 15:04:00', '蛋奶类', 5);
INSERT INTO `foodtype` VALUES (6, '2025-09-18 15:05:00', '豆类', 6);
INSERT INTO `foodtype` VALUES (7, '2025-09-18 15:06:00', '坚果类', 7);
INSERT INTO `foodtype` VALUES (8, '2025-09-18 15:07:00', '饮品类', 8);

-- ----------------------------
-- Table structure for foodunit
-- ----------------------------
DROP TABLE IF EXISTS `foodunit`;
CREATE TABLE `foodunit`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食物单位主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `FoodId` int(11) NULL DEFAULT NULL COMMENT '食物',
  `UnitName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位名称',
  `UnitValue` int(11) NULL DEFAULT NULL COMMENT '单位值',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `FoodId`(`FoodId`) USING BTREE,
  CONSTRAINT `foodunit_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '食物单位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of foodunit
-- ----------------------------
INSERT INTO `foodunit` VALUES (1, '2025-09-18 15:30:00', 1, '碗', 150);
INSERT INTO `foodunit` VALUES (2, '2025-09-18 15:31:00', 1, '勺', 20);
INSERT INTO `foodunit` VALUES (3, '2025-09-18 15:32:00', 2, '片', 25);
INSERT INTO `foodunit` VALUES (4, '2025-09-18 15:33:00', 2, '个', 100);
INSERT INTO `foodunit` VALUES (5, '2025-09-18 15:34:00', 3, '小包', 40);
INSERT INTO `foodunit` VALUES (6, '2025-09-18 15:35:00', 3, '碗', 80);
INSERT INTO `foodunit` VALUES (7, '2025-09-18 15:36:00', 4, '朵', 10);
INSERT INTO `foodunit` VALUES (8, '2025-09-18 15:37:00', 4, '份', 200);
INSERT INTO `foodunit` VALUES (9, '2025-09-18 15:38:00', 5, '根', 100);
INSERT INTO `foodunit` VALUES (10, '2025-09-18 15:39:00', 5, '片', 20);
INSERT INTO `foodunit` VALUES (11, '2025-09-18 15:40:00', 6, '把', 100);
INSERT INTO `foodunit` VALUES (12, '2025-09-18 15:41:00', 6, '份', 150);
INSERT INTO `foodunit` VALUES (13, '2025-09-18 15:42:00', 7, '个', 150);
INSERT INTO `foodunit` VALUES (14, '2025-09-18 15:43:00', 7, '片', 30);
INSERT INTO `foodunit` VALUES (15, '2025-09-18 15:44:00', 8, '根', 120);
INSERT INTO `foodunit` VALUES (16, '2025-09-18 15:45:00', 8, '片', 20);
INSERT INTO `foodunit` VALUES (17, '2025-09-18 15:46:00', 9, '个', 180);
INSERT INTO `foodunit` VALUES (18, '2025-09-18 15:47:00', 9, '瓣', 20);
INSERT INTO `foodunit` VALUES (19, '2025-09-18 15:48:00', 10, '块', 100);
INSERT INTO `foodunit` VALUES (20, '2025-09-18 15:49:00', 10, '片', 50);
INSERT INTO `foodunit` VALUES (21, '2025-09-18 15:50:00', 11, '块', 100);
INSERT INTO `foodunit` VALUES (22, '2025-09-18 15:51:00', 11, '片', 30);
INSERT INTO `foodunit` VALUES (23, '2025-09-18 15:52:00', 12, '块', 100);
INSERT INTO `foodunit` VALUES (24, '2025-09-18 15:53:00', 12, '片', 40);
INSERT INTO `foodunit` VALUES (25, '2025-09-18 15:54:00', 13, '个', 60);
INSERT INTO `foodunit` VALUES (26, '2025-09-18 15:55:00', 14, '杯', 250);
INSERT INTO `foodunit` VALUES (27, '2025-09-18 15:56:00', 14, '毫升', 1);
INSERT INTO `foodunit` VALUES (28, '2025-09-18 15:57:00', 15, '杯', 200);
INSERT INTO `foodunit` VALUES (29, '2025-09-18 15:58:00', 15, '毫升', 1);
INSERT INTO `foodunit` VALUES (30, '2025-09-18 15:59:00', 16, '把', 50);
INSERT INTO `foodunit` VALUES (31, '2025-09-18 16:00:00', 17, '块', 100);
INSERT INTO `foodunit` VALUES (32, '2025-09-18 16:01:00', 17, '片', 20);
INSERT INTO `foodunit` VALUES (33, '2025-09-18 16:02:00', 18, '颗', 5);
INSERT INTO `foodunit` VALUES (34, '2025-09-18 16:03:00', 18, '把', 30);
INSERT INTO `foodunit` VALUES (35, '2025-09-18 16:04:00', 19, '个', 10);
INSERT INTO `foodunit` VALUES (36, '2025-09-18 16:05:00', 19, '半', 5);
INSERT INTO `foodunit` VALUES (37, '2025-09-18 16:06:00', 20, '杯', 250);
INSERT INTO `foodunit` VALUES (38, '2025-09-18 16:07:00', 20, '毫升', 1);

-- ----------------------------
-- Table structure for healtharticle
-- ----------------------------
DROP TABLE IF EXISTS `healtharticle`;
CREATE TABLE `healtharticle`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康知识主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `HealthArticleTypeId` int(11) NULL DEFAULT NULL COMMENT '分类',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `PublishUserId` int(11) NULL DEFAULT NULL COMMENT '发布人',
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `ViewCount` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审核状态枚举(1:待审核,2:审核通过,3:审核失败)',
  `AuditTime` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `AuditUserId` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `AuditReply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核回复',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `PublishUserId`(`PublishUserId`) USING BTREE,
  INDEX `AuditUserId`(`AuditUserId`) USING BTREE,
  INDEX `HealthArticleTypeId`(`HealthArticleTypeId`) USING BTREE,
  CONSTRAINT `healtharticle_ibfk_1` FOREIGN KEY (`PublishUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `healtharticle_ibfk_2` FOREIGN KEY (`AuditUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `healtharticle_ibfk_3` FOREIGN KEY (`HealthArticleTypeId`) REFERENCES `healtharticletype` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '健康知识表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healtharticle
-- ----------------------------
INSERT INTO `healtharticle` VALUES (1, '2025-09-18 17:00:00', '科学饮食搭配：均衡营养的重要性', 1, 'http://localhost:7245/614402003/0.jpg', 2, '<p>均衡营养是维持身体健康的基础。合理的饮食搭配应该包含碳水化合物、蛋白质、脂肪、维生素和矿物质等多种营养成分。</p><p>建议每日摄入：<br/>- 谷物类：250-400g<br/>- 蔬菜类：300-500g<br/>- 水果类：200-350g<br/>- 肉蛋类：120-200g<br/>- 奶类：300ml</p>', 156, 2, '2025-09-18 17:30:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (2, '2025-09-18 17:05:00', '有氧运动的健康益处及注意事项', 2, 'http://localhost:7245/118043795/5.jpg', 2, '<p>有氧运动是指人体在氧气充分供应的情况下进行的体育锻炼，如跑步、游泳、骑车等。</p><p>主要益处包括：<br/>1. 增强心肺功能<br/>2. 提高新陈代谢<br/>3. 控制体重<br/>4. 改善睡眠质量<br/>5. 增强免疫力</p><p>运动时间建议每周150分钟中等强度运动。</p>', 248, 2, '2025-09-18 17:35:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (3, '2025-09-18 17:10:00', '糖尿病的预防与日常管理', 3, 'http://localhost:7245/651736469/3.jpg', 2, '<p>糖尿病是一种慢性代谢性疾病，预防和管理至关重要。</p><p>预防措施：<br/>- 保持健康体重<br/>- 规律运动<br/>- 合理饮食<br/>- 定期体检</p><p>日常管理要点：<br/>- 监测血糖<br/>- 按时服药<br/>- 控制饮食<br/>- 适量运动<br/>- 定期复查</p>', 189, 2, '2025-09-18 17:40:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (4, '2025-09-18 17:15:00', '职场压力管理与心理调适', 4, 'http://localhost:7245/876124425/1.jpg', 2, '<p>现代职场压力日益增大，学会有效的压力管理和心理调适非常重要。</p><p>压力管理技巧：<br/>1. 时间管理<br/>2. 设定合理目标<br/>3. 学会说\"不\"<br/>4. 寻求支持<br/>5. 放松技巧</p><p>心理调适方法：<br/>- 深呼吸练习<br/>- 冥想<br/>- 运动放松<br/>- 音乐疗法<br/>- 与朋友交流</p>', 300, 2, '2025-09-18 17:45:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (5, '2025-09-18 17:20:00', '优质睡眠的重要性及改善方法', 5, 'http://localhost:7245/127660989/0.jpg', 2, '<p>睡眠是人体恢复和修复的重要过程，优质睡眠对身心健康至关重要。</p><p>睡眠不足的危害：<br/>- 免疫力下降<br/>- 记忆力减退<br/>- 情绪不稳定<br/>- 新陈代谢紊乱</p><p>改善睡眠的方法：<br/>- 规律作息<br/>- 睡前放松<br/>- 适宜环境<br/>- 避免刺激性食物<br/>- 限制电子设备使用</p>', 333, 2, '2025-09-18 17:50:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (6, '2025-09-18 17:25:00', '中医养生之四季调理', 6, 'http://localhost:7245/476465979/14.jpg', 2, '<p>中医强调\"天人合一\"，根据四季变化调理身体是传统养生智慧。</p><p>春季养生：<br/>- 养肝护肝<br/>- 适当运动<br/>- 调节情志</p><p>夏季养生：<br/>- 养心安神<br/>- 清热解暑<br/>- 适量出汗</p><p>秋季养生：<br/>- 润肺防燥<br/>- 早睡早起<br/>- 收敛神气</p><p>冬季养生：<br/>- 养肾藏精<br/>- 温补阳气<br/>- 避寒就温</p>', 428, 2, '2025-09-18 17:55:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (7, '2025-09-18 17:30:00', '女性月经期的健康护理', 7, 'http://localhost:7245/685116819/3.jpg', 2, '<p>月经期是女性生理周期的重要组成部分，正确的护理有助于维护女性健康。</p><p>月经期护理要点：<br/>- 保持外阴清洁<br/>- 选择合适的卫生用品<br/>- 注意保暖<br/>- 适度休息<br/>- 避免剧烈运动</p><p>饮食建议：<br/>- 多吃温热食物<br/>- 补充铁质<br/>- 避免生冷食物<br/>- 适量补充维生素</p>', 278, 2, '2025-09-18 18:00:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (8, '2025-09-18 17:35:00', '儿童营养与健康成长', 8, 'http://localhost:7245/771843222/2.jpg', 2, '<p>儿童期是生长发育的关键时期，合理的营养搭配对健康成长至关重要。</p><p>儿童营养需求：<br/>- 蛋白质：促进生长发育<br/>- 钙质：骨骼和牙齿发育<br/>- 维生素D：促进钙吸收<br/>- 铁质：预防贫血<br/>- 维生素A：视力发育</p><p>健康饮食习惯：<br/>- 定时定量<br/>- 多样化饮食<br/>- 少吃零食<br/>- 多喝水<br/>- 适量运动</p>', 357, 2, '2025-09-18 18:05:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (9, '2025-09-18 17:40:00', '高血压的预防与控制', 3, 'http://localhost:7245/260704923/3.jpg', 2, '<p>高血压是常见的心血管疾病，被称为\"无声的杀手\"，预防和控制非常重要。</p><p>预防措施：<br/>- 低盐饮食<br/>- 控制体重<br/>- 规律运动<br/>- 戒烟限酒<br/>- 减轻压力</p><p>日常控制：<br/>- 定期监测血压<br/>- 按时服药<br/>- 健康饮食<br/>- 适量运动<br/>- 保持良好心态</p>', 191, 2, '2025-09-18 18:10:00', 1, NULL);
INSERT INTO `healtharticle` VALUES (10, '2025-09-18 17:45:00', '维生素D的重要性与补充方法', 1, 'http://localhost:7245/275454329/0.jpg', 2, '<p>维生素D被称为\"阳光维生素\"，对骨骼健康、免疫功能等都有重要作用。</p><p>维生素D的作用：<br/>- 促进钙磷吸收<br/>- 维护骨骼健康<br/>- 调节免疫功能<br/>- 预防某些疾病</p><p>补充方法：<br/>- 适当日晒<br/>- 食物补充（鱼类、蛋黄等）<br/>- 维生素D补充剂<br/>- 强化食品</p>', 299, 2, '2025-09-18 22:09:35', 1, '欧克');
INSERT INTO `healtharticle` VALUES (11, '2025-09-18 17:50:00', '瑜伽练习的身心益处', 2, 'http://localhost:7245/449162634/4.jpg', 2, '<p>瑜伽是一种古老的身心练习方式，结合体位、呼吸和冥想，带来全面的健康益处。</p><p>身体益处：<br/>- 增强柔韧性<br/>- 改善平衡感<br/>- 强化核心肌群<br/>- 缓解肌肉紧张<br/>- 改善姿态</p><p>心理益处：<br/>- 减轻压力<br/>- 改善情绪<br/>- 提高专注力<br/>- 促进放松<br/>- 增强自我意识</p>', 198, 2, '2025-09-18 22:37:54', 1, '欧克');
INSERT INTO `healtharticle` VALUES (12, '2025-09-18 17:55:00', '焦虑情绪的识别与应对', 4, 'http://localhost:7245/598976325/2.jpg', 2, '<p>焦虑是现代人常见的心理问题，学会识别和应对焦虑情绪对心理健康很重要。</p><p>焦虑症状：<br/>- 过度担心<br/>- 紧张不安<br/>- 心跳加速<br/>- 呼吸困难<br/>- 睡眠问题</p><p>应对方法：<br/>- 深呼吸练习<br/>- 渐进性肌肉放松<br/>- 认知重构<br/>- 规律运动<br/>- 寻求专业帮助</p>', 145, 3, '2025-09-18 22:37:56', 1, '欧克');
INSERT INTO `healtharticle` VALUES (13, '2025-09-18 18:00:00', '戒烟的健康益处与方法', 5, 'http://localhost:7245/358291071/1.jpg', 2, '<p>吸烟对健康危害极大，戒烟是改善健康最有效的方法之一。</p><p>戒烟益处：<br/>- 降低癌症风险<br/>- 改善心肺功能<br/>- 提高免疫力<br/>- 改善口气和牙齿<br/>- 节约金钱</p><p>戒烟方法：<br/>- 制定戒烟计划<br/>- 寻找替代活动<br/>- 避免诱因<br/>- 寻求支持<br/>- 考虑药物辅助</p>', 224, 2, '2025-09-18 22:37:59', 1, '欧克');
INSERT INTO `healtharticle` VALUES (14, '2025-09-18 18:05:00', '艾灸养生的原理与应用', 6, 'http://localhost:7245/810187343/0.jpg', 2, '<p>艾灸是中医传统疗法，通过燃烧艾草刺激穴位，达到调理身体的目的。</p><p>艾灸原理：<br/>- 温通经络<br/>- 调和气血<br/>- 扶正祛邪<br/>- 回阳救逆</p><p>常用穴位：<br/>- 足三里：强身健体<br/>- 关元：补肾壮阳<br/>- 神阙：调理脾胃<br/>- 大椎：预防感冒</p><p>注意事项：<br/>- 选择合适时间<br/>- 注意防火安全<br/>- 孕妇慎用</p>', 182, 2, '2025-09-18 22:38:01', 1, '欧克');
INSERT INTO `healtharticle` VALUES (15, '2025-09-18 18:10:00', '更年期女性的健康管理', 7, 'http://localhost:7245/359877083/18.jpg', 2, '<p>更年期是女性生命中的重要阶段，科学的健康管理有助于平稳度过这一时期。</p><p>更年期症状：<br/>- 月经不规律<br/>- 潮热出汗<br/>- 情绪波动<br/>- 睡眠问题<br/>- 骨质疏松</p><p>健康管理：<br/>- 均衡饮食<br/>- 规律运动<br/>- 心理调适<br/>- 定期体检<br/>- 必要时激素替代治疗</p>', 358, 2, '2025-09-18 22:38:03', 1, '欧克');

-- ----------------------------
-- Table structure for healtharticletype
-- ----------------------------
DROP TABLE IF EXISTS `healtharticletype`;
CREATE TABLE `healtharticletype`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康知识分类主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `Sort` int(11) NULL DEFAULT NULL COMMENT '显示顺序',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '健康知识分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healtharticletype
-- ----------------------------
INSERT INTO `healtharticletype` VALUES (1, '2025-09-18 16:00:00', '营养饮食', 1);
INSERT INTO `healtharticletype` VALUES (2, '2025-09-18 16:01:00', '运动健身', 2);
INSERT INTO `healtharticletype` VALUES (3, '2025-09-18 16:02:00', '疾病预防', 3);
INSERT INTO `healtharticletype` VALUES (4, '2025-09-18 16:03:00', '心理健康', 4);
INSERT INTO `healtharticletype` VALUES (5, '2025-09-18 16:04:00', '生活习惯', 5);
INSERT INTO `healtharticletype` VALUES (6, '2025-09-18 16:05:00', '中医养生', 6);
INSERT INTO `healtharticletype` VALUES (7, '2025-09-18 16:06:00', '女性健康', 7);
INSERT INTO `healtharticletype` VALUES (8, '2025-09-18 16:07:00', '儿童健康', 8);

-- ----------------------------
-- Table structure for healthindicator
-- ----------------------------
DROP TABLE IF EXISTS `healthindicator`;
CREATE TABLE `healthindicator`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康指标主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '指标名称',
  `BelongUserId` int(11) NULL DEFAULT NULL COMMENT '所属人',
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '描述内容',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `IsComm` tinyint(1) NULL DEFAULT NULL COMMENT '是否公用',
  `Threshold` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '阈值',
  `HealthIndicatorTypeId` int(11) NULL DEFAULT NULL COMMENT '指标归类',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `HealthIndicatorTypeId`(`HealthIndicatorTypeId`) USING BTREE,
  INDEX `BelongUserId`(`BelongUserId`) USING BTREE,
  CONSTRAINT `healthindicator_ibfk_1` FOREIGN KEY (`HealthIndicatorTypeId`) REFERENCES `healthindicatortype` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `healthindicator_ibfk_2` FOREIGN KEY (`BelongUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '健康指标表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healthindicator
-- ----------------------------
INSERT INTO `healthindicator` VALUES (1, '2025-09-17 14:15:10', '空腹血糖', 1, '测量空腹状态下的血糖浓度，正常范围为3.9-6.1mmol/L', 'http://localhost:7245/214741414/居民画像_空腹血糖.png', 1, '3.9-6.1', 1);
INSERT INTO `healthindicator` VALUES (2, '2025-09-17 14:15:11', '餐后2小时血糖', 1, '餐后2小时血糖浓度，正常应小于7.8mmol/L', 'http://localhost:7245/193366260/血压.png', 1, '<7.8', 1);
INSERT INTO `healthindicator` VALUES (3, '2025-09-17 14:15:12', '糖化血红蛋白', 1, '反映近2-3个月平均血糖水平，正常范围4.0-6.0%', 'http://localhost:7245/403691426/糖化血红蛋白.png', 1, '4.0-6.0', 1);
INSERT INTO `healthindicator` VALUES (10, '2025-09-17 14:15:20', '身高', 1, '身体的高度，单位厘米', 'http://localhost:7245/829205285/身高.png', 1, '>0', 2);
INSERT INTO `healthindicator` VALUES (11, '2025-09-17 14:15:21', '体重', 1, '身体的重量，单位千克', 'http://localhost:7245/296227674/体重.png', 1, '>0', 2);
INSERT INTO `healthindicator` VALUES (12, '2025-09-17 14:15:22', '体温', 1, '正常体温范围36.0-37.2℃', 'http://localhost:7245/63322551/体温计.png', 1, '36.0-37.2', 2);
INSERT INTO `healthindicator` VALUES (13, '2025-09-17 14:15:23', 'BMI指数', 1, '身体质量指数，正常范围18.5-23.9', 'http://localhost:7245/615698740/女童BMI指数.png', 1, '18.5-23.9', 2);
INSERT INTO `healthindicator` VALUES (20, '2025-09-17 14:15:30', '收缩压', 1, '心脏收缩时的血压，正常范围90-140mmHg', 'http://localhost:7245/12261008/收缩压-舒张压.png', 1, '90-140', 3);
INSERT INTO `healthindicator` VALUES (21, '2025-09-17 14:15:31', '舒张压', 1, '心脏舒张时的血压，正常范围60-90mmHg', 'http://localhost:7245/660276180/舒张压.png', 1, '60-90', 3);
INSERT INTO `healthindicator` VALUES (30, '2025-09-17 14:15:40', '总胆固醇', 1, '血液中胆固醇总量，正常范围3.1-5.2mmol/L', 'http://localhost:7245/716140102/总胆固醇.png', 1, '3.1-5.2', 4);
INSERT INTO `healthindicator` VALUES (31, '2025-09-17 14:15:41', '甘油三酯', 1, '血液中甘油三酯含量，正常范围0.45-1.69mmol/L', 'http://localhost:7245/708753948/甘油三酯.png', 1, '0.45-1.69', 4);
INSERT INTO `healthindicator` VALUES (32, '2025-09-17 14:15:42', '低密度脂蛋白', 1, '坏胆固醇，正常范围<3.4mmol/L', 'http://localhost:7245/114683745/低密度脂蛋白.png', 1, '<3.4', 4);
INSERT INTO `healthindicator` VALUES (33, '2025-09-17 14:15:43', '高密度脂蛋白', 1, '好胆固醇，正常范围>1.04mmol/L', 'http://localhost:7245/971890180/非高密度脂蛋白.png', 1, '>1.04', 4);
INSERT INTO `healthindicator` VALUES (40, '2025-09-17 14:15:50', '静息心率', 1, '安静状态下的心率，正常范围60-100次/分', 'http://localhost:7245/131766988/平均静息心率.png', 1, '60-100', 5);
INSERT INTO `healthindicator` VALUES (41, '2025-09-17 14:15:51', '运动心率', 1, '运动时的心率，一般不超过220-年龄', 'http://localhost:7245/344692383/jianyan.png', 1, '160-220', 5);
INSERT INTO `healthindicator` VALUES (50, '2025-09-17 14:16:00', '谷丙转氨酶', 1, 'ALT，正常范围7-40U/L', 'http://localhost:7245/858633139/25.png', 1, '7-40', 6);
INSERT INTO `healthindicator` VALUES (51, '2025-09-17 14:16:01', '谷草转氨酶', 1, 'AST，正常范围13-35U/L', 'http://localhost:7245/699792978/乙肝.png', 1, '13-35', 6);
INSERT INTO `healthindicator` VALUES (52, '2025-09-17 14:16:02', '总胆红素', 1, '正常范围3.4-17.1μmol/L', 'http://localhost:7245/20487043/肝胆科 (1).png', 1, '3.4-17.1', 6);
INSERT INTO `healthindicator` VALUES (60, '2025-09-17 14:16:10', '血肌酐', 1, '正常范围男性53-106μmol/L，女性44-97μmol/L', 'http://localhost:7245/838572509/iconfont.png', 1, '44-106', 7);
INSERT INTO `healthindicator` VALUES (61, '2025-09-17 14:16:11', '血尿素氮', 1, '正常范围2.9-8.2mmol/L', 'http://localhost:7245/528605255/产物纯化.png', 1, '2.9-8.2', 7);
INSERT INTO `healthindicator` VALUES (62, '2025-09-17 14:16:12', '尿酸', 1, '正常范围男性150-416μmol/L，女性89-357μmol/L', 'http://localhost:7245/803257444/尿酸 svg.png', 1, '89-416', 7);
INSERT INTO `healthindicator` VALUES (70, '2025-09-17 14:16:20', '白细胞计数', 1, '正常范围3.5-9.5×10^9/L', 'http://localhost:7245/18572083/水质评价.png', 1, '3.5-9.5', 8);
INSERT INTO `healthindicator` VALUES (71, '2025-09-17 14:16:21', '红细胞计数', 1, '正常范围男性4.3-5.8×10^12/L，女性3.8-5.1×10^12/L', 'http://localhost:7245/105618397/WaterMeter.png', 1, '3.8-5.8', 8);
INSERT INTO `healthindicator` VALUES (72, '2025-09-17 14:16:22', '血红蛋白', 1, '正常范围男性130-175g/L，女性115-150g/L', 'http://localhost:7245/922924527/血红蛋白.png', 1, '115-175', 8);
INSERT INTO `healthindicator` VALUES (73, '2025-09-17 14:16:23', '血小板计数', 1, '正常范围125-350×10^9/L', 'http://localhost:7245/747450327/血小板计数.png', 1, '125-350', 8);
INSERT INTO `healthindicator` VALUES (80, '2025-09-17 14:16:30', '肺活量', 1, '正常范围因年龄性别而异，一般2500-4000ml', 'http://localhost:7245/904004045/肺活量.png', 1, '2500-4000', 9);
INSERT INTO `healthindicator` VALUES (81, '2025-09-17 14:16:31', '血氧饱和度', 1, '正常范围95-100%', 'http://localhost:7245/983817023/血氧饱和度.png', 1, '95-100', 9);
INSERT INTO `healthindicator` VALUES (90, '2025-09-17 14:16:40', '促甲状腺激素', 1, 'TSH，正常范围0.27-4.2mIU/L', 'http://localhost:7245/206313432/PH.png', 1, '0.27-4.2', 10);
INSERT INTO `healthindicator` VALUES (91, '2025-09-17 14:16:41', '游离甲状腺素', 1, 'FT4，正常范围12-22pmol/L', 'http://localhost:7245/428866574/Hexagon.png', 1, '12-22', 10);
INSERT INTO `healthindicator` VALUES (92, '2025-09-17 14:16:42', '游离三碘甲状腺原氨酸', 1, 'FT3，正常范围3.1-6.8pmol/L', 'http://localhost:7245/30667537/胰岛素注射.png', 1, '3.1-6.8', 10);
INSERT INTO `healthindicator` VALUES (107, '2025-09-17 20:56:39', '游离三碘甲状腺原氨酸', 2, 'FT3，正常范围3.1-6.8pmol/L', 'http://localhost:7245/30667537/胰岛素注射.png', 0, '3.1-6.8', 23);
INSERT INTO `healthindicator` VALUES (108, '2025-09-17 20:59:01', '肺活量', 2, '正常范围因年龄性别而异，一般2500-4000ml', 'http://localhost:7245/904004045/肺活量.png', 0, '2500-4000', 24);
INSERT INTO `healthindicator` VALUES (109, '2025-09-17 20:59:01', '血氧饱和度', 2, '正常范围95-100%', 'http://localhost:7245/983817023/血氧饱和度.png', 0, '95-100', 24);
INSERT INTO `healthindicator` VALUES (110, '2025-09-18 13:20:06', '体温', 2, '正常体温范围36.0-37.2℃', 'http://localhost:7245/63322551/体温计.png', 0, '36.0-37.2', 28);
INSERT INTO `healthindicator` VALUES (111, '2025-09-18 13:20:07', '体重', 2, '身体的重量，单位千克', 'http://localhost:7245/296227674/体重.png', 0, '>0', 28);
INSERT INTO `healthindicator` VALUES (112, '2025-09-18 13:20:08', '身高', 2, '身体的高度，单位厘米', 'http://localhost:7245/829205285/身高.png', 0, '>0', 28);
INSERT INTO `healthindicator` VALUES (113, '2025-09-18 13:20:10', '空腹血糖', 2, '测量空腹状态下的血糖浓度，正常范围为3.9-6.1mmol/L', 'http://localhost:7245/214741414/居民画像_空腹血糖.png', 0, '3.9-6.1', 29);
INSERT INTO `healthindicator` VALUES (114, '2025-09-18 13:20:10', '餐后2小时血糖', 2, '餐后2小时血糖浓度，正常应小于7.8mmol/L', 'http://localhost:7245/193366260/血压.png', 0, '<7.8', 29);

-- ----------------------------
-- Table structure for healthindicatorrecord
-- ----------------------------
DROP TABLE IF EXISTS `healthindicatorrecord`;
CREATE TABLE `healthindicatorrecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康指标记录主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `HealthIndicatorTypeId` int(11) NULL DEFAULT NULL COMMENT '指标分类',
  `HealthIndicatorId` int(11) NULL DEFAULT NULL COMMENT '健康指标',
  `RecordUserId` int(11) NULL DEFAULT NULL COMMENT '记录人',
  `RecordTime` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `RecordValue` double(20, 8) NULL DEFAULT NULL COMMENT '记录值',
  `IsAbnormity` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否异常',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `HealthIndicatorId`(`HealthIndicatorId`) USING BTREE,
  INDEX `RecordUserId`(`RecordUserId`) USING BTREE,
  INDEX `HealthIndicatorTypeId`(`HealthIndicatorTypeId`) USING BTREE,
  CONSTRAINT `healthindicatorrecord_ibfk_1` FOREIGN KEY (`HealthIndicatorId`) REFERENCES `healthindicator` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `healthindicatorrecord_ibfk_2` FOREIGN KEY (`RecordUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `healthindicatorrecord_ibfk_3` FOREIGN KEY (`HealthIndicatorTypeId`) REFERENCES `healthindicatortype` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '健康指标记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healthindicatorrecord
-- ----------------------------
INSERT INTO `healthindicatorrecord` VALUES (2, '2025-09-18 13:45:47', 29, 113, 2, '2025-09-18 13:45:39', 14.00000000, 'Y');
INSERT INTO `healthindicatorrecord` VALUES (3, '2025-09-18 13:45:47', 29, 114, 2, '2025-09-18 13:45:39', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (4, '2025-09-20 14:58:37', 29, 114, 2, '2025-09-20 14:58:28', 5.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (5, '2025-09-20 14:58:37', 29, 113, 2, '2025-09-20 14:58:28', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (6, '2025-09-20 14:58:37', 28, 110, 2, '2025-09-20 14:58:28', 37.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (7, '2025-09-20 14:58:37', 28, 111, 2, '2025-09-20 14:58:28', 122.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (8, '2025-09-20 15:06:15', 24, 109, 2, '2025-09-20 15:06:09', 99.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (9, '2025-09-20 15:06:15', 24, 108, 2, '2025-09-20 15:06:09', 2600.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (10, '2025-09-20 18:21:09', 29, 113, 2, '2025-09-16 18:20:53', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (11, '2025-09-20 18:21:09', 29, 114, 2, '2025-09-16 18:20:53', 6.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (12, '2025-09-20 18:21:09', 28, 111, 2, '2025-09-16 18:20:53', 22.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (13, '2025-09-20 18:22:03', 23, 107, 2, '2025-09-20 18:22:00', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (14, '2025-09-20 18:28:48', 29, 113, 2, '2025-09-19 18:28:41', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (15, '2025-09-20 18:28:58', 29, 113, 2, '2025-09-18 18:28:52', 5.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (16, '2025-09-20 18:29:05', 29, 113, 2, '2025-09-18 18:29:00', 6.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (17, '2025-09-20 18:29:11', 29, 113, 2, '2025-09-17 18:29:06', 5.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (18, '2025-09-20 18:29:17', 29, 113, 2, '2025-09-15 18:29:12', 2.00000000, 'Y');
INSERT INTO `healthindicatorrecord` VALUES (19, '2025-09-20 18:30:52', 29, 113, 2, '2025-08-21 18:30:41', 5.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (20, '2025-09-20 18:30:52', 29, 114, 2, '2025-08-13 18:30:41', 5.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (21, '2025-09-21 11:14:40', 29, 113, 2, '2025-09-21 11:14:17', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (22, '2025-09-21 11:14:40', 28, 110, 2, '2025-09-21 11:14:17', 36.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (23, '2025-09-21 11:14:40', 28, 111, 2, '2025-09-21 11:14:17', 60.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (24, '2025-09-21 11:14:40', 29, 114, 2, '2025-09-21 11:14:17', 6.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (25, '2025-09-21 11:14:40', 28, 112, 2, '2025-09-21 11:14:17', 180.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (26, '2025-09-21 11:14:40', 24, 108, 2, '2025-09-21 11:14:17', 2600.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (27, '2025-09-21 11:14:40', 24, 109, 2, '2025-09-21 11:14:17', 99.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (28, '2025-09-22 09:10:15', 29, 113, 2, '2025-09-22 09:10:11', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (29, '2025-09-22 09:10:15', 29, 114, 2, '2025-09-22 09:10:11', 6.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (30, '2025-09-22 09:10:37', 28, 110, 2, '2025-09-22 09:10:24', 37.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (31, '2025-09-22 09:10:37', 28, 111, 2, '2025-09-22 09:10:24', 60.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (32, '2025-09-22 09:10:37', 28, 112, 2, '2025-09-22 09:10:24', 178.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (33, '2025-09-22 09:10:37', 24, 109, 2, '2025-09-22 09:10:24', 99.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (34, '2025-09-22 09:10:37', 24, 108, 2, '2025-09-22 09:10:24', 2688.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (35, '2025-09-22 09:59:58', 29, 113, 2, '2025-09-23 09:59:40', 4.00000000, 'N');
INSERT INTO `healthindicatorrecord` VALUES (36, '2025-09-22 09:59:58', 29, 114, 2, '2025-09-22 09:59:40', 3.00000000, 'N');

-- ----------------------------
-- Table structure for healthindicatortype
-- ----------------------------
DROP TABLE IF EXISTS `healthindicatortype`;
CREATE TABLE `healthindicatortype`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康指标分类主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类名称',
  `BelongUserId` int(11) NULL DEFAULT NULL COMMENT '所属人',
  `IsComm` tinyint(1) NULL DEFAULT NULL COMMENT '是否公用',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `BelongUserId`(`BelongUserId`) USING BTREE,
  CONSTRAINT `healthindicatortype_ibfk_1` FOREIGN KEY (`BelongUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '健康指标分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healthindicatortype
-- ----------------------------
INSERT INTO `healthindicatortype` VALUES (1, '2025-09-17 14:06:19', '血糖', 1, 1);
INSERT INTO `healthindicatortype` VALUES (2, '2025-09-17 14:06:40', '基础指标', 1, 1);
INSERT INTO `healthindicatortype` VALUES (3, '2025-09-17 14:14:12', '血压', 1, 1);
INSERT INTO `healthindicatortype` VALUES (4, '2025-09-17 14:14:16', '血脂', 1, 1);
INSERT INTO `healthindicatortype` VALUES (5, '2025-09-17 14:15:00', '心率', 1, 1);
INSERT INTO `healthindicatortype` VALUES (6, '2025-09-17 14:15:01', '肝功能', 1, 1);
INSERT INTO `healthindicatortype` VALUES (7, '2025-09-17 14:15:02', '肾功能', 1, 1);
INSERT INTO `healthindicatortype` VALUES (8, '2025-09-17 14:15:03', '血常规', 1, 1);
INSERT INTO `healthindicatortype` VALUES (9, '2025-09-17 14:15:04', '呼吸系统', 1, 1);
INSERT INTO `healthindicatortype` VALUES (10, '2025-09-17 14:15:05', '内分泌', 1, 1);
INSERT INTO `healthindicatortype` VALUES (23, '2025-09-17 20:56:38', '内分泌', 2, 0);
INSERT INTO `healthindicatortype` VALUES (24, '2025-09-17 20:59:01', '呼吸系统', 2, 0);
INSERT INTO `healthindicatortype` VALUES (28, '2025-09-18 13:20:06', '基础指标', 2, 0);
INSERT INTO `healthindicatortype` VALUES (29, '2025-09-18 13:20:10', '血糖', 2, 0);

-- ----------------------------
-- Table structure for healthnotice
-- ----------------------------
DROP TABLE IF EXISTS `healthnotice`;
CREATE TABLE `healthnotice`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '健康提醒主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `PublishUserId` int(11) NULL DEFAULT NULL COMMENT '提醒人',
  `Content` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提醒内容',
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提醒标题',
  `Num` int(11) NULL DEFAULT NULL COMMENT '提醒次数',
  `RemindTime` datetime(0) NULL DEFAULT NULL COMMENT '提醒时间',
  `RemindType` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '提醒方式',
  `IsRemind` tinyint(1) NULL DEFAULT NULL COMMENT '是否提醒',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `PublishUserId`(`PublishUserId`) USING BTREE,
  CONSTRAINT `healthnotice_ibfk_1` FOREIGN KEY (`PublishUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '健康提醒表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of healthnotice
-- ----------------------------
INSERT INTO `healthnotice` VALUES (2, '2025-09-21 13:41:23', 2, '测试', '测试', 1, '2025-09-21 13:42:16', '邮件', 1);

-- ----------------------------
-- Table structure for likerecord
-- ----------------------------
DROP TABLE IF EXISTS `likerecord`;
CREATE TABLE `likerecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '点赞记录主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `LikeUserId` int(11) NULL DEFAULT NULL COMMENT '点赞人',
  `LikeType` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '点赞类型',
  `RelativeId` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联Id',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `LikeUserId`(`LikeUserId`) USING BTREE,
  CONSTRAINT `likerecord_ibfk_1` FOREIGN KEY (`LikeUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '点赞记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of likerecord
-- ----------------------------
INSERT INTO `likerecord` VALUES (2, '2025-09-20 09:32:05', 2, '健康知识', '15');
INSERT INTO `likerecord` VALUES (4, '2025-09-20 09:45:53', 2, '食谱', '10');
INSERT INTO `likerecord` VALUES (6, '2025-09-20 09:53:24', 2, '健康知识', '8');
INSERT INTO `likerecord` VALUES (7, '2025-09-20 09:53:30', 2, '健康知识', '10');

-- ----------------------------
-- Table structure for messagenotice
-- ----------------------------
DROP TABLE IF EXISTS `messagenotice`;
CREATE TABLE `messagenotice`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消息通知主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `RelationNo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联单号',
  `UserId` int(11) NULL DEFAULT NULL COMMENT '接受人',
  `ActualSendTime` datetime(0) NULL DEFAULT NULL COMMENT '实际发送时间',
  `Type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型',
  `TargetKey` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '目标',
  `Content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '通知内容',
  `IsSuccess` tinyint(1) NULL DEFAULT NULL COMMENT '是否成功',
  `IsSend` tinyint(1) NULL DEFAULT NULL COMMENT '是否发送',
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '通知标题',
  `PlanSendTime` datetime(0) NULL DEFAULT NULL COMMENT '计划发送时间',
  `ResultMsg` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '发送结果',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `UserId`(`UserId`) USING BTREE,
  CONSTRAINT `messagenotice_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消息通知表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of messagenotice
-- ----------------------------
INSERT INTO `messagenotice` VALUES (1, '2025-09-21 13:41:23', '2', 2, '2025-09-21 13:44:04', '健康提醒', '3110670494@qq.com', '测试', 1, 1, '测试', '2025-09-21 13:42:16', '发送成功');

-- ----------------------------
-- Table structure for recipe
-- ----------------------------
DROP TABLE IF EXISTS `recipe`;
CREATE TABLE `recipe`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '食谱主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '标题',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `ImageUrls` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '详细图',
  `Content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `ViewCount` int(11) NULL DEFAULT NULL COMMENT '浏览量',
  `VideoUrl` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视频路径',
  `AuditUserId` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `PublishUserId` int(11) NULL DEFAULT NULL COMMENT '发布人',
  `AuditTime` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `AuditStatus` int(11) NULL DEFAULT NULL COMMENT '审核状态枚举(1:待审核,2:审核通过,3:审核失败)',
  `AuditReply` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '审核回复',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `PublishUserId`(`PublishUserId`) USING BTREE,
  INDEX `AuditUserId`(`AuditUserId`) USING BTREE,
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`PublishUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`AuditUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '食谱表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recipe
-- ----------------------------
INSERT INTO `recipe` VALUES (1, '2025-09-19 10:00:00', '蒸蛋羹配时蔬', 'http://localhost:7245/276106579/1.jpg', 'http://localhost:7245/550088983/6.jpg,http://localhost:7245/860662346/2.jpg', '<p>营养丰富的蒸蛋羹，搭配新鲜时蔬，口感嫩滑，营养均衡。</p><p><strong>食材：</strong><br/>鸡蛋 2个<br/>西兰花 100g<br/>胡萝卜 50g<br/>香菇 3朵</p><p><strong>制作步骤：</strong><br/>1. 鸡蛋打散，加入温水搅拌均匀<br/>2. 过筛去泡沫，倒入蒸碗<br/>3. 蒸锅水开后放入，蒸10分钟<br/>4. 蔬菜焯水摆盘装饰</p>', 245, 'http://localhost:7245/recipe001/video.mp4', 1, 2, '2025-09-19 10:30:00', 2, '营养搭配合理，制作简单');
INSERT INTO `recipe` VALUES (2, '2025-09-19 10:15:00', '燕麦香蕉早餐杯', 'http://localhost:7245/208274799/0.jpg', 'http://localhost:7245/793005099/4.jpg,http://localhost:7245/198975129/3.jpg', '<p>高纤维低脂的健康早餐，富含维生素和矿物质。</p><p><strong>食材：</strong><br/>燕麦片 50g<br/>香蕉 1根<br/>酸奶 100ml<br/>蓝莓 适量<br/>蜂蜜 1勺</p><p><strong>制作步骤：</strong><br/>1. 燕麦片用热水冲泡5分钟<br/>2. 香蕉切片铺底<br/>3. 倒入燕麦，加酸奶<br/>4. 撒上蓝莓，淋蜂蜜</p>', 192, 'http://localhost:7245/recipe002/video.mp4', 1, 2, '2025-09-19 10:45:00', 2, '健康营养，适合减脂期');
INSERT INTO `recipe` VALUES (3, '2025-09-19 10:30:00', '清蒸鲈鱼配柠檬', 'http://localhost:7245/570286916/0.jpg', 'http://localhost:7245/124885205/10.jpg,http://localhost:7245/416619754/5.jpg,http://localhost:7245/958461200/8.jpg', '<p>高蛋白低脂肪的优质蛋白来源，肉质鲜嫩，营养价值高。</p><p><strong>食材：</strong><br/>鲈鱼 1条<br/>柠檬 半个<br/>生姜 3片<br/>葱丝 适量<br/>蒸鱼豉油 2勺</p><p><strong>制作步骤：</strong><br/>1. 鲈鱼洗净打花刀<br/>2. 鱼身塞姜片，淋料酒腌制<br/>3. 蒸锅水开后蒸8分钟<br/>4. 撒葱丝，淋蒸鱼豉油和柠檬汁</p>', 312, 'http://localhost:7245/recipe003/video.mp4', 1, 2, '2025-09-19 11:00:00', 2, '制作精美，营养丰富');
INSERT INTO `recipe` VALUES (4, '2025-09-19 10:45:00', '彩虹沙拉配坚果', 'http://localhost:7245/333547367/0.jpg', 'http://localhost:7245/809270015/6.jpg,http://localhost:7245/122044038/7.jpg', '<p>色彩丰富的蔬菜沙拉，富含维生素、纤维和健康脂肪。</p><p><strong>食材：</strong><br/>生菜 100g<br/>紫甘蓝 50g<br/>胡萝卜丝 50g<br/>圣女果 10个<br/>核桃仁 20g<br/>橄榄油醋汁 适量</p><p><strong>制作步骤：</strong><br/>1. 所有蔬菜洗净切好<br/>2. 圣女果对半切开<br/>3. 摆盘成彩虹色<br/>4. 撒坚果，淋沙拉汁</p>', 156, 'http://localhost:7245/recipe004/video.mp4', 1, 2, '2025-09-19 11:15:00', 2, '颜值很高，营养全面');
INSERT INTO `recipe` VALUES (5, '2025-09-19 11:00:00', '紫薯银耳羹', 'http://localhost:7245/358308287/0.jpg', 'http://localhost:7245/663518492/13.jpg,http://localhost:7245/89208909/6.jpg', '<p>养颜美容的甜品，富含胶原蛋白和花青素，口感Q弹香甜。</p><p><strong>食材：</strong><br/>紫薯 200g<br/>银耳 1朵<br/>冰糖 适量<br/>枸杞 10粒<br/>牛奶 100ml</p><p><strong>制作步骤：</strong><br/>1. 银耳提前泡发去根<br/>2. 紫薯蒸熟压成泥<br/>3. 银耳煮1小时至软糯<br/>4. 加紫薯泥和冰糖，撒枸杞</p>', 278, 'http://localhost:7245/recipe005/video.mp4', 1, 2, '2025-09-19 11:30:00', 2, '口感丰富，营养价值高');
INSERT INTO `recipe` VALUES (6, '2025-09-19 11:15:00', '鸡胸肉蔬菜卷', 'http://localhost:7245/651140243/0.jpg', 'http://localhost:7245/725584599/1.jpg,http://localhost:7245/286153575/6.jpg', '<p>高蛋白低卡路里的健身餐，口感丰富，制作简单。</p><p><strong>食材：</strong><br/>鸡胸肉 150g<br/>黄瓜 1根<br/>胡萝卜 1根<br/>紫菜片 2张<br/>黑胡椒 适量</p><p><strong>制作步骤：</strong><br/>1. 鸡胸肉煎至两面金黄<br/>2. 蔬菜切丝焯水<br/>3. 紫菜铺平，放鸡肉和蔬菜<br/>4. 卷紧切段，撒黑胡椒</p>', 203, 'http://localhost:7245/recipe006/video.mp4', 1, 2, '2025-09-19 11:45:00', 2, '适合健身人群');
INSERT INTO `recipe` VALUES (7, '2025-09-19 11:30:00', '山药排骨汤', 'http://localhost:7245/957168683/0.jpg', 'http://localhost:7245/176758679/4.jpg,http://localhost:7245/115896086/3.jpg', '<p>滋补养胃的经典汤品，营养丰富，适合全家享用。</p><p><strong>食材：</strong><br/>排骨 300g<br/>山药 200g<br/>胡萝卜 100g<br/>玉米 1根<br/>生姜 3片</p><p><strong>制作步骤：</strong><br/>1. 排骨焯水去血沫<br/>2. 山药去皮切段<br/>3. 所有食材放入砂锅<br/>4. 大火煮开转小火炖1.5小时</p>', 330, 'http://localhost:7245/recipe007/video.mp4', 1, 2, '2025-09-19 12:00:00', 2, '汤品清香，营养滋补');
INSERT INTO `recipe` VALUES (8, '2025-09-19 11:45:00', '藜麦蔬菜饭', 'http://localhost:7245/139444076/2.jpg', 'http://localhost:7245/685422299/1.jpg,http://localhost:7245/375216828/4.jpg', '<p>超级食物藜麦搭配时令蔬菜，营养密度极高的主食。</p><p><strong>食材：</strong><br/>藜麦 100g<br/>西兰花 100g<br/>玉米粒 50g<br/>豌豆 50g<br/>橄榄油 1勺</p><p><strong>制作步骤：</strong><br/>1. 藜麦淘洗干净煮15分钟<br/>2. 蔬菜分别焯水<br/>3. 热锅下橄榄油<br/>4. 倒入藜麦和蔬菜炒匀</p>', 170, 'http://localhost:7245/recipe008/video.mp4', 1, 2, '2025-09-19 12:15:00', 2, '营养全面，口感丰富');
INSERT INTO `recipe` VALUES (9, '2025-09-19 12:00:00', '蜂蜜柚子茶', 'http://localhost:7245/220552755/3.jpg', 'http://localhost:7245/58548843/11.jpg,http://localhost:7245/777616084/15.jpg,http://localhost:7245/823462811/10.jpg', '<p>清香甘甜的养生茶饮，富含维生素C，具有润燥化痰的功效。</p><p><strong>食材：</strong></p><p>柚子 1个</p><p>蜂蜜 200g</p><p>冰糖 100g</p><p>盐 少许</p><p><strong>制作步骤：</strong></p><p>1. 柚子皮用盐搓洗干净</p><p>2. 柚子皮切丝，果肉剥出</p><p>3. 柚子皮煮10分钟去苦味</p><p>4. 加冰糖熬煮至浓稠，晾凉加蜂蜜</p>', 289, 'http://localhost:7245/761855498/20250202_143127.mp4', 1, 2, '2025-09-19 12:30:00', 2, '制作精细，口感清香');
INSERT INTO `recipe` VALUES (10, '2025-09-19 12:15:00', '牛油果吐司', 'http://localhost:7245/244972399/1.jpg', 'http://localhost:7245/726155689/2.jpg,http://localhost:7245/318984926/3.jpg,http://localhost:7245/347836075/7.jpg,http://localhost:7245/569321950/12.jpg', '<p>网红健康早餐，富含优质脂肪和蛋白质，颜值与营养并存。</p><p><strong>食材：</strong><br/>全麦吐司 2片<br/>牛油果 1个<br/>鸡蛋 1个<br/>圣女果 5个<br/>黑胡椒 适量</p><p><strong>制作步骤：</strong><br/>1. 吐司烤至微黄<br/>2. 牛油果压成泥，加黑胡椒<br/>3. 煎蛋至半熟<br/>4. 吐司涂牛油果泥，放煎蛋和圣女果</p>', 315, 'http://localhost:7245/recipe010/video.mp4', 1, 2, '2025-09-19 12:45:00', 2, '颜值很高，营养丰富');

-- ----------------------------
-- Table structure for sport
-- ----------------------------
DROP TABLE IF EXISTS `sport`;
CREATE TABLE `sport`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运动参考主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `Name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '运动名称',
  `Cover` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '封面',
  `Content` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '介绍',
  PRIMARY KEY (`Id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运动参考表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sport
-- ----------------------------
INSERT INTO `sport` VALUES (1, '2025-09-18 16:00:00', '跑步', 'http://localhost:7245/854672772/跑步.png', '有氧运动，能够有效提高心肺功能，燃烧脂肪，增强体质');
INSERT INTO `sport` VALUES (2, '2025-09-18 16:01:00', '游泳', 'http://localhost:7245/876606386/游泳圈.png', '全身运动，对关节冲击小，能锻炼全身肌群，提高心肺功能');
INSERT INTO `sport` VALUES (3, '2025-09-18 16:02:00', '骑行', 'http://localhost:7245/369508609/骑行.png', '低冲击有氧运动，能够锻炼下肢肌肉，提高心血管健康');
INSERT INTO `sport` VALUES (4, '2025-09-18 16:03:00', '健身房器械训练', 'http://localhost:7245/212879772/Weight Bench.png', '力量训练，能够增加肌肉量，提高基础代谢率');
INSERT INTO `sport` VALUES (5, '2025-09-18 16:04:00', '瑜伽', 'http://localhost:7245/320663250/瑜伽.png', '柔韧性训练，能够改善身体柔韧性，减压放松，增强身心平衡');
INSERT INTO `sport` VALUES (6, '2025-09-18 16:05:00', '篮球', 'http://localhost:7245/449533534/篮球.png', '团体运动，能够锻炼协调性，提高心肺功能和反应能力');
INSERT INTO `sport` VALUES (7, '2025-09-18 16:06:00', '羽毛球', 'http://localhost:7245/751470484/羽毛球.png', '球类运动，能够锻炼手眼协调，提高反应速度和敏捷性');
INSERT INTO `sport` VALUES (8, '2025-09-18 16:07:00', '乒乓球', 'http://localhost:7245/835759562/乒乓球.png', '技巧性运动，能够锻炼专注力，提高手眼协调和反应能力');
INSERT INTO `sport` VALUES (9, '2025-09-18 16:08:00', '爬山', 'http://localhost:7245/119380968/爬山.png', '户外有氧运动，能够锻炼下肢力量，提高心肺功能，享受自然');
INSERT INTO `sport` VALUES (10, '2025-09-18 16:09:00', '快走', 'http://localhost:7245/519404985/快走.png', '低强度有氧运动，适合初学者，能够改善心血管健康');
INSERT INTO `sport` VALUES (11, '2025-09-18 16:10:00', '跳绳', 'http://localhost:7245/436280677/跳绳.png', '高效燃脂运动，能够快速提高心率，锻炼协调性');
INSERT INTO `sport` VALUES (12, '2025-09-18 16:11:00', '太极拳', 'http://localhost:7245/858272420/太极拳.png', '传统运动，动作缓慢优美，能够改善平衡力，适合中老年人');
INSERT INTO `sport` VALUES (13, '2025-09-18 16:12:00', '广场舞', 'http://localhost:7245/48877538/跳广场舞.png', '群体运动，结合音乐和舞蹈，能够锻炼协调性，增进社交');
INSERT INTO `sport` VALUES (14, '2025-09-18 16:13:00', '仰卧起坐', 'http://localhost:7245/851209315/仰卧起坐.png', '核心力量训练，主要锻炼腹部肌肉，改善核心稳定性');
INSERT INTO `sport` VALUES (15, '2025-09-18 16:14:00', '俯卧撑', 'http://localhost:7245/486471415/俯卧撑.png', '上肢力量训练，主要锻炼胸肌、肩膀和三头肌');

-- ----------------------------
-- Table structure for sportrecord
-- ----------------------------
DROP TABLE IF EXISTS `sportrecord`;
CREATE TABLE `sportrecord`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运动记录主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `SportId` int(11) NULL DEFAULT NULL COMMENT '运动',
  `SportUnitId` int(11) NULL DEFAULT NULL COMMENT '运动单位',
  `RecordUserId` int(11) NULL DEFAULT NULL COMMENT '记录人',
  `RecordTime` datetime(0) NULL DEFAULT NULL COMMENT '记录时间',
  `RecordValue` int(11) NULL DEFAULT NULL COMMENT '记录值',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `RecordUserId`(`RecordUserId`) USING BTREE,
  INDEX `SportId`(`SportId`) USING BTREE,
  INDEX `SportUnitId`(`SportUnitId`) USING BTREE,
  CONSTRAINT `sportrecord_ibfk_1` FOREIGN KEY (`RecordUserId`) REFERENCES `appuser` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `sportrecord_ibfk_2` FOREIGN KEY (`SportId`) REFERENCES `sport` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT,
  CONSTRAINT `sportrecord_ibfk_3` FOREIGN KEY (`SportUnitId`) REFERENCES `sportunit` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运动记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sportrecord
-- ----------------------------
INSERT INTO `sportrecord` VALUES (1, '2025-09-18 20:26:00', 15, 35, 2, '2025-09-18 20:25:57', 1);
INSERT INTO `sportrecord` VALUES (2, '2025-09-18 20:27:09', 4, 10, 2, '2025-09-18 20:27:08', 1);
INSERT INTO `sportrecord` VALUES (3, '2025-09-18 20:27:10', 3, 8, 2, '2025-09-18 20:27:09', 1);
INSERT INTO `sportrecord` VALUES (5, '2025-09-18 20:27:12', 1, 2, 2, '2025-09-18 20:27:11', 1);
INSERT INTO `sportrecord` VALUES (6, '2025-09-18 20:42:33', 14, 33, 2, '2025-09-18 20:42:32', 1);
INSERT INTO `sportrecord` VALUES (7, '2025-09-18 20:42:37', 13, 31, 2, '2025-09-18 20:42:33', 2);
INSERT INTO `sportrecord` VALUES (8, '2025-09-22 09:57:20', 14, 32, 2, '2025-09-22 09:57:19', 1);

-- ----------------------------
-- Table structure for sportunit
-- ----------------------------
DROP TABLE IF EXISTS `sportunit`;
CREATE TABLE `sportunit`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运动单位主键',
  `CreationTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `SportId` int(11) NULL DEFAULT NULL COMMENT '运动',
  `UnitName` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '单位名称',
  `UnitValue` double(20, 8) NULL DEFAULT NULL COMMENT '单位值',
  `Calories` double(20, 8) NULL DEFAULT NULL COMMENT '热量',
  PRIMARY KEY (`Id`) USING BTREE,
  INDEX `SportId`(`SportId`) USING BTREE,
  CONSTRAINT `sportunit_ibfk_1` FOREIGN KEY (`SportId`) REFERENCES `sport` (`Id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '运动单位表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sportunit
-- ----------------------------
INSERT INTO `sportunit` VALUES (1, '2025-09-18 16:15:00', 1, '分钟', 1.00000000, 10.50000000);
INSERT INTO `sportunit` VALUES (2, '2025-09-18 16:16:00', 1, '公里', 1.00000000, 70.00000000);
INSERT INTO `sportunit` VALUES (3, '2025-09-18 16:17:00', 1, '小时', 1.00000000, 630.00000000);
INSERT INTO `sportunit` VALUES (4, '2025-09-18 16:18:00', 2, '分钟', 1.00000000, 12.00000000);
INSERT INTO `sportunit` VALUES (5, '2025-09-18 16:19:00', 2, '圈', 50.00000000, 25.00000000);
INSERT INTO `sportunit` VALUES (6, '2025-09-18 16:20:00', 2, '小时', 1.00000000, 720.00000000);
INSERT INTO `sportunit` VALUES (7, '2025-09-18 16:21:00', 3, '分钟', 1.00000000, 8.50000000);
INSERT INTO `sportunit` VALUES (8, '2025-09-18 16:22:00', 3, '公里', 1.00000000, 35.00000000);
INSERT INTO `sportunit` VALUES (9, '2025-09-18 16:23:00', 3, '小时', 1.00000000, 510.00000000);
INSERT INTO `sportunit` VALUES (10, '2025-09-18 16:24:00', 4, '分钟', 1.00000000, 6.00000000);
INSERT INTO `sportunit` VALUES (11, '2025-09-18 16:25:00', 4, '组', 1.00000000, 15.00000000);
INSERT INTO `sportunit` VALUES (12, '2025-09-18 16:26:00', 4, '小时', 1.00000000, 360.00000000);
INSERT INTO `sportunit` VALUES (13, '2025-09-18 16:27:00', 5, '分钟', 1.00000000, 3.50000000);
INSERT INTO `sportunit` VALUES (14, '2025-09-18 16:28:00', 5, '节课', 60.00000000, 210.00000000);
INSERT INTO `sportunit` VALUES (15, '2025-09-18 16:29:00', 6, '分钟', 1.00000000, 9.00000000);
INSERT INTO `sportunit` VALUES (16, '2025-09-18 16:30:00', 6, '场', 48.00000000, 432.00000000);
INSERT INTO `sportunit` VALUES (17, '2025-09-18 16:31:00', 7, '分钟', 1.00000000, 7.50000000);
INSERT INTO `sportunit` VALUES (18, '2025-09-18 16:32:00', 7, '场', 30.00000000, 225.00000000);
INSERT INTO `sportunit` VALUES (19, '2025-09-18 16:33:00', 8, '分钟', 1.00000000, 5.50000000);
INSERT INTO `sportunit` VALUES (20, '2025-09-18 16:34:00', 8, '场', 30.00000000, 165.00000000);
INSERT INTO `sportunit` VALUES (21, '2025-09-18 16:35:00', 9, '分钟', 1.00000000, 11.00000000);
INSERT INTO `sportunit` VALUES (22, '2025-09-18 16:36:00', 9, '小时', 1.00000000, 660.00000000);
INSERT INTO `sportunit` VALUES (23, '2025-09-18 16:37:00', 10, '分钟', 1.00000000, 4.50000000);
INSERT INTO `sportunit` VALUES (24, '2025-09-18 16:38:00', 10, '公里', 1.00000000, 45.00000000);
INSERT INTO `sportunit` VALUES (25, '2025-09-18 16:39:00', 10, '步数', 1000.00000000, 35.00000000);
INSERT INTO `sportunit` VALUES (26, '2025-09-18 16:40:00', 11, '分钟', 1.00000000, 12.50000000);
INSERT INTO `sportunit` VALUES (27, '2025-09-18 16:41:00', 11, '次', 100.00000000, 15.00000000);
INSERT INTO `sportunit` VALUES (28, '2025-09-18 16:42:00', 12, '分钟', 1.00000000, 3.00000000);
INSERT INTO `sportunit` VALUES (29, '2025-09-18 16:43:00', 12, '套', 20.00000000, 60.00000000);
INSERT INTO `sportunit` VALUES (30, '2025-09-18 16:44:00', 13, '分钟', 1.00000000, 4.00000000);
INSERT INTO `sportunit` VALUES (31, '2025-09-18 16:45:00', 13, '支舞', 5.00000000, 20.00000000);
INSERT INTO `sportunit` VALUES (32, '2025-09-18 16:46:00', 14, '个', 1.00000000, 0.50000000);
INSERT INTO `sportunit` VALUES (33, '2025-09-18 16:47:00', 14, '组', 20.00000000, 10.00000000);
INSERT INTO `sportunit` VALUES (34, '2025-09-18 16:48:00', 14, '分钟', 1.00000000, 5.00000000);
INSERT INTO `sportunit` VALUES (35, '2025-09-18 16:49:00', 15, '个', 1.00000000, 0.60000000);
INSERT INTO `sportunit` VALUES (36, '2025-09-18 16:50:00', 15, '组', 15.00000000, 9.00000000);
INSERT INTO `sportunit` VALUES (37, '2025-09-18 16:51:00', 15, '分钟', 1.00000000, 6.00000000);

SET FOREIGN_KEY_CHECKS = 1;

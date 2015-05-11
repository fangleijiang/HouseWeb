/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50527
Source Host           : localhost:3306
Source Database       : houseweb

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2015-05-11 22:16:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '方思源', 'fangleijiang@qq.com', '18942560376', '男', '已激活');
INSERT INTO `t_admin` VALUES ('3', 'admin3', 'e10adc3949ba59abbe56e057f20f883e', '万智军', '1549690699@qq.com', '15243676452', '男', '已激活');

-- ----------------------------
-- Table structure for `t_areainfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_areainfo`;
CREATE TABLE `t_areainfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_areainfo
-- ----------------------------
INSERT INTO `t_areainfo` VALUES ('1', '山东');
INSERT INTO `t_areainfo` VALUES ('2', '江苏');
INSERT INTO `t_areainfo` VALUES ('3', '浙江');
INSERT INTO `t_areainfo` VALUES ('4', '安徽');
INSERT INTO `t_areainfo` VALUES ('5', '广东');
INSERT INTO `t_areainfo` VALUES ('6', '福建');
INSERT INTO `t_areainfo` VALUES ('7', '湖南');

-- ----------------------------
-- Table structure for `t_cart`
-- ----------------------------
DROP TABLE IF EXISTS `t_cart`;
CREATE TABLE `t_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `houseInfo_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tk3d4vhpet5vm8mbhyaqgtqa1` (`houseInfo_id`),
  KEY `FK_8x24uj0agcrrqnt4pi49r0ixv` (`user_id`),
  CONSTRAINT `FK_8x24uj0agcrrqnt4pi49r0ixv` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_tk3d4vhpet5vm8mbhyaqgtqa1` FOREIGN KEY (`houseInfo_id`) REFERENCES `t_houseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_cart
-- ----------------------------
INSERT INTO `t_cart` VALUES ('1', '2015-05-05 15:10', '4', '1');

-- ----------------------------
-- Table structure for `t_city`
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cityName` varchar(255) DEFAULT NULL,
  `areaInfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8k4rrh0lf60vkjiay5lvb6mpg` (`areaInfo_id`),
  CONSTRAINT `FK_8k4rrh0lf60vkjiay5lvb6mpg` FOREIGN KEY (`areaInfo_id`) REFERENCES `t_areainfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_city
-- ----------------------------
INSERT INTO `t_city` VALUES ('1', '青岛', '1');
INSERT INTO `t_city` VALUES ('2', '济南', '1');
INSERT INTO `t_city` VALUES ('3', '烟台', '1');
INSERT INTO `t_city` VALUES ('4', '苏州', '2');
INSERT INTO `t_city` VALUES ('5', '南京', '2');
INSERT INTO `t_city` VALUES ('6', '无锡', '2');
INSERT INTO `t_city` VALUES ('7', '杭州', '3');
INSERT INTO `t_city` VALUES ('8', '宁波', '3');
INSERT INTO `t_city` VALUES ('9', '温州', '3');
INSERT INTO `t_city` VALUES ('10', '绍兴', '3');
INSERT INTO `t_city` VALUES ('11', '合肥', '4');
INSERT INTO `t_city` VALUES ('12', '阜阳', '4');
INSERT INTO `t_city` VALUES ('13', '深圳', '5');
INSERT INTO `t_city` VALUES ('14', '广州', '5');
INSERT INTO `t_city` VALUES ('15', '东莞', '5');
INSERT INTO `t_city` VALUES ('16', '佛山', '5');
INSERT INTO `t_city` VALUES ('17', '中山', '5');
INSERT INTO `t_city` VALUES ('18', '珠海', '5');
INSERT INTO `t_city` VALUES ('19', '惠州', '5');
INSERT INTO `t_city` VALUES ('20', '福州', '6');
INSERT INTO `t_city` VALUES ('21', '厦门', '6');
INSERT INTO `t_city` VALUES ('22', '泉州', '6');
INSERT INTO `t_city` VALUES ('23', '长沙', '7');
INSERT INTO `t_city` VALUES ('24', '衡阳', '7');
INSERT INTO `t_city` VALUES ('25', '郴州', '7');
INSERT INTO `t_city` VALUES ('26', '邵阳', '7');
INSERT INTO `t_city` VALUES ('27', '永州', '7');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `houseInfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m1t3sl59cjhspyocsm60i0w1f` (`houseInfo_id`),
  CONSTRAINT `FK_m1t3sl59cjhspyocsm60i0w1f` FOREIGN KEY (`houseInfo_id`) REFERENCES `t_houseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------
INSERT INTO `t_comment` VALUES ('1', '你好', '2015年5月5日', '4');
INSERT INTO `t_comment` VALUES ('2', '不错啊', '2015年5月5日', '4');
INSERT INTO `t_comment` VALUES ('3', '你好啊', '2015年5月5日', '4');
INSERT INTO `t_comment` VALUES ('4', '这个有点贵啊', '2015年5月5日', '4');

-- ----------------------------
-- Table structure for `t_houseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `t_houseinfo`;
CREATE TABLE `t_houseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` text,
  `fitment` varchar(255) DEFAULT NULL,
  `houseFace` varchar(255) DEFAULT NULL,
  `houseFlont` varchar(255) DEFAULT NULL,
  `houseName` varchar(255) DEFAULT NULL,
  `householdType` varchar(255) DEFAULT NULL,
  `housingFurniture` varchar(255) DEFAULT NULL,
  `imageUrl` varchar(255) DEFAULT NULL,
  `paymentStyle` varchar(255) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `propertyType` varchar(255) DEFAULT NULL,
  `publishDate` varchar(255) DEFAULT NULL,
  `rentArea` varchar(255) DEFAULT NULL,
  `rentStyle` varchar(255) DEFAULT NULL,
  `scores` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fdd43ii4kfh7uhwf8v46x2uji` (`user_id`),
  CONSTRAINT `FK_fdd43ii4kfh7uhwf8v46x2uji` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_houseinfo
-- ----------------------------
INSERT INTO `t_houseinfo` VALUES ('1', '长沙伍家岭-四方坪-湘江世纪城-北辰三角洲-珠江花城', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742514612.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742518656.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742525195.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742532123.jpg\"/></p>', '精装修', '朝东', '7层/18层', '珠江花城', '2室 2厅 1卫', '床，厨具，空调。。。', './upload/QQ截图20150504202506.png', '押一付三', '1800', '有物业', '2015-05-04 20:30', '75', '整租房', '0', '开福区政府珠 江花城四期 家电齐全 拎包入住 ', '1');
INSERT INTO `t_houseinfo` VALUES ('2', '长沙雨花区新建西路与芙蓉路交汇处(省第二人民医院旁)', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742876966.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742881071.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742888499.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742892603.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430742903542.jpg\"/></p>', ' 精装修', '朝向南北', '7层/32层', '新芙蓉之都', '1室 1厅 1卫', '床，热水器，洗衣机，空调。。。。。', './upload/QQ截图20150504203136.png', '押一付三', '1600', '有物业', '2015-05-04 20:35', '60', '合租房', '0', '真实有效：新建西路 新芙蓉之都', '1');
INSERT INTO `t_houseinfo` VALUES ('3', '长沙桐梓坡金星大道市政府格林星城美林银谷沁园', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743232614.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743237405.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743245956.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743251442.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743258510.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743264904.jpg\"/></p>', '精装修 ', '朝向南北', '23层/33层', '林银谷沁园', '3室 2厅 2卫 ', '家具家电齐全。。。。', './upload/QQ截图20150504203620.png', '押一付三', '2400', '居住物业', '2015-05-04 20:41', '100', '整租房', '0', '步步高桐梓坡路王府井【永祺西京】美林银谷温馨两房拎包入住  ', '1');
INSERT INTO `t_houseinfo` VALUES ('4', '长沙岳麓 - 银盆岭 - 奥克斯广场绿地香水湾', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload1/20150504/27311430743490597.png\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743496166.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743501285.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430743509443.jpg\"/></p>', '精装修', '', '5层/33层', '奥克斯广场绿地香水湾', '一室', '', './upload/QQ截图20150504204149.png', '押一付三', '780', '居住物业', '2015-05-04 20:45', '15', '短租/日租房', '1', '(单间出租) 免中介费 银盆岭奥克斯广场绿地六沟垄精装修', '1');
INSERT INTO `t_houseinfo` VALUES ('5', '长沙-岳麓 - 麓谷 - 麓谷锦和园', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload1/20150504/25211430744030330.png\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744036312.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744043086.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744051173.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744057277.jpg\"/></p>', '简单装修', '朝向南', '15层/17层', '麓谷锦和园 ', '3室 1厅 1卫', '', './upload/QQ截图20150504204747.png', '半年付', '1600', '居住物业', '2015-05-04 20:54', ' 90', '合租房', '0', '麓谷麓谷锦和园 3室1厅90平米 简单装修 半年付(个人)  ', '2');
INSERT INTO `t_houseinfo` VALUES ('6', '长沙-岳麓 - 汽车西站 - 前程丽景恩宇红公馆 ', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload1/20150504/20461430744341192.png\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744348582.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744355007.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744363203.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744368125.jpg\"/></p>', '精装修', '', '5层/23层', '前程丽景恩宇', '1室 1厅 1卫', '', './upload/QQ截图20150504205628.png', '押一付三', '2000', '居住物业', '2015-05-04 20:59', '100', '整租房', '4', '汽车西站前程丽景恩宇 1室1厅37平米 豪华装修', '2');
INSERT INTO `t_houseinfo` VALUES ('7', '长沙-壹号公馆', '<p><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload1/20150504/80481430744678032.png\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744684934.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744691423.jpg\"/><img src=\"http://localhost:8080/HouseWeb/ueditor/jsp/upload/1430744698926.jpg\"/></p>', '精装修', ' 朝向南', '6层/32层', '壹号公馆', '1室 1厅 1卫', '', './upload/QQ截图20150504210220.png', '押一付三', '2700', '居住物业', '2015-05-04 21:05', '45', '整租房', '0', '壹号公馆 豪华装修(个人)  ', '3');

-- ----------------------------
-- Table structure for `t_impeach`
-- ----------------------------
DROP TABLE IF EXISTS `t_impeach`;
CREATE TABLE `t_impeach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(255) DEFAULT NULL,
  `resion` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `houseInfo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2lomrqlgjble9k9lx4xg096p2` (`houseInfo_id`),
  CONSTRAINT `FK_2lomrqlgjble9k9lx4xg096p2` FOREIGN KEY (`houseInfo_id`) REFERENCES `t_houseinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_impeach
-- ----------------------------
INSERT INTO `t_impeach` VALUES ('1', '2015-05-05 15:10', '房子是假的啊', '未审核', '4');

-- ----------------------------
-- Table structure for `t_rentalinformation`
-- ----------------------------
DROP TABLE IF EXISTS `t_rentalinformation`;
CREATE TABLE `t_rentalinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `householdType` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `latest_time` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `release_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_rentalinformation
-- ----------------------------
INSERT INTO `t_rentalinformation` VALUES ('1', '长沙天心区', '急租一室一厅', '一室一厅', '18942560376', '1000', '2015-04-05', '急租一室一厅急租一室一厅急租一室一厅急租一室一厅', '方先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('2', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('3', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('4', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('5', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('6', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('7', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('8', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('9', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('10', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('11', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('12', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('13', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('14', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('15', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('16', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('17', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('18', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('19', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('20', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('21', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('22', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('23', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('24', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('25', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('26', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('27', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('28', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('29', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('30', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('31', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('32', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('33', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('34', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('35', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('36', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('37', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('38', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('39', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('40', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('41', '长沙天心区', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('42', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('43', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('44', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('45', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('46', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('47', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('48', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('49', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('50', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('51', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('52', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('53', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('54', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('55', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('56', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('57', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('58', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('59', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('60', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');
INSERT INTO `t_rentalinformation` VALUES ('61', '晋中', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租，那么合租也行，要求设备齐全，有厨房，带卫生间，最好是陡岭小区，附近也可以，距离陡岭小区越近越好。如有房源，请联系我。联系我时，请说是在58同城上看到的，谢谢', '三室一厅', '18942560376', '1500', '三天后', '因本人在陡岭路附近培训，需租房一个月，如果没有独立的一室一厅一卫出租', '李先生', '2015-03-16 22:08');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `emailAddress` varchar(255) DEFAULT NULL,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `qqNumber` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `numbeOfPostings` int(11) NOT NULL,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '长沙', '32', '一名大学生', '1549690699@qq.com', 'fangleijiang', 'e10adc3949ba59abbe56e057f20f883e', '15243676422', '1549690699', '11', '男', '方雷江', '/upload/QQ图片20140506205740.jpg', '22', '个人');
INSERT INTO `t_user` VALUES ('2', '长沙', '45', '大学生求合租', '154969066@qq.com', 'wzj', 'e10adc3949ba59abbe56e057f20f883e', '15243676422', '154969066@qq.com', '25', '男', '万智军', '/upload/6159252dd42a2834b1c7cf5b59b5c9ea15cebf79.gif', '6', '个人');
INSERT INTO `t_user` VALUES ('3', '长沙', '15', '求合租', '142454363@qq.com', 'xiaohua', 'e10adc3949ba59abbe56e057f20f883e', '15434567890', '123141241', '42', '女', '小花', 'img/head_img/girl.png', '1', '个人');
INSERT INTO `t_user` VALUES ('4', '长沙', '15', '21412412', '15243675@qq.com', 'fang', 'e10adc3949ba59abbe56e057f20f883e', '15243676422', '41242343', '4', '男', '放肆元', 'img/head_img/boy.png', '0', '个人');
INSERT INTO `t_user` VALUES ('6', '长沙', '15', '你猜', 'ffew@qq.com', '123', 'e10adc3949ba59abbe56e057f20f883e', '15243675211', '312313123', '0', '男', '小明', 'img/head_img/boy.png', '0', '中介');
INSERT INTO `t_user` VALUES ('7', '湖南长沙', '27', '本人拥有大量房源', '1549690699@qq.com', 'user1', 'e10adc3949ba59abbe56e057f20f883e', '18942560376', '1549690699', '0', '男', '万志军', 'img/head_img/boy.png', '0', '个人');

-- ----------------------------
-- Table structure for `t_user_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_user`;
CREATE TABLE `t_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user1_id` int(11) DEFAULT NULL,
  `user2_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_r7g3s1wk3tcg0t9pm3hj58fvy` (`user1_id`),
  KEY `FK_cty31vw32ngsykhv4b4bl1c0p` (`user2_id`),
  CONSTRAINT `FK_cty31vw32ngsykhv4b4bl1c0p` FOREIGN KEY (`user2_id`) REFERENCES `t_user` (`id`),
  CONSTRAINT `FK_r7g3s1wk3tcg0t9pm3hj58fvy` FOREIGN KEY (`user1_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_user
-- ----------------------------
INSERT INTO `t_user_user` VALUES ('1', '2', '4');
INSERT INTO `t_user_user` VALUES ('2', '2', '1');

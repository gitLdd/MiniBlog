/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50554
Source Host           : localhost:3306
Source Database       : mini_blog

Target Server Type    : MYSQL
Target Server Version : 50554
File Encoding         : 65001

Date: 2018-06-12 21:34:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `text` longtext CHARACTER SET utf8 NOT NULL,
  `releaseDate` datetime NOT NULL,
  `zanNum` int(11) DEFAULT NULL,
  `talkNum` int(11) DEFAULT NULL,
  `label` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`tid`),
  KEY `发布人` (`uid`),
  CONSTRAINT `发布人` FOREIGN KEY (`uid`) REFERENCES `blogger` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '1', '标题啦啦啦啦啦啦啦啦啦......', '撒地方阿萨德阿士大夫阿萨德法撒旦发士大夫阿萨德发士大夫阿萨德发士大夫撒地方阿士大夫阿士大夫阿士大夫阿萨德反', '2018-01-19 11:03:51', '9999', '3', '测试');
INSERT INTO `blog` VALUES ('2', '1', '标题啊阿萨德', '卡拉时间和打法介绍的法律框架啊 阿士大夫阿士大夫阿士大夫阿士大夫阿士大夫阿士大夫', '2017-12-03 11:03:57', '99', '0', '测试');
INSERT INTO `blog` VALUES ('3', '1', '是地方比较阿', '阿萨德法撒旦反馈加班哈是考虑交电话费垃圾速度变化疯狂邻居阿苏打绿将哈萨克的链接发布哈师大反', '2017-12-05 11:04:30', '12', '0', '测试');
INSERT INTO `blog` VALUES ('4', '1', ' 撒地方', '啊私房话考虑将按时打发了恐惧爱上对方考虑ujhaskdljf哗啦声卡绝代风华栾克军阿士大夫刻录机嘎哈收到了付款京哈是老款的加班费李达康把交伙食费', '2017-12-07 11:04:57', '26', '0', '测试');
INSERT INTO `blog` VALUES ('5', '1', '按揭客户夸奖', '奥斯卡减肥哈是考虑将发货单垃圾卡合适的法律空降兵哈市的付款链接哈市考虑的基本覆盖辣椒水的办法绿卡就是固定部分两款就是噶的路费即可ghasdlflaskjdgf绿卡就是打个比方旅客将覆盖北师大两款机关法撒旦', '2017-12-09 11:05:20', '266', '0', '测试');
INSERT INTO `blog` VALUES ('7', '1', '卡哈师大十大', '阿士大夫健康良好爱上肯定两极分化爱上考虑交电话费爱上考虑的加班费辣椒水大发光火绿卡就是电话拜访离开教室嘎哈的反', '2017-12-13 11:06:00', '678', '0', '测试');
INSERT INTO `blog` VALUES ('8', '1', '爱上爱上爱上', '爱上房价肯定会安静时考虑的恢复栾克军啊哈撒反对金坷垃苏打绿反馈讲噶是老款的减肥', '2017-12-15 11:06:19', '145', '1', '测试');
INSERT INTO `blog` VALUES ('9', '1', '爱上爱上撒地', '十大发士大夫阿士大夫阿士大夫就辣椒水库和地方凉快结婚噶苏打绿反馈绿卡是决定和部分绿卡就是被官方活动冷酷阿士大夫', '2017-12-17 11:06:41', '156', '0', '测试');
INSERT INTO `blog` VALUES ('10', '1', '夸奖hi级教你', '将考虑将撒谎的反栾克军暗红色的考虑将暗示过很发达栾克军撒很发达栾克军个撒地方栾克军嘎哈十大', '2017-12-19 11:07:07', '486', '0', '测试');
INSERT INTO `blog` VALUES ('11', '1', '俺考虑接受拉', '撒大家快来哈就是考虑大发光火栾克军嘎哈十大法律框架考虑将改变哈师大老客户把斯大林覆盖率', '2017-12-21 11:07:27', '168', '0', '测试');
INSERT INTO `blog` VALUES ('12', '1', '爱上爱上对的', '撒大家快来噶熟练度发个栾克军噶撒地方两款价格八十多两款就是噶好的方立即噶撒地方', '2017-12-22 11:07:45', '489', '0', '测试');
INSERT INTO `blog` VALUES ('13', '2', '阿萨德速度f', '速度阿士大夫噶撒反对是发达撒地方暗室逢灯', '2017-12-22 11:35:52', '158', '0', '测试');
INSERT INTO `blog` VALUES ('14', '3', '丰盛的', '地方时富商大贾富商大贾', '2017-12-22 11:45:31', '9999', '0', '测试');
INSERT INTO `blog` VALUES ('16', '5', '你的哈', '垃圾收费的爱上肯定冷加工哈收到了尽快刚把撒地方', '2017-12-12 15:40:56', '456', '0', '测试');
INSERT INTO `blog` VALUES ('17', '6', '空间里挥洒搞得', '爱上考虑将地方官哈哈是客观的发布阿士大夫乱说肯定官方i安顺路大发光火', '2017-12-09 15:41:02', '658', '0', '测试');
INSERT INTO `blog` VALUES ('18', '7', '双方的理科计划', '就是肯定冷负荷考虑将按时换个地方考虑价格撒很发达考虑价格哈师大反冷静客观哈收到了反馈感觉', '2017-11-08 15:41:06', '156', '0', '测试');
INSERT INTO `blog` VALUES ('19', '8', '看，加速播放的爱讲话时看到', '撒旦发士大夫阿萨德阿士大夫阿士大夫', '2017-11-17 15:41:14', '7899', '0', '测试');
INSERT INTO `blog` VALUES ('20', '9', '撒旦发士大夫', '金坷垃是合法的栾克军噶撒地方两节课是嘎哈的疯狂邻居是古巴的福利巴萨的旅客擦拭东莞vblkasdbfkljasdgbhklsvbaj', '2017-12-09 15:41:19', '4563', '0', '测试');
INSERT INTO `blog` VALUES ('21', '10', '阿萨德', '爱上考虑将发货单阿斯利康的花费不高静安寺路口大法官', '2017-12-24 15:41:29', '4167', '0', '测试');
INSERT INTO `blog` VALUES ('22', '11', '阿萨德阿士大夫阿士大夫', '撒旦发生考虑决定关宏峰拉升空间大概发生肯定利君股份', '2017-12-25 15:41:33', '417', '0', '测试');
INSERT INTO `blog` VALUES ('23', '12', '阿萨德刚hi爱上吕迪格反', '3阿士大夫6847651阿萨德fasd638f74阿萨德', '2017-12-05 15:41:37', '456', '0', '测试');
INSERT INTO `blog` VALUES ('24', '6', '撒旦阿士大夫阿士大夫', '阿萨德阿士大夫尽快，爱帅哥的法律巴萨的讲话靠爆发力', '2017-12-31 15:41:41', '1678', '0', '测试');
INSERT INTO `blog` VALUES ('25', '10', '最新的', '爱上大是大非撒地方阿士大夫阿萨德', '2017-12-23 13:00:16', '489', '0', '测试');
INSERT INTO `blog` VALUES ('26', '9', '新新新新新', '是发达阿萨德法撒旦阿士大夫暗室逢灯', '2017-12-23 13:01:41', '596', '0', '测试');
INSERT INTO `blog` VALUES ('27', '2', '最热博文榜第一', '考虑将哈市栾克军啊哈撒反对垃圾卡哈师大反陆家撒地方路公交哈师大', '2017-12-23 14:49:50', '999', '0', '测试');
INSERT INTO `blog` VALUES ('28', '21', '最新最热博文', '是大法官哈师大反合适的合适的哈师大', '2018-05-01 16:00:06', '9999', '5', '测试');
INSERT INTO `blog` VALUES ('29', '21', '嘻嘻嘻', '收到合适的话是大法官', '2017-12-24 16:01:07', '1', '0', '测试');
INSERT INTO `blog` VALUES ('30', '14', '啦啦啦蜜雪冰城', '按时发噶所噶所噶是个大事', '2017-12-24 16:02:18', '99999', '0', '测试');
INSERT INTO `blog` VALUES ('31', '1', '文章发布测试', '现在时间是 <font color=\"#FD01E7\">2017年12月26日14:01:52<br><font color=\"#000000\">我的域名是 <a href=\"http://www.luxinda.xin\" target=\"_blank\">卢欣达</a></font><br></font>wode touxiang <img src=\"http://localhost:8888/MiniBlogFiles/BlogIMG/aa305fd4-853e-433f-be81-c1b5356db6ba.jpg\" style=\"max-width: 100%;\" width=\"26\" height=\"26\"><br>\r\n\r\n嘻嘻<span>?</span>', '2017-12-26 14:03:38', '999999', '0', '测试 时间 超链接');
INSERT INTO `blog` VALUES ('32', '21', '测试测试', '阿士大夫', '2018-01-12 12:14:41', '999', '1', '嘻嘻 啦啦');
INSERT INTO `blog` VALUES ('33', '1', '注入测试', 'html注入测试<br>&lt;script type=\"text/javascript\"&gt;alert(\"xxxxxxxxx\");&lt;/script&gt;', '2018-01-03 14:20:51', '0', '6', '测试 HTML注入');
INSERT INTO `blog` VALUES ('34', '1', '标签为空测试', '<p>标签为空测试</p><p>标签为空测试</p><p>标签为空测试</p>', '2018-01-03 14:26:44', '0', '0', '无');
INSERT INTO `blog` VALUES ('35', '1', '标签为空', '<p>标签为空 <br></p><p>标签为空 <br></p><p>标签为空 <br></p><p>标签为空</p>', '2018-01-03 14:29:09', '0', '0', '无');
INSERT INTO `blog` VALUES ('37', '1', '图片测试', '<p align=\"center\">这是史迪仔<img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/19/heia_org.gif\" alt=\"[偷笑]\" data-w-e=\"1\"></p><p align=\"center\"><img src=\"http://localhost:8888/MiniBlogFiles/BlogIMG/e11a6e7d-568f-4308-af9a-cc8e990b21c9.png\" style=\"max-width:100%;\"></p>', '2018-01-04 18:47:51', '0', '2', '史迪仔');
INSERT INTO `blog` VALUES ('38', '1', 'Maven环境发布测试', '<p><br><img src=\"http://192.168.25.133/group1/M00/00/01/wKgZhVsfst-ALQu_AABk_1sA-yA787.jpg\" style=\"max-width: 100%;\" height=\"61\" width=\"61\">这 就是三星Note 8 <img src=\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/40/pcmoren_tian_org.png\" alt=\"[舔屏]\" data-w-e=\"1\">\r\n\r\n<img src=\"file:///C:\\Users\\Ldd\\AppData\\Local\\Temp\\SGTpbq\\6992\\44072F6A.gif\">\r\n\r\n\r\n</p>', '2018-06-12 19:48:46', '0', '1', '三星 手机 Note8');

-- ----------------------------
-- Table structure for blogger
-- ----------------------------
DROP TABLE IF EXISTS `blogger`;
CREATE TABLE `blogger` (
  `uid` int(50) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NOT NULL,
  `password` varchar(255) CHARACTER SET gb2312 COLLATE gb2312_bin NOT NULL,
  `sex` varchar(255) DEFAULT '未知',
  `nick` varchar(255) DEFAULT 'MiniBlog用户',
  `shanchang` varchar(255) NOT NULL DEFAULT '未知',
  `geqian` varchar(255) DEFAULT '这个人很神秘，没有添加个人描述',
  `fileName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `nick` (`nick`),
  KEY `fileName` (`fileName`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of blogger
-- ----------------------------
INSERT INTO `blogger` VALUES ('1', '937043917@qq.com', '8141689ec5876709673df16bdcc162e1', '男', '神父', 'JavaScript', '命中有时终须有 命中无时莫强求', 'lxd');
INSERT INTO `blogger` VALUES ('2', '2435352046@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '男', 'Oxygen1', 'JavaSE', '这个人很神秘，没有添加个人描述', 'lxd');
INSERT INTO `blogger` VALUES ('3', '2900069697@qq.com', 'c4ca4238a0b923820dcc509a6f75849b', '男', 'Oxygen2', 'JavaScript', '这个人很神秘，没有添加个人描述', 'lxd');
INSERT INTO `blogger` VALUES ('5', '1475421941@qq.com', '8141689ec5876709673df16bdcc162e1', '男', 'Oxygen3', 'MySQL', '这个人很神秘，没有添加个人描述', 'lxd');
INSERT INTO `blogger` VALUES ('6', '1475421942@qq.com', '8141689ec5876709673df16bdcc162e1', '男', 'Oxygen4', 'HTML+CSS', '这个人很神秘，没有添加个人描述', 'lxd');
INSERT INTO `blogger` VALUES ('7', '1316635026@qq.com', '4782cdd2c3a5529e0c4b53bbfff0220f', '男', '卢彦丰', '未知', 'No pains,No gains.', 'lyf');
INSERT INTO `blogger` VALUES ('8', '1363688579@qq.com', '184e99f28a23fb3036e42d82dc2f2393', '男', '胡浩洋', '未知', '回味无限，往事如烟', 'hhy');
INSERT INTO `blogger` VALUES ('9', '929490788@qq.com', 'fd739de3cac51e98a3454528f0e98074', '女', '李一含', '未知', 'Eager', 'lyh');
INSERT INTO `blogger` VALUES ('10', '970738634@qq.com', 'e731df1fa3f11033104d50e53e3382c6', '女', '李若琳', '未知', '这个人很神秘，没有添加个人描述', 'lrl');
INSERT INTO `blogger` VALUES ('11', '97146846@qq.com', '5ae99832f789ad64562ec999fa571560', '未知', '用户0a546d', '未知', '这个人很神秘，没有添加个人描述', 'lxd');
INSERT INTO `blogger` VALUES ('12', '935160637@qq.com', 'b7001e8b9f8480fc196e9a94e307103e', '未知', '用户1sfd26', '未知', '这个人很神秘，没有添加个人描述', 'lxd');
INSERT INTO `blogger` VALUES ('13', 'asamunaicha@qq.com', '4aab3a68a7251d3d69e5cd730d71c1a1', '女', '阿萨姆奶茶', '未知', '统一奶茶 阿萨姆', 'default_female');
INSERT INTO `blogger` VALUES ('14', 'mixuebingchengnaicha@qq.com', '0f1c4f8341cd986d1c8e4cd25a256bf7', '女', '蜜雪冰城', '未知', '这个人很神秘，没有添加个人描述', 'default_female');
INSERT INTO `blogger` VALUES ('15', 'tongyibinghongcha@qq.com', 'fa115637f3f21dcd984a40d3051bd2ad', '男', '用户56aca', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('16', 'woxihuanni@qq.com', 'faf45f7c0226e69469ac289489834e00', '男', '用户65ds1', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('17', 'jiamiceshi@qq.com', 'f516a439a2318a4d68e9c11c9d03acd3', '男', '用户33ad6', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('19', 'kszcmmjm@qq.com', '474b960219b460567718ffcc0c45389b', '男', '用户4e638', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('20', '123456@qq.com', '35de170fc7836ea645e1a7d7b307ff6e', '男', '用户3b424', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('21', 'skdjhfg@163.com', '42f003eeeaec39eeeb7406a37772ee61', '男', '用户62877e', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('22', 'asgfagsasg@aa.acas', 'de5e8a227f1ea61f975de7c154345adf', '男', '用户646f6f', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('25', '55555@qq.com', '46e3a2b0a018ebf7562bf8492611d568', '男', '用户094f58', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('26', '11111@qq.com', '6b63ece637719ce33673a96f12731c0e', '男', '用户f1c09d', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('27', '111@123.com', '6846860684f05029abccc09a53cd66f1', '女', '111', '未知', '11111', 'default_female');
INSERT INTO `blogger` VALUES ('28', '5555555@qq.com', 'dbb7f8d1f4838a7c741aaa4d69ef7ae9', '男', '用户afd7d9', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('29', 'sssssss@qq.com', 'c67fe2b0e347a3147f7b4dd5aca3417e', '男', '那就叫我神父吧', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('30', '123456789@qq.com', '315be36db8ad7b3e3a7bb0839d6fa839', '男', '用户202834', '未知', '这个人很神秘，没有添加个人描述', 'default_male');
INSERT INTO `blogger` VALUES ('31', '999999@qq.com', '74e28cdb1c13003b39a491d9b825e9b0', '男', '用户da9654', '未知', '这个人很神秘，没有添加个人描述', 'default_male');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `unick` varchar(255) NOT NULL,
  `ufileName` varchar(255) NOT NULL,
  PRIMARY KEY (`cid`),
  KEY `评论人id` (`uid`),
  KEY `评论文章id` (`tid`),
  KEY `评论人昵称` (`unick`),
  KEY `评论人头像` (`ufileName`),
  CONSTRAINT `评论文章id` FOREIGN KEY (`tid`) REFERENCES `blog` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `评论人id` FOREIGN KEY (`uid`) REFERENCES `blogger` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `评论人头像` FOREIGN KEY (`ufileName`) REFERENCES `blogger` (`fileName`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `评论人昵称` FOREIGN KEY (`unick`) REFERENCES `blogger` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '1', 'xixixixi', '2018-01-01 15:34:01', '神父', 'lxd');
INSERT INTO `comment` VALUES ('2', '1', '1', 'xixixixi', '2018-01-02 15:34:01', '神父', 'lxd');
INSERT INTO `comment` VALUES ('3', '1', '1', 'xixixixi', '2018-01-03 15:34:01', '神父', 'lxd');
INSERT INTO `comment` VALUES ('4', '28', '1', '呀呀呀呀呀', '2018-01-03 15:58:06', '神父', 'lxd');
INSERT INTO `comment` VALUES ('5', '28', '1', '新嘻嘻嘻', '2018-01-03 15:58:44', '神父', 'lxd');
INSERT INTO `comment` VALUES ('6', '28', '1', '咿呀呦 咿呀呦', '2018-01-03 15:59:01', '神父', 'lxd');
INSERT INTO `comment` VALUES ('7', '33', '1', '注入测试<script type=\"text/javascript\">alert(\"xxxxxxxxx\");</script>', '2018-01-03 16:09:30', '神父', 'lxd');
INSERT INTO `comment` VALUES ('8', '33', '1', '我是作者', '2018-01-03 16:43:55', '神父', 'lxd');
INSERT INTO `comment` VALUES ('9', '33', '2', '嘻嘻嘻啊', '2018-01-03 16:44:21', 'Oxygen1', 'lxd');
INSERT INTO `comment` VALUES ('11', '33', '2', '1234125', '2018-01-03 16:57:14', 'Oxygen1', 'lxd');
INSERT INTO `comment` VALUES ('12', '33', '26', '嘻嘻嘻(*^__^*) 嘻嘻……', '2018-01-03 16:59:42', '用户f1c09d', 'default_male');
INSERT INTO `comment` VALUES ('14', '8', '1', 'hahaha', '2018-01-03 18:19:44', '神父', 'lxd');
INSERT INTO `comment` VALUES ('15', '33', '1', '/javascript\">alert(\"xxxxxxxxx\")', '2018-01-04 17:33:19', '神父', 'lxd');
INSERT INTO `comment` VALUES ('16', '28', '1', 'sdsddssdsdsd', '2018-01-04 17:33:47', '神父', 'lxd');
INSERT INTO `comment` VALUES ('17', '37', '1', '史迪仔 是真的强！', '2018-03-05 17:05:50', '神父', 'lxd');
INSERT INTO `comment` VALUES ('18', '37', '1', '强个鸡儿哦', '2018-03-05 17:06:01', '神父', 'lxd');
INSERT INTO `comment` VALUES ('19', '28', '1', '啊', '2018-06-12 18:28:38', '神父', 'lxd');
INSERT INTO `comment` VALUES ('20', '32', '1', '嘻嘻嘻', '2018-06-12 19:47:32', '神父', 'lxd');
INSERT INTO `comment` VALUES ('21', '38', '1', '牛批牛批', '2018-06-12 19:49:02', '神父', 'lxd');

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `youxiang` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of contact
-- ----------------------------

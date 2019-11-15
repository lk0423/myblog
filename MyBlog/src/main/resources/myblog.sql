/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50643
Source Host           : localhost:3306
Source Database       : myblog

Target Server Type    : MYSQL
Target Server Version : 50643
File Encoding         : 65001

Date: 2019-11-15 16:06:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for archives
-- ----------------------------
DROP TABLE IF EXISTS `archives`;
CREATE TABLE `archives` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archiveName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archives
-- ----------------------------
INSERT INTO `archives` VALUES ('3', '2019年11月');

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` bigint(20) NOT NULL,
  `author` varchar(255) NOT NULL,
  `originalAuthor` varchar(255) NOT NULL,
  `articleTitle` varchar(255) NOT NULL,
  `articleContent` longtext NOT NULL,
  `articleTags` varchar(255) NOT NULL,
  `articleType` varchar(255) NOT NULL,
  `articleCategories` varchar(255) NOT NULL,
  `publishDate` varchar(255) NOT NULL,
  `updateDate` varchar(255) NOT NULL,
  `articleUrl` varchar(255) NOT NULL,
  `articleTabloid` text NOT NULL,
  `likes` int(11) NOT NULL,
  `lastArticleId` bigint(20) DEFAULT NULL,
  `nextArticleId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('4', '1573561260', ' LK', ' LK', '中国合伙人语录', '#####成东青有这样一段话：\n  - “我从来就没有什么梦想，我也不知道什么是梦想，我只知道什么是失败。中国的学生是全世界学生里最容易失败的。因为你们面临的是全世界最残酷的考试，从初中到高中是44.1%，也就是说有近600万人失败了，从高中考大学的升学率是39.9%……失败无处不在，人生如此绝望，这就是现实！掉在水里你不会淹死，呆在水里你才会淹死，你只有游出去。那些从一开始就选择放弃的人他不会失败，因为他们从一开始就失败了。失败并不可怕，害怕失败才真正可怕。我们只有从失败中寻找胜利，在绝望中，寻求希望。”', '电影,理想,原创', '原创', '电影', '2019-11-12', '2019-11-12', 'https://www.zhyocean.cn/article/1573561260', '成东青有这样一段话：“我从来就没有什么梦想，我也不知道什么是梦想，我只知道什么是失败。中国的学生是全世界学生里最容易失败的。因为你们面临的是全世界最残酷的考试，从初中到高中是44.1%，也就是说有近600万人失败了，从高中考大学的升学率是39.9%……失败无处不在，人生如此绝望，这就是现实！掉在水里你不会淹死，呆在水里你才会淹死，你只有游出去。那些从一开始就选择放弃的人他不会失败，因为他们从...', '0', '0', '1573561358');
INSERT INTO `article` VALUES ('5', '1573561358', ' LK', 'LK', '解决win10下MySQL登录时遇到Access denied for user \'root\'@\'localhost\' (using password: YES)的问题', '\n\n  **一。首先** 当输入\n     \n     mysql -uroot -p\n\n   再输入密码时，遇到了这个情况\n\n     Access denied for user \'root\'@\'localhost\' (using password: YES)\n 在网上找了很多解决办法，但是基本只有一个，在.ini文件中的mysqld条目添加\n\n	skip-grant-tables\n然后重启服务器，再按照刚刚的步骤再来一遍（最后不输入密码），但是还是一条语句把我拦了下来\n\n	Access denied for user \'root\'@\'localhost\' (using password: NO)\n\n\n **二。那么**\n\n\n\n\n\n   总体上的思想还是修改.ini配置文件的内容，不过是通过命令行的形式修改，不知道是不是因为版本迭代了把以前那个直接修改文件的方法屏蔽了，无论如何，通过命令行修改在MySQL 8.0上是可以的。\n\n   下面开始吧。\n\n   1.以管理员身份打开cmd，切换到MySQL的bin目录\n\n\n\n   2.关闭MySQL服务器\n\n	net stop mysql\n\n\n   3.跳过输入密码的步骤\n\n	mysqld --defaults-file=\"D:\\MySQL\\my.ini\" --console --skip-grant-tables\n  （注意：文件名字与路径要与自己的吻合）\n\n\n     \n\n   4.重启服务器\n\n	net start mysql\n\n\n   5.登录MySQL服务器\n\n	mysql -uroot -p\n   输入密码之后就能登录成功了。\n\n\n\n\n   到这一步差不多就能完成了，当输入\n\n	show databases;  \n正常，则完毕，若  MySQL的反馈是：\n\n	You must reset your password using ALTER USER statement before executing this statement.\n   应该是MySQL认为安装时提供的随机密码不安全，让用户重置密码。\n\n   找到的现成办法\n\n   参考文章：https://dev.mysql.com/doc/refman/5.7/en/alter-user.html\n\n        密码永不过期的\n\nALTER USER \'root\'@\'localhost\' IDENTIFIED BY \'新密码\' PASSWORD EXPIRE NEVER;\n        密码有限期的\n\nALTER USER \'root\'@\'localhost\' IDENTIFIED BY \'新密码\' PASSWORD EXPIRE;\n\n\n        然后重新登录一下服务器就能正常的操作了。\n\n\n原文地址：https://blog.csdn.net/cartoon_/article/details/80344637', 'mysql,转载', '转载', '数据库', '2019-11-12', '2019-11-12', 'https://blog.csdn.net/cartoon_/article/details/80344637', '一。首先当输入再输入密码时，遇到了这个情况在网上找了很多解决办法，但是基本只有一个，在.ini文件中的mysqld条目添加然后重启服务器，再按照刚刚的步骤再来一遍（最后不输入密码），但是还是一条语句把我拦了下来二。那么总体上的思想还是修改.ini配置文件的内容，不过是通过命令行的形式修改，不知道是不是因为版本迭代了把以前那个直接修改文件的方法屏蔽了，无论如何，通过命令行修改在MySQL8.0...', '1', '1573561260', '0');

-- ----------------------------
-- Table structure for article_likes_record
-- ----------------------------
DROP TABLE IF EXISTS `article_likes_record`;
CREATE TABLE `article_likes_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` bigint(20) NOT NULL,
  `likerId` int(11) NOT NULL,
  `likeDate` varchar(255) NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article_likes_record
-- ----------------------------
INSERT INTO `article_likes_record` VALUES ('2', '1533196734', '1', '2018-08-02 21:24', '0');
INSERT INTO `article_likes_record` VALUES ('3', '1573561358', '1', '2019-11-12 21:40', '1');

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('3', '人生');
INSERT INTO `categories` VALUES ('4', 'Java');
INSERT INTO `categories` VALUES ('5', 'python');
INSERT INTO `categories` VALUES ('6', '数据库');
INSERT INTO `categories` VALUES ('7', '小技巧');
INSERT INTO `categories` VALUES ('8', '感悟');
INSERT INTO `categories` VALUES ('9', '电影');

-- ----------------------------
-- Table structure for comment_likes_record
-- ----------------------------
DROP TABLE IF EXISTS `comment_likes_record`;
CREATE TABLE `comment_likes_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` bigint(20) NOT NULL,
  `pId` int(11) NOT NULL,
  `likerId` int(11) NOT NULL,
  `likeDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_likes_record
-- ----------------------------

-- ----------------------------
-- Table structure for comment_record
-- ----------------------------
DROP TABLE IF EXISTS `comment_record`;
CREATE TABLE `comment_record` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pId` bigint(20) NOT NULL,
  `articleId` bigint(20) NOT NULL,
  `answererId` int(11) NOT NULL,
  `respondentId` int(11) NOT NULL,
  `commentDate` varchar(255) NOT NULL,
  `likes` int(255) NOT NULL,
  `commentContent` text NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_record
-- ----------------------------
INSERT INTO `comment_record` VALUES ('2', '0', '1533196734', '1', '1', '2018-08-03 00:13', '1', '测试评论功能，嘻嘻嘻', '0');
INSERT INTO `comment_record` VALUES ('3', '2', '1533196734', '1', '1', '2018-08-03 00:15', '0', '一切正常，哈哈哈', '0');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedbackContent` text NOT NULL,
  `contactInfo` varchar(255) DEFAULT NULL,
  `personId` int(11) NOT NULL,
  `feedbackDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------

-- ----------------------------
-- Table structure for friendlink
-- ----------------------------
DROP TABLE IF EXISTS `friendlink`;
CREATE TABLE `friendlink` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogger` varchar(40) NOT NULL,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of friendlink
-- ----------------------------
INSERT INTO `friendlink` VALUES ('1', 'naget的小屋', 'https://naget.github.io');
INSERT INTO `friendlink` VALUES ('2', 'Li Pan\'s 博客', 'http://www.lipan.xyz');
INSERT INTO `friendlink` VALUES ('3', '陈晓雷个人博客', 'http://www.csxll.top');
INSERT INTO `friendlink` VALUES ('4', 'SAn Blog', 'https://sanii.cn');
INSERT INTO `friendlink` VALUES ('5', '会打篮球的程序猿', 'http://www.liuzhaopo.top');
INSERT INTO `friendlink` VALUES ('6', 'Mr_曾中杰', 'https://www.zengzhongjie.com');
INSERT INTO `friendlink` VALUES ('7', '去当CTO', 'https://www.qdcto.com');
INSERT INTO `friendlink` VALUES ('8', 'Face2Object', 'https://www.bossding.com.cn');
INSERT INTO `friendlink` VALUES ('9', '小海博客', 'https://www.celess.cn');
INSERT INTO `friendlink` VALUES ('10', '枫之羽', 'http://fzhiy.com');

-- ----------------------------
-- Table structure for leave_message_likes_record
-- ----------------------------
DROP TABLE IF EXISTS `leave_message_likes_record`;
CREATE TABLE `leave_message_likes_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(255) NOT NULL,
  `pId` int(11) NOT NULL,
  `likerId` int(11) NOT NULL,
  `likeDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_message_likes_record
-- ----------------------------

-- ----------------------------
-- Table structure for leave_message_record
-- ----------------------------
DROP TABLE IF EXISTS `leave_message_record`;
CREATE TABLE `leave_message_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(255) NOT NULL,
  `pId` int(255) NOT NULL,
  `answererId` int(11) NOT NULL,
  `respondentId` int(11) NOT NULL,
  `leaveMessageDate` varchar(255) NOT NULL,
  `likes` int(11) NOT NULL,
  `leaveMessageContent` text NOT NULL,
  `isRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of leave_message_record
-- ----------------------------
INSERT INTO `leave_message_record` VALUES ('14', 'categories', '0', '1', '1', '2018-09-19 13:53', '0', '分类留言测试', '0');
INSERT INTO `leave_message_record` VALUES ('15', 'archives', '0', '1', '1', '2018-09-19 13:53', '0', '归档留言', '0');
INSERT INTO `leave_message_record` VALUES ('16', 'tags', '0', '1', '1', '2018-09-19 13:53', '0', '标签留言', '0');
INSERT INTO `leave_message_record` VALUES ('17', 'update', '0', '1', '1', '2018-09-19 13:53', '0', '更新留言', '0');
INSERT INTO `leave_message_record` VALUES ('18', 'friendlylink', '0', '1', '1', '2018-09-19 13:54', '0', '需要添加友链的朋友可在www.zhyocean.cn/friendlylink下方留言（网站名称+网址），随后验证后会在本人博客中添加友链链接', '0');

-- ----------------------------
-- Table structure for privateword
-- ----------------------------
DROP TABLE IF EXISTS `privateword`;
CREATE TABLE `privateword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `privateWord` varchar(255) NOT NULL,
  `publisherId` varchar(255) NOT NULL,
  `replierId` varchar(255) DEFAULT NULL,
  `replyContent` varchar(255) DEFAULT NULL,
  `publisherDate` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privateword
-- ----------------------------
INSERT INTO `privateword` VALUES ('8', '悄悄话测试', '1', '0', null, '2018-09-19 14:13:32');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'ROLE_USER');
INSERT INTO `role` VALUES ('2', 'ROLE_ADMIN');
INSERT INTO `role` VALUES ('3', 'ROLE_SUPERADMIN');

-- ----------------------------
-- Table structure for tags
-- ----------------------------
DROP TABLE IF EXISTS `tags`;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL,
  `tagSize` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tags
-- ----------------------------
INSERT INTO `tags` VALUES ('21', '电影', '12');
INSERT INTO `tags` VALUES ('22', '理想', '12');
INSERT INTO `tags` VALUES ('23', '原创', '12');
INSERT INTO `tags` VALUES ('24', 'mysql', '12');
INSERT INTO `tags` VALUES ('25', '转载', '12');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` char(255) NOT NULL,
  `trueName` varchar(255) DEFAULT NULL,
  `birthday` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personalBrief` varchar(255) DEFAULT NULL,
  `avatarImgUrl` text NOT NULL,
  `recentlyLanded` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '17364527412', ' LK', 'a3caed36f0fe5a01e5f144db8927235e', 'men', 'LK', '1999-06-06', '3431780376@qq.com', '', 'img/lk.jpg', '2019-11-15 09:43:10');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `User_id` int(11) NOT NULL,
  `Role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1');
INSERT INTO `user_role` VALUES ('1', '2');
INSERT INTO `user_role` VALUES ('1', '3');

-- ----------------------------
-- Table structure for visitor
-- ----------------------------
DROP TABLE IF EXISTS `visitor`;
CREATE TABLE `visitor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `visitorNum` bigint(20) NOT NULL,
  `pageName` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visitor
-- ----------------------------
INSERT INTO `visitor` VALUES ('8', '0', 'article/1573561260');
INSERT INTO `visitor` VALUES ('9', '0', 'article/1573561358');

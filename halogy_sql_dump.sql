-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.24 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-06-13 17:32:07
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for halogy
DROP DATABASE IF EXISTS `halogy`;
CREATE DATABASE IF NOT EXISTS `halogy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `halogy`;


-- Dumping structure for table halogy.ha_blog_catmap
DROP TABLE IF EXISTS `ha_blog_catmap`;
CREATE TABLE IF NOT EXISTS `ha_blog_catmap` (
  `catID` int(11) NOT NULL DEFAULT '0',
  `postID` int(11) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`catID`,`postID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_blog_catmap: 0 rows
/*!40000 ALTER TABLE `ha_blog_catmap` DISABLE KEYS */;
REPLACE INTO `ha_blog_catmap` (`catID`, `postID`, `siteID`) VALUES
	(1, 1, 1);
/*!40000 ALTER TABLE `ha_blog_catmap` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_blog_cats
DROP TABLE IF EXISTS `ha_blog_cats`;
CREATE TABLE IF NOT EXISTS `ha_blog_cats` (
  `catID` int(11) NOT NULL AUTO_INCREMENT,
  `catName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catSafe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `catOrder` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_blog_cats: 0 rows
/*!40000 ALTER TABLE `ha_blog_cats` DISABLE KEYS */;
REPLACE INTO `ha_blog_cats` (`catID`, `catName`, `catSafe`, `dateCreated`, `catOrder`, `deleted`, `siteID`) VALUES
	(1, 'Hi! I\'m Mac.', 'hi-im-mac', '2012-06-13 20:08:12', NULL, 0, 1);
/*!40000 ALTER TABLE `ha_blog_cats` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_blog_comments
DROP TABLE IF EXISTS `ha_blog_comments`;
CREATE TABLE IF NOT EXISTS `ha_blog_comments` (
  `commentID` int(11) NOT NULL AUTO_INCREMENT,
  `postID` int(11) NOT NULL DEFAULT '0',
  `dateCreated` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `comment` text COLLATE utf8_unicode_ci,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_blog_comments: 0 rows
/*!40000 ALTER TABLE `ha_blog_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_blog_comments` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_blog_posts
DROP TABLE IF EXISTS `ha_blog_posts`;
CREATE TABLE IF NOT EXISTS `ha_blog_posts` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `postTitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uri` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `excerpt` text COLLATE utf8_unicode_ci,
  `userID` int(11) DEFAULT NULL,
  `tags` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '1',
  `allowComments` tinyint(1) NOT NULL DEFAULT '1',
  `allowPings` tinyint(1) NOT NULL DEFAULT '1',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_blog_posts: 0 rows
/*!40000 ALTER TABLE `ha_blog_posts` DISABLE KEYS */;
REPLACE INTO `ha_blog_posts` (`postID`, `postTitle`, `dateCreated`, `dateModified`, `uri`, `body`, `excerpt`, `userID`, `tags`, `published`, `allowComments`, `allowPings`, `views`, `deleted`, `siteID`) VALUES
	(1, 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore', '2012-06-13 20:09:20', '2012-06-13 17:09:20', 'lorem-ipsum-dolor-sit-amet-consectetur-adipisicing-elit-sed-do-eiusmod-tempor-incididunt-ut-labore-e', '**Lorem ipsum** dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\r\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\r\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\r\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\r\ncillum dolore eu fugiat nulla pariatur. *Excepteur*sint occaecat cupidatat non\r\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '', 1, '', 1, 1, 1, 1, 0, 1);
/*!40000 ALTER TABLE `ha_blog_posts` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_captcha
DROP TABLE IF EXISTS `ha_captcha`;
CREATE TABLE IF NOT EXISTS `ha_captcha` (
  `captcha_id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `captcha_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `word` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`captcha_id`),
  KEY `word` (`word`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_captcha: 0 rows
/*!40000 ALTER TABLE `ha_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_captcha` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_ci_sessions
DROP TABLE IF EXISTS `ha_ci_sessions`;
CREATE TABLE IF NOT EXISTS `ha_ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `user_agent` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_ci_sessions: 0 rows
/*!40000 ALTER TABLE `ha_ci_sessions` DISABLE KEYS */;
REPLACE INTO `ha_ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
	('c52fdb65706613701f4c371eceb78f5b', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KH', 1339618944, 'a:54:{s:9:"user_data";s:0:"";s:8:"lastPage";s:29:"http://localhost/halogy/admin";s:6:"userID";s:1:"1";s:8:"username";s:9:"superuser";s:7:"groupID";s:2:"-1";s:5:"email";s:0:"";s:12:"subscription";s:1:"Y";s:10:"subscribed";s:1:"0";s:4:"plan";s:1:"0";s:7:"bounced";s:1:"0";s:11:"dateCreated";s:19:"2012-06-13 15:54:31";s:12:"dateModified";s:19:"2012-06-13 15:54:31";s:11:"displayName";N;s:9:"firstName";s:5:"Admin";s:8:"lastName";N;s:8:"address1";N;s:8:"address2";N;s:8:"address3";N;s:4:"city";N;s:5:"state";N;s:8:"postcode";N;s:7:"country";N;s:8:"currency";s:3:"USD";s:15:"billingAddress1";N;s:15:"billingAddress2";N;s:15:"billingAddress3";N;s:11:"billingCity";N;s:12:"billingState";N;s:15:"billingPostcode";N;s:14:"billingCountry";N;s:5:"phone";N;s:6:"avatar";N;s:9:"signature";N;s:3:"bio";s:0:"";s:11:"companyName";N;s:12:"companyEmail";N;s:14:"companyWebsite";N;s:18:"companyDescription";N;s:11:"companyLogo";N;s:8:"language";s:7:"english";s:5:"posts";s:1:"0";s:5:"kudos";s:1:"0";s:13:"notifications";s:1:"1";s:7:"privacy";s:1:"V";s:8:"resetkey";N;s:9:"lastLogin";s:19:"0000-00-00 00:00:00";s:7:"custom1";N;s:7:"custom2";N;s:7:"custom3";N;s:7:"custom4";N;s:6:"active";s:1:"1";s:6:"siteID";N;s:12:"session_user";b:1;s:13:"session_admin";b:1;}');
/*!40000 ALTER TABLE `ha_ci_sessions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_community_messagemap
DROP TABLE IF EXISTS `ha_community_messagemap`;
CREATE TABLE IF NOT EXISTS `ha_community_messagemap` (
  `messageID` int(11) NOT NULL DEFAULT '0',
  `toUserID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `siteID` int(11) NOT NULL DEFAULT '0',
  `parentID` int(11) NOT NULL DEFAULT '0',
  `unread` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`messageID`,`toUserID`,`userID`,`siteID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_community_messagemap: 0 rows
/*!40000 ALTER TABLE `ha_community_messagemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_community_messagemap` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_community_messages
DROP TABLE IF EXISTS `ha_community_messages`;
CREATE TABLE IF NOT EXISTS `ha_community_messages` (
  `messageID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`messageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_community_messages: 0 rows
/*!40000 ALTER TABLE `ha_community_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_community_messages` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_emails
DROP TABLE IF EXISTS `ha_emails`;
CREATE TABLE IF NOT EXISTS `ha_emails` (
  `emailID` int(11) NOT NULL AUTO_INCREMENT,
  `emailName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailSubject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bodyHTML` text COLLATE utf8_unicode_ci,
  `bodyText` text COLLATE utf8_unicode_ci,
  `campaignID` int(11) NOT NULL DEFAULT '0',
  `templateID` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateSent` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `listID` int(11) NOT NULL DEFAULT '0',
  `deploy` tinyint(1) NOT NULL DEFAULT '0',
  `deployDate` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `status` enum('D','S') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `sent` int(11) unsigned NOT NULL DEFAULT '0',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `clicks` int(11) unsigned NOT NULL DEFAULT '0',
  `unsubscribed` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`emailID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_emails: 0 rows
/*!40000 ALTER TABLE `ha_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_emails` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_blocks
DROP TABLE IF EXISTS `ha_email_blocks`;
CREATE TABLE IF NOT EXISTS `ha_email_blocks` (
  `blockID` int(11) NOT NULL AUTO_INCREMENT,
  `emailID` int(11) DEFAULT NULL,
  `blockRef` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`blockID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_blocks: 0 rows
/*!40000 ALTER TABLE `ha_email_blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_blocks` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_campaigns
DROP TABLE IF EXISTS `ha_email_campaigns`;
CREATE TABLE IF NOT EXISTS `ha_email_campaigns` (
  `campaignID` int(11) NOT NULL AUTO_INCREMENT,
  `campaignName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`campaignID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_campaigns: 0 rows
/*!40000 ALTER TABLE `ha_email_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_campaigns` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_deploy
DROP TABLE IF EXISTS `ha_email_deploy`;
CREATE TABLE IF NOT EXISTS `ha_email_deploy` (
  `deployID` int(11) NOT NULL AUTO_INCREMENT,
  `emailID` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `sent` tinyint(1) NOT NULL DEFAULT '0',
  `failed` tinyint(1) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`deployID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_deploy: 0 rows
/*!40000 ALTER TABLE `ha_email_deploy` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_deploy` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_includes
DROP TABLE IF EXISTS `ha_email_includes`;
CREATE TABLE IF NOT EXISTS `ha_email_includes` (
  `includeID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `includeRef` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`includeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_includes: 0 rows
/*!40000 ALTER TABLE `ha_email_includes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_includes` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_lists
DROP TABLE IF EXISTS `ha_email_lists`;
CREATE TABLE IF NOT EXISTS `ha_email_lists` (
  `listID` int(11) NOT NULL AUTO_INCREMENT,
  `listName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`listID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_lists: 0 rows
/*!40000 ALTER TABLE `ha_email_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_lists` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_list_subscribers
DROP TABLE IF EXISTS `ha_email_list_subscribers`;
CREATE TABLE IF NOT EXISTS `ha_email_list_subscribers` (
  `listID` int(11) NOT NULL DEFAULT '0',
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`listID`,`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_list_subscribers: 0 rows
/*!40000 ALTER TABLE `ha_email_list_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_list_subscribers` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_email_templates
DROP TABLE IF EXISTS `ha_email_templates`;
CREATE TABLE IF NOT EXISTS `ha_email_templates` (
  `templateID` int(11) NOT NULL AUTO_INCREMENT,
  `templateName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `linkStyle` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`templateID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_email_templates: 0 rows
/*!40000 ALTER TABLE `ha_email_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_email_templates` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_events
DROP TABLE IF EXISTS `ha_events`;
CREATE TABLE IF NOT EXISTS `ha_events` (
  `eventID` int(11) NOT NULL AUTO_INCREMENT,
  `eventTitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `eventDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `eventEnd` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `time` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `excerpt` text COLLATE utf8_unicode_ci,
  `userID` int(11) DEFAULT NULL,
  `groupID` int(11) NOT NULL DEFAULT '0',
  `tags` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `featured` tinyint(1) unsigned DEFAULT '0',
  `deleted` tinyint(1) unsigned DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`eventID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_events: 0 rows
/*!40000 ALTER TABLE `ha_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_events` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_files
DROP TABLE IF EXISTS `ha_files`;
CREATE TABLE IF NOT EXISTS `ha_files` (
  `fileID` int(11) NOT NULL AUTO_INCREMENT,
  `fileRef` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `folderID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`fileID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_files: 0 rows
/*!40000 ALTER TABLE `ha_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_files` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_file_folders
DROP TABLE IF EXISTS `ha_file_folders`;
CREATE TABLE IF NOT EXISTS `ha_file_folders` (
  `folderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentID` int(11) unsigned NOT NULL DEFAULT '0',
  `folderName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folderOrder` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`folderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_file_folders: 0 rows
/*!40000 ALTER TABLE `ha_file_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_file_folders` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_forums
DROP TABLE IF EXISTS `ha_forums`;
CREATE TABLE IF NOT EXISTS `ha_forums` (
  `forumID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `forumName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catID` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_unicode_ci,
  `topics` int(10) unsigned NOT NULL DEFAULT '0',
  `replies` int(10) unsigned NOT NULL DEFAULT '0',
  `lastPostID` int(11) DEFAULT NULL,
  `private` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `groupID` int(11) DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`forumID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_forums: 0 rows
/*!40000 ALTER TABLE `ha_forums` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_forums` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_forums_cats
DROP TABLE IF EXISTS `ha_forums_cats`;
CREATE TABLE IF NOT EXISTS `ha_forums_cats` (
  `catID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentID` int(11) unsigned NOT NULL DEFAULT '0',
  `catName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `catOrder` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_forums_cats: 0 rows
/*!40000 ALTER TABLE `ha_forums_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_forums_cats` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_forums_posts
DROP TABLE IF EXISTS `ha_forums_posts`;
CREATE TABLE IF NOT EXISTS `ha_forums_posts` (
  `postID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topicID` int(11) unsigned NOT NULL DEFAULT '0',
  `body` text COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`postID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_forums_posts: 0 rows
/*!40000 ALTER TABLE `ha_forums_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_forums_posts` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_forums_subs
DROP TABLE IF EXISTS `ha_forums_subs`;
CREATE TABLE IF NOT EXISTS `ha_forums_subs` (
  `topicID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`topicID`,`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_forums_subs: 0 rows
/*!40000 ALTER TABLE `ha_forums_subs` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_forums_subs` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_forums_topics
DROP TABLE IF EXISTS `ha_forums_topics`;
CREATE TABLE IF NOT EXISTS `ha_forums_topics` (
  `topicID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `forumID` int(11) unsigned NOT NULL DEFAULT '0',
  `topicTitle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `replies` int(11) unsigned NOT NULL DEFAULT '0',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `userID` int(11) DEFAULT NULL,
  `lastPostID` int(11) DEFAULT NULL,
  `sticky` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`topicID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_forums_topics: 0 rows
/*!40000 ALTER TABLE `ha_forums_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_forums_topics` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_images
DROP TABLE IF EXISTS `ha_images`;
CREATE TABLE IF NOT EXISTS `ha_images` (
  `imageID` int(11) NOT NULL AUTO_INCREMENT,
  `imageRef` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `imageName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folderID` int(11) NOT NULL DEFAULT '0',
  `groupID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) DEFAULT NULL,
  `class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filesize` int(11) NOT NULL DEFAULT '0',
  `maxsize` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_images: 0 rows
/*!40000 ALTER TABLE `ha_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_images` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_image_folders
DROP TABLE IF EXISTS `ha_image_folders`;
CREATE TABLE IF NOT EXISTS `ha_image_folders` (
  `folderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentID` int(11) unsigned NOT NULL DEFAULT '0',
  `folderName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `folderSafe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folderOrder` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`folderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_image_folders: 0 rows
/*!40000 ALTER TABLE `ha_image_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_image_folders` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_includes
DROP TABLE IF EXISTS `ha_includes`;
CREATE TABLE IF NOT EXISTS `ha_includes` (
  `includeID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `versionID` int(11) NOT NULL DEFAULT '0',
  `includeRef` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('H','C','J') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'H',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`includeID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_includes: 0 rows
/*!40000 ALTER TABLE `ha_includes` DISABLE KEYS */;
REPLACE INTO `ha_includes` (`includeID`, `dateCreated`, `dateModified`, `versionID`, `includeRef`, `type`, `deleted`, `siteID`) VALUES
	(1, '2012-06-13 19:22:48', '2012-06-13 16:22:48', 1, 'header', 'H', 0, 1),
	(2, '2012-06-13 19:22:48', '2012-06-13 20:24:49', 3, 'footer', 'H', 0, 1);
/*!40000 ALTER TABLE `ha_includes` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_include_versions
DROP TABLE IF EXISTS `ha_include_versions`;
CREATE TABLE IF NOT EXISTS `ha_include_versions` (
  `versionID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `objectID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_include_versions: 0 rows
/*!40000 ALTER TABLE `ha_include_versions` DISABLE KEYS */;
REPLACE INTO `ha_include_versions` (`versionID`, `dateCreated`, `objectID`, `userID`, `body`, `siteID`) VALUES
	(1, '2012-06-13 19:22:48', 1, 1, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"\n	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\n<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="">\n	<head>\n		<meta http-equiv="content-type" content="text/html; charset=utf-8" />\n		<title>{page:title}</title>\n\n		<meta name="keywords" content="{page:keywords}" />\n		<meta name="description" content="{page:description}" />\n\n		<link rel="stylesheet" href="http://static.halogy.com/css/newsite.css" type="text/css" />\n		\n	</head>\n	<body>\n	\n		<div class="logo">\n			<a href="/">\n				<img src="http://static.halogy.com/images/halogy_logo.png" id="logo" alt="Halogy" />\n			</a>			\n		</div>\n\n		<div class="main">\n			', 1),
	(2, '2012-06-13 19:22:48', 2, 1, '\n		</div>\n		\n		<div class="menu">\n			<ul>\n				{navigation}\n				<li><a href="/blog">Blog</a></li>\n				<li><a href="/shop">Shop</a></li>				<li><a href="/admin">Admin</a></li>\n			</ul>\n		</div>\n		\n		<center><p><small>Powered by <a href="http://www.halogy.com">Halogy</a></small></p>		\n	\n		\n	</body>\n</html>', 1),
	(3, '2012-06-13 20:24:49', 2, 1, '		</div>\n		\n		<div class="menu">\n			<ul>\n				{navigation}\n				<li><a href="/halogy/blog">Blog</a></li>\n				<li><a href="/halogy/shop">Shop</a></li>\n<li><a href="/halogy/admin">Admin</a></li>\n			</ul>\n		</div>\n		\n		<center><p><small>Powered by <a href="http://www.halogy.com">Halogy</a></small></p>		\n	\n		\n	</body>\n</html>', 1);
/*!40000 ALTER TABLE `ha_include_versions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_navigation
DROP TABLE IF EXISTS `ha_navigation`;
CREATE TABLE IF NOT EXISTS `ha_navigation` (
  `navID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `navName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `parentID` int(11) NOT NULL DEFAULT '0',
  `navOrder` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `siteID` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`navID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_navigation: 0 rows
/*!40000 ALTER TABLE `ha_navigation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_navigation` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_pages
DROP TABLE IF EXISTS `ha_pages`;
CREATE TABLE IF NOT EXISTS `ha_pages` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `versionID` int(11) NOT NULL DEFAULT '0',
  `pageName` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datePublished` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `uri` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `draftID` int(11) DEFAULT NULL,
  `templateID` int(11) DEFAULT NULL,
  `parentID` int(11) NOT NULL DEFAULT '0',
  `pageOrder` int(11) NOT NULL DEFAULT '0',
  `keywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `redirect` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  `navigation` tinyint(1) NOT NULL DEFAULT '1',
  `views` int(11) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`pageID`),
  KEY `uri` (`uri`),
  KEY `active` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_pages: 0 rows
/*!40000 ALTER TABLE `ha_pages` DISABLE KEYS */;
REPLACE INTO `ha_pages` (`pageID`, `versionID`, `pageName`, `dateCreated`, `dateModified`, `datePublished`, `title`, `active`, `uri`, `draftID`, `templateID`, `parentID`, `pageOrder`, `keywords`, `description`, `redirect`, `userID`, `groupID`, `navigation`, `views`, `deleted`, `siteID`) VALUES
	(1, 3, 'Home', '2012-06-13 19:22:48', '2012-06-13 20:19:14', '2012-06-13 20:19:12', 'Home', 1, 'home', 9, 1, 0, 0, '', '', '', NULL, 0, 1, 0, 0, 1),
	(2, 0, '', '2012-06-13 19:55:54', '2012-06-13 16:55:54', '0000-00-00 00:00:00', '', 0, '', 2, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1),
	(3, 0, '', '2012-06-13 20:03:07', '2012-06-13 17:03:07', '0000-00-00 00:00:00', '', 0, '', 4, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 1, 0, 1, 1),
	(4, 7, 'A Empresa', '2012-06-13 20:12:35', '2012-06-13 20:22:45', '2012-06-13 20:22:45', 'A Empresa', 1, 'a-empresa', 10, 1, 0, 0, '', '', '', NULL, 0, 1, 0, 0, 1);
/*!40000 ALTER TABLE `ha_pages` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_page_blocks
DROP TABLE IF EXISTS `ha_page_blocks`;
CREATE TABLE IF NOT EXISTS `ha_page_blocks` (
  `blockID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) DEFAULT NULL,
  `versionID` int(11) NOT NULL DEFAULT '0',
  `blockRef` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `siteID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`blockID`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_page_blocks: 0 rows
/*!40000 ALTER TABLE `ha_page_blocks` DISABLE KEYS */;
REPLACE INTO `ha_page_blocks` (`blockID`, `pageID`, `versionID`, `blockRef`, `body`, `dateCreated`, `siteID`) VALUES
	(1, NULL, 1, 'block1', '# Welcome.\n\nYour site is set up and ready to go!', '2012-06-13 19:22:48', 1),
	(4, NULL, 5, 'block1', '# Quem somos? \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2012-06-13 20:14:47', 1),
	(6, NULL, 6, 'block1', '# Quem somos? \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2012-06-13 20:14:49', 1),
	(7, NULL, 7, 'block1', '# Quem somos? \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2012-06-13 20:14:49', 1),
	(9, NULL, 3, 'block1', '# Welcome.\n\n*Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.*', '2012-06-13 20:19:12', 1),
	(11, NULL, 8, 'block1', '# Welcome.\n\n*Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.*', '2012-06-13 20:19:14', 1),
	(12, NULL, 9, 'block1', '# Welcome.\n\n*Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.*', '2012-06-13 20:19:14', 1),
	(13, NULL, 10, 'block1', '# Quem somos? \n\nLorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod\ntempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,\nquis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo\nconsequat. Duis aute irure dolor in reprehenderit in voluptate velit esse\ncillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non\nproident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2012-06-13 20:22:46', 1);
/*!40000 ALTER TABLE `ha_page_blocks` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_page_versions
DROP TABLE IF EXISTS `ha_page_versions`;
CREATE TABLE IF NOT EXISTS `ha_page_versions` (
  `versionID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionID`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_page_versions: 0 rows
/*!40000 ALTER TABLE `ha_page_versions` DISABLE KEYS */;
REPLACE INTO `ha_page_versions` (`versionID`, `pageID`, `dateCreated`, `userID`, `published`, `siteID`) VALUES
	(1, 1, '2012-06-13 19:22:48', NULL, 1, 1),
	(2, 2, '2012-06-13 19:55:54', 1, 0, 1),
	(3, 1, '2012-06-13 19:55:59', 1, 1, 1),
	(4, 3, '2012-06-13 20:03:07', 1, 0, 1),
	(5, 4, '2012-06-13 20:12:35', 1, 0, 1),
	(6, 4, '2012-06-13 20:14:47', 1, 1, 1),
	(7, 4, '2012-06-13 20:14:49', 1, 1, 1),
	(8, 1, '2012-06-13 20:19:12', 1, 0, 1),
	(9, 1, '2012-06-13 20:19:14', 1, 0, 1),
	(10, 4, '2012-06-13 20:22:46', 1, 0, 1);
/*!40000 ALTER TABLE `ha_page_versions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_permissions
DROP TABLE IF EXISTS `ha_permissions`;
CREATE TABLE IF NOT EXISTS `ha_permissions` (
  `permissionID` int(11) NOT NULL AUTO_INCREMENT,
  `permission` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `key` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `special` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`),
  UNIQUE KEY `key` (`key`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_permissions: 52 rows
/*!40000 ALTER TABLE `ha_permissions` DISABLE KEYS */;
REPLACE INTO `ha_permissions` (`permissionID`, `permission`, `key`, `category`, `special`) VALUES
	(49, 'Allow Pages', 'pages', 'Pages', 0),
	(50, 'Add / edit pages', 'pages_edit', 'Pages', 0),
	(51, 'Delete pages', 'pages_delete', 'Pages', 0),
	(52, 'Access to all pages', 'pages_all', 'Pages', 0),
	(53, 'Allow Templates', 'pages_templates', 'Templates', 0),
	(54, 'Allow Web Forms', 'webforms', 'Web Forms', 0),
	(55, 'Delete tickets', 'webforms_tickets', 'Web Forms', 0),
	(56, 'Add / edit web forms', 'webforms_edit', 'Web Forms', 0),
	(57, 'Delete web forms', 'webforms_delete', 'Web Forms', 0),
	(58, 'Allow image uploads', 'images', 'Uploads', 0),
	(59, 'Allow file uploads', 'files', 'Uploads', 0),
	(60, 'Access to all images', 'images_all', 'Uploads', 0),
	(61, 'Access to all files', 'files_all', 'Uploads', 0),
	(62, 'Allow Users', 'users', 'Users', 0),
	(63, 'Add / edit users', 'users_edit', 'Users', 0),
	(64, 'Delete users', 'users_delete', 'Users', 0),
	(65, 'Import / export users', 'users_import', 'Users', 0),
	(66, 'Edit permission groups', 'users_groups', 'Users', 0),
	(67, 'Allow Blog', 'blog', 'Blog', 0),
	(68, 'Add / edit posts', 'blog_edit', 'Blog', 0),
	(69, 'Add / edit categories', 'blog_cats', 'Blog', 0),
	(70, 'Access to all posts', 'blog_all', 'Blog', 0),
	(71, 'Delete posts', 'blog_delete', 'Blog', 0),
	(72, 'Allow Shop', 'shop', 'Shop', 0),
	(73, 'Add / edit products', 'shop_edit', 'Shop', 0),
	(74, 'Delete products', 'shop_delete', 'Shop', 0),
	(75, 'Add / edit categories', 'shop_cats', 'Shop', 0),
	(76, 'Add / edit orders', 'shop_orders', 'Shop', 0),
	(77, 'Access to all products', 'shop_all', 'Shop', 0),
	(78, 'View subscriptions', 'shop_subscriptions', 'Shop', 0),
	(79, 'Add / edit shipping', 'shop_shipping', 'Shop', 0),
	(80, 'Add / edit reviews', 'shop_reviews', 'Shop', 0),
	(81, 'Add / edit discounts', 'shop_discounts', 'Shop', 0),
	(82, 'Add / edit upsells', 'shop_upsells', 'Shop', 0),
	(83, 'Access Events', 'events', 'Events', 0),
	(84, 'Add / edit events', 'events_edit', 'Events', 0),
	(85, 'Delete events', 'events_delete', 'Events', 0),
	(86, 'Access Forums', 'forums', 'Forums', 0),
	(87, 'Add / edit boards', 'forums_edit', 'Forums', 0),
	(88, 'Delete boards', 'forums_delete', 'Forums', 0),
	(89, 'Add / edit categories', 'forums_cats', 'Forums', 0),
	(90, 'Allow Community', 'community', 'Community', 0),
	(91, 'Allow Wiki', 'wiki', 'Wiki', 0),
	(92, 'Add / edit pages', 'wiki_edit', 'Wiki', 0),
	(93, 'Add / edit categories', 'wiki_cats', 'Wiki', 0),
	(94, 'Emailer', 'emailer', 'Emailer', 0),
	(95, 'Add / edit campaigns', 'emailer_campaigns_edit', 'Emailer', 0),
	(96, 'Delete campaigns', 'emailer_campaigns_delete', 'Emailer', 0),
	(97, 'Add /edit emails', 'emailer_edit', 'Emailer', 0),
	(98, 'Delete emails', 'emailer_delete', 'Emailer', 0),
	(99, 'Add / edit templates', 'emailer_templates', 'Emailer', 0),
	(100, 'Add / edit lists', 'emailer_lists', 'Emailer', 0);
/*!40000 ALTER TABLE `ha_permissions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_permission_groups
DROP TABLE IF EXISTS `ha_permission_groups`;
CREATE TABLE IF NOT EXISTS `ha_permission_groups` (
  `groupID` int(11) NOT NULL AUTO_INCREMENT,
  `groupName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_permission_groups: 1 rows
/*!40000 ALTER TABLE `ha_permission_groups` DISABLE KEYS */;
REPLACE INTO `ha_permission_groups` (`groupID`, `groupName`, `siteID`) VALUES
	(-1, 'Superuser', 0),
	(1, 'Administrator', 1);
/*!40000 ALTER TABLE `ha_permission_groups` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_permission_map
DROP TABLE IF EXISTS `ha_permission_map`;
CREATE TABLE IF NOT EXISTS `ha_permission_map` (
  `groupID` int(11) NOT NULL DEFAULT '0',
  `permissionID` int(11) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`groupID`,`permissionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_permission_map: 0 rows
/*!40000 ALTER TABLE `ha_permission_map` DISABLE KEYS */;
REPLACE INTO `ha_permission_map` (`groupID`, `permissionID`, `siteID`) VALUES
	(-1, 49, 1),
	(-1, 50, 1),
	(-1, 51, 1),
	(-1, 52, 1),
	(-1, 53, 1),
	(-1, 54, 1),
	(-1, 55, 1),
	(-1, 56, 1),
	(-1, 57, 1),
	(-1, 58, 1),
	(-1, 59, 1),
	(-1, 60, 1),
	(-1, 61, 1),
	(-1, 62, 1),
	(-1, 63, 1),
	(-1, 64, 1),
	(-1, 65, 1),
	(-1, 66, 1),
	(-1, 67, 1),
	(-1, 68, 1),
	(-1, 69, 1),
	(-1, 70, 1),
	(-1, 71, 1),
	(-1, 72, 1),
	(-1, 73, 1),
	(-1, 74, 1),
	(-1, 75, 1),
	(-1, 76, 1),
	(-1, 77, 1),
	(-1, 78, 1),
	(-1, 79, 1),
	(-1, 80, 1),
	(-1, 81, 1),
	(-1, 82, 1),
	(-1, 83, 1),
	(-1, 84, 1),
	(-1, 85, 1),
	(-1, 86, 1),
	(-1, 87, 1),
	(-1, 88, 1),
	(-1, 89, 1),
	(-1, 90, 1),
	(-1, 91, 1),
	(-1, 92, 1),
	(-1, 93, 1),
	(-1, 94, 1),
	(-1, 95, 1),
	(-1, 96, 1),
	(-1, 97, 1),
	(-1, 98, 1),
	(-1, 99, 1),
	(-1, 100, 1),
	(1, 49, 1),
	(1, 50, 1),
	(1, 51, 1),
	(1, 52, 1),
	(1, 53, 1),
	(1, 54, 1),
	(1, 55, 1),
	(1, 56, 1),
	(1, 57, 1),
	(1, 58, 1),
	(1, 59, 1),
	(1, 60, 1),
	(1, 61, 1),
	(1, 62, 1),
	(1, 63, 1),
	(1, 64, 1),
	(1, 65, 1),
	(1, 66, 1),
	(1, 67, 1),
	(1, 68, 1),
	(1, 69, 1),
	(1, 70, 1),
	(1, 71, 1),
	(1, 72, 1),
	(1, 73, 1),
	(1, 74, 1),
	(1, 75, 1),
	(1, 76, 1),
	(1, 77, 1),
	(1, 78, 1),
	(1, 79, 1),
	(1, 80, 1),
	(1, 81, 1),
	(1, 82, 1),
	(1, 83, 1),
	(1, 84, 1),
	(1, 85, 1),
	(1, 86, 1),
	(1, 87, 1),
	(1, 88, 1),
	(1, 89, 1),
	(1, 90, 1),
	(1, 91, 1),
	(1, 92, 1),
	(1, 93, 1),
	(1, 94, 1),
	(1, 95, 1),
	(1, 96, 1),
	(1, 97, 1),
	(1, 98, 1),
	(1, 99, 1),
	(1, 100, 1);
/*!40000 ALTER TABLE `ha_permission_map` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_ratings
DROP TABLE IF EXISTS `ha_ratings`;
CREATE TABLE IF NOT EXISTS `ha_ratings` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `objectID` int(11) DEFAULT NULL,
  `table` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ratingID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_ratings: 0 rows
/*!40000 ALTER TABLE `ha_ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_ratings` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_bands
DROP TABLE IF EXISTS `ha_shop_bands`;
CREATE TABLE IF NOT EXISTS `ha_shop_bands` (
  `bandID` int(11) NOT NULL AUTO_INCREMENT,
  `bandName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multiplier` double DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`bandID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_bands: 0 rows
/*!40000 ALTER TABLE `ha_shop_bands` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_bands` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_catmap
DROP TABLE IF EXISTS `ha_shop_catmap`;
CREATE TABLE IF NOT EXISTS `ha_shop_catmap` (
  `catID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`catID`,`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_catmap: 0 rows
/*!40000 ALTER TABLE `ha_shop_catmap` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_catmap` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_cats
DROP TABLE IF EXISTS `ha_shop_cats`;
CREATE TABLE IF NOT EXISTS `ha_shop_cats` (
  `catID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentID` int(11) unsigned NOT NULL DEFAULT '0',
  `catName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `catSafe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `catOrder` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_cats: 0 rows
/*!40000 ALTER TABLE `ha_shop_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_cats` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_discounts
DROP TABLE IF EXISTS `ha_shop_discounts`;
CREATE TABLE IF NOT EXISTS `ha_shop_discounts` (
  `discountID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiryDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `type` enum('T','P','C') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'T',
  `objectID` text COLLATE utf8_unicode_ci,
  `modifier` enum('A','P') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A',
  `base` enum('T','P') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'T',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`discountID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_discounts: 0 rows
/*!40000 ALTER TABLE `ha_shop_discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_discounts` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_modifiers
DROP TABLE IF EXISTS `ha_shop_modifiers`;
CREATE TABLE IF NOT EXISTS `ha_shop_modifiers` (
  `modifierID` int(11) NOT NULL AUTO_INCREMENT,
  `modifierName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bandID` int(11) DEFAULT NULL,
  `multiplier` double DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`modifierID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_modifiers: 0 rows
/*!40000 ALTER TABLE `ha_shop_modifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_modifiers` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_orders
DROP TABLE IF EXISTS `ha_shop_orders`;
CREATE TABLE IF NOT EXISTS `ha_shop_orders` (
  `orderID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `transactionID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `quantity` tinyint(4) NOT NULL DEFAULT '0',
  `key` text COLLATE utf8_unicode_ci,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_orders: 0 rows
/*!40000 ALTER TABLE `ha_shop_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_orders` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_postages
DROP TABLE IF EXISTS `ha_shop_postages`;
CREATE TABLE IF NOT EXISTS `ha_shop_postages` (
  `postageID` int(11) NOT NULL AUTO_INCREMENT,
  `total` double NOT NULL DEFAULT '0',
  `cost` double NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`postageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_postages: 0 rows
/*!40000 ALTER TABLE `ha_shop_postages` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_postages` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_products
DROP TABLE IF EXISTS `ha_shop_products`;
CREATE TABLE IF NOT EXISTS `ha_shop_products` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `catalogueID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `productOrder` int(11) NOT NULL DEFAULT '0',
  `productName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtitle` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `excerpt` text COLLATE utf8_unicode_ci,
  `tags` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `imageName` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noimage.gif',
  `status` enum('S','O','P','D') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `stock` int(11) unsigned NOT NULL DEFAULT '1',
  `fileID` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `featured` enum('Y','T','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `bandID` int(11) DEFAULT NULL,
  `freePostage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userID` int(11) DEFAULT NULL,
  `published` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`productID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_products: 0 rows
/*!40000 ALTER TABLE `ha_shop_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_products` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_reviews
DROP TABLE IF EXISTS `ha_shop_reviews`;
CREATE TABLE IF NOT EXISTS `ha_shop_reviews` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `productID` int(11) NOT NULL DEFAULT '0',
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rating` int(5) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8_unicode_ci,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_reviews: 0 rows
/*!40000 ALTER TABLE `ha_shop_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_reviews` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_transactions
DROP TABLE IF EXISTS `ha_shop_transactions`;
CREATE TABLE IF NOT EXISTS `ha_shop_transactions` (
  `transactionID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `transactionCode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `userID` int(11) NOT NULL DEFAULT '0',
  `amount` double(10,2) NOT NULL DEFAULT '0.00',
  `postage` double(10,2) DEFAULT NULL,
  `paid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trackingStatus` enum('U','L','A','O','D') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'U',
  `discounts` double(10,2) NOT NULL DEFAULT '0.00',
  `donation` double(10,2) NOT NULL DEFAULT '0.00',
  `tax` double(10,2) NOT NULL DEFAULT '0.00',
  `discountCode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `expiryDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `transactionCode` (`transactionCode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_transactions: 0 rows
/*!40000 ALTER TABLE `ha_shop_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_transactions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_upsells
DROP TABLE IF EXISTS `ha_shop_upsells`;
CREATE TABLE IF NOT EXISTS `ha_shop_upsells` (
  `upsellID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` enum('V','N','P') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `value` double(10,2) DEFAULT NULL,
  `numProducts` int(11) DEFAULT NULL,
  `productIDs` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `upsellOrder` int(11) DEFAULT NULL,
  `remove` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`upsellID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_upsells: 0 rows
/*!40000 ALTER TABLE `ha_shop_upsells` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_upsells` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_shop_variations
DROP TABLE IF EXISTS `ha_shop_variations`;
CREATE TABLE IF NOT EXISTS `ha_shop_variations` (
  `variationID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `variation` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(10,2) NOT NULL DEFAULT '0.00',
  `type` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`variationID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_shop_variations: 0 rows
/*!40000 ALTER TABLE `ha_shop_variations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_shop_variations` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_sites
DROP TABLE IF EXISTS `ha_sites`;
CREATE TABLE IF NOT EXISTS `ha_sites` (
  `siteID` int(11) NOT NULL AUTO_INCREMENT,
  `siteDomain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `altDomain` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `siteName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteEmail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteURL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteTel` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteAddress` text COLLATE utf8_unicode_ci,
  `siteCountry` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupID` int(11) DEFAULT NULL,
  `plan` int(11) NOT NULL DEFAULT '0',
  `quota` int(11) unsigned NOT NULL DEFAULT '0',
  `paging` int(11) NOT NULL DEFAULT '20',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopEmail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopItemsPerPage` int(11) NOT NULL DEFAULT '6',
  `shopItemsPerRow` int(11) NOT NULL DEFAULT '3',
  `shopFreePostage` tinyint(1) NOT NULL DEFAULT '0',
  `shopShippingTable` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopFreePostageRate` int(11) DEFAULT NULL,
  `shopGateway` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'paypal',
  `shopVariation1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopVariation2` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopVariation3` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopStockControl` tinyint(1) NOT NULL DEFAULT '0',
  `shopTax` tinyint(2) NOT NULL DEFAULT '0',
  `shopTaxRate` double NOT NULL DEFAULT '0',
  `shopTaxState` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopAPIKey` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopAPIUser` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopAPIPass` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopVendor` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailerEmail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `emailerName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `dateFmt` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateOrder` enum('DM','MD') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DM',
  `headlines` int(11) NOT NULL DEFAULT '3',
  `clientID` int(11) DEFAULT NULL,
  `emailHeader` text COLLATE utf8_unicode_ci,
  `emailFooter` text COLLATE utf8_unicode_ci,
  `emailTicket` text COLLATE utf8_unicode_ci,
  `emailOrder` text COLLATE utf8_unicode_ci,
  `emailAccount` text COLLATE utf8_unicode_ci,
  `emailDispatch` text COLLATE utf8_unicode_ci,
  `emailDonation` text COLLATE utf8_unicode_ci,
  `emailSubscription` text COLLATE utf8_unicode_ci,
  `timezone` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'UTC',
  `subscriptionAction` int(11) DEFAULT NULL,
  `activation` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`siteID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_sites: 0 rows
/*!40000 ALTER TABLE `ha_sites` DISABLE KEYS */;
REPLACE INTO `ha_sites` (`siteID`, `siteDomain`, `altDomain`, `dateCreated`, `dateModified`, `siteName`, `siteEmail`, `siteURL`, `siteTel`, `siteAddress`, `siteCountry`, `groupID`, `plan`, `quota`, `paging`, `theme`, `shopEmail`, `shopItemsPerPage`, `shopItemsPerRow`, `shopFreePostage`, `shopShippingTable`, `shopFreePostageRate`, `shopGateway`, `shopVariation1`, `shopVariation2`, `shopVariation3`, `shopStockControl`, `shopTax`, `shopTaxRate`, `shopTaxState`, `shopAPIKey`, `shopAPIUser`, `shopAPIPass`, `shopVendor`, `emailerEmail`, `emailerName`, `currency`, `dateFmt`, `dateOrder`, `headlines`, `clientID`, `emailHeader`, `emailFooter`, `emailTicket`, `emailOrder`, `emailAccount`, `emailDispatch`, `emailDonation`, `emailSubscription`, `timezone`, `subscriptionAction`, `activation`, `active`) VALUES
	(1, 'localhost/halogy', NULL, '2012-06-13 18:55:36', '2012-06-13 20:23:16', 'Meu primeiro site com Halogy', 'dev@everlon.com.br', 'http://localhost/halogy/', '', '', 'BR', 1, 0, 0, 20, NULL, '', 6, 3, 0, NULL, 0, 'paypal', 'Colour', 'Size', 'Other', 0, 0, 0, '', '', '', '', '', NULL, NULL, 'BRL', NULL, 'MD', 3, NULL, 'Dear {name},', 'Best Regards,\r\nMy Site\r\nhttp://localhost/halogy/\r\n\r\n', 'Thank you for contacting us, a new ticket has been created. This is an automated response confirming the receipt of your message. We will attend to your enquiry soon as possible. The details of your enquiry are below for your records. When replying, please keep the ticket ID in the subject to ensure that your replies are dealt with correctly.', 'This is a confirmation to say that your order on My Site has been placed and is currently being processed. We will email you again once your order has been shipped.\r\n\r\nIf you have any queries about your order, please do not hesitate to contact us at  quoting your unique order reference number. Thank you for your custom.', 'Your account for My Site has been set up. Thank you for registering with us.\r\n\r\nPlease keep the information below safe.', 'This is a notification to say that your order {order-id} on My Site has been shipped.\r\n\r\nYou can track your order and view past orders by clicking on the link below.\r\n\r\nhttp://localhost/halogy/shop/orders\r\n\r\nIf you have any other queries about your order, please do not hesitate to contact us at  quoting your unique order reference number.', 'Thank you for your donation placed on My Site.', 'This is a confirmation to say that your subscription has been created on My Site. You can update your subscription and view invoices by logging in to your account. Please note that your subscription will renew at the intervals stated on the website unless you cancel the subscription prior to the renewal date. See our website for more information. To login to your account please click on the URL below:\r\n\r\nhttp://localhost/halogy/shop/account\r\n\r\nYour subscription details are below, thank you for your custom.', 'UM3', NULL, 0, 1);
/*!40000 ALTER TABLE `ha_sites` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_subscribers
DROP TABLE IF EXISTS `ha_subscribers`;
CREATE TABLE IF NOT EXISTS `ha_subscribers` (
  `subscriberID` int(11) NOT NULL AUTO_INCREMENT,
  `subscriptionID` int(11) DEFAULT NULL,
  `referenceID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `lastPayment` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `fullName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci,
  `postcode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`subscriberID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_subscribers: 0 rows
/*!40000 ALTER TABLE `ha_subscribers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_subscribers` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_subscriptions
DROP TABLE IF EXISTS `ha_subscriptions`;
CREATE TABLE IF NOT EXISTS `ha_subscriptions` (
  `subscriptionID` int(11) NOT NULL AUTO_INCREMENT,
  `subscriptionRef` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cgCode` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cgProduct` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscriptionName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `description` text COLLATE utf8_unicode_ci,
  `price` double DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `term` enum('M','Y') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`subscriptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_subscriptions: 0 rows
/*!40000 ALTER TABLE `ha_subscriptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_subscriptions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_sub_payments
DROP TABLE IF EXISTS `ha_sub_payments`;
CREATE TABLE IF NOT EXISTS `ha_sub_payments` (
  `paymentID` int(11) NOT NULL AUTO_INCREMENT,
  `referenceID` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `amount` double DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`paymentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=FIXED;

-- Dumping data for table halogy.ha_sub_payments: 0 rows
/*!40000 ALTER TABLE `ha_sub_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_sub_payments` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_tags
DROP TABLE IF EXISTS `ha_tags`;
CREATE TABLE IF NOT EXISTS `ha_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `safe_tag` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tag` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `safe_tag` (`safe_tag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_tags: 0 rows
/*!40000 ALTER TABLE `ha_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_tags` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_tags_ref
DROP TABLE IF EXISTS `ha_tags_ref`;
CREATE TABLE IF NOT EXISTS `ha_tags_ref` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0',
  `row_id` int(10) unsigned NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `table` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `siteID` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_tags_ref: 0 rows
/*!40000 ALTER TABLE `ha_tags_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_tags_ref` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_templates
DROP TABLE IF EXISTS `ha_templates`;
CREATE TABLE IF NOT EXISTS `ha_templates` (
  `templateID` int(11) NOT NULL AUTO_INCREMENT,
  `templateName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `versionID` int(11) NOT NULL DEFAULT '0',
  `modulePath` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`templateID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_templates: 0 rows
/*!40000 ALTER TABLE `ha_templates` DISABLE KEYS */;
REPLACE INTO `ha_templates` (`templateID`, `templateName`, `dateCreated`, `dateModified`, `versionID`, `modulePath`, `deleted`, `siteID`) VALUES
	(1, 'Default', '2012-06-13 19:22:48', '2012-06-13 16:22:48', 1, '', 0, 1);
/*!40000 ALTER TABLE `ha_templates` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_template_versions
DROP TABLE IF EXISTS `ha_template_versions`;
CREATE TABLE IF NOT EXISTS `ha_template_versions` (
  `versionID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `objectID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_template_versions: 0 rows
/*!40000 ALTER TABLE `ha_template_versions` DISABLE KEYS */;
REPLACE INTO `ha_template_versions` (`versionID`, `dateCreated`, `objectID`, `userID`, `body`, `siteID`) VALUES
	(1, '2012-06-13 19:22:48', 1, 1, '{include:header}\n\n\n\n			{block1}\n			\n			\n\n{include:footer}', 1);
/*!40000 ALTER TABLE `ha_template_versions` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_tickets
DROP TABLE IF EXISTS `ha_tickets`;
CREATE TABLE IF NOT EXISTS `ha_tickets` (
  `ticketID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `formName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `notes` text COLLATE utf8_unicode_ci,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_tickets: 0 rows
/*!40000 ALTER TABLE `ha_tickets` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_tickets` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_tracking
DROP TABLE IF EXISTS `ha_tracking`;
CREATE TABLE IF NOT EXISTS `ha_tracking` (
  `trackingID` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `userKey` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipAddress` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userAgent` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `referer` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `lastPage` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userdata` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `siteID` int(11) DEFAULT '0',
  PRIMARY KEY (`trackingID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_tracking: 0 rows
/*!40000 ALTER TABLE `ha_tracking` DISABLE KEYS */;
REPLACE INTO `ha_tracking` (`trackingID`, `date`, `userKey`, `ipAddress`, `userAgent`, `referer`, `views`, `lastPage`, `userdata`, `siteID`) VALUES
	(1, '2012-06-13 18:55:36', '4384004403327804caddfd0e6931f720', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KH', 'http://localhost/', 17, '/admin', '', 1);
/*!40000 ALTER TABLE `ha_tracking` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_users
DROP TABLE IF EXISTS `ha_users`;
CREATE TABLE IF NOT EXISTS `ha_users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupID` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subscription` enum('Y','E','P','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `subscribed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `plan` int(11) NOT NULL DEFAULT '0',
  `bounced` tinyint(1) DEFAULT '0',
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `displayName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `billingAddress1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingAddress2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingAddress3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingCity` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingState` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingPostcode` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billingCountry` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `signature` text COLLATE utf8_unicode_ci,
  `bio` text COLLATE utf8_unicode_ci NOT NULL,
  `companyName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyEmail` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyWebsite` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyDescription` text COLLATE utf8_unicode_ci,
  `companyLogo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'english',
  `posts` int(11) unsigned NOT NULL DEFAULT '0',
  `kudos` int(11) NOT NULL DEFAULT '0',
  `notifications` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `privacy` enum('V','F','H') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'V',
  `resetkey` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastLogin` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `custom1` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom2` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom3` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom4` text COLLATE utf8_unicode_ci,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `emailindex` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_users: 1 rows
/*!40000 ALTER TABLE `ha_users` DISABLE KEYS */;
REPLACE INTO `ha_users` (`userID`, `username`, `password`, `groupID`, `email`, `subscription`, `subscribed`, `plan`, `bounced`, `dateCreated`, `dateModified`, `displayName`, `firstName`, `lastName`, `address1`, `address2`, `address3`, `city`, `state`, `postcode`, `country`, `currency`, `billingAddress1`, `billingAddress2`, `billingAddress3`, `billingCity`, `billingState`, `billingPostcode`, `billingCountry`, `phone`, `avatar`, `signature`, `bio`, `companyName`, `companyEmail`, `companyWebsite`, `companyDescription`, `companyLogo`, `language`, `posts`, `kudos`, `notifications`, `privacy`, `resetkey`, `lastLogin`, `custom1`, `custom2`, `custom3`, `custom4`, `active`, `siteID`) VALUES
	(1, 'superuser', 'f35364bc808b079853de5a1e343e7159', -1, '', 'Y', 0, 0, 0, '2012-06-13 15:54:31', '2012-06-13 16:22:47', NULL, 'Admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'USD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 'english', 0, 0, 1, 'V', NULL, '2012-06-13 19:22:47', NULL, NULL, NULL, NULL, 1, NULL);
/*!40000 ALTER TABLE `ha_users` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_web_forms
DROP TABLE IF EXISTS `ha_web_forms`;
CREATE TABLE IF NOT EXISTS `ha_web_forms` (
  `formID` int(11) NOT NULL AUTO_INCREMENT,
  `dateCreated` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `formName` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `formRef` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fieldSet` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `captcha` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `account` tinyint(1) NOT NULL DEFAULT '0',
  `groupID` int(11) DEFAULT NULL,
  `outcomeMessage` text COLLATE utf8_unicode_ci,
  `outcomeEmails` text COLLATE utf8_unicode_ci,
  `outcomeRedirect` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fileTypes` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`formID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_web_forms: 0 rows
/*!40000 ALTER TABLE `ha_web_forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_web_forms` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_wiki
DROP TABLE IF EXISTS `ha_wiki`;
CREATE TABLE IF NOT EXISTS `ha_wiki` (
  `pageID` int(11) NOT NULL AUTO_INCREMENT,
  `pageName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `versionID` int(11) DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) DEFAULT NULL,
  `catID` int(11) DEFAULT NULL,
  `uri` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `active` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `groupID` int(11) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`pageID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_wiki: 0 rows
/*!40000 ALTER TABLE `ha_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_wiki` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_wiki_cats
DROP TABLE IF EXISTS `ha_wiki_cats`;
CREATE TABLE IF NOT EXISTS `ha_wiki_cats` (
  `catID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentID` int(11) unsigned NOT NULL DEFAULT '0',
  `catName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_unicode_ci,
  `catOrder` int(11) DEFAULT NULL,
  `deleted` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_wiki_cats: 0 rows
/*!40000 ALTER TABLE `ha_wiki_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_wiki_cats` ENABLE KEYS */;


-- Dumping structure for table halogy.ha_wiki_versions
DROP TABLE IF EXISTS `ha_wiki_versions`;
CREATE TABLE IF NOT EXISTS `ha_wiki_versions` (
  `versionID` int(11) NOT NULL AUTO_INCREMENT,
  `pageID` int(11) NOT NULL DEFAULT '0',
  `dateCreated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userID` int(11) DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `notes` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siteID` int(11) DEFAULT NULL,
  PRIMARY KEY (`versionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table halogy.ha_wiki_versions: 0 rows
/*!40000 ALTER TABLE `ha_wiki_versions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ha_wiki_versions` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

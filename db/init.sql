CREATE DATABASE IF NOT EXISTS `emqx` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `emqx`;

CREATE TABLE `mqtt_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(35) DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mqtt_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `mqtt_user` (`username`, `password`, `salt`) VALUES
('emqx','efa1f375d76194fa51a3556a97e641e61685f914d446979da50a551a4333ffd7', NULL),
('juan11','efa1f375d76194fa51a3556a97e641e61685f914d446979da50a551a4333ffd7', NULL);

CREATE TABLE `mqtt_acl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allow` int(1) DEFAULT 1,
  `ipaddr` varchar(60) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `clientid` varchar(100) DEFAULT NULL,
  `access` int(2) NOT NULL,
  `topic` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  INDEX (ipaddr),
  INDEX (username),
  INDEX (clientid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `mqtt_acl` (allow, ipaddr, username, clientid, access, topic)
VALUES (0, NULL, '$all', NULL, 1, '$SYS/#');

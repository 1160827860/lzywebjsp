CREATE DATABASE GuestBook;
CREATE TABLE User(
  id INT auto_increment PRIMARY KEY NOT NULL,
  name VARCHAR (11) NOT NULL ,
  password VARCHAR (16) NOT NULL ,
  mail VARCHAR (20) NOT NULL
);

CREATE TABLE message(
    id INT auto_increment PRIMARY KEY NOT NULL,
    user_id INT NOT NULL ,
    text VARCHAR(150) NOT NULL,
    title VARCHAR (20) NOT NULL,
    create_time DATE NOT NULL
);
DELIMITER $$
CREATE PROCEDURE sele_user_count(IN username VARCHAR,IN userpassword VARCHAR )
BEGIN
    SELECT COUNT(*) AS TOTALUSER  FROM user WHERE name = username AND password = userpassword;
END$$
DELIMITER;
-- 使用老师的库，老师的库中有很多重复
CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `time` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='GUESTBOOK';
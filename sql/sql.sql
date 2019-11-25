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
    title VARCHAR (20) NOT NULL
);
DELIMITER $$
CREATE PROCEDURE sele_user_count(IN username VARCHAR,IN userpassword VARCHAR )
BEGIN
    SELECT COUNT(*) AS TOTALUSER  FROM user WHERE name = username AND password = userpassword;
END$$
DELIMITER;
CREATE DATABASE GuestBook;
CREATE TABLE User(
  id INT auto_increment PRIMARY KEY NOT NULL,
  name VARCHAR (11) NOT NULL ,
  password VARCHAR (16) NOT NULL ,
  mail VARCHAR (20) NOT NULL
);
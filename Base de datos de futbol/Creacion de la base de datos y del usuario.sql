/*Borramos la base de datos*/
DROP DATABASE IF EXISTS `Futbol`;

DROP USER 'Futbol'@'localhost';

/*Creación de la base de datos*/
create database `Futbol` default character set utf8 collate utf8_general_ci;

/*Creación del usuario*/
create user 'Futbol'@'localhost' identified by 'Futbol';
grant all privileges on `Futbol`.* to 'Futbol'@'localhost';
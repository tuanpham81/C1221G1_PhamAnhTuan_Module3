CREATE DATABASE `student-management`;
CREATE TABLE `student-management`.`student` (
`id` INT NOT NULL,
`name` VARCHAR(45) NULL,
`age` INT NULL,
`country` VARCHAR(45) NULL,
PRIMARY KEY(`id`));
CREATE TABLE `student-management`.`class`(
`id` int not null,
`name` varchar(45) null,
primary key(`id`));
CREATE TABLE `student-management`.`teacher`(
`id` int not null,
`name` varchar(45) null,
`age` int null,
`country` varchar(45) null,
primary key(`id`));

create database stundent_management;

use stundent_management;

create table Student
(idStudent int primary key not null,
`name` varchar(45),
age int,
country varchar(45)
);

create table Class 
(idClass int primary key not null,
`name` varchar(45)
);

create table Teacher
(idTeacher int primary key not null,
`name` varchar(45),
age int,
country varchar(45)
);
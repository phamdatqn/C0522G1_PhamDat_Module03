CREATE DATABASE stundent_management;

USE stundent_management;

CREATE TABLE student (
    idStudent INT PRIMARY KEY NOT NULL,
    `name` VARCHAR(45),
    age INT,
    country VARCHAR(45)
);

CREATE TABLE class (
    idClass INT PRIMARY KEY NOT NULL,
    `name` VARCHAR(45)
);

CREATE TABLE teacher (
    idTeacher INT PRIMARY KEY NOT NULL,
    `name` VARCHAR(45),
    age INT,
    country VARCHAR(45)
);
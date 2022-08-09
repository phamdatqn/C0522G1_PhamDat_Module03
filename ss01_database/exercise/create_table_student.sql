CREATE DATABASE stundent_management;

USE stundent_management;

CREATE TABLE student (
    student_id INT PRIMARY KEY,
    `name` VARCHAR(45),
    age INT,
    country VARCHAR(45)
);

CREATE TABLE class (
    class_id INT PRIMARY KEY,
    `name` VARCHAR(45)
);

CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY,
    `name` VARCHAR(45),
    age INT,
    country VARCHAR(45)
);
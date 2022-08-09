CREATE DATABASE IF NOT EXISTS quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    status BIT
);

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    phone VARCHAR(20),
    status BIT,
    class_id INT NOT NULL,
    FOREIGN KEY (class_id)
        REFERENCES class (class_id)
);

CREATE TABLE `subject` (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    status BIT DEFAULT 1
);

CREATE TABLE mark (
    mard_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT NOT NULL,
    student_id INT NOT NULL,
    mard FLOAT DEFAULT 0 CHECK (mard BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (subject_id , student_id),
    FOREIGN KEY (subject_id)
        REFERENCES `subject` (subject_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);


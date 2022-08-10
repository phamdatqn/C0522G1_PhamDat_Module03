DROP DATABASE IF EXISTS quan_ly_sinh_vien;
CREATE DATABASE quan_ly_sinh_vien;
USE quan_ly_sinh_vien;

CREATE TABLE class (
    class_id INT PRIMARY KEY AUTO_INCREMENT,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME NOT NULL,
    status BIT
);
INSERT INTO class
VALUES
 (1,'A1','2008/12/20',1),
(2,'A2','2008/12/22',1),
(3,'B3',current_date,0);

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
INSERT INTO student
VALUES 
(1,'Hung','Ha Noi','0912113113',1,1),
(2,'Hoa','Hai Phong',null,1,1),
(3,'Manh','HCM','0123123123',0,1);

CREATE TABLE `subject` (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_name VARCHAR(30) NOT NULL,
    credit TINYINT NOT NULL DEFAULT 1 CHECK (Credit >= 1),
    status BIT DEFAULT 1
);
INSERT INTO `subject`
VALUES 
(1,'CF',5,1),
(2,'C',6,1),
(3,'HDJ',5,1),
(4,'RDBMS',10,1);

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
INSERT INTO mark
VALUES 
(1,1,1,8,1),
(2,1,2,10,2),
(3,2,1,12,1);
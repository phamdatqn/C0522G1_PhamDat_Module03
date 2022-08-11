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
    add_ress VARCHAR(50),
    phone VARCHAR(20),
    `status` BIT,
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
    mark FLOAT DEFAULT 0 CHECK (mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (subject_id , student_id),
    FOREIGN KEY (subject_id)
        REFERENCES `subject` (subject_id),
    FOREIGN KEY (student_id)
        REFERENCES student (student_id)
);
INSERT INTO mark
VALUES 
(1,1,1,20,1),
(2,1,2,10,2),
(3,2,1,19,1);

-- 1. Hiển thị số lượng sinh viên ở từng nơi
SELECT add_ress, COUNT(student_id) AS so_luong_hoc_vien
FROM student
GROUP BY add_ress;

-- 2. Tính điểm trung bình các môn học của mỗi học viên
 select student.student_id,student.student_name,avg(mark)
 from student
 join mark on student.student_id = mark.student_id
 group by student.student_id;
 
 -- 3. Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
select student.student_id,student.student_name,avg(mark)as diem_trung_binh
from student
join mark on student.student_id = mark.student_id
group by student.student_id
having diem_trung_binh >15;

-- 4. Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select student.student_id,student.student_name, max(diem_trung_binh)
from student, (select avg(mark.mark)as diem_trung_binh
from student
join mark on student.student_id = mark.student_id
group by student.student_id)as diem_trung_binh_lon_nhat;
 

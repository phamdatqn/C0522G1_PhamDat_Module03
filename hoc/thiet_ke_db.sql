DROP DATABASE IF EXISTS c0522g1;
CREATE DATABASE c0522g1;
USE c0522g1;
CREATE TABLE class_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);
CREATE TABLE class (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    class_type_id INT,
    FOREIGN KEY (class_type_id)
        REFERENCES class_type (id)
);
CREATE TABLE jame (
    `account` VARCHAR(50),
    `password` VARCHAR(25),
    PRIMARY KEY (`account`)
);
CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    birthday DATE,
    gender BOOLEAN,
    email VARCHAR(50),
    `point` INT,
    `account` VARCHAR(50),
    class_id INT,
    FOREIGN KEY (`account`)
        REFERENCES jame (`account`),
    FOREIGN KEY (class_id)
        REFERENCES class (id)
)
;
CREATE TABLE instructor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    birthday DATE,
    salary FLOAT
);

CREATE TABLE instructor_class (
    class_id INT,
    instructor_id INT,
    start_time DATE,
    PRIMARY KEY (class_id , instructor_id),
    FOREIGN KEY (class_id)
        REFERENCES class (id),
    FOREIGN KEY (instructor_id)
        REFERENCES instructor (id)
);


-- Nhập thông tin cho bảng 
insert into class_type (name) values ('full time'), ('part time'),('orther');

insert into class (name,class_type_id) values ('c1121g1',1), ('c1221g1',1),('a0821i1',2),('a0921i1',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);
 
 -- 1: lấy thông tin học sinh + lóp nào.
SELECT student.`name`, birthday, gender, class.name FROM student
JOIN class ON student.class_id = class.id;

 -- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào và cả các bạn đã đăng ký nhưng chưa có lớp học.
  select student.`name`,birthday,gender,class.name from student
 left join class on student.class_id = class.id;

-- 4.Lấy thông tin của các học viên tên 'Tien' và 'Toan’.
  select `name`,birthday,gender from student
  where `name` like '%Tien' or `name` like '%Nam';
  
  -- 5. Lấy ra học viên có điểm lớn hơn 5 .
  select * from student
  where `point`>5;
  
  -- 6 Lấy ra học viên có họ là “nguyen”
    select * from student
  where `name` like 'nguyen%';
  
  -- 7. Thông kế số lượng học sinh theo từng loại điểm.
   select `name`,birthday,gender,`point`, count(id)as so_luong from student
   group by `point` 
   order by `point`;
   
-- 8 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn 5
select `name`,birthday,gender,`point`, count(id)as so_luong from student
where `point` >5
   group by `point` 
   order by `point`;

-- 9. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select `name`,birthday,gender,`point`, count(id)as so_luong from student
  where ( `point`>5) 
   group by `point` 
   having (so_luong >=2) 
   order by `point`;
 
-- 10. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp tên học viên theo alphabet.
select student.`name`,birthday,gender,class.`name` from student
JOIN class ON student.class_id = class.id
order by student.`name`;

create view v_student as 
select * 
from student;

select * from v_student;

update v_student set class_id =2 where id=1;

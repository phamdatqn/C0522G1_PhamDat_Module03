CREATE DATABASE IF NOT EXISTS  furama_case;

USE furama_case;

CREATE TABLE IF NOT EXISTS `role` (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(255),
    is_delete BIT DEFAULT 0
);


CREATE TABLE IF NOT EXISTS `user` (
    user_name VARCHAR(255) PRIMARY KEY,
    `password` VARCHAR(255),
    is_delete BIT DEFAULT 0
);
INSERT INTO `user` (user_name,`password`)
VALUES
('phamdat@gmail.com','123456'),
('datphamt@gmail.com','123456');


CREATE TABLE IF NOT EXISTS user_role (
    role_id INT,
    user_name VARCHAR(255),
    PRIMARY KEY (role_id , user_name),
    FOREIGN KEY (user_name)
        REFERENCES `user` (user_name),
    FOREIGN KEY (role_id)
        REFERENCES `role` (role_id),
    is_delete BIT DEFAULT 0
);

CREATE TABLE IF NOT EXISTS `position` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    is_delete BIT DEFAULT 0
);
INSERT INTO `position`(`name`)
VALUES
('Quản Lý'),
('Nhân Viên');

CREATE TABLE IF NOT EXISTS education_degree (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    is_delete BIT DEFAULT 0
);
INSERT INTO education_degree(`name`)
VALUES ('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

CREATE TABLE IF NOT EXISTS division (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    is_delete BIT DEFAULT 0
);

INSERT INTO division(`name`)
VALUES ('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');


CREATE TABLE IF NOT EXISTS employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    id_card VARCHAR(12) NOT NULL UNIQUE,
    salary DOUBLE NOT NULL CHECK (salary >= 3000000),
    phone_number VARCHAR(12) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(255),
    position_id INT,
    FOREIGN KEY (position_id)
        REFERENCES `position` (id),
    education_degree_id INT,
    FOREIGN KEY (education_degree_id)
        REFERENCES education_degree (id),
    division_id INT,
    FOREIGN KEY (division_id)
        REFERENCES division (id),
    user_name VARCHAR(255) UNIQUE,
    FOREIGN KEY (user_name)
        REFERENCES `user` (`user_name`),
    is_delete BIT DEFAULT 0
);
INSERT INTO employee(`name`,date_of_birth,id_card,salary,phone_number,email,address,position_id,education_degree_id,division_id)
VALUES
('Nguyễn Văn An','1970-11-07','456231786',10000000,'0901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, P Thanh Bình, Quận Hải Châu, TP Đà Nẵng',1,3,1),
('Lê Văn Bình','1997-04-09','654231234',7000000,'0934212314','binhlv@gmail.com','22 Yên Bái, P Hải Châu 1, Quận Hải Châu, TP Đà Nẵng',1,2,2),
('Hồ Thị Yến','1995-12-12','999231723',14000000,'0412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản','1980-04-04','123231365',17000000,'0374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'0902341231','phatphat@gmail.com','43 Yên Bái, P Hải Châu 1, Quận Hải Châu, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'0978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, P Thanh Bình, Quận Hải Châu, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'0941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông','1989-09-03','234414123',9000000,'0642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang','1982-09-03','256781231',6000000,'0245144444','hoangtong@gmail.com','213 Hàm Nghi, Thạc Gián, Thanh Khê, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo','1994-01-08','755434343',8000000,'0988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);


CREATE TABLE IF NOT EXISTS customer_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    is_delete BIT DEFAULT 0
);
INSERT INTO customer_type( `name`)
VALUES
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

CREATE TABLE IF NOT EXISTS customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_type_id INT,
    FOREIGN KEY (customer_type_id)
	REFERENCES customer_type (id),
    `name` VARCHAR(50) NOT NULL,
    gencustomer_typeder BIT(1) NOT NULL,
    date_of_birth DATE NOT NULL,
    id_card VARCHAR(12) NOT NULL UNIQUE,
    phone_number VARCHAR(12) NOT NULL,
    email VARCHAR(45),
    address VARCHAR(255),
    is_delete BIT DEFAULT 0
);
select * from customer;
INSERT INTO customer( `name`,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id)
VALUES 
('Nguyễn Thị Hào','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng,P Hải Châu 2, Quận Hải Châu, TP Đà Nẵng',5),
('Phạm Xuân Diệu','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
('Trương Đình Nghệ','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
('Dương Văn Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, P Thạch Thang, Quận Hải Châu, TP Đà Nẵng',1),
('Hoàng Trần Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai',4),
('Tôn Nữ Mộc Châu','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, P Hòa An, Quận Cẩm Lệ, TP Đà Nẵng',4),
('Nguyễn Mỹ Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','123/45 Lê Lợi,Phường Bến Nghé, Quận 1, TP Hồ Chí Minh',1),
('Nguyễn Thị Hào','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
('Trần Đại Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Phường Nghĩa Chánh Nam, TP Quảng Ngãi',1),
('Nguyễn Tâm Đắc','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Quận Sơn Trà, TP Đà Nẵng',2),
('Phạm Đạt','1993-07-01',1,'212368165','0988888888','datpham@gmail.com','999 Nguyễn Tất Thành, Quận hải Châu, TP Đà Nẵng',2);


CREATE TABLE IF NOT EXISTS facility_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    is_delete BIT DEFAULT 0
);
INSERT INTO facility_type(`name`)
VALUES
('Villa'),
('House'),
('Room');

CREATE TABLE IF NOT EXISTS rent_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45),
    is_delete BIT DEFAULT 0
);
INSERT INTO rent_type(`name`)
VALUES 
('year'),
('month'),
('day'),
('hour');

CREATE TABLE IF NOT EXISTS facility (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    area INT CHECK (area > 30),
    cost DOUBLE CHECK (cost > 0),
    max_people INT CHECK (max_people BETWEEN 1 AND 19),
    rent_type_id INT,
    FOREIGN KEY (rent_type_id)
        REFERENCES rent_type (id),
    facility_type_id INT,
    FOREIGN KEY (facility_type_id)
        REFERENCES facility_type (id),
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(255),
    pool_area DOUBLE,
    number_of_floors INT,
    facility_free TEXT,
    is_delete BIT DEFAULT 0
);
INSERT INTO facility(`name`,area,cost,max_people,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free,rent_type_id,facility_type_id)
VALUES 
('Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,null,3,1),
('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,null,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,'1 Xe máy, 1 Xe đạp',4,3),
('Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,null,3,1),
('House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,null,3,2),
('Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,'1 Xe máy',4,3),
('House Princess 03',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,null,3,2);
update facility set name='111',area=40000,cost=190000,max_people=4,rent_type_id=2,facility_type_id=1,standard_room='vip',description_other_convenience='có xe đạp',
 pool_area=400, number_of_floors=3, facility_free='xe đạp' where id=7 and is_delete=0;

insert into facility(`name`,area,cost,max_people,rent_type_id,facility_type_id,standard_room,description_other_convenience,pool_area,number_of_floors,facility_free) 
value("dat",5000,900000,6,3,2,'vip','có ghế tình yêu',200,3,null);

CREATE TABLE IF NOT EXISTS contract (
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    deposit DOUBLE NOT NULL,
    employee_id INT,
    customer_id INT,
    facility_id INT,
    is_delete BIT DEFAULT 0,
    FOREIGN KEY (employee_id)
        REFERENCES employee (id),
    FOREIGN KEY (customer_id)
        REFERENCES customer (id),
    FOREIGN KEY (facility_id)
        REFERENCES facility (id)
);
INSERT INTO contract(start_date,end_date,deposit,employee_id,customer_id,facility_id)
VALUES
('2020-12-08','2020-12-08',0,3,1,3),
('2020-07-14','2020-07-21',200000,7,3,1),
('2021-03-15','2021-03-17',50000,3,4,2),
('2021-01-14','2021-01-18',100000,7,5,5),
('2021-07-14','2021-07-15',0,7,2,6),
('2021-06-01','2021-06-03',0,7,7,6),
('2021-09-02','2021-09-05',100000,7,4,4),
('2021-06-17','2021-06-18',150000,3,4,1),
('2020-11-19','2020-11-19',0,3,4,3),
('2021-04-12','2021-04-14',0,10,3,5),
('2021-04-25','2021-04-25',0,2,2,1),
('2021-05-25','2021-05-27',0,7,10,1);


CREATE TABLE IF NOT EXISTS attach_facility (
    id INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45) NOT NULL,
    cost DOUBLE NOT NULL CHECK (cost > 0),
    unit VARCHAR(10) NOT NULL,
    `status` VARCHAR(45),
    is_delete BIT DEFAULT 0
);
INSERT INTO attach_facility(`name`,cost,unit,`status`)
VALUES 
('Karaoke',10000,'giờ','tiện nghi hiện tại'),
('Thuê xe máy',10000,'chiếc','hỏng 1 xe'),
('Thuê xe đạp',20000,'chiếc','tốt'),
('Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),
('Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');

CREATE TABLE IF NOT EXISTS contrat_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT,
    attach_facility_id INT,
    quantity INT NOT NULL,
    is_delete BIT DEFAULT 0,
    FOREIGN KEY (contract_id)
        REFERENCES contract (id),
    FOREIGN KEY (attach_facility_id)
        REFERENCES attach_facility (id)
);
INSERT INTO contrat_detail(quantity,contract_id,attach_facility_id)
VALUES 
(5,2,4),
(8,2,5),
(15,2,6),
(1,3,1),
(11,3,2),
(1,1,3),
(2,1,2),
(2,12,2);

update customer set is_delete=0 where id=11 and is_delete=1;
update customer set name="Đạt Phạm" where id=11 and is_delete=0;

update customer set customer_type_id=3,name="ĐẠT",gender=0,date_of_birth="1991-11-11",id_card="123456789",
            phone_number="123456",email="testupdate",address="kệ" where id=11 and is_delete=0;
SELECT * FROM customer_type where is_delete=0;
SELECT * FROM facility where is_delete=0
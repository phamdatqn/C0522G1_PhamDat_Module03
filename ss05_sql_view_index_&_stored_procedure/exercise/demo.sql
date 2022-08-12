Drop database if exists demo;
create database  demo;
use demo;

create table products (
id int auto_increment primary key,
product_code varchar(50) unique,
product_name varchar(50),
product_price double,
product_amount int,
product_description varchar(100),
product_status varchar(50));

Insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
values 
('b1234567','Bánh chocopie',15000,50,'Bánh vị socola, hạng dùng 6 tháng','new 100%'),
('k1234567','kẹo socola',10000,51,'hạt nhân socola, hạng dùng 12 tháng','new 100%'),
('b1234568','Bánh Tráng',5000,250,'Bánh tráng vị dừa, hạng dùng 6 tháng','new 100%'),
('k1234569','kẹo chupa ba chupa',35000,150,'Full vị, hạng dùng 12 tháng','new 100%'),
('b1234510','Bánh Dừa Nướng',20000,55,'Bánh dừa nướng thái lan, hạng dùng 6 tháng','new 100%');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
alter table products add unique index i_unique_product(product_code);
explain select * from products where product_code='k1234567' ;
alter table products drop index i_unique_product;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
alter table products add index i_composite_product(product_name,product_price);
explain select * from products where product_name='kẹo chupa ba chupa'and product_price>=5000;
alter table products drop index i_composite_product;

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_product as
select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view
SET SQL_SAFE_UPDATES = 0;
update w_product 
set product_name = 'Bánh hachi' where product_code ='b1234567';

-- Tiến hành xoá view
drop view w_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure sp_product()
	begin
		select * from products;
    end//
delimiter ;
call sp_product();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure sp_add_product(p_code varchar(50),p_name varchar(50),p_price double,p_amount int,p_description varchar(100),p_status varchar(50))
	begin
		insert into products(product_code,product_name,product_price,product_amount,product_description,product_status)
        value(p_code,p_name,p_price,p_amount,p_description,p_status);
    end//
delimiter ;
call sp_add_product('k1234100','Bánh new add',22000,500,'Bánh add sp','new 1000%');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure sp_update_product(update_id int,p_code varchar(50),p_name varchar(50),p_price double,p_amount int,p_description varchar(100),p_status varchar(50))
begin 
	update products set 
     product_code = p_code,
     product_name = p_name,
     product_price = p_price,
     product_amount = p_amount,
     product_description = p_description,
     product_status = p_status 
     where id= update_id;
end// 
delimiter ;
call sp_update_product(6,'k1234101','Bánh update ',38000,15,'Bánh update sp','new 909%');


-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure sp_delete_product(delete_id int)
begin 
	delete from products
	where id= delete_id;
end// 
delimiter ;
call sp_delete_product(6);

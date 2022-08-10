DROP DATABASE IF EXISTS quan_ly_ban_hang;
CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    age INT
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_price DOUBLE,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    price DOUBLE
);

CREATE TABLE order_detail (
    detail_id INT,
    product_id INT,
    order_qty INT,
    FOREIGN KEY (detail_id)REFERENCES `order` (order_id),
    FOREIGN KEY (product_id)REFERENCES product (product_id)
);
INSERT INTO customer(`name`,age)
VALUES
('Minh Quan',10),
('Ngoc Oanh',20),
('Hong Ha',50);

INSERT INTO `order`(customer_id,order_date,total_price)
VALUES 
(1,'2006/3/21',null),
(2,'2006/3/23',null),
(1,'2006/3/16',null);

INSERT INTO product( `name`,price)
VALUES 
('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);

INSERT INTO order_detail
VALUES 
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);

-- 1: Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
 SELECT order_id,order_date,total_price FROM `order`;
 
 -- 2: Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách.
 SELECT customer.`name`,product.`name`,`order`.order_date FROM customer
 join `order` on customer.customer_id=`order`.customer_id
 join order_detail on order_detail.detail_id=`order`.order_id
 join product on product.product_id=order_detail.product_id;
 
 -- 3: Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
 SELECT * FROM customer
 where customer.customer_id
 not in 
 (SELECT customer.customer_id FROM customer
 join `order` on customer.customer_id=`order`.customer_id
 join order_detail on order_detail.detail_id=`order`.order_id
 join product on product.product_id=order_detail.product_id);
 
---- --   -- 4: Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
--  -- Giá bán của từng loại được tính = odQTY*pPrice)
  SELECT `order`.order_id,order_date,sum(order_detail.order_qty*product.price) as gia_ban_tung_hoa_don from `order`
  join order_detail on `order`.order_id=order_detail.detail_id
  join product on product.product_id=order_detail.product_id
  group by `order`.order_id;

 

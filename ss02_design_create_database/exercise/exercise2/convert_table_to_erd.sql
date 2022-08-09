CREATE DATABASE quan_ly_ban_hang;
USE quan_ly_ban_hang;

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    age INT,
    CHECK (age >= 18)
);

CREATE TABLE `order` (
    order_id INT PRIMARY KEY,
    customer_id INT,
    date_order DATE,
    total_price DOUBLE,
    FOREIGN KEY (customer_id)
        REFERENCES customer (customer_id)
);

CREATE TABLE product (
    product_id INT PRIMARY KEY,
    `name` VARCHAR(45),
    price DOUBLE
);

CREATE TABLE order_detail (
    detail_id INT,
    product_id INT,
    order_qty VARCHAR(45),
    FOREIGN KEY (detail_id)
        REFERENCES `order` (order_id),
    FOREIGN KEY (product_id)
        REFERENCES product (product_id)
);


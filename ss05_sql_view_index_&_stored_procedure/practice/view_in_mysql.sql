USE `classicmodels`;

create view customer_views AS
select customerNumber, customerName, phone
from customers;
select * from customer_views;

CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

DROP VIEW view_name;
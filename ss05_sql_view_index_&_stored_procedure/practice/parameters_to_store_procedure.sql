USE `classicmodels`;

-- SP IN
DELIMITER //
create procedure sp_get_customer_by_id(IN cus_id INT)
begin
select * from customers where customerNumber = cus_id;
end //
DELIMITER ;

call sp_get_customer_by_id(175);

DELIMITER //

-- SP OUT
CREATE PROCEDURE GetCustomersCountByCity(

    IN  in_city VARCHAR(50),

    OUT total INT

)

BEGIN

    SELECT COUNT(customerNumber)

    INTO total

    FROM customers

    WHERE city = in_city;

END//

DELIMITER ;
CALL GetCustomersCountByCity('Lyon',@total);
SELECT @total;


-- SP INOUT
DELIMITER //

CREATE PROCEDURE SetCounter(

    INOUT counter INT,

    IN inc INT

)

BEGIN

    SET counter = counter + inc;

END//

DELIMITER ;

SET @counter = 1;

CALL SetCounter(@counter,1); -- 2

CALL SetCounter(@counter,1); -- 3

CALL SetCounter(@counter,5); -- 8

SELECT @counter; -- 8
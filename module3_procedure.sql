DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
select * from customers;
END //
DELIMITER ;

CALL findAllCustomers();

DELIMITER //
DROP procedure if exists `findAllCustomers`//
create procedure findAllCustomers()
begin
select* from customers where customerNumber = 175;
end; //
DELIMITER 

CALL findAllCustomers();

DELIMITER //
DROP procedure if exists `findAllCustomers`//
DELIMITER 

DELIMITER //
create procedure getCusByID(
in cusNum INT(11))
begin
select * from customers where customerNumber = cusNum;
end //
DELIMITER ;

call getCusByID(175);

DELIMITER //
create procedure getCustomersCountBycity(
in in_city varchar(50),
out total int)
begin
select count(customerNumber)
into total
from customers
where city = in_city;
end //
delimiter ;

call getCustomersCountBycity('Lyon', @total);
select @total;

DELIMITER //
create procedure setCounter(
inout counter int,
in inc int
)
begin
set counter = counter + inc;
end //
DELIMITER ;

DROP procedure if exists setCounter;

SET @counter = 1;
CALL setCounter(@counter, 1);
select @counter;
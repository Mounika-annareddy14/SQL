-- so lets look at how we can create a stored procedures

-- first lets just write simple query
select * from employee_salary where salary >=60000;

-- now lets put this into a stored procedures
Create Procedure large_salaries()
select * from employee_salary where salary >= 60000;

-- Now if we run this it will work and create the stored procedure
-- we can click refresh and see that it is there

-- notice it did not give us an output, that's because we 

-- If we want to call it and use it we can call it by saying:
Call large_salaries();

-- as you can see it ran the query inside the stored procedure we created


-- Now how we have written is not actually best practice.alter
-- Usually when writing a stored procedure you don't have a simple query like that. It's usually more complex

-- if we tried to add another query to this stored procedure it wouldn't work. It's a separate query:
create procedure large_salaries2()
select * from employee_salary 
where salary >= 60000;
select * from employee_salary 
where salary >= 50000;

-- best practice is to use a delimitter and a begin and end to really control whats in the stored procedure
-- lets see how we can do these
-- the delimitter is what separates the queries by default , we can change this to something like two $$
-- when we change this delimitter it now reads in everything as one whole unit or query instead of stopping
-- after the first semicolon

delimiter $$
Create procedure large_salaries3()
Begin
		select * from employee_salary where salary >= 60000;
        select * from employee_salary where salary >= 50000;
end $$
-- now we change the delimiter back after we use it to take make it default again
delimiter ;

-- let's refresh to see the SP
-- now we can run this stored procedure
CALL large_salaries3();

-- -- as you can see we have 2 outputs which are the 2 queries we had in our stored procedure

-- we can also create a stored procedure by right clicking on Stored Procedures and creating one:

-- it's going to drop the procedure if it already exists.
use `parks_and_recreation`;
Drop Procedure if exists `large_salaries3`;
-- it automatically adds the dilimiter for us
DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

DELIMITER ;

-- and changes it back at the end

-- this can be a genuinely good option to help you write your Stored Procedures faster, although either way
-- works

-- if we click finish you can see it is created the same and if we run it

CALL large_salaries3();

-- we get our results

-- -------------------------------------------------------------------------

-- we can also add parameters
USE `parks_and_recreation`;
DROP PROCEDURE IF EXISTS `large_salaries3`;

DELIMITER $$

CREATE PROCEDURE large_salaries4(employee_id_param INT)  -- Added `IN` before parameter
BEGIN
    SELECT *
    FROM employee_salary
    WHERE salary >= 60000
    AND employee_id = employee_id_param;  -- Fixed parameter reference
END $$

DELIMITER ;

-- Calling the procedure with a parameter
CALL large_salaries4(1);

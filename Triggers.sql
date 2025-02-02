-- Triggers
-- a trigger is a block of code that executes automatically executes when an event takes place in a table.

-- for example we have these 2 tables , invoice and payments  - when a client makes a payment we want it to update the invoice field "total  paid"
-- to reflect that the client has indeed their voice..

select * from employee_salary;
select * from employee_demographics;

-- so really when we get a new row or data is inserted into the payments table we want a trigger to update the correct invoice
-- with the amount that was paid
-- so lets write this out

use park_and_recreation;
Delimiter $$

CREATE TRIGGER  employee_insert2
-- we can also do BEFORE , BUT for this  we have to do after
		AFTER INSERT ON EMPLOYEE_SALARY
-- now this means triggers get started / activated for each row that is inserted . some sql databases like mssql have batch triggers or table level triggers
-- that triggers only once , but mysql doesnot have that functionality
		 FOR EACH ROW
         -- NOW we can write our block of code that we want to run when this is triggered
BEGIN

-- we want to update our client invoices table
-- and set the total paid = total_paid (if they had already made some payments) + NEW.amount_paid
-- NEW says only from the new rows that were inserted. There is also OLD which is rows that were deleted or updated, but for us we want NEW
		INSERT INTO employee_demographics(EMPLOYEE_ID , FIRST_NAME , LAST_NAME)  VALUES (NEW.EMPLOYEE_ID , NEW.FIRST_NAME , NEW.LAST_NAME);
END $$
DELIMITER ;

-- Now let's run it and create it
-- Now that it's created let's test it out.
-- Let's insert a payment into the payments table and see if it updates in the Invoice table.
-- so let's put the values that we want to insert - let's pay off this invoice 3 in full
INSERT INTO EMPLOYEE_SALARY(EMPLOYEE_ID , FIRST_NAME , LAST_NAME , OCCUPATION , SALARY , DEPT_ID)
 VALUES (13,'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);
 
-- now it was updated in the payments table and the trigger was triggered and update the corresponding values in the invoice table
SELECT * FROM EMPLOYEE_SALARY;
DELETE FROM EMPLOYEE_SALARY
WHERE EMPLOYEE_ID = 13;


-- -------------------------------------------------------------------------

-- NOW LETS LOOK AT EVENTS
-- events are task or block of code that gets executed according to a schedule.these are fantastic for so many reasons. importing data on schedule
-- secheduling reports to be exported to files and so many other things.
-- we can schedule all of this to happen every day ,  every monday , every first of month at 10am really whatever we want.
-- This really helps with automation in MySQL

-- let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
-- All we have to do is delete them from the demographics table

SELECT * FROM parks_and_recreation.employee_demographics;

SHOW EVENTS;

-- WE CAN DROP EVENTS OR ALTER
DROP EVENT IF EXISTS DELETE_RETIREES;
DELIMITER $$
CREATE EVENT DELETE_RETIRESS
ON SCHEDULE EVERY 30 SECOND
DO BEGIN
        DELETE 
        FROM  parks_and_recreation.employee_demographics
	WHERE AGE>=60;
END $$

SELECT * FROM parks_and_recreation.employee_demographics;


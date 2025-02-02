--- GROUP BY
--- When you use GROUP BY clause in a my sql  query , it groups together rows that have the same values in the specified columns or columns 
--- GROUP BY is going to allow us to group rows that have the same data and run aggregrate functions on them 

select * from parks_and_recreation.employee_demographics;

--- when you use group by you have to have the same columns you re grouping on in the groupby statement

select gender from parks_and_recreation.employee_demographics
group by gender ;


select first_name from employee_demographics
group by 
gender;


select occupation from employee_salary
group by 
occupation;
-- notice there is only one office manager row


select occupation from employee_salary;

--- when we group by two  columns we have a row for both occupation and salary because salary is differnet---
select occupation , salary from employee_salary
group by 
occupation , salary;


--- now the most useful reason we use group by is so we can perform out aggrerate functions on them--
select gender ,  Avg(age)
from employee_demographics 
GROUP BY GENDER;


SELECT GENDER , AVG(AGE) , MAX(AGE) , MIN(AGE) , COUNT(AGE) 
FROM employee_demographics
GROUP BY GENDER;


---- ORDER BY CLAUSE-----
-----------------------
# THE ORDER BY keyword is used to sort the result -set in Asc-Desc order 

# the order by keyword sorts the record in ascending order by default . To sort the records in descending orders use the DESC keyword.

# FIRST LETS START SIMPLE WITH JUST ORDERING BY ONE COLUMN
-- if we use order by it goes a to z by default (ascending order)
SELECT * FROM employee_demographics
ORDER BY first_name;

--- WE CAN MANULLAY CHANGE THE ORDER BY USING DESC
SELECT * FROM EMPLOYEE_DEMOGRAPHICS 
ORDER BY
FIRST_NAME DESC;

#NOW WE CAN ALSO DO FOR MULTIPLE COLUMNS LIKE THESE
SELECT * FROM EMPLOYEE_DEMOGRAPHICS 
ORDER BY 
GENDER , AGE;

SELECT * FROM EMPLOYEE_DEMOGRAPHICS
ORDER BY
GENDER DESC , AGE DESC;


#now we don't actually have to spell out the column names. We can actually just use their column position

#State is in position 8 and money is in 9, we can use those as well.
SELECT *
FROM employee_demographics
ORDER BY 5 DESC, 4 DESC;

#Now best practice is to use the column names as it's more overt and if columns are added or replaced or something in this table 
-- it will still use the right columns to order on.
-- So that's all there is to order by - fairly straight forward, but something I use for most queries I use in SQL






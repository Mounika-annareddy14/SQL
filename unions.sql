--- UNIONS
-- A union is how you can combine rows together - not columns like we have been doing with joins where one column is put next to other 
-- joins allows us to combine the rows  of data 

select first_name , last_name 
from employee_demographics
UNION
select occupation , salary 
from employee_salary ;

-- so we can see basically combined the data together , but not side by side in differnt columns , but one on top of the other in the same columns
# this obviously is not good since we are mixing data

select first_name , last_name from employee_demographics
union
select first_name , last_name from employee_salary;

-- it get rids of duplicates .. union is shorthand for union distinct

select first_name , last_name from employee_demographics
UNION distinct
SELECT FIRST_NAME , LAST_NAME FROM EMPLOYEE_SALARY;

-- we can use UNION ALL to show all values

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

#Now Let's actually try to use UNION
# The Parks department is trying to cut their budget and wants to identify older employees they can push out or high paid employees who they can reduce pay or push out
-- let's create some queries to help with this

SELECT first_name , last_name ,'old'
from employee_demographics
where
age > 50;

select first_name , last_name , 'Old Lady' as label
from employee_demographics
where
age > 40  and gender = 'female'
UNION
select first_name , last_name , 'old man' 
from employee_demographics
where 
age > 40 and gender = 'Male'
union
select first_name , last_name , 'high-paid-employee'
from employee_salary 
where 
salary >= 70000
order by first_name;









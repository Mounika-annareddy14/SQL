# SELECT statement is used to help filter or select our actual columns 

SELECT * FROM parks_and_recreation.employee_demographics;



select first_name , 
gender , 
birth_date,
age,
(age + 10) * 10
from parks_and_recreation.employee_demographics;
#PEMDAS

SELECT DISTINCT gender from parks_and_recreation.employee_demographics;


select distinct first_name , gender from parks_and_recreation.employee_demographics;
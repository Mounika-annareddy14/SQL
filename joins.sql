-- JOINS --
-- joins allow us to combine 2 tabels together (or more) if they have a common column
-- doest mean they need the same column name  , but the data in it are the same and can be used to join the tables together.
-- there are several joins inner joins , outer joins , self joins


-- here are the first 2 tables  - lets see what columns and data in the rows we have in common that we can join on

SELECT * FROM 
employee_demographics;

SELECT * FROM
EMPLOYEE_SALARY;

--- LETS start with an INNER JOINS --- 
-- Inner joins returns the rows that are the same in both columns.

-- since we have the  same column we need to specifiy which table they are coming

select * from employee_demographics
JOIN employee_salary;

-- notice Ron Swanson isnt in the results ? this is because does not have an employee id  in the demographics table. he refused to give his birth date age or gender.

-- use aliasing
select * from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id = sal.employee_id;

-- OUTER JOINS
-- FOR outer joins we have left and right
--  a left join will take everything from the left table even if there is no match in th join , but it will only return matches from the right table
-- a rigit join will take evrything from the right table even if there is no match in the join , but it will only returns matches from the left table

select * from employee_salary as sal
left join employee_demographics as dem
on sal.employee_id = dem.employee_id;

-- so we will notice we have everything from the left table or the salary tabel . even though there is no match to ron.
-- since there is no match on the right table it returns null


-- if we just switch this to a right join it basically just looks like an inner join
-- thats because we are taking everything from the demographics table and only matches from the left or salary table . since they have all the matches 
-- it looks like a inner join

select * from employee_salary as sal
right join employee_demographics as dem
  on sal.employee_id = dem.employee_id;
  
 -- SELF JOIN
 -- a elf join is where we tie a table to it self
 
 select * from employee_salary;
 
 -- what could we do is a serete santa so the person with the higher id is the persons secrete santa
 
 SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id
    ;

-- now let's change it to give them their secret santa
SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1  = emp2.employee_id
    ;



SELECT emp1.employee_id as emp_santa, emp1.first_name as santa_first_name, emp1.last_name as santa_last_name, emp2.employee_id, emp2.first_name, emp2.last_name
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1  = emp2.employee_id;
    
    -- So leslie is Ron's secret santa and so on -- Mark Brandanowitz didn't get a secret santa, but he doesn't deserve one because he broke Ann's heart so it's all good

-- joining multiple tables

-- now we have on other table we can join - lets a look on it
select * from 
parks_and_recreation.parks_departments;

select * from employee_demographics as dem
inner join employee_salary as sal

on dem.employee_id = sal.employee_id

join parks_departments as dept
on dept.department_id = sal.dept_id;

-- we noticed that we we did this since its an inner join it got rid of andy because he was not a part of any department
-- -- if we do a left join we would still include him because we are taking everything from the left table which is the salary table in this instance
SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
LEFT JOIN parks_departments dept
	ON dept.department_id = sal.dept_id;
  
  
  











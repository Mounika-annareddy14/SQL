-- using common  table expressions (CTE)
-- A CTE allows you to define a subquery block that can be refrenced within the main query.
-- It is particulary useful for recursive queries or queries that requires referencing a higher level.
-- this is something we will look at in the next level//

-- Let's take a look at the basics of writing a CTE:

-- first CTE S  starts with using a WITH keyword . Now we get to name this CTE anything we want.
-- then we acn say as and within the parenthesis we build our subquery / table we want.
WITH CTE_Example AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary), AVG(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
-- directly after using it we can query the CTE
select * from CTE_Example;


--  now if i come down here it wont work because its not using the same syntax
select * from CTE_Example;

-- now we acn use the columns within this CTE to do calculations on this data that
-- now we couldnt have done without it..


with CTE_example as
(select gender , sum(salary) , max(salary) , count(salary) , avg(salary)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
-- notice here i have to use back ticks to specify the table names  - without them its doesnot work
select gender , round(avg(`sum(salary)`/`count(salary)`),2)
from CTE_example
group by gender;

-- we also have ability to create multiple CTE s with just one with expression

WITH CTE_Example AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
), -- just have to separate by using a comma
CTE_Example2 AS 
(
SELECT employee_id, salary
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
)
-- Now if we change this a bit, we can join these two CTEs together
SELECT *
FROM CTE_Example cte1
LEFT JOIN CTE_Example2 cte2
	ON cte1. employee_id = cte2. employee_id;
    
-- the last thing i wanted to show you is that we can actually make our life easier by renaming the columns in the CTe
-- lets take our very first step CTE we made. we had to use tick marks because of the column names

with CTE_example (gender , sum_salary , min_salary , max_salary , count_salary) as
(
select gender ,  sum(salary) , max(salary) , min(salary), count(salary) 
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
-- notice here I have to use back ticks to specify the table names  - without them it doesn't work
select gender , round(Avg(sum_salary / count_salary),2)  as avg
from CTE_Example
group by gender

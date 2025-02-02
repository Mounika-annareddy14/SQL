-- SUBQUERIES--
-- subqueries are queries within the queries.

select * from employee_demographics;

#Now let's say we wanted to look at employees who actually work in the Parks and Rec Department, we could join tables together or we could use a subquery
#We can do that like this:
select * from employee_demographics
where employee_id in
						(select employee_id from employee_salary where dept_id = 1);
                        

#So we are using that subquery in the where statement and if we just highlight the subwuery and run it it's basically a list we are selecting from in the outer query

select * from employee_demographics
where employee_id in
						(select employee_id , salary from employee_salary where dept_id = 1);
                        
-- now if we try to have more than 1 column in the subquery we get an error saying the operand should contain 1 column only
-- we can also use subqueries in the select and from statements-- 
-- Let's say we want to look at the salaries and compare them to the average salary

select first_name , salary , Avg(salary)
from employee_salary;
--- if we run this its not going to work we are using columns with an aggregrate functions so we need to use group by
-- if we do that though we dont exactly get what we want

select first_name , salary , Avg(salary)
from employee_salary
group by first_name , salary;

-- its giving us the average per group which we dont want
-- here is a good use for subquery

select first_name , salary ,
(select Avg(salary) from employee_salary)
from employee_salary;


-- we can also use it in the from statement
select * from (select gender , min(age) , max(age) , count(age) , avg(age) 
from employee_demographics
group by gender);
-- now this does not work because we get an error saying we have to name it

select gender ,  avg(min_age)
from (select gender, min(age) min_age , max(age) max_age , count(age) count_age , avg(age) avg_age from employee_demographics
group by gender) as agg_table
group by gender


                        

-- Windows functions
-- Windows functions are really powerful and somewhat like a group by - except they dont roll everything up into 1 row when grouping.
-- windows function allows us to look at a partition or a group , but they each keep their own unique rows in the output
-- we will also look at things like Row numbers , rank and dense rank..

select * from employee_demographics;
-- first lets look at group by
select gender , Round(avg(salary),1)
from employee_demographics dem
join employee_salary sal
			on dem.employee_id = sal.employee_id
group by gender;

select dem.employee_id , dem.first_name , gender , salary ,
AVG(salary) over()
from employee_demographics dem
join employee_salary sal
			on dem.employee_id = sal.employee_id
;

-- now we can add any columns and it works . we could get this exact same output with a subquery in the select statement ,
-- but window functions have a lot more functionality , lets take a look

-- if we use partition its kind of like the group by except it doesnot roll up - it just partitions or breaks based on a column when doing the calculations 

select dem.employee_id , dem.first_name , gender , salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY  employee_id)
from employee_demographics dem
JOIN employee_salary sal
		on dem.employee_id = sal.employee_id ;
        

-- now if we wanted to see what the salaries were for genders we could do that by using sum , but also we could use order by to get a rolling total

select dem.employee_id , dem.first_name , gender , salary,
SUM(salary) over(PARTITION BY gender ORDER BY employee_id)
from employee_demographics dem
join employee_salary sal
		on dem.employee_id = sal.employee_id ;
        
-- lets look at row_number rank and dense rank now

select dem.employee_id , dem.first_name , gender , salary,
row_number() over(partition by gender)
from employee_demographics dem
join employee_salary sal
		on dem.employee_id = sal.employee_id;
        
-- let's  try ordering by salary so we can see the order of highest paid employees by gender
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary desc)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

-- lets compare to this rank
select dem.employee_id , dem.first_name , gender , salary,
row_number() over(partition by gender order by salary desc) row_num,
Rank() over(partition by gender order by salary desc) rank_1
from employee_demographics dem
join employee_salary sal



	  on dem.employee_id = sal.employee_id;
      
-- notice rank repeats on tom ad jerry at 5, but then skips 6 to go to 7 -- this goes based off positional rank

-- lets compare this to dense rank
select dem.employee_id , dem.first_name , gender , salary,
row_number() over(partition by gender order by salary desc) row_num,
Rank() over(partition by gender order by salary desc) rank_1,
dense_rank() over(partition by gender order by salary desc) dense_rank_2
from employee_demographics dem
join employee_salary sal
	 on dem.employee_id = sal.employee_id;


-- lets compare this with lag_lead
select dem.employee_id , dem.first_name , gender , salary,
lag(salary , 1, 0) over(partition by gender order by salary) as prev_salary,
lead(salary , 1, 0) over(partition by gender order by salary) as next_salary
from employee_demographics dem
join employee_salary sal
	 on dem.employee_id = sal.employee_id;
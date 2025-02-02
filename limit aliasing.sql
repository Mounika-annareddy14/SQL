-- LIMIT ALIASING

-- LIMIT IS JUST GOING TO SPECIFY HOW MANY ROWS YOU WANT IN THE OUTPUT

SELECT * FROM employee_demographics
LIMIT 3;

-- IF WE CHANGE SOMETHING LIKE THE ORDER OR USE A GROUP BY IT WOULD CHANGE THE OUTPUT
SELECT * FROM EMPLOYEE_DEMOGRAPHICS
ORDER BY FIRST_NAME
LIMIT 3
;

-- now there  is an additional parameter in limoit which we can access using a comma that specifies the starting place
select * from employee_demographics
order by first_name 
limit 3,2;

-- this now says start at position 3 and take 2 rows after that
-- this is not used a lot 

-- you could us it if you wanted to select the third oldest person by doing this:
SELECT *
FROM employee_demographics
ORDER BY age desc;
-- we can see it's Donna - let's try to select her
SELECT *
FROM employee_demographics
ORDER BY age desc
LIMIT 2,1;

-- ALIASING--
-- ALIASING  is just a way to change the name of the column.
-- we can use the keyword AS to specify we are using an Alias
SELECT gender, AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender
;

-- although we don't actually need it, but it's more explicit which I usually like
SELECT gender, AVG(age) Avg_age
FROM employee_demographics
GROUP BY gender
;


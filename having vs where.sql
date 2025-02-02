---- HAVING vs WHERE-----
-- both were created to filter rows of data , but they are two separate things
-- where is going to filter rows based off columns of data
-- havimg is going to filter rows based off aggregrated columns when grouped.

SELECT GENDER , AVG(AGE)
FROM employee_demographics
GROUP BY GENDER;


SELECT GENDER , AVG(AGE)
FROM employee_demographics
WHERE AVG(AGE) > 40
GROUP BY GENDER;


--- THIS DOES NOT WORKING BECAUSE OF ORDER OF OPERATIONS . ON THE BACKEND WHERE COMES BEFORE THE GROUP BY .
-- SO WE CANT FILTER ON DATA THAT HASNT BEEN GROUPED
-- THIS IS WHY HAVING CLAUSE IS CREATED....

SELECT GENDER , AVG(AGE)
FROM employee_demographics
GROUP BY GENDER
HAVING AVG(AGE) > 40;

--- ALIASING----
SELECT GENDER , AVG(AGE) AS avg_age
FROM employee_demographics
GROUP BY GENDER
HAVING avg_age > 40;
---# WHERE CLAUSE---
# The WHERE clause is used to filter records (rows of data)

#Its going to extract only those recods that fulfil a SPECIAL CONDITION

# so basically if we say "Where name is = 'Mouni' - only rows were the name = 'Mouni' will return
#so this is only effecting the rows , not the columns


#Lets take a look at how this looks
select * from parks_and_recreation.employee_salary
WHERE salary > 50000;

select * from parks_and_recreation.employee_salary
WHERE salary >= 50000;

select * from parks_and_recreation.employee_demographics
where gender = 'female';

select * from parks_and_recreation.employee_demographics
where gender != 'Female';

#we can use where clause for date values also
select * from parks_and_recreation.employee_demographics
where birth_date = '1980-01-01';

select * from parks_and_recreation.employee_demographics
where birth_date > '1985-01-01';


# ----LIKE STATEMENT------
---- two special characters a % and a_--------

-- % means anything --
select * from parks_and_recreation.employee_demographics where first_name like 'a%';

-- _ means specific values
select * from parks_and_recreation.employee_demographics where first_name like 'a___';

select * from parks_and_recreation.employee_demographics where first_name like 'a___%';

select * from parks_and_recreation.employee_demographics where birth_date like '1____%';

-- Uisng temporary files
-- temporary tables are tables that are only visible to the session that created them.
-- they can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.
 
 -- there are two ways to create temps:
 -- 1. this  is the less commonly used way -- which is build it exactly like a real table and insert data into it.
 
 create TEMPORARY TABLE TEMP_TABLE
 (FIRST_NAME VARCHAR (50),
 LAST_NAME VARCHAR (50),
 FAVIOURITE_MOVIE VARCHAR(100)
 );
 
 -- IF we execute this it gets created and we can actually query it..
 
 select * from Temp_table;
 -- notice that if we refresh out tables it isn't there. It isn't an actual table. It's just a table in memory.

-- now obviously it's balnk so we would need to insert data into it like this:

insert into temp_table 
values ('Alex','Freberg','Lord of the Rings: The Twin Towers');
-- now we run it and execute it again we have our data
select * from temp_table;

-- the second way is much faster and my preferred method
-- 2. Build it by inserting data into it - easier and faster
create temporary table salary_over_50k
select * from employee_salary where salary > 50000;

select * from salary_over_50k
-- this is the primary way I've used temp tables especially if I'm just querying data and have some complex data I want to put into boxes or these temp tables to use later
-- it helps me kind of categorize and separate it out

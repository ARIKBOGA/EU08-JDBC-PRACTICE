select * from employees;
-- reads all column from employees table

select * from departments;
-- reads all column from departments table

select first_name from employees;
--get only firstname from employees table

--displaty city names
select city from locations; 

--get me first_name,last_name and salary

select first_name,last_name,salary from employees;

--get me street address and postal code 
SELECT street_address, postal_code 
FROM locations;

select distinct first_name from employees;
--remove duplicates


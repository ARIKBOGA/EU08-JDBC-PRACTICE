--how to find employees information of who is making highest salary in the company ?

--get me the highest salary 
select max(salary) from employees;

--highest salary employee information
select *
from employees
where salary = 24000;


--subquery solution in one shot 
select *
from employees
where salary = (select max(salary) from employees);

--finding second highest salary
--get highest salary first
select max(salary) from employees;

--highest after 24k 
select max(salary)
from employees
where salary <24000;

--one shot combining two queries

select max(salary)
from employees
where salary < (select max(salary) from employees);

--employee information of who is making second highest salary ? 
select * 
from employees
where salary = (select max(salary)from employees where salary < (select max(salary) from employees) );

----------
select * from employees;

select * from employees
order by salary desc;

select *
from employees
where rownum < 11;

--list the employees who is making top 10 salary

--get the first 10 people then order them high to low based on salary
select *
from employees
where rownum < 11
order by salary desc;

--order all employees based on salary high to low then display only first 10 result
select *
from (select * from employees order by salary desc)
where rownum < 11;

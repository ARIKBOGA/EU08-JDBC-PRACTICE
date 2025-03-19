--how to find employees information of who is making highest salary in the company ?

--get me the highest salary 
select max(salary)
from employees;

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
select max(salary)
from employees;

--highest after 24k 
select max(salary)
from employees
where salary < 24000;

--one shot combining two queries

select max(salary)
from employees
where salary < (select max(salary) from employees);

--employee information of who is making second highest salary ? 
select *
from employees
where salary = (select max(salary) from employees where salary < (select max(salary) from employees));

-- FIRST_NAME, DEPARTMENT_NAME of sixth highest salary employees
select FIRST_NAME, DEPARTMENT_NAME, SALARY
from EMPLOYEES
         join DEPARTMENTS d on d.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
where SALARY = (select min(SALARY)
                from (select SALARY
                      from (select distinct SALARY from EMPLOYEES order by SALARY desc)
                      where ROWNUM < 7));
----------
select *
from employees
where FIRST_NAME like 'A%ys%a';

select *
from employees
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

-- get first 3 highest salary
select SALARY
from (select distinct SALARY from EMPLOYEES order by salary desc)
where rownum < 4
order by SALARY desc;


select round(avg(SALARY),3)
from EMPLOYEES;

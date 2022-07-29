
--get me unique job_ids
select distinct job_id from employees;

-- get me average salary for IT_PROG
SELECT AVG(salary)
FROM employees
WHERE job_id = 'AC_ACCOUNT';

-- get me average salary for each job_id
select job_id,avg(salary)
from employees
group by job_id;


--get me job_ids where their avg salary is more than 5k
select job_id,avg(salary),count(*),sum(salary)
from employees
group by job_id
having avg(salary) >5000;

--get me job_ids where their avg salary is more than 5k
select job_id,avg(salary),count(*),sum(salary)
from employees
where salary >5000
group by job_id;



--1. Show all job_id and average salary who work as any of these jobs IT_PROG, SA_REP, FI_ACCOUNT, AD_VP
SELECT JOB_ID, AVG(SALARY)
FROM EMPLOYEES
WHERE JOB_ID IN ('IT_PROG', 'SA_REP', 'FI_ACCOUNT', 'AD_VP')
GROUP BY JOB_ID;

--2. Show all records whose last name contains 2 lowercase 'a's
SELECT *
FROM EMPLOYEES
WHERE LAST_NAME LIKE2 '%a%a%';

--3. Display max salary  for each department
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, MAX(SALARY) MAX_SALARY
FROM DEPARTMENTS D
         JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME, D.DEPARTMENT_ID
ORDER BY MAX_SALARY DESC;

--4. Display total salary for each department except department_id 30, and where total salary >30000
SELECT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, SUM(E.SALARY)
FROM DEPARTMENTS D
         JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID !=30
GROUP BY D.DEPARTMENT_ID, D.DEPARTMENT_NAME
HAVING SUM(SALARY) <= 30000
ORDER BY SUM(SALARY) DESC, DEPARTMENT_ID;

--5. Write a SQL query that returns first and last name any employees who started job between 1-JAN-2000 and 3-SEP-2007 from the hr database
SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE BETWEEN DATE '2000-01-01' AND DATE '2007-09-03'
ORDER BY HIRE_DATE;

--6. Display country_id, country name, region id, region name from hr database
SELECT COUNTRY_ID, COUNTRY_NAME, R.REGION_ID, R.REGION_NAME
FROM COUNTRIES
         JOIN REGIONS R on COUNTRIES.REGION_ID = R.REGION_ID;

--7. Display All cities, country names from hr database
SELECT CITY, C2.COUNTRY_NAME
FROM LOCATIONS L
         JOIN COUNTRIES C2 on C2.COUNTRY_ID = L.COUNTRY_ID;

--8. display the first name, last name, department number, and department name,  for all employees for departments 80 or 40.
SELECT CONCAT(CONCAT(FIRST_NAME, ' '), LAST_NAME) FULL_NAME, E.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
         JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IN (40, 80);

--9. Display employees' first name, Lastname department id and all departments including those where do not have any employee.
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
         RIGHT JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_ID;

--10. Display the first name, last name, department number, and name, for all employees who have or have not any department
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_ID, D.DEPARTMENT_NAME
FROM EMPLOYEES E
         LEFT JOIN DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
ORDER BY D.DEPARTMENT_ID;

--11. Display all employee and their manager's names
SELECT E.FIRST_NAME, E.LAST_NAME, M.FIRST_NAME, M.LAST_NAME
FROM EMPLOYEES E
        LEFT JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID;
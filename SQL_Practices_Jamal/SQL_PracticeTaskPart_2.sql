--1. list the initials of all the employees
SELECT CONCAT(CONCAT(SUBSTR(FIRST_NAME, 1, 1), '.'), SUBSTR(LAST_NAME, 1, 1)) INITIALS
FROM EMPLOYEES;

--2. list the full names of all employees ( full_name: Lastname FirstName)
SELECT CONCAT(CONCAT(LAST_NAME, ' '), FIRST_NAME) FULL_NAME
FROM EMPLOYEES;

--3. who has the longest name in the employees table? (single name)
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) = (SELECT MAX(LENGTH)
                            FROM (SELECT LENGTH(FIRST_NAME) LENGTH
                                  FROM EMPLOYEES
                                  ORDER BY LENGTH(FIRST_NAME) DESC))
  AND FIRST_NAME NOT LIKE '% %';

--4. Show all employees who work in any one of these department id  90, 60, 100, 130, 120
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN (90, 60, 100, 130, 120);

--5. Show all employees who does not work in any one of these department id 90, 60,  100, 130, 120
SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID NOT IN (90, 60, 100, 130, 120)
   OR DEPARTMENT_ID IS NULL;


--6. divide employees into groups by using their job id

--6.1 display the maximum salaries in each groups
SELECT MAX(SALARY), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY MAX(SALARY) DESC;

--6.2 display the minimum salaries in each groups
SELECT MIN(SALARY), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY MIN(SALARY);

--6.3 display the average salary of each group
SELECT AVG(SALARY), JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY AVG(SALARY) DESC;

--6.4 how many employees are there in each group that have minimum salary of 5000 ?
SELECT COUNT(EMPLOYEES.JOB_ID), JOB_ID
FROM EMPLOYEES
WHERE SALARY < 5000
GROUP BY JOB_ID;

--6.5 display the total budgets of each groups
SELECT SUM(SALARY) BUDGET, JOB_ID
FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY BUDGET DESC;

--7. display employees' full email addresses and full names (assume that the domain of the email is @gmail)
SELECT CONCAT(CONCAT(LOWER(EMAIL), '@'), 'gmail.com') AS EMAIL,
       CONCAT(CONCAT(LAST_NAME, ' '), FIRST_NAME)     AS FULL_NAME
FROM EMPLOYEES;

--8. display full addresses from locations table in a single column (full address: Street_Address,  CityName  ZipCode,  Country_id)
SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(STREET_ADDRESS, ' '), CITY), ' '), POSTAL_CODE), ' '),
              COUNTRY_ID) FULL_ADDRESS
FROM LOCATIONS;
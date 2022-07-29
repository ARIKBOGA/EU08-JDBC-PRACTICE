--how can we rename the column that we displayed
select first_name as "given_name", last_name as "surname"
from employees;

--text functions,string mani.
--java first_name+" "+last_name
-- in sql concat is ||

select first_name||' '||last_name as "full_name"
from employees;

--Task;
--add @gmail.com and name new column to full_email
select email from employees;

select email||'@gmail.com' as "full_email"
from employees;

--making all lowercase
select lower(email||'@gmail.com') as "full_email"
from employees;

--upper case
select upper(email||'@gmail.com') as "full_email"
from employees;

--length(value)
select first_name,length(first_name) as "length_name"
from employees
order by "length_name" desc;

--substr(colName,begIndex,NumberOfChar)
select substr(first_name,0,1)||'.'||substr(last_name,0,1) as "initials"
from employees;

select substr(first_name,0,1)||'.'||substr(last_name,0,1) as "initials",
first_name||' '||last_name as "full_name",lower(email||'@gmail.com') as "full_email"
from employees;

--VIEW
CREATE VIEW Emaillist_jamal as select substr(first_name,0,1)||'.'||substr(last_name,0,1) as "initials",
first_name||' '||last_name as "full_name",lower(email||'@gmail.com') as "full_email"
from employees;

select "full_name"
from Emaillist_jamal;

--to remove view
drop view Emaillist_jamal;




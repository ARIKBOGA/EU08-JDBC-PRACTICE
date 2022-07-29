/*
create table syntax:
    create table TableName(
        colName1 DataType Constraints,
        colName2 DataType Constraints(optional)
        colName3 DataType Constraints,
        ...
    );
*/

CREATE TABLE ScrumTeam(
        Emp_ID Integer Primary Key,
        FirstName varchar(30) not null,
        LastName varchar(30),
        JobTitle varchar(20)
        
);

select * from scrumteam;

/*
INSERT INTO tableName (column1, column2,…)
VALUES (value1, value2 … );
*/

INSERT INTO ScrumTeam (emp_id,firstname,lastname,jobtitle)
VALUES (1,'Severus','Snape','Tester');

INSERT INTO ScrumTeam VALUES (2,'Harold','Finch','Developer');

INSERT INTO ScrumTeam VALUES (3,'Phoebe','Buffay','ScrumMaster');

INSERT INTO ScrumTeam VALUES (4,'Michael','Scofield','PO');


--how to update data
/*
UPDATE table_name
SET column1 = value1,
column2 = value2 , …
WHERE condition;
*/

UPDATE ScrumTeam
SET jobtitle = 'Tester'
WHERE emp_id = 4;

--Delete from table 
/*
DELETE FROM table_name
WHERE condition;
*/
DELETE FROM ScrumTeam
WHERE emp_id = 3;

--saving changes
commit;


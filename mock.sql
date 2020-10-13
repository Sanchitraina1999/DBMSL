CREATE DATABASE MOCK;

USE MOCK;

CREATE TABLE Emp(
    Emp_name VARCHAR(16) NOT NULL,
    City VARCHAR(16) NOT NULL,
    EmpId INT NOT NULL,
    PRIMARY KEY(Emp_name)
);

CREATE TABLE Emp_salary(
    Emp_name VARCHAR(16) NOT NULL,
    Deptname VARCHAR(16) NOT NULL,
    Salary INT NOT NULL,
    FOREIGN KEY (Emp_name) REFERENCES Emp(Emp_name) ON DELETE CASCADE 
);

CREATE TABLE Emp_Details(
    EMPNO INT NOT NULL,
    ENAME VARCHAR(16) NOT NULL,
    JOB VARCHAR(16) NOT NULL,
    HIREDATE DATE NOT NULL,
    SAL INT NOT NULL,
    DEPTNO INT NOT NULL,
    FOREIGN KEY (ENAME) REFERENCES Emp(Emp_name) ON DELETE CASCADE 
);

INSERT INTO Emp
    (Emp_name,City,EmpId)
VALUES
    ('Sanchit','Jammu',1),
    ('Ayush','Pune',2),
    ('Abhishek','Delhi',3),
    ('JONES','Mumbai',4),
    ('Ayushi','Nagpur',5),
    ('FORD','Ambala',6),
    ('SMITH','Badharwah',7),
    ('Kabir','Poonch',8),
    ('Kalpit','Rajouri',9),
    ('Vansh','Srinagar',10);
 
INSERT INTO Emp_salary
    (Emp_name,Deptname,Salary)
VALUES
    ('Sanchit','IT',15000),
    ('Ayush','ADMIN',10000),
    ('Abhishek','SECURITY',12000),
    ('JONES','SERVICE',15999),
    ('Ayushi','IT',12000),
    ('FORD','SERVICE',9000),
    ('SMITH','ADMIN',25000),
    ('Kabir','IT',23000),
    ('Kalpit','SERVICE',24000),
    ('Vansh','SECURITY',14000);

INSERT INTO Emp_Details
    (EMPNO,ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES
    (1,'Sanchit','Jammu','1999-12-08',15000,1),
    (2,'Ayush','Pune','1999-10-14',10000,2),
    (3,'Abhishek','Delhi','2001-12-13',12000,3),
    (4,'JONES','Mumbai','2002-12-12',15999,4),
    (5,'Ayushi','Nagpur','2003-12-18',12000,1),
    (6,'FORD','Ambala','2004-04-18',9000,4),
    (7,'SMITH','Badharwah','1997-11-28',25000,2),
    (8,'Kabir','Poonch','2006-01-30',23000,1),
    (9,'Kalpit','Rajouri','1999-02-28',24000,4),
    (10,'Vansh','Srinagar','1996-06-18',14000,3);
 

 select * from Emp;

 select * from Emp_salary;

 select * from Emp_Details;

-- 1.List the employee details along with Deptname and salary ,
-- city using left outer join & right outer  
-- join and inner Join. In Emp and Emp_salary relation. 


SELECT Emp_name,City,EmpId,Salary,Deptname
FROM Emp
LEFT JOIN Emp_salary
using (Emp_name);

SELECT Emp_name,City,EmpId,Salary,Deptname
FROM Emp
RIGHT JOIN Emp_salary
using (Emp_name);

SELECT Emp.Emp_name,City,EmpId,Salary,Deptname
FROM Emp
INNER JOIN Emp_salary
ON Emp.Emp_name = Emp_salary.Emp_name;

-- 2.Create view  EMP_SALARY1 on Emp_salary table  containing
--  Emp_name,Deptname. 

CREATE VIEW EMP_SALARY1
AS
SELECT Emp_name,Deptname
FROM Emp_salary;

SELECT * FROM EMP_SALARY1;

-- 3 Display records of employess working  in smith's 
-- dept using EMP_Details relation. 

SELECT *
FROM Emp_Details
where DEPTNO = (
    SELECT DEPTNO
    FROM Emp_Details
    WHERE ENAME = 'SMITH'
);

-- 4.Display salary of employee whose salary is more than 
-- salary of FORD using EMP_Details relation. 

SELECT ENAME,SAL
FROM Emp_Details
where SAL > (
    SELECT salary
    FROM Emp_salary
    where Emp_name = 'FORD'
);

-- 5.Display records of employee who are senior to JONES 
-- using Emp_Details relation. 
SELECT *
FROM Emp_Details
WHERE HIREDATE>(
    SELECT HIREDATE
    FROM Emp_Details
    WHERE ENAME = 'JONES'
);

-- 6.Create view  Emp_View on Emp relation 
-- contaianing Emp_name and City. 

CREATE VIEW Emp_View
AS
SELECT emp_name, city,EmpId
from Emp;

-- 7.Update city in Emp_View 
-- whose EmpId is 10. 

UPDATE Emp_View
SET City='Jaipur'
where EmpId = 10;

-- 8.Display view Emp_View. 

select * from Emp_View;

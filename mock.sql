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
    PRIMARY KEY (Salary),
    FOREIGN KEY (Emp_name) REFERENCES Emp(Emp_name) ON DELETE CASCADE
);

CREATE TABLE Emp_Details(
    EMPNO INT NOT NULL,
    ENAME VARCHAR(16) NOT NULL,
    JOB VARCHAR(16) NOT NULL,
    HIREDATE DATE NOT NULL,
    SAL INT NOT NULL,
    DEPTNO INT NOT NULL,
    FOREIGN KEY (EMPNO) REFERENCES Emp(EmpId) ON DELETE CASCADE,
    FOREIGN KEY (ENAME) REFERENCES Emp(Emp_name) ON DELETE CASCADE,
    FOREIGN KEY (SAL) REFERENCES Emp_salary(Salary) ON DELETE CASCADE
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
    (EMPNO,Emp_name,Deptname,Salary)
VALUES
    (1,'Sanchit','IT',15000),
    (2,'Ayush','ADMIN',10000),
    (3,'Abhishek','SECURITY',12000),
    (4,'JONES','SERVICE',15999),
    (5,'Ayushi','IT',12000),
    (6,'FORD','SERVICE',9000),
    (7,'SMITH','ADMIN',25000),
    (8,'Kabir','IT',23000),
    (9,'Kalpit','SERVICE',24000),
    (10,'Vansh','SECURITY',14000);

INSERT INTO Emp_Details
    (ENAME,JOB,HIREDATE,SAL,DEPTNO)
VALUES
    ('Sanchit','Jammu','1999-12-08',15000,1),
    ('Ayush','Pune','1999-10-14',15000,2),
    ('Abhishek','Delhi','2001-12-13',15000,3),
    ('JONES','Mumbai','2002-12-12',15000,4),
    ('Ayushi','Nagpur','2003-12-18',15000,1),
    ('FORD','Ambala','2004-04-18',15000,4),
    ('SMITH','Badharwah','1997-11-28',15000,2),
    ('Kabir','Poonch','2006-01-30',15000,1),
    ('Kalpit','Rajouri','1999-02-28',15000,4),
    ('Vansh','Srinagar','1996-06-18',15000,3);
 

1.List the employee details along with Deptname and salary ,
city using left outer join & right outer  
join and inner Join. In Emp and Emp_salary relation. 

2.Create view  EMP_SALARY1 on Emp_salary table  containing
 Emp_name,Deptname. 

3 Display records of employess working  in smith's 
dept using EMP_Details relation. 

4.Disply salary of employee whose salary is more than 
salary of FORD using EMP_Details relation. 

5.Display records of employee who are senior to JONES 
using Emp_Details relation. 

6.Create view  Emp_View on Emp relation 
contaianing Emp_name and City. 

7.Update city in Emp_View 
whose EmpId id 10. 

8.Display view Emp_View. 
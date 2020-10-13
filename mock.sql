CREATE DATABASE MOCK;

USE MOCK;

CREATE TABLE Emp(
    Emp_name VARCHAR(16) NOT NULL,
    City VARCHAR(16) NOT NULL,
    EmpId INT NOT NULL AUTO_INCREMENT,
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
    FOREIGN KEY (ENAME) REFERENCES Emp(Emp_name) ON DELETE CASCADE,
    FOREIGN KEY (SAL) REFERENCES Emp_salary(Salary) ON DELETE CASCADE
);


DEPT - SMITH
SALARY MORE THAN SALARY OF FORD USING EMP_DETAILS
Display records of employee who are senior to JONES using Emp_Details relation. 
Emp_View whose EmpId id 10. 

INSERT INTO Emp
    (Emp_name,City)
VALUES
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),
    ('Sanchit','Jammu'),

    (1, 1, 5),
    (2, 2, 4),
    (3, 3, 4),
    (4, 1, 5),
    (5, 2, 4),
    (6, 3, 20),
    (7, 2, 4),
    (8, 3, 5),
    (9, 1, 23),
    (10, 2, 5);


 

 

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
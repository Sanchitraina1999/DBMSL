CREATE DATABASE eight31155;

USE eight31155;


CREATE TABLE Student
(
    Rollno int NOT NULL,
    Name varchar(16) NOT NULL,
    DateofAdmission DATE NOT NULL,
    branch VARCHAR(16) NOT NULL,
    percent DOUBLE NOT NULL,
    Status varchar(16) NOT NULL,
    PRIMARY KEY (Rollno)
);

CREATE TABLE Alumni
(
    Rollno int NOT NULL,
    Name varchar(16) NOT NULL,
    DateofAdmission DATE NOT NULL,
    branch VARCHAR(16) NOT NULL,
    percent DOUBLE NOT NULL,
    Status varchar(16) NOT NULL,
    PRIMARY KEY (Rollno)
);

//Status = 'c' -> current
//Status = 'a' -> alumni

INSERT INTO Student
    (Rollno,Name,DateofAdmission,branch,percent,Status)
VALUES
    (1, 'Sanchit','1999-01-18','COMP',90.0,'c'),
    (2, 'Ayush','2009-02-08','COMP',70.0,'c'),
    (3, 'Abhishek','2019-12-19','COMP',80.1,'c'),
    (4, 'Koushal','1997-02-14','COMP',91.4,'c'),
    (5, 'Sourav','1996-10-14','IT',90.0,'c'),
    (6, 'Ayush','1995-11-30','IT',92.5,'c'),
    (7, 'Gourav','1993-09-24','IT',85.0,'c'),
    (8, 'Sankit','1994-04-28','ENTC',87.2,'c'),
    (9, 'Shivam','1992-03-18','ENTC',92.3,'c'),
    (10, 'Sativa','2001-02-19','ENTC',91.4,'c');

CREATE TRIGGER T1 
AFTER DELETE ON Student
FOR EACH ROW
INSERT INTO Alumni 
VALUES
(OLD.Rollno, OLD.Name,OLD.DateofAdmission,OLD.branch,OLD.percent,"alumni");

CREATE TRIGGER T2
AFTER UPDATE ON Student
FOR EACH ROW
INSERT INTO Alumni
VALUES 
(OLD.Rollno, OLD.Name,OLD.DateofAdmission,OLD.branch,OLD.percent,"alumni");

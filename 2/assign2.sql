-- Creation of table with primary and foreign along with
-- integrity constraints
CREATE DATABASE `31155`;

USE `31155`;

CREATE TABLE Departments
(
    dept_id int NOT NULL,
    dept_name varchar(16) NOT NULL,
    PRIMARY KEY(dept_id)
);

CREATE TABLE Professors
(
    prof_id int NOT NULL,
    prof_fname varchar(16) NOT NULL,
    prof_lname varchar(16) NOT NULL,
    dept_id int NOT NULL,
    designation varchar(16) NOT NULL,
    salary int NOT NULL,
    doj DATE NOT NULL,
    email varchar(32) NOT NULL,
    phone varchar(10) NOT NULL,
    city varchar(16) NOT NULL,
    PRIMARY KEY (prof_id),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE works
(
    prof_id int NOT NULL,
    dept_id int NOT NULL,
    duration int NOT NULL,
    FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Shift
(
    prof_id int NOT NULL,
    shift varchar(16) NOT NULL,
    working_hours varchar(16) NOT NULL,
    FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (prof_id, shift,working_hours)
);

desc Departments;

desc Professors;

desc works;

desc Shift;

-- Data Insertions into Tables

INSERT INTO Departments
    (dept_id, dept_name)
VALUES
    (1, 'Computer'),
    (2, 'IT'),
    (3, 'EnTC');

select *
from Departments;

INSERT INTO Professors
    (prof_id,prof_fname,prof_lname,dept_id,designation,salary,doj,email,phone,city)
VALUES
    (1, 'Binod', 'Sharma', 1, 'Professor', 55000, '1999-12-08', 'sanchit199@gmail.com', 9149659875, 'jammu');

select *
from Professors;

INSERT INTO works
    (prof_id, dept_id, duration)
VALUES
    (1,1,2);

select *
from works;

INSERT INTO Shift
    (prof_id,shift,working_hours)
VALUES
    (1,'Morning',8);

select * from Shift;

-- Whenever we delete or update any key that is foreign key
-- in another table, it is also updated/deleted in the child tables

-- WE CAN ONLY DELETE OR UPDATE columns that are foreign keys
-- in PARENT KEYS, not in CHILD tables;

-- Examples ->

UPDATE Shift
SET prof_id=10
WHERE prof_id=1;

-- This above snippet results in following error:
-- ERROR 1452 (23000): Cannot add or update a child row:
--  a foreign key constraint fails (`31155`.`Shift`, CONSTRAINT `Shift_ibfk_1` 
-- FOREIGN KEY (`prof_id`) REFERENCES `Professors` (`prof_id`) ON DELETE CASCADE 
-- ON UPDATE CASCADE)

-- Updating columns that are foreign keys in PARENT table
UPDATE Departments
SET dept_id = 11
WHERE dept_id = 1;

-- Delete from table_name is as:

Delete from table_name where something;

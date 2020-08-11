CREATE DATABASE `31155`;

USE `31155`;

CREATE TABLE Departments(
    dept_id int NOT NULL,
    dept_name varchar(16) NOT NULL,
    PRIMARY KEY(dept_id)
);

CREATE TABLE Professors(
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
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE
);

CREATE TABLE works(
    prof_id int NOT NULL,
    dept_id int NOT NULL,
    duration int NOT NULL,
    FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE
);

CREATE TABLE Shift(
    prof_id int NOT NULL,
    shift varchar(16) NOT NULL,
    working_hours varchar(16) NOT NULL,
    FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE,
    PRIMARY KEY (prof_id, shift,working_hours)
);

desc Departments;

desc Professors;

desc works;

desc Shift;
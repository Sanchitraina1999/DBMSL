sanchit199@imsotired:~/Desktop/TE/DBMSL$ sudo mysql
[sudo] password for sanchit199: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 33
Server version: 8.0.21-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> CREATE DATABASE `31155`;
Query OK, 1 row affected (0.19 sec)

mysql> USE `31155`;
Database changed
mysql> CREATE TABLE Departments(
    ->     dept_id int NOT NULL,
    ->     dept_name varchar(16) NOT NULL,
    ->     PRIMARY KEY(dept_id)
    -> );
Query OK, 0 rows affected (0.66 sec)

mysql> CREATE TABLE Professors(
    ->     prof_id int NOT NULL,
    ->     prof_fname varchar(16) NOT NULL,
    ->     prof_lname varchar(16) NOT NULL,
    ->     dept_id int NOT NULL,
    ->     designation varchar(16) NOT NULL,
    ->     salary int NOT NULL,
    ->     doj DATE NOT NULL,
    ->     email varchar(32) NOT NULL,
    ->     phone varchar(10) NOT NULL,
    ->     city varchar(16) NOT NULL,
    ->     PRIMARY KEY (prof_id),
    ->     FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (1.62 sec)

mysql> CREATE TABLE works(
    ->     prof_id int NOT NULL,
    ->     dept_id int NOT NULL,
    ->     duration int NOT NULL,
    ->     FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE
    -> );
Query OK, 0 rows affected (0.67 sec)

mysql> CREATE TABLE Shift(
    ->     prof_id int NOT NULL,
    ->     shift varchar(16) NOT NULL,
    ->     working_hours varchar(16) NOT NULL,
    ->     FOREIGN KEY (prof_id) REFERENCES Professors(prof_id) ON DELETE CASCADE,
    ->     PRIMARY KEY (prof_id, shift,working_hours)
    -> );
Query OK, 0 rows affected (0.59 sec)

mysql> desc Departments;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_id   | int         | NO   | PRI | NULL    |       |
| dept_name | varchar(16) | NO   |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
2 rows in set (0.20 sec)

mysql> desc Professors;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| prof_id     | int         | NO   | PRI | NULL    |       |
| prof_fname  | varchar(16) | NO   |     | NULL    |       |
| prof_lname  | varchar(16) | NO   |     | NULL    |       |
| dept_id     | int         | NO   | MUL | NULL    |       |
| designation | varchar(16) | NO   |     | NULL    |       |
| salary      | int         | NO   |     | NULL    |       |
| doj         | date        | NO   |     | NULL    |       |
| email       | varchar(32) | NO   |     | NULL    |       |
| phone       | varchar(10) | NO   |     | NULL    |       |
| city        | varchar(16) | NO   |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
10 rows in set (0.01 sec)

mysql> desc works;
+----------+------+------+-----+---------+-------+
| Field    | Type | Null | Key | Default | Extra |
+----------+------+------+-----+---------+-------+
| prof_id  | int  | NO   | MUL | NULL    |       |
| dept_id  | int  | NO   |     | NULL    |       |
| duration | int  | NO   |     | NULL    |       |
+----------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> 
mysql> desc Shift;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| prof_id       | int         | NO   | PRI | NULL    |       |
| shift         | varchar(16) | NO   | PRI | NULL    |       |
| working_hours | varchar(16) | NO   | PRI | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> 


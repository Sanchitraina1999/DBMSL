-- Write a Stored Procedure namely proc_Grade for the categorization of  customer. 
-- If purchase by customer in year is <=20000 and >=10000 then customer will be placed 
-- in platinum category. If  purchase by customer is between 9999 and 5000 category is gold, 
-- if purchase between 4999 and 2000 category is silver. 
-- Write a PL/SQL block for using procedure created with above requirement.

-- Customer(Cust_id,name, total_purchase)
-- Category(Cust_id,Name,Class)


sanchit199@imsotired:~$ sudo mysql
[sudo] password for sanchit199: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 24
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database seventh31155;
Query OK, 1 row affected (0.13 sec)

mysql> use seventh31155;
Database changed
mysql> CREATE TABLE Customer(
    -> Cust_id INT NOT NULL,
    -> name VARCHAR(32),
    -> total_purchase INT,
    -> PRIMARY KEY (Cust_id)
    -> );
Query OK, 0 rows affected (0.62 sec)

mysql> CREATE TABLE Category(
    -> Cust_id INT NOT NULL,
    -> Name VARCHAR(32),
    -> Class VARCHAR(32),
    -> FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id) ON DELETE CASCADE ON UPDATE CASCADE
    -> );
Query OK, 0 rows affected (1.29 sec)

mysql> INSERT INTO Customer
    ->     (Cust_id, name, total_purchase)
    -> VALUES
    ->     (1,'Sanchit',15000),
    ->     (2,'Ayush',17000),
    ->     (3,'Abhishek',3000),
    ->     (4,'Koushal',4000),
    ->     (5,'Dhar',6000),
    ->     (6,'Shivam',7000),
    ->     (7,'Sativa',283932),
    ->     (8,'Shubham',9932),
    ->     (9,'Omji',1983),
    ->     (10,'Trioloki',2050),
    ->     (11,'Suzzy',2020),
    ->     (12,'Aarti',10000);
Query OK, 12 rows affected (0.20 sec)
Records: 12  Duplicates: 0  Warnings: 0

mysql> delimiter $$
mysql> create procedure proc_grade()
    -> begin
    ->      declare name varchar(30);
    ->      declare b int default 0;
    ->      declare id int;
    ->      declare total int;
    ->      declare cursor_c1 cursor for select * from Customer;
    ->      declare continue handler for not found set b=1;
    ->      open cursor_c1;
    ->      repeat
    ->      fetch cursor_c1 into id,name,total;
    ->      if not b then
    ->      if total>=10000 and total<=20000 then
    ->      insert into Category values(id,name,'Platinum');
    ->      end if;
    ->      if total>=5000 and total<=9999 then
    ->      insert into Category values(id,name,'Gold');
    ->      end if;
    ->      if total>=2000 and total<=4999 then
    ->      insert into Category values(id,name,'Silver');
    ->      end if;
    ->      end if;
    ->      until b end repeat;
    -> end;
    ->  $$
Query OK, 0 rows affected (0.48 sec)

mysql> delimiter ;
mysql> call proc_grade();
Query OK, 0 rows affected (1.15 sec)

mysql> select * from Customer;
+---------+----------+----------------+
| Cust_id | name     | total_purchase |
+---------+----------+----------------+
|       1 | Sanchit  |          15000 |
|       2 | Ayush    |          17000 |
|       3 | Abhishek |           3000 |
|       4 | Koushal  |           4000 |
|       5 | Dhar     |           6000 |
|       6 | Shivam   |           7000 |
|       7 | Sativa   |         283932 |
|       8 | Shubham  |           9932 |
|       9 | Omji     |           1983 |
|      10 | Trioloki |           2050 |
|      11 | Suzzy    |           2020 |
|      12 | Aarti    |          10000 |
+---------+----------+----------------+
12 rows in set (0.00 sec)

mysql> select * from Category;
+---------+----------+----------+
| Cust_id | Name     | Class    |
+---------+----------+----------+
|       1 | Sanchit  | Platinum |
|       2 | Ayush    | Platinum |
|       3 | Abhishek | Silver   |
|       4 | Koushal  | Silver   |
|       5 | Dhar     | Gold     |
|       6 | Shivam   | Gold     |
|       8 | Shubham  | Gold     |
|      10 | Trioloki | Silver   |
|      11 | Suzzy    | Silver   |
|      12 | Aarti    | Platinum |
+---------+----------+----------+
10 rows in set (0.00 sec)

mysql> ^DBye


delimiter $$
mysql> create procedure proc_grade_with_id_as_in(in ID int)
    -> begin
    ->      declare name varchar(30);
    ->      declare b int default 0;
    ->      declare id int;
    ->      declare total int;
    ->      declare cursor_c1 cursor for select * from Customer where id=ID;
    ->      declare continue handler for not found set b=1;
    ->      open cursor_c1;
    ->      repeat
    ->      fetch cursor_c1 into id,name,total;
    ->      if not b then
    ->          if total>=10000 and total<=20000 then
    ->              insert into Category values(id,name,'Platinum');
    ->          end if;
    ->          if total>=5000 and total<=9999 then
    ->              insert into Category values(id,name,'Gold');
    ->          end if;
    ->          if total>=2000 and total<=4999 then
    ->              insert into Category values(id,name,'Silver');
    ->          end if;
    ->      end if;
    ->      until b end repeat;
    -> end;cust_id
mysql> delimiter ;
mysql> call proc_grade();

sanchit199@imsotired:~$ sudo mysql
[sudo] password for sanchit199: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| 31155              |
| college            |
| fourth_31155       |
| information_schema |
| mydb               |
| mysql              |
| performance_schema |
| second31155        |
| seventh31155       |
| sys                |
| third31155         |
| third_31155        |
+--------------------+
12 rows in set (0.01 sec)

mysql> use seventh31155;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> DELIMITER $$
mysql> CREATE FUNCTION func_grade(Cust_id INT, total_price INT)
    ->     RETURNS VARCHAR(32)
    ->     DETERMINISTIC
    ->     BEGIN
    ->         DECLARE Class VARCHAR(32);
    ->         IF total_price BETWEEN 10000 AND 20000 THEN
    ->             SET Class = "Platinum";
    ->         ELSEIF total_price BETWEEN 5000 AND 9999 THEN
    ->             SET Class = "Gold";
    ->         ELSEIF total_price BETWEEN 2000 AND 4999 THEN
    ->             SET Class = "Silver";
    ->         END IF;
    ->         RETURN Class;
    ->     END 
    ->     $$
Query OK, 0 rows affected (0.11 sec)

mysql> DELIMITER ;
mysql> SELECT func_grade(12,10000);
+----------------------+
| func_grade(12,10000) |
+----------------------+
| Platinum             |
+----------------------+
1 row in set (0.00 sec)

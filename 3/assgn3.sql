-- 1. Insert atleast 10 records in professors table and insert other tables accordingly.

INSERT INTO Departments
    (dept_id, dept_name)
VALUES
    (1, 'Computer'),
    (2, 'IT'),
    (3, 'EnTC');

INSERT INTO Professors
    (prof_id,prof_fname,prof_lname,dept_id,designation,salary,doj,email,phone,city)
VALUES
    (1, 'Binod', 'binod', 1, 'Professor', 25000, '2015-01-01', 'abc@gmail.com', 9149589875, 'jammu'),
    (2, 'Sahil', 'Singh', 2, 'Assistant Professor', 30000, '2016-01-01', 'xyz@gmail.com', 9149656875, 'pune'),
    (3, 'Sanchit', 'Raina', 3, 'Professor', 19000, '2016-01-01', 'def@gmail.com', 9149459875, 'mumbai'),
    (4, 'Rajwinder', 'Singh', 1, 'Professor', 35000, '2015-01-01', 'stu@gmail.com', 9154659875, 'mumbai'),
    (5, 'Tejas', 'Sarawade', 2, 'Professor', 20000, '2016-01-01', 'jkl@gmail.com', 9144579875, 'pune'),
    (6, 'Sam', 'Jagdale', 3, 'Assistant Professor', 40000, '1999-12-26', 'ghi@gmail.com', 9145759875, 'pune'),
    (7, 'Pradyumna', 'Rajje', 2, 'Assistant Professor', 9000, '2016-01-01', 'vwx@gmail.com', 9197569875, 'mumbai'),
    (8, 'Ayush', 'Raina', 3, 'Professor', 18000, '2015-01-01', 'mno@gmail.com', 9145459875, 'mumbai'),
    (9, 'Abhishek', 'Dhar', 1, 'Assistant Professor', 50000, '1997-12-08', 'zyx@gmail.com', 9164659875, 'mumbai'),
    (10, 'Danish', 'Bhat', 2, 'Professor', 15000, '2015-01-01', 'pqr@gmail.com', 9149654875, 'pune');

INSERT INTO works
    (prof_id, dept_id, duration)
VALUES
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

INSERT INTO Shift
    (prof_id,shift,working_hours)
VALUES
    (1, 'Morning', 8),
    (2, 'Evening', 8),
    (3, 'Morning', 7),
    (4, 'Evening', 8),
    (5, 'Morning', 6),
    (6, 'Evening', 9),
    (7, 'Morning', 8),
    (8, 'Evening',10),
    (9, 'Morning', 8),
    (10,'Evening', 8);

-- 2. Display all professors details with city pune and mumbai and professor first name starting with
-- 'a' or 'd'.

SELECT * FROM Professors where ((city='pune' or city='mumbai') and (prof_fname like 'a%' or prof_fname like 'd%'));

-- 3. list the number of different cities of professors.(use of distinct)

Select count(distinct city) from Professors;

-- 4. Give 5% increase in salary of the professors with date of joining 1-1-2015.

UPDATE Professors
set salary = (1.05)*salary
where doj='2015-01-01';

-- 5. Delete professor details living in pune.

Delete from Professors
where city='pune';

-- 6. Find the names of professors belonging to pune or mumbai

SELECT prof_fname,prof_lname from Professors
where city='pune' or city='mumbai';

-- 7. Find the professors who joined on date 1-1-2015 as well as in 1-1-2016

SELECT * from Professors
where doj='2015-01-01' or doj='2015-01-01';

-- 8. Find the professor having maximum salary and names of professors having salary between
-- 10,000 and 20,000.

select prof_fname,prof_lname 
from Professors 
where salary IN(select max(salary) from Professors where salary BETWEEN 10000 and 20000);

-- 9. Display all professors name with salary and date of joining with decreasing order of salary.

SELECT prof_fname, prof_lname, salary, doj
from Professors
order by salary desc; 

-- 10. Display professors name, date of joining and dept_id with salary 30000, 40000 and 50000

SELECT prof_fname, prof_lname, dept_id 
from Professors
where salary IN ('30000', '40000', '50000');
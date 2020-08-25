-- VIEW FOR -
-- 2. Display all professors details with city pune and mumbai and professor first name starting with
-- 'a' or 'd'.

CREATE VIEW prof_pune_mumbai_a_d AS
SELECT * FROM Professors
WHERE ((city='pune' or city='mumbai') and (prof_fname like 'a%' or prof_fname like 'd%'));

-- use this view as-

SELECT * FROM prof_pune_mumbai_a_d;

-- 6. Find the names of professors belonging to pune or mumbai

CREATE VIEW prof_pune_mumbai AS
SELECT * FROM Professors
WHERE city='pune' or city='mumbai';

SELECT * FROM prof_pune_mumbai;


-- 7. Find the professors who joined on date 1-1-2015 as well as in 1-1-2016

CREATE VIEW prof_doj AS
SELECT * FROM Professors
WHERE doj='2015-01-01' or doj='2015-01-01';

SELECT * FROM prof_doj;


-- 9. Display all professors name with salary and date of joining with decreasing order of salary.

CREATE VIEW prof_name_salary_doj AS
SELECT prof_fname, prof_lname, salary, doj
from Professors
order by salary desc; 

SELECT * FROM prof_name_salary_doj;

-- 10. Display professors name, date of joining and dept_id with salary 30000, 40000 and 50000

CREATE VIEW prof_name_dept_id AS
SELECT prof_fname, prof_lname, dept_id 
from Professors
where salary IN ('30000', '40000', '50000');

SELECT * FROM prof_name_dept_id;


-- INDEX

CREATE INDEX prof_fname_idx
ON Professors(prof_fname);

--Searching becomes faster on creation of INDEX

-- to use this index -

-- Now faster executions are possible on table Professors

Select * from Professors;

Select prof_fname
FROM Professors;
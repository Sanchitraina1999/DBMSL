-- /////////////////////////////////////////

--   1. Find the professor details and department details using NATURAL JOIN.
    SELECT prof_id, prof_fname, prof_lname, dept_id,dept_name, designation, salary, doj, email, phone, city
    FROM Professors
    NATURAL JOIN Departments;

--   2. Find the prof_id, prof_name and  shift. (INNER JOIN)
    SELECT prof_id, prof_fname, prof_lname, shift
    FROM Professors
    INNER JOIN Shift
    using(prof_id);

--   3. List all the department details and the corresponding names of professors in the same department.(left outer join) 
    SELECT dept_id, dept_name, prof_fname,prof_lname
    FROM Departments
    LEFT JOIN Professors
    using (dept_id);

--   4. List all the professors and the corresponding names of department.(right outer join) 
    SELECT prof_fname, prof_lname, dept_name
    FROM Professors
    RIGHT JOIN Departments
    using (dept_id);

--   5. Display professor name, dept_name, shift, salary where prof_id = 101;(multitable join) 
    SELECT p.prof_fname, p.prof_lname, d.dept_name, s.shift, p.salary
    from Professors p
    INNER JOIN Departments d ON d.dept_id = p.dept_id
    INNER JOIN Shift s ON s.prof_id = p.prof_id
    WHERE p.prof_id=101;

--   6. list the total number of professor in each department.(count and any join,groupby)
    SELECT d.dept_name,count(*) as prof_count
    FROM Professors p
    INNER JOIN Departments d on p.dept_id = d.dept_id 
    GROUP BY d.dept_name;
    
--   7. List the prof_id associated department and the dept_name having name ‘computer’;(subquery)     
    SELECT prof_id, dept_id, dept_name
    FROM Professors
    Where dept_id IN (SELECT dept_id FROM Departments WHERE dept_name='computer');

--   8. Find the names of all departments where the professors joined in year 2015 (or date of joining is 1-1-2015).(subquery) 
    SELECT dept_name
    FROM Departments
    WHERE dept_id IN (SELECT dept_id FROM Professors WHERE doj='2015-01-01');

--   9. Create view showing the professor and shift details. (COMPLEX VIEW) 
    CREATE VIEW view_prof
    AS
    SELECT p.prof_id,p.prof_fname,p.prof_lname,p.dept_id,p.designation,p.salary,p.doj,p.email,p.phone,p.city,s.shift,s.working_hours
    FROM Professors p
    INNER JOIN Shift s
    ON p.prof_id = s.prof_id;

    --use view as--
    SELECT * FROM view_prof;

--   10. Perform Manipulation on simple view-Insert, update, delete, drop view.
    --CREATE SIMPLE VIEW
        CREATE VIEW view_dept
        AS
        SELECT dept_id,dept_name
        FROM Departments;
    -- Insert view.
            INSERT INTO view_dept
            VALUES(
                4, 'mechanical'
            );
    -- update view.
            UPDATE view_dept
            SET dept_name='Electrical'
            WHERE dept_id=4;

    -- drop view.
            DROP VIEW view_dept;
CREATE database sixth31155;

USE sixth31155;

CREATE TABLE newEmployee( 
    emp_id INT NOT NULL AUTO_INCREMENT, 
    emp_designation VARCHAR(50), 
    emp_name VARCHAR(50), 
    PRIMARY KEY(emp_id) 
);

CREATE TABLE oldEmployee( 
     emp_id INT NOT NULL AUTO_INCREMENT, 
     emp_name VARCHAR(50), 
     emp_designation VARCHAR(50), 
     PRIMARY KEY(emp_id) 
);

INSERT INTO 
    oldEmployee 
VALUES(DEFAULT,'Shawn','Manager'),
    (DEFAULT,'Mendes','Sr. Developer'),
    (DEFAULT,'Ayush','Data Analyst');
SELECT * FROM oldEmployee;

INSERT INTO newEmployee VALUES(DEFAULT,'Shawn','Manager');

SELECT * FROM newEmployee;

DELIMITER $$

CREATE PROCEDURE old_to_new() 
    BEGIN 
    declare v_id INT; 
    declare v_nm VARCHAR(50); 
    declare v_desg VARCHAR(50); 
    declare v_finished INT DEFAULT 0; 
    declare c1 cursor for SELECT emp_id,emp_name,emp_designation from oldEmployee where emp_id not in (select emp_id from newEmployee); 
    declare continue handler for NOT FOUND set v_finished=1; 
    open c1; 
        get_emp: LOOP 
            fetch c1 into v_id,v_nm,v_desg; 
            if v_finished =1 then 
                leave get_emp; 
            end if; 
            insert into newEmployee values(v_id,v_nm,v_desg); 
        END LOOP get_emp; 
    close c1; 
    END $$ 

DELIMITER ;

select * from newEmployee;

CALL old_to_new();

select * from newEmployee;


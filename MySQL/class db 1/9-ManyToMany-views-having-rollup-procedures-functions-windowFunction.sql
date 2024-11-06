use school_db;

 create table students(id int auto_increment primary key, student_name varchar(250));
 create table courses(id int auto_increment primary key, course_name varchar(250),fees int);

create table student_course(student_id int, course_id int , FOREIGN KEY (student_id) REFERENCES students(id), FOREIGN KEY (course_id) REFERENCES courses(id));

desc student_course;

insert into students(student_name) values ('raju'),('sham'),('paul'),('alex');

insert into courses(id,course_name,fees) values (101,'PD',3000);
insert into courses(course_name,fees) values ('java',5000),('SQL',4000),('Python',6000),('Linux',10000);

insert into student_course (student_id , course_id) values (1,101),(1,102),(2,105),(1,105),(3,103),(2,102),(4,104);
select * from student_course;

-- joins with many to many relationships
 select student_name, course_name from students JOIN student_course ON student_course.student_id=students.id JOIN courses ON student_course.course_id=courses.id;
 
 
 -- views
 CREATE VIEW inst_info AS select student_name, course_name from students JOIN student_course ON student_course.student_id=students.id JOIN courses ON student_course.course_id=courses.id;
  show tables;
  select * from inst_info;
   drop view inst_info;
   
-- having

CREATE VIEW inst_info AS select student_name, course_name,fees from students JOIN student_course ON student_course.student_id=students.id JOIN courses ON student_course.course_id=courses.id;
select * from inst_info;

-- ERROR : you can't use where with group by
select student_name,sum(fees) from inst_info group by student_name where sum(fee) > 10000;
select student_name,sum(fees) from inst_info group by student_name having sum(fees) > 10000;

-- ROLL up
 select student_name,sum(fees) from inst_info group by student_name WITH ROLLUP;
 
 select ifnull(student_name,"Total") as student_name,sum(fees) from inst_info group by student_name WITH ROLLUP;
 
 -- stored procedures
 use bank_db;
  select * from employees2;
  
DELIMITER $$
CREATE PROCEDURE emp_info()
BEGIN
    SELECT * FROM employees2 ORDER BY salary;
END$$

DELIMITER ;
call emp_info();

-- argument passing in stored procedure
DELIMITER $$
CREATE PROCEDURE get_empid(IN p_fname varchar(100))
BEGIN
    SELECT * FROM employees2 WHERE fname = p_fname;
END$$

DELIMITER ;
call get_empid('raju');

-- return output in variable in stored procedure
DELIMITER $$
CREATE PROCEDURE get_sum_by_dept 
	(IN p_dept VARCHAR(100), OUT p_sum DECIMAL(10, 2))
BEGIN
    SELECT sum(salary) INTO p_sum FROM employees2 WHERE dept=p_dept;
END$$

DELIMITER ;

set @p_sum = 0;
call get_sum_by_dept('loan', @p_sum);
select @p_sum;

-- User defined functions
DELIMITER $$
CREATE FUNCTION emp_name_max_salary()
RETURNS VARCHAR(50)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
	DECLARE v_max INT;
    DECLARE v_name VARCHAR(50);
    SELECT MAX(salary) INTO v_max FROM employees2;
    SELECT fname INTO v_name FROM employees2 WHERE salary=v_max;
    
    RETURN v_name;
END$$

DELIMITER ;
select emp_name_max_salary();

-- window function
SELECT emp_id,fname,salary,SUM(salary) over() as sum_salary from employees2;

SELECT emp_id,fname,salary,SUM(salary) over(ORDER BY emp_id) as sum_salary from employees2;

SELECT emp_id,dept,salary,SUM(salary) over(PARTITION BY dept) as sum_salary from employees2;

SELECT emp_id,dept,salary,MAX(salary) over(PARTITION BY dept) as sum_salary from employees2;

SELECT ROW_NUMBER() OVER() AS row_no, emp_id,dept,salary from employees2;

SELECT ROW_NUMBER() OVER(ORDER BY salary) AS row_no, emp_id,dept,salary from employees2;

SELECT ROW_NUMBER() OVER(PARTITION BY dept) AS row_no, emp_id,dept,salary from employees2;

SELECT  emp_id,dept,salary,RANK() OVER(ORDER BY salary DESC) AS rank_sal from employees2;

SELECT  emp_id,dept,salary,DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_sal from employees2;

SELECT  emp_id,dept,salary,LAG(salary) OVER() AS lag_sal from employees2;

SELECT  emp_id,dept,salary,LEAD(salary) OVER() AS lead_sal from employees2;

SELECT  emp_id,dept,salary,salary - LAG(salary) OVER(ORDER BY salary DESC) AS diff_sal from employees2;

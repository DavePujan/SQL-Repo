Listing and Creating a Database

    -- Create a database
        CREATE DATABASE database_name;

    -- Show all databases
        SHOW DATABASES;

    -- Use a specific database
        USE database_name;

    -- Drop a database
        DROP DATABASE database_name;

Creating and Managing Tables

    -- Create a table
        CREATE TABLE table_name (
            column1 datatype constraints,
            column2 datatype constraints,
            ...
        );

    -- Describe a table
        DESCRIBE table_name;

    -- Insert data into a table
        INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...);

    -- To insert multiple values
        INSERT INTO table_name (column1, column2, ...) VALUES (value1, value2, ...) , (value1, value2, ...) , (value1, value2, ...);

    SET SQL_SAFE_UPDATES = 0;  -- it will prevent user to delete a large number of rows from the table,if you haven't used where clause in your query it will not execute the UPDATE or DELETE statement.
    SET SQL_SAFE_UPDATES = 1;

    -- Update data in a table
        UPDATE table_name SET column1 = value1 WHERE condition;
        update class2 set std_name="bhavy" where roll = 5;

    -- Delete data from a table
        DELETE FROM table_name WHERE condition;

    -- Drop a table
        DROP TABLE table_name;

    -- Set NOT NULL in a column
        ALTER TABLE table_name MODIFY column_name datatype NOT NULL;

    -- Set default values
        ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT default_value;
        create table default2(id int not null default 0, name varchar(30) default 'poojan');

    -- Primary key
        ALTER TABLE table_name ADD PRIMARY KEY (column_name);

    -- Auto-increment values  (only one auto inc per table)
        CREATE TABLE table_name (
            id INT AUTO_INCREMENT,
            ...
        );
        CREATE TABLE class2(id INT PRIMARY KEY auto_increment,sname VARCHAR(15) NOT NULL,student_type VARCHAR(15) DEFAULT 'REGULAR');

String Functions

    -- Alias
        SELECT column_name AS alias_name FROM table_name;
        SELECT id AS STD_ID FROM class2;

    -- CONCAT
        SELECT CONCAT(column1, column2) FROM table_name;
        select concat(fname," ",lname) from fullname;

    -- CONCAT_WS
        SELECT CONCAT_WS(separator, column1, column2) FROM table_name;
        select concat_ws("_",fname,lname) from fullname;

    -- SUBSTR
        SELECT SUBSTR(column_name, start, length) FROM table_name;
        select substring('hey buddy',1,4);
        select substring('hello raju',-4);

    -- REPLACE
        SELECT REPLACE(column_name, 'old_value', 'new_value') FROM table_name;
        select replace(sname,'poojan','mohini') from auto1;

    -- REVERSE
        SELECT REVERSE(column_name) FROM table_name;
        select reverse(sname) from auto1;

    -- UPPER and LOWER
        SELECT UPPER(column_name), LOWER(column_name) FROM table_name;
        select upper(sname) from auto1;

    -- CHAR_LENGTH
        SELECT CHAR_LENGTH(column_name) FROM table_name;
        select char_length(sname) from auto1;

    -- TRIM
        SELECT TRIM(column_name) FROM table_name;
        select trim("        are you all alright?            ");

        SELECT LTRIM(column_name) FROM table_name;
        SELECT RTRIM(column_name) FROM table_name;

    -- Insert
        INSERT(str, pos, len, new_str)
        select insert("hello poojan", 7 , 0 , "i am ");
        -- str is the original string in which the insertion is to be made.
        -- pos is the position in the string where the new string will be inserted.
        -- len is the number of characters to be removed from str starting from position pos. (If you want to insert without deleting any characters, set len to 0).
        -- new_str is the string that you want to insert into str.

    -- Left and right
        select left("hey poojan",3);
        select right("hey poojan",6);

    --Repeat
        select repeat("BKL ",5);

Data Manipulation

    -- Remove duplicates
        SELECT DISTINCT column_name FROM table_name;
        select DISTINCT(dept) from employees2;

    -- Sorting data
        SELECT * FROM table_name ORDER BY column_name ASC|DESC;
        select * from employees2 order by fname desc;

    -- LIKE keyword
        SELECT * FROM table_name WHERE column_name LIKE 'pattern';
        select * from employees where desig like "%cash%";
        select * from employees2 where fname like "____"; --je 4 char nu hase ej batavse...

    -- LIMIT keyword
        SELECT * FROM table_name LIMIT number;
        select * from employees2 limit 3;

    -- COUNT function
        SELECT COUNT(column_name) FROM table_name;
        select count(fname) from employees2;

    -- GROUP BY
        SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;
        select dept,count(fname) from employees2 group by dept;

    -- MAX and MIN functions
        SELECT MAX(column_name), MIN(column_name) FROM table_name;
        select min(salary) from employees2 ;

    -- Subqueries
        SELECT column_name FROM table_name WHERE column_name IN (SELECT column_name FROM another_table);

        select emp_id,fname,salary from employees2 where salary = (select max(salary) from employees2);

    -- SUM and AVG functions
        SELECT SUM(column_name), AVG(column_name) FROM table_name;
        select sum(salary) from employees2 ;
        select avg(salary) from employees2 ;

Data Types

    -- DECIMAL
        CREATE TABLE table_name (column_name DECIMAL(10, 2));
        create table num1 (price decimal(5,2));
        insert into num1 value (155.78);

    -- DOUBLE
        CREATE TABLE table_name (column_name DOUBLE);

    -- FLOAT
        CREATE TABLE table_name (column_name FLOAT);
        create table num2(f float , d double);
        insert into num2 value(123.456, 123.456);

    -- DATETIME
        CREATE TABLE table_name (column_name DATETIME);

        create table person(jd date ,jt time, jdt datetime);
        insert into person value('2022-05-17' , '20:00:00' , '2023-03-23 20:03:32');

    -- Current date/time
        SELECT CURDATE(), CURTIME(), NOW();
        insert into person value(curdate() , curtime() , now());

        select dayname('2023-05-23');
        select dayofmonth(curdate());
        select dayofweek(curdate());
        select monthname(curdate());
        select hour(curtime());

    -- Date formatting
        SELECT DATE_FORMAT(column_name, 'format') FROM table_name;
        select jdt,date_format(jdt,'%D %a at %r') from person;

    -- Date maths
        SELECT column_name + INTERVAL 1 DAY FROM table_name;

        select datediff('2023-04-20' , '2023-04-15');
        select timediff('23:00:00' , '20:00:50');
        select date_add(now(),interval 1 year);
        select date_sub(now(),interval 1 year);

Constraints and Operators

    -- Default and ON UPDATE TIMESTAMP
            CREATE TABLE table_name (
            column_name TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
            );

            create table blogs( blog varchar(150), ct datetime default CURRENT_TIMESTAMP, ut datetime on update CURRENT_TIMESTAMP);
            insert into blogs (blog) value ('this is first');
            update blogs set blog = 'this is edited';

    -- Relational operators
        SELECT * FROM table_name WHERE column_name = value;

        select * from employees2 where salary > 65000;
        select * from employees2 where salary < 65000;
        select * from employees2 where salary <= 45000;
        select * from employees2 where salary >= 45000;
        select * from employees2 where salary != 45000;

    -- Logical operators
        SELECT * FROM table_name WHERE condition1 AND condition2;
        select * from employees2 where salary = 45000 and dept='account';
        select * from employees2 where salary = 45000 or dept='loan';

    -- IN and NOT IN
        SELECT * FROM table_name WHERE column_name IN (value1, value2);
        select * from employees2 where dept='account' or dept='cash' or dept='loan';
        select * from employees2 where dept in('account','cash','loan');
        select * from employees2 where dept not in('account','cash','loan');

    -- BETWEEN
        SELECT * FROM table_name WHERE column_name BETWEEN value1 AND value2;
        select * from employees2 where salary>=40000 and salary <=65000;
        select * from employees2 where salary between 40000 and 65000;

    -- CASE statement
        SELECT column_name,
            CASE
                WHEN condition1 THEN 'result1'
                WHEN condition2 THEN 'result2'
                ELSE 'result3'
            END AS alias_name
        FROM table_name;

        select fname,salary,
            case
                when salary >= 50000 then 'higher salary'
                when salary >= 40000 and salary <50000 then 'mid salary'
                else 'low salary'
            end as 'salary category'
        from employees2;

    -- Is Null 
        select * from person where jd=null;
        select * from person where jd is null;

    -- Not like
        select * from employees2 where fname not like 'a%';

    -- UNIQUE constraint
        CREATE TABLE table_name (
        column_name INT UNIQUE
        );

    -- CHECK constraint
        CREATE TABLE table_name (
        column_name INT CHECK (column_name > 0)
        );

        create table contacts(name varchar(30) , mob varchar(10) unique check (length(mob) >= 10));
        insert into contacts value('one',1234567890);

    -- Named constraints
        create table contacts2(mob varchar(10) unique CONSTRAINT mobno_less_than_10_digits check (length(mob) >= 10));
        desc contacts2;
        insert into contacts2 value(12345);
        -- ERROR: Check constraint 'mobno_less_than_10_digits' is violated.

Altering Tables

    -- Add or drop a column
        ALTER TABLE table_name ADD column_name datatype;
        ALTER TABLE table_name DROP COLUMN column_name;

        alter table contacts2 add column name varchar(30);
        alter table contacts2 drop column name;

    -- Rename a column
        ALTER TABLE table_name CHANGE old_column_name new_column_name datatype;
        alter table contacts2 rename column name to fname;

    -- Change table name
        alter table contacts2 rename to mycontact;
        -- or
        rename table mycontact to contacts2;

    -- Modify column property
        ALTER TABLE table_name MODIFY column_name new_datatype;

Relationships and Joins

    -- Summary of Relationships:
        Relationship                      	Example
        One-to-One	                        User to Profile
        One-to-Many	                        Department to Employees
        Many-to-Many	                    Students to Courses
        Self-Referencing	                Employee to Manager

    -- Foreign key
        CREATE TABLE child_table (
        parent_id INT,
        FOREIGN KEY (parent_id) REFERENCES parent_table(id)
        );

        create table customers( cust_id int auto_increment primary key, name varchar(50) , email varchar(5));
        
        create table orders( ord_id int auto_increment primary key , date date, amount decimal(10,2), cust_id int , FOREIGN KEY (cust_id) REFERENCES customers(cust_id)); 

    -- Joins

        -- INNER JOIN
            SELECT * FROM table1
            JOIN table2 ON table1.column_name = table2.column_name; 
            select * from customers inner join orders on orders.cust_id=customers.cust_id;

        -- LEFT JOIN
            SELECT * FROM table1
            LEFT JOIN table2 ON table1.column_name = table2.column_name; 
            select * from customers left join orders on orders.cust_id=customers.cust_id;

        -- usecase of ifnull 
            select name,ifnull(sum(amount),0) as total from customers left join orders on orders.cust_id=customers.cust_id group by name;

        -- RIGHT JOIN
            SELECT * FROM table1
            RIGHT JOIN table2 ON table1.column_name = table2.column_name; 
            select * from orders right join customers on orders.cust_id=customers.cust_id;

        -- Cross join
            SELECT * FROM table1 CROSS JOIN table2;
            select * from customers,orders;

        -- joins with many to many relationships
            select student_name, course_name 
            from students 
            JOIN student_course ON student_course.student_id=students.id 
            JOIN courses ON student_course.course_id=courses.id;
 
    -- ON DELETE CASCADE
        ALTER TABLE child_table ADD CONSTRAINT fk_parent
        FOREIGN KEY (parent_id) REFERENCES parent_table(id) ON DELETE CASCADE;

Views and Stored Routines

    -- Create a view
        CREATE VIEW view_name AS SELECT column1, column2 FROM table_name;

        CREATE VIEW inst_info AS 
        select student_name, course_name from students 
        JOIN student_course ON student_course.student_id=students.id 
        JOIN courses ON student_course.course_id=courses.id;
        
        drop view inst_info;

    -- HAVING clause
        SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name HAVING COUNT(*) > number;

        -- ERROR : you can't use where with group by
        select student_name,sum(fees) from inst_info group by student_name where sum(fee) > 10000;
        select student_name,sum(fees) from inst_info group by student_name having sum(fees) > 10000;

    -- ROLL up
        select student_name,sum(fees) from inst_info group by student_name WITH ROLLUP;

    -- Stored procedure
        CREATE PROCEDURE procedure_name (IN param1 datatype, OUT param2 datatype)
        BEGIN
            -- procedure body
        END;

        DELIMITER $$
        CREATE PROCEDURE get_sum_by_dept 
            (IN p_dept VARCHAR(100), OUT p_sum DECIMAL(10, 2))
        BEGIN
            SELECT sum(salary) INTO p_sum FROM employees2 WHERE dept=p_dept;
        END$$

        DELIMITER ;

    -- Call a stored procedure
        CALL procedure_name(value1, @output);
        set @p_sum = 0;
        call get_sum_by_dept('loan', @p_sum);
        select @p_sum;

    -- User-defined function
        CREATE FUNCTION function_name (param datatype) RETURNS datatype
        BEGIN
            -- function body
            RETURN value;
        END;

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

    -- Call a user-defined function
        SELECT function_name(value);
        select emp_name_max_salary();

Window Functions

    -- Using window functions
        SELECT column_name, ROW_NUMBER() OVER (PARTITION BY column_name ORDER BY column_name) as row_num
        FROM table_name;
        
        -- Examples:
        SELECT emp_id,fname,salary,SUM(salary) over(ORDER BY emp_id) as sum_salary from employees2;

        SELECT emp_id,dept,salary,SUM(salary) over(PARTITION BY dept) as sum_salary from employees2;

        SELECT ROW_NUMBER() OVER(PARTITION BY dept) AS row_no, emp_id,dept,salary from employees2;

        SELECT  emp_id,dept,salary,RANK() OVER(ORDER BY salary DESC) AS rank_sal from employees2;

        SELECT  emp_id,dept,salary,DENSE_RANK() OVER(ORDER BY salary DESC) AS rank_sal from employees2;

        SELECT  emp_id,dept,salary,LAG(salary) OVER() AS lag_sal from employees2;

        SELECT  emp_id,dept,salary,LEAD(salary) OVER() AS lead_sal from employees2;

1. Indexes

    -- Create an index on a column
        CREATE INDEX index_name ON table_name (column_name);

    -- Drop an index
        DROP INDEX index_name ON table_name;

2. Transactions

    -- Start a transaction
        START TRANSACTION;

    -- Perform some queries
        INSERT INTO table_name (column1) VALUES ('value1');
        UPDATE table_name SET column1 = 'new_value' WHERE condition;

    -- Commit the transaction
        COMMIT;

    -- If there was an error and you want to rollback
        ROLLBACK;

3. Stored Functions vs. Procedures

    -- Create a stored function
        CREATE FUNCTION function_name (param datatype) RETURNS datatype
        BEGIN
            DECLARE result datatype;
            -- Function logic
            RETURN result;
        END;

    -- Create a stored procedure
        CREATE PROCEDURE procedure_name (IN param1 datatype)
        BEGIN
            -- Procedure logic
        END;

4. Error Handling in Stored Procedures

    -- Example of error handling in a stored procedure
        CREATE PROCEDURE safe_procedure()
        BEGIN
            DECLARE EXIT HANDLER FOR SQLEXCEPTION
            BEGIN
                -- Error handling logic (e.g., rollback)
                ROLLBACK;
            END;

            START TRANSACTION;
            -- Procedure logic
            COMMIT;
        END;

5. Data Import/Export

    -- Import data from a CSV file
        LOAD DATA INFILE '/path/to/file.csv'
        INTO TABLE table_name
        FIELDS TERMINATED BY ',' 
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n'
        IGNORE 1 ROWS;

    -- Export data to a CSV file
        SELECT * FROM table_name
        INTO OUTFILE '/path/to/output.csv'
        FIELDS TERMINATED BY ',' 
        ENCLOSED BY '"'
        LINES TERMINATED BY '\n';

6. Triggers

    -- Create a trigger before inserting a row
        CREATE TRIGGER trigger_name BEFORE INSERT ON table_name
        FOR EACH ROW
        BEGIN
            -- Trigger logic, e.g., set a default value
            SET NEW.column_name = 'default_value';
        END;

    -- Create a trigger after updating a row
        CREATE TRIGGER trigger_name AFTER UPDATE ON table_name
        FOR EACH ROW
        BEGIN
            -- Logic to execute after update
        END;

7. Data Types in Detail
    - For JSON data type:

    -- Create a table with a JSON column
        CREATE TABLE table_name (
            id INT PRIMARY KEY,
             data JSON
        );

8. Performance Optimization
    - Use `EXPLAIN` to analyze query performance:

    EXPLAIN SELECT * FROM table_name WHERE condition;

9. Security Best Practices
    - Granting privileges to users:

    -- Create a user
    CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';

    -- Grant privileges
    GRANT SELECT, INSERT ON database_name.* TO 'username'@'localhost';

    -- Revoke privileges
    REVOKE SELECT ON database_name.* FROM 'username'@'localhost';

    -- Flush privileges to apply changes
    FLUSH PRIVILEGES;

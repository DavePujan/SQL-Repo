show databases;
USE school_db;

CREATE DATABASE WRONG_DB;
USE WRONG_DB;
SELECT DATABASE();
DROP DATABASE wrong_db;

USE school_db;
CREATE TABLE class1(std_num INT, std_name VARCHAR(20),physics INT,chem INT,bio INT,maths INT);
DESC class1;
select * from class1;

INSERT INTO class1(std_num,std_name,physics,chem,bio,maths) VALUE(1,"pujan",97,99,77,76);
-- OR YOU CAN ALSO DO SOMETHING LIKE THIS,
INSERT INTO class1 VALUE (2,"harsh",67,87,66,98);
-- OR LIKE THIS,
INSERT INTO class1 VALUE (3,"krips",55,67,77,87), (4,"shyam",78,67,88,76);
INSERT INTO class1 VALUE (6,"chaman",66,77,78,96), (7,"lalu",56,56,67,76), (8,"kalu",88,87,67,76), (9,"bhalu",90,65,98,78), (10,"nalu",76,87,78,98);

SET SQL_SAFE_UPDATES = 0;
INSERT INTO class1 VALUE (5,"krips wrpng",67,87,66,98);
DELETE FROM class1 WHERE std_name="krips wrong";
INSERT INTO class1 VALUE (5,"bhavy wrong",98,88,98,78);
INSERT INTO class1 VALUE (5,"bhavy wrong",98,88,98,78);
UPDATE class1 SET std_name="bhavy" where std_num=5;

CREATE TABLE wrong(id INT, sname VARCHAR(10));
DROP TABLE wrong;

-- HOW TO IGNORE NULL BY WRITING NOT NULL
CREATE TABLE not_null(id INT NOT NULL,sname VARCHAR(10) NOT NULL,roll INT);
INSERT INTO not_null VALUE (NULL,NULL,NULL); -- get error that id cannot be null

-- default values
CREATE TABLE default1(id INT,sname VARCHAR(10),mark INT DEFAULT 0);
INSERT INTO default1(id,sname) VALUE (1,"PUJAN");
DESC default1;

-- what is primary key
CREATE TABLE primarykey(id INT NOT NULL PRIMARY KEY,sname VARCHAR(10));
INSERT INTO primarykey VALUE(1,"harsh"), (2,"bhavy"); 
SELECT * FROM primarykey;
INSERT INTO primarykey VALUE (1,"poojan"); -- error that duplicate entry not allowed
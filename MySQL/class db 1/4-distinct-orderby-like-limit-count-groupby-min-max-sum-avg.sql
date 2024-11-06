
use bank_db;
select * from employees2;

select DISTINCT(dept) from employees2;
select DISTINCT fname,lname from employees2;

select * from employees2 order by fname;

select * from employees where desig like "%cash%";
 
--  je 4 char nu hoi ej batavse
select * from employees2 where fname like "____"; 
select * from employees2 where fname like "R___";
  
select * from employees2 limit 3;
select * from employees2 limit 3,2;
  
-- give o/p of a person with max salary
select * from employees2 order by salary desc limit 1;

-- shows how many person's data is stored
select count(*) from employees2;
select count(fname) from employees2;
select count(distinct dept) from employees2;
  
select count(emp_id) from employees2 where desig = "manager";

select dept from employees2 group by dept;
-- shows how many person is in each department
 select dept,count(fname) from employees2 group by dept;
 
select max(salary) from employees2 ;
select max(fname) from employees2 ;
select min(salary) from employees2 ;
select min(fname) from employees2 ;
  
select emp_id,fname,salary from employees2 
where salary = (select max(salary) from employees2);
  
select sum(salary) from employees2 ;
select avg(salary) from employees2 ;
   
select  dept,avg(salary) from employees2 group by dept ;
 select  dept,count(emp_id),avg(salary) from employees2 group by dept ;

   
   
   
   
  
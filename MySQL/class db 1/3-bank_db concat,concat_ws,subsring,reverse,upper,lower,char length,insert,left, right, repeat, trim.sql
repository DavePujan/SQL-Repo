SELECT CONCAT('HEY','BUDDY');

use bank_db;
select * from employees2;
select emp_id, concat(fname," ", lname) AS FullName  from employees2;

select emp_id , concat_ws('_',fname,lname) as fullname from employees2;

select substring('Hey Buddy',1,4);
select substring(emp_id , 2) as id ,fname,lname,dept from employees2;

select replace('hello buddy','hello','hey');
select replace(emp_id,'10','1000') as id,fname,lname,dept from employees2;

select reverse("hello");

select upper("hello");
select emp_id,upper(fname),lname from employees2;

select lower("HEllo");
select emp_id,lower(fname),lname from employees2;

select char_length("hello");
select emp_id, char_length(fname) ,lname from employees2;
select * from employees2 where char_length(fname)> 5;

select insert("hello poojan", 7 , 0 , "i am ");

select left("hey poojan",3);
select right("hey poojan",6);

select repeat("BKL ",5);
select trim("        are you all alright?            ");


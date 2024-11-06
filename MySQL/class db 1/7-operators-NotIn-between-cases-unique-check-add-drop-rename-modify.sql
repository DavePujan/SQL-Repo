use bank_db;
select * from employees2 where salary > 65000;
select * from employees2 where salary < 65000;
select * from employees2 where salary <= 45000;
select * from employees2 where salary >= 45000;
select * from employees2 where salary != 45000;
 
select * from employees2 where salary = 45000 and dept='account';
select * from employees2 where salary = 45000 or dept='loan';
 
select * from employees2 where dept='account' or dept='cash' or dept='loan';
select * from employees2 where dept in('account','cash','loan');
select * from employees2 where dept not in('account','cash','loan');

select * from employees2 where salary>=40000 and salary <=65000;
select * from employees2 where salary between 40000 and 65000;

 select fname,salary,
 case  
 when salary >=40000 
 then 'higher salary'  
 else 'low salary' 
 end  as 'salary category' 
 from employees2;
 
 select fname,salary,
case
when salary >= 50000 then 'higher salary'
when salary >= 40000 and salary <50000 then 'mid salary'
else 'low salary'
end as 'salary category'
from employees2;

select * from person where jd=null;
select * from person where jd is null;

select * from employees2 where fname not like 'a%';
 
create table contacts(name varchar(30) , mob varchar(10) unique check (length(mob) >= 10));
desc contacts;
insert into contacts value('one',12345);
insert into contacts value('one',1234567890);

-- named constraints
create table contacts2(mob varchar(10) unique CONSTRAINT mobno_less_than_10_digits check (length(mob) >= 10));
desc contacts2;
insert into contacts2 value(12345);
-- ERROR: Check constraint 'mobno_less_than_10_digits' is violated.


 alter table contacts2 add column name varchar(30);
desc contacts2;
alter table contacts2 drop column name;
desc contacts2;

alter table contacts2 add column name varchar(30);
desc contacts2;
alter table contacts2 rename column name to fname;
desc contacts2;

alter table contacts2 rename to mycontact;
desc mycontact;
rename table mycontact to contacts2;
desc contacts2;
 
alter table contacts2 modify mob varchar(20) default 'unknown';
desc contacts2;


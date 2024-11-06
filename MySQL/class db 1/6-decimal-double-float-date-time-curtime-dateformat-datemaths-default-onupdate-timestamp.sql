use school;
create table num (price int);
desc num;

insert into num values (156.28);
select * from num;

create table num1 (price decimal(5,2));
insert into num1 value (155.78);
select * from num1;
 
insert into num1 value (1557.8);
insert into num1 value (15.578);
select * from num1;
 
create table num2(f float , d double);
insert into num2 value(123.456, 123.456);
insert into num2 value(123.123456789, 123.123456789);
insert into num2 value(123.123456789, 123.1234567890123456789);
 
create table person(jd date ,jt time, jdt datetime);
desc person;
 
insert into person value('2022-05-17' , '20:00:00' , '2023-03-23 20:03:32');
select * from person;

insert into person value('2022:05:17' , '20:00:00' , '2023-03-23 20:03:32');
select * from person;

select curdate();
select curtime();
select now();

insert into person value(curdate() , curtime() , now());
select * from person;
 
select dayname('2023-05-23');
select dayofmonth(curdate());
select dayofweek(curdate());
select monthname(curdate());
 
select jd,monthname(jd) from person;
 
select hour(curtime());
  
select date_format(now(),'%d/%m/%y');
select date_format(now(),'%D %a of %m, 20%y at %r');
select jdt,date_format(jdt,'%D %a at %r') from person;
   
select datediff('2023-04-20' , '2023-04-15');
 select timediff('23:00:00' , '20:00:50');

 select date_add(now(),interval 1 year);
 select date_sub(now(),interval 1 year);

create table blogs( blog varchar(150), ct datetime default CURRENT_TIMESTAMP, ut datetime on update CURRENT_TIMESTAMP);
insert into blogs (blog) value ('this is first');
select * from blogs;
update blogs set blog='this is edited';
select * from blogs;
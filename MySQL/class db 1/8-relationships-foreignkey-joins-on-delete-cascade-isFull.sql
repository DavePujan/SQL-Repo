 create database stores;
 use stores;
 show tables;
 
 create table customers( cust_id int auto_increment primary key, name varchar(50) , email varchar(5));
 desc customers;
 
 create table orders( ord_id int auto_increment primary key , date date, amount decimal(10,2), cust_id int , FOREIGN KEY (cust_id) REFERENCES customers(cust_id));
 desc orders;
 
 SELECT CONSTRAINT_NAME, COLUMN_NAME, REFERENCED_TABLE_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME = 'orders';
 
 alter table customers modify email varchar(30);
 
 insert into customers (name,email) values ("raju","raju@email.com"),("sham","sham@email.com");
select * from customers;

insert into orders (date,amount,cust_id) values (curdate() , 105.38 , 1);
select * from orders;

insert into orders (date,amount,cust_id) values (curdate() , 500.38 , 1);
select * from orders;

insert into orders (date,amount,cust_id) values (curdate() , 503.38 , 1);
select * from orders;

insert into orders (date,amount,cust_id) values (curdate() , 503.38 , 10);
-- ERROR : Cannot add or update a child row: a foreign key constraint fails

insert into customers (name,email) values ("baburao","babu@email.com"),("paul","paul@email.com"),("alex","alex@gmail.com");
select * from customers;
select * from orders;

insert into orders (date,amount,cust_id) values (curdate() , 400.00 , 5),(curdate(), 700.00,4),(curdate(),400.00,5),(curdate(),1000.00,3),(curdate(),1100.00,1),(curdate(),900.00,4);
select * from orders;

 delete from orders where ord_id = 2;
 delete from orders where ord_id = 4;
 delete from orders where ord_id = 5;
select * from orders;

-- Cross Join
select * from customers,orders;

-- inner join
select * from customers inner join orders on orders.cust_id=customers.cust_id;
select name from customers inner join orders on orders.cust_id=customers.cust_id group by name;
select name,sum(amount) from customers inner join orders on orders.cust_id=customers.cust_id group by name;

-- left join
select * from customers left join orders on orders.cust_id=customers.cust_id;
select name,sum(amount) from customers left join orders on orders.cust_id=customers.cust_id group by name;

-- usecase of ifnull 
select name,ifnull(sum(amount),0) as total from customers left join orders on orders.cust_id=customers.cust_id group by name;

-- right join
 select * from orders right join customers on orders.cust_id=customers.cust_id;
 
 -- on delete cascade
delete from customers where name='raju';
-- ERROR : Cannot delete or update a parent row: a foreign key constraint fails
drop table orders;
create table orders(ord_id int auto_increment primary key, date date, amount decimal(10,2), cust_id int, FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE);

insert into orders (date,amount,cust_id) values (curdate() , 105.38 , 1), (curdate() , 500.48 , 2), (curdate() , 300.458 , 1);
select * from orders;

 delete from customers where name='raju';
 select * from customers;
 select * from orders;
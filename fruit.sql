create database pratice;
use pratice;

create table fruits(fruitnumber int primary key,name varchar(20),price int);
create table sailer(sailerid int primary key,name varchar(20),fruitid int,address varchar(30),foreign key(fruitid) references fruits(fruitnumber));

INSERT INTO fruits (fruitnumber, name, price) VALUES
(1, 'Apple', 120),
(2, 'Banana', 40),
(3, 'Mango', 150),
(4, 'Grapes', 90),
(5, 'Orange', 70);

INSERT INTO sailer (sailerid, name, fruitid, address) VALUES
(1, 'John', 1, '123 Maple Street'),
(2, 'Emma', 2, '456 Oak Avenue'),
(3, 'David', 3, '789 Pine Road'),
(4, 'Sophia', 4, '101 Elm Drive'),
(5, 'Michael', 5, '202 Birch Lane');

select * from sailer;
select * from fruits;

create view fruitview as 
select s.sailerid,s.name ,f.price
from sailer s 
join fruits f on f.fruitnumber=s.fruitid; 

select * from fruitview;

alter table fruits rename  column name to fruitname; 

select f.fruitname,f.price,s.name,s.address
from fruits f 
join sailer s on f.fruitnumber=s.fruitid;

create view divya as
select * from fruits;
select * from divya;
alter table fruits add pack_date date;
alter table sailer add email varchar(200);
alter table sailer drop email;
alter table sailer rename column buissness_email to business_email;
alter table sailer modify column buissness_email int;
desc sailer;
alter table sailer  modify  buissness_email varchar(200); 
alter table sailer alter buissness_email set default 'sandiego@gmail.com';
alter table sailer drop column business_email;
alter table sailer add column email varchar(200);
alter table sailer add check(length(email)>20);
update sailer set email="diagosan12341@gmail.com" where sailerid=7;
select * from sailer;
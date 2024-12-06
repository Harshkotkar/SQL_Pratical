use assigment2;

create table person (person_id int primary key,name varchar(50),address varchar(100),phone varchar(15));

create table car (car_id int primary key,model varchar(50),year int,owner_id int,foreign key (owner_id) references person(person_id));

create table accident (accident_id int primary key,date date,location varchar(100),car_id int,foreign key (car_id) references car(car_id));

insert into person values 
(1, 'alice', 'Newyork', '1234567890'),
(2, 'Abhay', 'Pune', '2345678901'),
(3, 'Atharv', 'Mumbai', '3456789012'),
(4, 'Kartik', 'Delhi', '4567890123'),
(5, 'DJ', 'Kolkata', '1234567890');

insert into car values 
(101, 'toyota camry', 2020, 1),
(102, 'honda civic', 2018, 2),
(103, 'ford mustang', 2021, 3),
(104, 'tesla model 3', 2022, 4),
(105, 'BMW M5', 2019, 5);


insert into accident values 
(201, '2024-10-01', 'main street', 101),
(202, '2024-09-15', 'highway 1', 103),
(203, '2023-11-10', 'downtown', 105),
(204, '2022-06-05', 'highway 47', 102),
(205, '2024-05-20', 'city park', 104);

-- 1. List all persons
select * from person;

-- 2. List all cars
select * from car;

-- 3. List all persons who own a car of a specific model
select p.name, p.address, p.phone 
from person p 
join car c on p.person_id = c.owner_id 
where c.model = 'toyota camry'; 

-- 4. List cars with a specific manufacturing year
select * from car 
where year = 2020; 

-- 5. List persons who met an accident on a specific date
select p.name, p.address, p.phone 
from person p join car c on p.person_id = c.owner_id
join accident a on c.car_id = a.car_id where a.date = '2024-10-01';  

-- 6. List person details along with car details for accidents at a specific location
select p.name, p.address, p.phone, c.model, c.year, a.date, a.location
from person p join car c on p.person_id = c.owner_id join accident a on c.car_id = a.car_id where a.location = 'main street';  



use assigment2;

create table movies (movie_id int primary key,m_name varchar(100),release_year int,budget int);

create table actor (actor_id int primary key,a_name varchar(100),role varchar(50),charges int,a_address varchar(100));

create table producer (producer_id int primary key,name varchar(100),p_address varchar(100));

create table movie_actor (movie_id int,actor_id int,foreign key (movie_id) references movies(movie_id),foreign key (actor_id) references actor(actor_id));

create table movie_producer (movie_id int,producer_id int,foreign key (movie_id) references movies(movie_id),foreign key (producer_id) references producer(producer_id));


insert into movies values 
(1, 'inception', 2010, 160000000),
(2, 'interstellar', 2014, 165000000),
(3, 'dunkirk', 2017, 100000000),
(4, 'Black Panther', 2018, 200000000, 'Action'),
(5, 'Spider-Man: No Way Home', 2021, 200000000, 'Action');


insert into actor values 
(1, 'leonardo dicaprio', 'lead', 20000000, 'hollywood, ca'),
(2, '', 'lead', 18000000, 'austin, tx'),
(3, 'tom hardy', 'supporting', 8000000, 'london, uk'),
(4, 'Chadwick Boseman', 'lead', 15000000, 'los angeles, ca'),
(5, 'Tom Holland', 'lead', 15000000, 'los angeles, ca');

insert into producer values 
(1, 'emma thomas', 'la, ca'),
(2, 'christopher nolan', 'la, ca'),
(3, 'Kevin Feige', 'los angeles, ca');

insert into movie_actor values 
(1, 1),
(2, 2),  
(3, 3),
(4, 4),  
(5, 5); 

INSERT INTO movie_producer VALUES 
(1, 1),  
(2, 2),  
(3, 3),
(4, 4),  
(5, 5);  

ALTER TABLE movies ADD COLUMN genre VARCHAR(50);
UPDATE movies SET genre = 'Sci-Fi' WHERE movie_id = 1;
UPDATE movies SET genre = 'Sci-Fi' WHERE movie_id = 2;
UPDATE movies SET genre = 'War' WHERE movie_id = 3;

-- 1. List the names of movies produced by specific producers whose actors take charges greater than a certain amount.
select distinct m.m_name
from movies m
join movie_producer mp on m.movie_id = mp.movie_id
join producer p on mp.producer_id = p.producer_id
join movie_actor ma on m.movie_id = ma.movie_id
join actor a on ma.actor_id = a.actor_id
where a.charges > 10000;

-- 2. Find the names of actors with the highest charges.
select a_name from actor where charges = (select max(charges) from actor);

-- 3. List the names of movies with the minimum budget, release year, along with all actors who acted in them.
select m.m_name, m.release_year, a.a_name
from movies m
join movie_actor ma on m.movie_id = ma.movie_id
join actor a on ma.actor_id = a.actor_id
where m.budget = (select min(budget) from movies);



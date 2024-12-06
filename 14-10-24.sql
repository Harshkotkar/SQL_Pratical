create database fcp;
use fcp;
CREATE TABLE movie_theater (
    t_id INT,
    date DATE,
    time TIME,
    movie_name VARCHAR(30),
    movie_genre VARCHAR(20),  
    guest_total INT,
    t_cost DECIMAL(6,2),      
    PRIMARY KEY (t_id)
);

INSERT INTO movie_theater VALUES 
(1, '2024-10-06', '21:00:00', 'Inception', 'Sci-Fi', 120, 700.50),
(2, '2024-10-08', '21:00:00', 'Interstellar', 'Sci-Fi', 150, 950.00),
(3, '2024-10-11', '16:00:00', 'The Dark Knight', 'Action', 90, 800.00),
(4, '2024-10-12', '19:30:00', 'Joker', 'Drama', 80, 900.00),
(5, '2024-10-12', '17:00:00', 'WALL-E', 'Animation', 150, 600.00), 
(6, '2024-10-13', '20:00:00', 'Avengers: Endgame', 'Action', 200, 1200.00),
(7, '2024-10-13', '15:30:00', 'Spider-Man: No Way Home', 'Adventure', 180, 1000.50),
(8, '2024-10-17', '18:00:00', 'X-Men', 'Action', 105, 850.00),
(9, '2024-10-18', '13:00:00', 'Tangled', 'Animation', 160, 1000.00),
(10, '2024-10-18', '21:30:00', 'The Godfather', 'Crime', 60, 500.00);

#aggregate function

select count(movie_name) from movie_theater where movie_genre='action'; 
select movie_name from movie_theater where movie_genre='action';

#string pattern 
select * from  movie_theater where movie_name like'joker'; 
select * from  movie_theater where movie_name like'%aven%'; 
select * from  movie_theater where movie_name like'%god%' and movie_genre='crime'; 
#3 7 11
#order by
select * from  movie_theater order by movie_name desc; 
select * from  movie_theater order by movie_name asc;
select * from  movie_theater order by movie_name ; 
select movie_name from  movie_theater where time='21:00:00' order by movie_name asc; 

 #group by
select movie_name, sum((guest_total+12)*t_cost) as total_revenue from movie_theater group by movie_name order by total_revenue;
select movie_name, sum((guest_total+12)*(t_cost*0.88)) as total_revenue from movie_theater group by movie_name order by total_revenue;
select movie_name, (t_cost*0.88) as discounted_price from movie_theater order by discounted_price;
select * from movie_theater;

#--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table team (
    tid int primary key,
    tname varchar(50) not null
);

CREATE TABLE coach (
    cno INT PRIMARY KEY,
    cname VARCHAR(50) NOT NULL,
    age INT,
    experience INT
);

CREATE TABLE player (
    pno INT PRIMARY KEY,
    pname VARCHAR(50) NOT NULL,
    page INT,
    specialization VARCHAR(30)
);

CREATE TABLE matches (
	match_id int,
    matchground VARCHAR(50),
    matchdate DATE,
    tno1  int references team(tno),
    tno2 int references team(tno),
    PRIMARY KEY (match_id, matchdate)
);

desc matches;
INSERT INTO team VALUES 
(1, 'Red Dragons'),
(2, 'Blue Hawks'),
(3, 'Warriors'),
(4, 'Black Hawks'),
(5, 'Silver Surfer'), 
(6, 'Association '),
(7, 'Dare Devil'),
(8, 'Golden Warriors'),
(9, 'Dark Worriors'),
(10, 'Knights');




 

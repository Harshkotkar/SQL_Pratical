create database assigment4;

-- create a view for branchwise loan details
use assigment1;
CREATE VIEW branchwise_view AS
SELECT B.b_name AS branch_name,C.c_name AS customer_name,L.l_no AS loan_number,L.amount AS loan_amount
FROM loan L JOIN customer C ON L.cno = C.cno
JOIN  branch B ON L.b_no = B.b_no;

SELECT * FROM branchwise_view;


-- Create a view to find details of movie whose genre is and actor works in it
use assigment2;
CREATE VIEW movies_by_genre_and_actor AS
SELECT m.movie_id,m.m_name,m.release_year,m.budget,m.genre,a.a_name,a.role,a.charges,a.a_address
FROM movies m
JOIN movie_actor ma ON m.movie_id = ma.movie_id
JOIN actor a ON ma.actor_id = a.actor_id
WHERE m.genre = 'Sci-Fi'; 

select  * from movies_by_genre_and_actor;

-- 3. Create a view to find customer names who have taken loan > 30lakhs
use assigment1;
CREATE VIEW bank_view AS
SELECT C.c_name FROM customer C JOIN loan L ON C.cno = L.cno WHERE L.amount > 3000000;  

SELECT * FROM bank_view;

-- Create a view to find players whose specialization  is and belong to club
use fcp;
CREATE VIEW player_specialization_view AS
SELECT p.p_name AS player_name,p.p_age AS player_age,p.spec AS specialization,t.t_name AS team_name
FROM player p JOIN team t ON p.t_no = t.t_no;
SELECT * FROM player_specialization_view 
WHERE specialization = 'Batsman' AND team_name = 'Warriors';

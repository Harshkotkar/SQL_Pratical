
USE fcp;

CREATE TABLE team (t_no INT PRIMARY KEY,t_name VARCHAR(30));
ALTER TABLE team MODIFY t_name VARCHAR(50);

INSERT INTO team (t_no, t_name) VALUES
(1, 'Warriors'),
(2, 'Challengers'),
(3, 'Titans'),
(4, 'Knights'),
(5, 'Sharks');

CREATE TABLE coach (c_no INT PRIMARY KEY,c_name VARCHAR(40),age INT CHECK (age > 40),experience INT,t_no INT REFERENCES team (t_no));

INSERT INTO coach (c_no, c_name, age, experience, t_no) VALUES
(1, 'Rahul Dravid', 45, 20, 1),   -- Coach for Warriors
(2, 'Sourav Ganguly', 42, 15, 2), -- Coach for Challengers
(3, 'Anil Kumble', 50, 25, 3),    -- Coach for Titans
(4, 'Mithali Raj', 41, 10, 4),    -- Coach for Knights
(5, 'Kapil Dev', 42, 18, 5);      -- Coach for Sharks
 
CREATE TABLE player (p_no INT PRIMARY KEY,p_name VARCHAR(40),p_age INT CHECK (18 <= p_age AND p_age <= 60),spec VARCHAR(50),t_no INT REFERENCES team (t_no));

INSERT INTO player (p_no, p_name, p_age, spec, t_no) VALUES
(1, 'Virat Kohli', 32, 'Batsman', 1),   
(2, 'Jasprit Bumrah', 29, 'Bowler', 2),  
(3, 'Rohit Sharma', 35, 'Batsman', 3),   
(4, 'Harmanpreet Kaur', 34, 'Batsman', 4), 
(5, 'MS Dhoni', 42, 'Wicketkeeper', 5),  
(6, 'Shikhar Dhawan', 33, 'Batsman', 1), 
(7, 'Hardik Pandya', 30, 'All-rounder', 2), 
(8, 'Ravindra Jadeja', 35, 'All-rounder', 4), 
(9, 'Yuzvendra Chahal', 33, 'Bowler', 2), 
(10, 'Ravichandran Ashwin', 37, 'Bowler', 3); 


CREATE TABLE matches (mid INT PRIMARY KEY,matchground VARCHAR(40),tno1 INT REFERENCES team (t_no),tno2 INT REFERENCES team (t_no),sco_tno1 INT,sco_tno2 INT,CHECK (sco_tno2 <= sco_tno1 + 1));

INSERT INTO matches (mid, matchground, tno1, tno2, sco_tno1, sco_tno2) VALUES
(1, 'Eden Gardens', 1, 2, 250, 251),  
(2, 'Wankhede Stadium', 3, 4, 210, 211),  
(3, 'M. A. Chidambaram', 1, 3, 240, 241),  
(4, 'Feroz Shah Kotla', 2, 5, 180, 181),  
(5, 'M. Chinnaswamy', 4, 5, 160, 161),  
(6, 'Eden Gardens', 1, 4, 230, 231),  
(7, 'Wankhede Stadium', 2, 3, 200, 201),  
(8, 'M. A. Chidambaram', 1, 5, 190, 190),  
(9, 'Feroz Shah Kotla', 3, 5, 220, 221),  
(10, 'M. Chinnaswamy', 2, 4, 210, 211);  

SELECT * FROM team;
SELECT * FROM coach;
SELECT * FROM player;
SELECT * FROM matches;

-- 1. Find the name of the team coached by 'Rahul Dravid'
SELECT t_name FROM team WHERE t_no IN (SELECT t_no FROM coach WHERE c_name = 'Rahul Dravid');

-- 2. List details of players belonging to "Knights" team 
SELECT p_name, p_age, spec FROM player WHERE t_no IN (SELECT t_no FROM team WHERE t_name = 'Knights');

-- 3. Find the highest score of a match
SELECT GREATEST(MAX(sco_tno1), MAX(sco_tno2)) AS highest_score 
FROM matches;

-- 4. Find the lowest score of a match
SELECT LEAST(MIN(sco_tno1), MIN(sco_tno2)) AS lowest_score 
FROM matches;

-- 5. Display details of team and coach who have played matches on 'Eden Gardens'
SELECT t.t_name, c.c_name 
FROM team t
JOIN coach c ON t.t_no = c.t_no
JOIN matches m ON t.t_no IN (m.tno1, m.tno2)
WHERE m.matchground = 'Eden Gardens';

-- 6. Find team-wise scores of matches 
SELECT m.mid AS match_id, t1.t_name AS team1, m.sco_tno1 AS team1_score, t2.t_name AS team2, m.sco_tno2 AS team2_score
FROM matches m
JOIN team t1 ON m.tno1 = t1.t_no
JOIN team t2 ON m.tno2 = t2.t_no;

-- 7. Find match details played the most on a specific ground 
SELECT m.matchground AS ground, m.mid AS match_id, m.tno1 AS team1, m.sco_tno1 AS team1_score, m.tno2 AS team2, m.sco_tno2 AS team2_score
FROM matches m
WHERE m.matchground = (SELECT matchground FROM matches
GROUP BY matchground ORDER BY COUNT(*) DESC LIMIT 1 OFFSET 5);   -- This skips the first 5 matchgrounds and selects the next one

-- 8. List all batsmen and their teams 
SELECT  p.p_no, p.p_name, p.p_age, t.t_name
FROM player p
JOIN  team t ON p.t_no = t.t_no
WHERE p.spec = 'Batsman';

-- 9. Find teams that have played on 'Wankhede Stadium' 
SELECT DISTINCT t.t_name AS team_name
FROM team t
JOIN matches m ON t.t_no = m.tno1 OR t.t_no = m.tno2
WHERE m.matchground = 'Wankhede Stadium';

-- 10. Find match details for coach 'Anil Kumble'
SELECT t.t_name AS team_name, m.mid AS match_id, m.matchground
FROM coach c
JOIN team t ON c.t_no = t.t_no
JOIN  matches m ON c.t_no = m.tno1 OR c.t_no = m.tno2 WHERE c_name = 'Anil Kumble';

-- 11. Count how many matches each player has participated in
SELECT p.p_name, COUNT(*) AS match_count FROM player p JOIN matches m ON p.t_no = m.tno1 OR p.t_no = m.tno2
GROUP BY p.p_name
ORDER BY match_count DESC, p.p_name ASC LIMIT 20;  

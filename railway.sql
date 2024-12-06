
USE assigment1;

CREATE TABLE train (train_no INT ,train_name VARCHAR(20),src_station VARCHAR(20),
dest_station VARCHAR(20),
depart_time TIME,arrival_time TIME,num_of_bogies INT,
bogie_capacity INT,PRIMARY KEY(train_no)
);

INSERT INTO train (train_name, src_station, dest_station, depart_time, arrival_time, num_of_bogies, bogie_capacity) VALUES
('Rajdhani Express', 'Mumbai', 'Delhi', '08:00:00', '16:00:00', 12, 50),
('Nagpur Express', 'Chennai', 'Bangalore', '07:00:00', '12:00:00', 8, 75),
('Amravati Express', 'Hyderabad', 'Kolkata', '09:00:00', '19:00:00', 10, 60),
('Intercity Express', 'Jaipur', 'Agra', '11:00:00', '15:30:00', 6, 80),
('Manmad Express', 'Pune', 'Lucknow', '12:30:00', '23:00:00', 5, 100);
SELECT * FROM train;

CREATE TABLE passenger (passenger_id INT ,name VARCHAR(20),address VARCHAR(50),age INT,gender CHAR(1),PRIMARY KEY(passenger_id));

INSERT INTO passenger (name, address, age, gender) VALUES
('Ravi', 'Mumbai', 25, 'M'),
('Anjali', 'Chennai', 22, 'F'),
('Vishal', 'Hyderabad', 27, 'M'),
('Kunal', 'Jaipur', 21, 'F'),
('Rahul', 'Pune', 30, 'M'),
('Neha', 'Delhi', 23, 'F'),
('Ishan', 'Bangalore', 28, 'M'),
('Priya', 'Kolkata', 24, 'F'),
('Mrunal', 'Lucknow', 29, 'M'),
('Sanya', 'Agra', 20, 'F');

SELECT * FROM passenger;

CREATE TABLE train_passenger (
    train_no INT,passenger_id INT,status ENUM('Confirmed', 'Not Confirmed', 'Waiting') DEFAULT 'Not Confirmed',
    FOREIGN KEY(train_no) REFERENCES train(train_no),FOREIGN KEY(passenger_id) REFERENCES passenger(passenger_id));

INSERT INTO train_passenger (train_no, passenger_id, status) VALUES
(1, 1, 'Confirmed'), (1, 2, 'Confirmed'),
(2, 3, 'Waiting'), (2, 4, 'Waiting'),
(3, 5, 'Not Confirmed'), (3, 6, 'Not Confirmed'),
(4, 7, 'Waiting'), (4, 8, 'Confirmed'),
(5, 9, 'Confirmed'), (5, 10, 'Not Confirmed');
SELECT * FROM train_passenger;

-- Query 1: List distinct passengers with 'Confirmed' status
SELECT DISTINCT p.name 
FROM train_passenger tp
JOIN passenger p ON tp.passenger_id = p.passenger_id
WHERE tp.status = 'Confirmed';

-- Query 2: List distinct passengers with 'Waiting' status
SELECT DISTINCT p.name 
FROM train_passenger tp
JOIN passenger p ON tp.passenger_id = p.passenger_id
WHERE tp.status = 'Waiting';

-- Query 3: Delete trains with 10 bogies starting from 'Hyderabad'
DELETE FROM train 
WHERE num_of_bogies = 10 AND src_station = 'Hyderabad';

-- Query 4: Update waiting passengers (starting with 'P') to 'Confirmed'
UPDATE train_passenger tp
JOIN passenger p ON tp.passenger_id = p.passenger_id
SET tp.status = 'Confirmed'WHERE tp.status = 'Waiting' AND p.name LIKE 'P%';
SELECT * FROM train_passenger;


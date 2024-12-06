
USE assigment1;


CREATE TABLE department (dept_no INT PRIMARY KEY,dept_name VARCHAR(20));

INSERT INTO department VALUES 
(1, 'Sales'),
(2, 'Marketing'),
(3, 'HR'),
(4, 'IT'),
(5, 'Finance');

SELECT * FROM department;

CREATE TABLE salesman(s_no INT PRIMARY KEY,s_name VARCHAR(20),join_year YEAR,salary INT,dept_no INT,FOREIGN KEY(dept_no) REFERENCES department(dept_no));
INSERT INTO salesman VALUES 
(101, 'Amit', 2021, 55000, 1),
(102, 'Rohit', 2022, 60000, 2),
(103, 'Neha', 2023, 52000, 3),
(104, 'Pooja', 2022, 48000, 1),
(105, 'Vikram', 2020, 62000, 4),
(106, 'Kavita', 2021, 50000, 5),
(107, 'Anjali', 2023, 57000, 3),
(108, 'Ravi', 2020, 53000, 2),
(109, 'Rajesh', 2019, 58000, 4),
(110, 'Isha', 2021, 49000, 5);

SELECT * FROM salesman;


CREATE TABLE trip (t_no INT PRIMARY KEY,from_city VARCHAR(20),to_city VARCHAR(20),dept_date DATE,return_date DATE,s_no INT,FOREIGN KEY(s_no) REFERENCES salesman(s_no));

INSERT INTO trip VALUES 
(201, 'Mumbai', 'Delhi', '2023-10-01', '2023-10-05', 101),
(202, 'Chennai', 'Kolkata', '2023-09-10', '2023-09-15', 102),
(203, 'Hyderabad', 'Bangalore', '2023-09-20', '2023-09-25', 103),
(204, 'Pune', 'Ahmedabad', '2023-10-10', '2023-10-15', 104),
(205, 'Jaipur', 'Surat', '2023-10-30', '2023-11-04', 105),
(206, 'Lucknow', 'Bhopal', '2023-11-01', '2023-11-05', 106),
(207, 'Nagpur', 'Indore', '2023-11-15', '2023-11-20', 107),
(208, 'Chandigarh', 'Shimla', '2023-12-01', '2023-12-06', 108),
(209, 'Patna', 'Varanasi', '2023-12-20', '2023-12-25', 109),
(210, 'Coimbatore', 'Mysore', '2024-01-10', '2024-01-15', 110);

SELECT * FROM trip;

CREATE TABLE expense (e_id INT PRIMARY KEY,amount INT,t_no INT,FOREIGN KEY(t_no) REFERENCES trip(t_no));

--  values expense 
INSERT INTO expense VALUES
(301, 2000, 201),
(302, 2500, 202),
(303, 1800, 203),
(304, 2200, 204),
(305, 1900, 205),
(306, 3000, 206),
(307, 2700, 207),
(308, 2400, 208),
(309, 2600, 209),
(310, 2800, 210);

SELECT * FROM expense;

--  trip 
UPDATE trip SET dept_date = '2023-10-01', return_date = '2023-10-05' WHERE t_no = 202;
UPDATE trip SET dept_date = '2023-09-20', return_date = '2023-09-25' WHERE t_no = 203;
UPDATE trip SET dept_date = '2023-10-10', return_date = '2023-10-15' WHERE t_no = 204;
UPDATE trip SET dept_date = '2023-10-30', return_date = '2023-11-04' WHERE t_no = 205;
UPDATE trip SET dept_date = '2023-11-15', return_date = '2023-11-20' WHERE t_no = 207;
UPDATE trip SET dept_date = '2023-12-01', return_date = '2023-12-06' WHERE t_no = 208;
UPDATE trip SET dept_date = '2023-12-20', return_date = '2023-12-25' WHERE t_no = 209;
UPDATE trip SET dept_date = '2024-01-10', return_date = '2024-01-15' WHERE t_no = 210;

-- Question 1: List salesmen who joined after 2020 along with their departments
SELECT * 
FROM salesman, department WHERE join_year > 2020 AND salesman.dept_no = department.dept_no;

-- Question 2: Delete the expense record with the highest amount
DELETE FROM expense WHERE amount = (SELECT MAX(amount) FROM expense);

-- Question 3: Get the department and salesman with the latest join year
SELECT * FROM department, salesman WHERE join_year = (SELECT MAX(join_year) FROM salesman) AND department.dept_no = salesman.dept_no;

-- Question 4: Find the trip with the longest duration
SELECT * FROM trip WHERE return_date - dept_date = (SELECT MAX(return_date - dept_date) FROM trip);

-- Question 5: Count the number of trips starting from 'Mumbai'
SELECT COUNT(*) FROM trip WHERE from_city = 'Mumbai';

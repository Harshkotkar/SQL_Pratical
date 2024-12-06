-- Bank
use assigment1;

CREATE TABLE branch (b_no INT PRIMARY KEY,b_name VARCHAR(20));

INSERT INTO branch VALUES
(101, 'FC Road'),
(102, 'SB Road'),
(103, 'MG Road'),
(104, 'JM Road'),
(105, 'Baner Road');

CREATE TABLE customer (cno INT PRIMARY KEY,c_name VARCHAR(20));

INSERT INTO customer VALUES
(201, 'Abhishek'),
(202, 'Rahul'),
(203, 'Gargi'),
(204, 'Priyanka'),
(205, 'Amit');

CREATE TABLE acc (a_no INT PRIMARY KEY,b_no INT,cno INT,FOREIGN KEY (b_no) REFERENCES branch(b_no),FOREIGN KEY (cno) REFERENCES customer(cno));

INSERT INTO acc VALUES
(301, 101, 201),
(302, 102, 202),
(303, 103, 203),
(304, 104, 204),
(305, 105, 205);

-- Loan
CREATE TABLE loan (l_no INT PRIMARY KEY,b_no INT,cno INT,FOREIGN KEY (b_no) REFERENCES branch(b_no),FOREIGN KEY (cno) REFERENCES customer(cno));

INSERT INTO loan VALUES
(401, 101, 201),
(402, 102, 202),
(403, 103, 203),
(404, 104, 204),
(405, 105, 205);

ALTER TABLE loan ADD amount INT;
UPDATE loan SET amount = 2500000 WHERE l_no = 401;  
UPDATE loan SET amount = 3200000 WHERE l_no = 402;  
UPDATE loan SET amount = 2800000 WHERE l_no = 403; 
UPDATE loan SET amount = 5000000 WHERE l_no = 404;  
UPDATE loan SET amount = 7000000 WHERE l_no = 405;  


-- 1. List customers whose first name starts with ‘S’.
SELECT * FROM customer 
WHERE c_name LIKE 'S%';

-- List the names of customers who have received a loan in the year.
SELECT DISTINCT C.c_name
FROM customer C
JOIN loan L ON C.cno = L.cno
WHERE YEAR(L.loandate) = 2024;  

-- 3. Find the details of all accounts of senior citizens (over 60 years).
SELECT A.a_no, A.b_no, C.c_name, C.dob 
FROM acc A 
JOIN customer C ON A.cno = C.cno 
WHERE DATEDIFF(CURDATE(), C.dob) / 365 > 60;

-- 4. List customer details branch-wise.
SELECT B.b_name, C.cno, C.c_name 
FROM customer C
JOIN acc A ON C.cno = A.cno
JOIN branch B ON A.b_no = B.b_no
ORDER BY B.b_name, C.c_name;

-- 5. Find the average loan given by a specific branch.
SELECT AVG(L.amount) AS AvgLoanAmt
FROM loan L
JOIN branch B ON L.b_no = B.b_no
WHERE B.b_name = 'SB Road';  

-- 6. Find the count of customers who have taken a loan.
SELECT COUNT(DISTINCT cno) AS LoanCustomerCount 
FROM loan;





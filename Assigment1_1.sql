-- Employe
create  database assigment1;
use assigment1;

CREATE TABLE Emp(emp_no INT PRIMARY KEY,emp_name VARCHAR(20),address VARCHAR(30),city VARCHAR(20),birth DATE,data TEXT, emp_id VARCHAR(50) );

CREATE TABLE Project (project_no INT PRIMARY KEY,project_name VARCHAR(30),status VARCHAR(20));

CREATE TABLE Dept(dept_no INT PRIMARY KEY, dept_name VARCHAR(100) NOT NULL,location VARCHAR(100));

CREATE TABLE Investor (inv_name VARCHAR(100),inv_no INT PRIMARY KEY,inv_date DATE NOT NULL,inv_amt DECIMAL(10, 2));


INSERT INTO Emp VALUES 
(1, 'Abhay', 'Pune', 'Pune', '1990-04-15', 'HR', 'E001'),
(2, 'Bob', 'Mumbai', 'Mumbai', '1995-07-22', 'IT Manager', 'E002'),
(3, 'kartik', 'Delhi', 'Delhi', '1992-11-10', 'Finance Analyst', 'E003'),
(4, 'Ketan', 'Pune', 'Pune', '1990-04-15', 'Backend Devloper', 'E004'),
(5, 'Pranav', 'Mumbai', 'Mumbai', '1995-07-22', 'IT Manager', 'E005');

INSERT INTO Project VALUES 
(101, 'Healthcare System', 'Active'),
(102, 'E-commerce Platform', 'Progress'),
(103, 'Coffe Shop', 'Completed'),
(104 ,'Dignostic System ', 'Active'),
(105, 'Mobile shop', 'Progress'),
(106, 'Loction Navigator', 'Progress');

INSERT INTO Dept VALUES 
(1, 'HR', 'Pune'),
(2, 'Information Technology', 'Pune'),
(3, 'Finance', 'Pune'),
(4, 'Backend', 'Pune'),
(5, 'Frontend', 'Pune');

INSERT INTO Investor VALUES 
('John Hobs', 1001, '2024-01-15', 500000.00),
('James Show', 1002, '2024-02-10', 750000.00),
('keven Brew', 1003, '2024-03-05', 1000000.00),
('Alina Watson', 1004, '2023-06-05', 1000000.00),
('Cristal clerk', 1005, '2023-12-07', 1000000.00);





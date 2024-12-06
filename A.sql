-- Hospital
USE assignment1;

CREATE TABLE doctor (d_no INT PRIMARY KEY,d_name VARCHAR(20),d_speci VARCHAR(20));
INSERT INTO doctor VALUES
(101, 'Dr. Sara', 'Cardiologist'),
(102, 'Dr. Vansh', 'Neurologist'),
(103, 'Dr.Priyanka', 'Orthopedic'),
(104, 'Dr. Deepali', 'Endrocrionlogist'),
(105, 'Dr. Harsh', 'Dermatologist');

CREATE TABLE patient (p_no INT PRIMARY KEY,p_name VARCHAR(20),p_age VARCHAR(3));

INSERT INTO patient VALUES
(201, 'Alice', '30'),
(202, 'Prasad', '45'),
(203, 'Abhay', '28'),
(204, 'Kartik', '50'),
(205, 'Kunal', '35');

CREATE TABLE doct_patient (d_no INT,p_no INT,FOREIGN KEY (d_no) REFERENCES doctor(d_no),FOREIGN KEY (p_no) REFERENCES patient(p_no));

INSERT INTO doct_patient VALUES
(101, 201),
(102, 202),
(103, 203),
(104, 204),
(105, 205);

CREATE TABLE medicine (m_no INT PRIMARY KEY,m_name VARCHAR(20),m_price VARCHAR(10),mfg_date DATETIME,exp_date DATETIME);

INSERT INTO medicine VALUES
(301, 'Paracetamol', '50', '2023-01-01', '2025-01-01'),
(302, 'Ibuprofen', '70', '2023-02-01', '2025-02-01'),
(303, 'Amoxicillin', '120', '2023-03-01', '2025-03-01'),
(304, 'Aspirin', '40', '2023-04-01', '2026-04-01'),
(305, 'Cough Syrup', '80', '2023-05-01', '2026-05-01');

CREATE TABLE test (t_no INT PRIMARY KEY,t_name VARCHAR(20),t_cost VARCHAR(10));

INSERT INTO test VALUES
(401, 'Blood Test', '1000'),
(402, 'X-ray', '2000'),
(403, 'MRI Scan', '5000'),
(404, 'CT Scan', '7000'),
(405, 'Ultrasound', '3000');

CREATE TABLE bill_history (b_no INT PRIMARY KEY,p_no INT,t_no INT,FOREIGN KEY (p_no) REFERENCES patient(p_no),FOREIGN KEY (t_no) REFERENCES test(t_no));

INSERT INTO bill_history VALUES
(501, 201, 401),
(502, 202, 402),
(503, 203, 403),
(504, 204, 404),
(505, 205, 405);

CREATE TABLE Hospital_room(r_no INT PRIMARY KEY,r_type VARCHAR(20),ward_no VARCHAR(20),cost_per_day VARCHAR(10));

INSERT INTO Hospital_room VALUES
(601, 'General Room', 'Ward 1', '500'),
(602, 'Private Room', 'Ward 2', '1500'),
(603, 'ICU', 'Ward 3', '3000'),
(604, 'Deluxe Room', 'Ward 4', '2000'),
(605, 'Emergency', 'Ward 5', '4000');



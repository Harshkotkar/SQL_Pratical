
USE assigment1;

CREATE TABLE librarian (l_id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(20),experience VARCHAR(20));

 
INSERT INTO librarian (name, experience) VALUES
('Rakesh', '5 years'),
('Anjali', '3 years'),
('Vikram', '7 years'),
('Kavita', '2 years'),
('Manoj', '10 years');
SELECT * FROM librarian;

CREATE TABLE books (book_id INT AUTO_INCREMENT PRIMARY KEY,book_name VARCHAR(50),author VARCHAR(20),category VARCHAR(20),
quantity INT,cost DECIMAL(5,2),l_id INT,FOREIGN KEY (l_id) REFERENCES librarian(l_id));

-- values book
INSERT INTO books (book_name, author, category, quantity, cost, l_id) VALUES
('The Palace of Illusions', 'Chitra Banerjee', 'Fiction', 5, 299.99, 1),
('The White Tiger', 'Aravind Adiga', 'Fiction', 3, 349.99, 2),
('Train to Kanyakumari', 'Khushwant Singh', 'Historical', 4, 199.50, 3),
('The Guide', 'R.K. Narayan', 'Classic', 6, 249.75, 4),
('A Suitable Boy', 'Vikram Seth', 'Romance', 2, 599.00, 5),
('Gitanjali', 'Rabindranath Tagore', 'Poetry', 1, 149.99, 1),
('The God of Small Things', 'Arundhati Roy', 'Fiction', 3, 299.99, 2),
('The Immortals of Meluha', 'Amish Tripathi', 'Fantasy', 4, 399.50, 3),
('The Inheritance of Loss', 'Kiran Desai', 'Fiction', 5, 199.99, 4),
('Midnight’s Children', 'Salman Rushdie', 'Dystopian', 2, 499.00, 5);
SELECT * FROM books;

CREATE TABLE person (p_id INT AUTO_INCREMENT PRIMARY KEY,name varchar(20),gender char(1),phone_no varchar(10),book_interest varchar(20),membership_type varchar(20));

INSERT INTO person VALUES
('Ravi', 'M', '9876543210', 'Fiction', 'Annual'),
('Meena', 'F', '8765432109', 'Romance', 'Monthly'),
('Sana', 'F', '7654321098', 'Science', 'Annual'),
('Arjun', 'M', '6543210987', 'History', 'Lifetime'),
('Mona', 'F', '5432109876', 'Fantasy', 'Monthly'),
('Rahul', 'M', '4321098765', 'Adventure', 'Annual'),
('Karishma', 'F', '3210987654', 'Poetry', 'Lifetime'),
('Shiv', 'M', '2109876543', 'Romance', 'Monthly'),
('Nisha', 'F', '1098765432', 'Dystopian', 'Annual'),
('Aman', 'M', '0198765432', 'Thriller', 'Lifetime');
SELECT * FROM person;

CREATE TABLE person_books (
    p_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (p_id) REFERENCES person(p_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- values person_books
INSERT INTO person_books  VALUES
(1, 1, '2023-09-01', '2023-09-15'),
(1, 2, '2023-09-02', '2023-09-16'),
(2, 3, '2023-09-03', '2023-09-17'),
(3, 4, '2023-09-04', '2023-09-18'),
(4, 5, '2023-09-05', '2023-09-19'),
(5, 6, '2023-09-06', '2023-09-20'),
(6, 7, '2023-09-07', '2023-09-21'),
(7, 8, '2023-09-08', '2023-09-22'),
(8, 9, '2023-09-09', '2023-09-23'),
(9, 10, '2023-09-10', '2023-09-24');
SELECT * FROM person_books;

-- Query 1: List distinct students who borrowed books with the minimum quantity
SELECT DISTINCT p.name AS Student_Name, b.book_name AS Book_Name
FROM person p JOIN person_books pb ON p.p_id = pb.p_id
JOIN books b ON pb.book_id = b.book_id WHERE b.quantity = (SELECT MIN(quantity) FROM books);

-- Query 2: Calculate the average cost of all books
SELECT AVG(cost) AS Average_Cost FROM books;

-- Query 3: Count the number of distinct students with 'Monthly' membership
SELECT COUNT(DISTINCT pb.p_id) AS Total_Students
FROM person_books pb JOIN person p ON pb.p_id = p.p_id WHERE p.membership_type = 'Monthly';


SELECT * FROM librarian;
SELECT * FROM books;
SELECT * FROM person;
SELECT * FROM person_books;

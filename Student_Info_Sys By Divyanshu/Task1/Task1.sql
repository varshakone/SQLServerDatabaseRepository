
-- Creating Database 
CREATE DATABASE SISDB;
USE SISDB;

-- Creating Students Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15)
);

-- Creating Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Creating Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- Creating Teacher Table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

-- Creating Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number) VALUES
(1, 'Alice', 'Smith', '2000-04-23', 'alice.smith@example.com', '5551234567'),
(2, 'Bob', 'Johnson', '1998-07-12', 'bob.johnson@example.com', '5559876543'),
(3, 'Carol', 'White', '1999-03-19', 'carol.white@example.com', '5552468135'),
(4, 'David', 'Brown', '2001-11-30', 'david.brown@example.com', '5551357924'),
(5, 'Emily', 'Davis', '2000-06-15', 'emily.davis@example.com', '5558642097'),
(6, 'Frank', 'Miller', '1997-09-05', 'frank.miller@example.com', '5557564839'),
(7, 'Grace', 'Wilson', '2002-01-25', 'grace.wilson@example.com', '5553294751'),
(8, 'Henry', 'Moore', '1998-10-10', 'henry.moore@example.com', '5559283746'),
(9, 'Isabella', 'Taylor', '2001-12-17', 'isabella.taylor@example.com', '5555362947'),
(10, 'Jake', 'Anderson', '1999-02-08', 'jake.anderson@example.com', '5556284710');

INSERT INTO Teacher (teacher_id, first_name, last_name, email ) VALUES
(11, 'John', 'Doe', 'john.doe@example.com'),
(12, 'Jane', 'Smith', 'jane.smith@example.com'),
(13, 'Michael', 'Johnson', 'michael.johnson@example.com'),
(14, 'Emily', 'White', 'emily.white@example.com'),
(15, 'Robert', 'Brown', 'robert.brown@example.com'),
(16, 'Linda', 'Davis', 'linda.davis@example.com'),
(17, 'William', 'Taylor', 'william.taylor@example.com'),
(18, 'Barbara', 'Wilson', 'barbara.wilson@example.com'),
(19, 'James', 'Moore', 'james.moore@example.com'),
(20, 'Patricia', 'Anderson', 'patricia.anderson@example.com');


INSERT INTO Courses (course_id, course_name, credits, teacher_id) VALUES
(1,'Mathematics', 3, 11),
(2,'Physics', 4, 12),
(3,'Chemistry', 3, 13),
(4,'Biology', 3, 14),
(5,'History', 2, 15),
(6,'English', 3, 16),
(7,'Philosophy', 2, 17),
(8,'Computer Science', 4, 18),
(9,'Economics', 3, 19),
(10,'Psychology', 3, 20);

INSERT INTO Payments (payment_id, student_id, amount, payment_date) VALUES
(101,1, 1000.00, '2024-09-10'),
(102,2, 1200.00, '2024-09-11'),
(103,3, 1100.00, '2024-09-12'),
(104,4, 1300.00, '2024-09-13'),
(105,5, 900.00, '2024-09-14'),
(106,6, 950.00, '2024-09-15'),
(107,7, 1050.00, '2024-09-16'),
(108,8, 1150.00, '2024-09-17'),
(109,9, 1250.00, '2024-09-18'),
(110,10, 1350.00, '2024-09-19');


INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date) VALUES
(101,1, 1, '2024-09-01'),
(102,2, 2, '2024-09-02'),
(103,3, 3, '2024-09-03'),
(104,4, 4, '2024-09-04'),
(105,5, 5, '2024-09-05'),
(106,6, 6, '2024-09-06'),
(107,7, 7, '2024-09-07'),
(108,8, 8, '2024-09-08'),
(109,9, 9, '2024-09-09'),
(110,10, 10, '2024-09-10');

SELECT * FROM Students;

-- SELECT * FROM Courses;
-- SELECT * FROM Enrollments;
-- SELECT * FROM Teacher;
-- SELECT * FROM Payments;


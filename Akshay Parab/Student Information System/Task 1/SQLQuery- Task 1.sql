create database SISDB;
-- Create Students table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(10)
);

-- Create Teacher table
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Create Courses table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);

-- Create Enrollments table
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id), 
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) 
);

-- Create Payments table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES Students(student_id) 


-- Insert into Students table
INSERT INTO Students VALUES
(1,'Akshay', 'Parab', '2002-02-22', 'akshayparab@gmail.com', '9123456789'),
(2,'Pooja', 'Patil', '2000-09-25', 'poojapatil@gmail.com', '9234567890'),
(3,'Rahul', 'parab', '1998-11-14', 'rahulparab@gmail.com', '9345678901'),
(4,'Anjali', 'Deshmukh', '1999-03-04', 'anjalideshmukh@gmail.com', '9456789012'),
(5,'Ravi', 'kumar', '2001-01-17', 'ravikumar@gmail.com', '9567890123'),
(6,'Neha', 'Naik', '1997-12-02', 'nehanaik@gmail.com', '9678901234'),
(7,'Vikram', 'Gupta', '2000-04-19', 'vikramgupta@gmail.com', '9789012345'),
(8,'Simran', 'joshi', '1999-08-08', 'simranjoshi@gmail.com', '9890123456'),
(9,'Suresh', 'Kulkarni', '2000-10-10', 'sureshkulkarni@gmail.com', '9991234567'),
(10,'Meena', 'gawade', '1998-07-21', 'meenagawade@gmail.com', '9912345678');

-- Insert into Teacher table
INSERT INTO Teacher VALUES
(11,'Raj', 'Kapoor', 'rajkapoor@gmail.com'),
(12,'Sneha', 'Iyengar', 'snehaiyengar@gmail.com'),
(13,'Manish', 'Aggarwal', 'manishaggarwal@gmail.com'),
(14,'Priya', 'Sinha', 'priyasinha@gmail.com'),
(15,'Kiran', 'Rao', 'kiranrao@gmail.com'),
(16,'Ajay', 'Mehta', 'ajaymehta@gmail.com'),
(17,'Rachana', 'Shah', 'rachanashah@gmail.com'),
(18,'Dev', 'Chaudhary', 'devchaudhary@gmail.com'),
(19,'Lakshmi', 'Iyer', 'lakshmiiyer@gmail.com'),
(20,'Sunil', 'Ghosh', 'sunilghosh@gmail.com');

-- Insert into Courses table
INSERT INTO Courses VALUES
(111,'Data Structures', 4, 11),
(222,'Operating Systems', 3, 12),
(333,'Database Management', 4, 13),
(444,'Computer Networks', 3, 14),
(555,'Machine Learning', 4, 15),
(666,'Artificial Intelligence', 3, 16),
(777,'Software Engineering', 3, 17),
(888,'Web Development', 3, 18),
(999,'Algorithms', 4, 19),
(1000,'Cybersecurity', 3, 20);

-- Insert into Enrollments table
INSERT INTO Enrollments VALUES
(21,1, 111, '2024-01-10'),
(22,2, 222, '2024-01-12'),
(23,3, 333, '2024-01-15'),
(24,4, 444, '2024-01-17'),
(25,5, 555, '2024-01-18'),
(26,6, 666, '2024-01-20'),
(27,7, 777, '2024-01-22'),
(28,8, 888, '2024-01-23'),
(29,9, 999, '2024-01-25'),
(30,10, 1000, '2024-01-28');

-- Insert into Payments table
INSERT INTO Payments VALUES
(31,1, 15000, '2024-02-01'),
(32,2, 14000, '2024-02-02'),
(33,3, 13000, '2024-02-05'),
(34,4, 15000, '2024-02-07'),
(35,5, 14000, '2024-02-08'),
(36,6, 13000, '2024-02-10'),
(37,7, 15000, '2024-02-11'),
(38,8, 14000, '2024-02-12'),
(39,9, 13000, '2024-02-13'),
(40,10, 15000, '2024-02-14');

select * from Students;
select * from Teacher;
select * from Courses;
select * from Enrollments;
select * from Payments;

CREATE DATABASE SISDB; 

CREATE TABLE Students (
    student_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(10)
);
CREATE TABLE Teacher (
    teacher_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);
CREATE TABLE Courses (
    course_id INT PRIMARY KEY IDENTITY(1,1),
    course_name VARCHAR(100),
    credits INT,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teacher(teacher_id)
);
CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    student_id INT,
    amount DECIMAL(10, 2),
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);


INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES
('Ishaan', 'Gupta', '2000-08-15', 'amit.sharma@example.com', '9876543210'),
('Priya', 'Kapoor', '1996-02-20', 'priya.kapoor@example.com', '9123456789'),
('Ravi', 'Mehta', '1997-12-10', 'ravi.mehta@example.com', '9000000001'),
('Sunita', 'Singh', '1995-05-05', 'sunita.singh@example.com', '8989898989'),
('Rajesh', 'Patel', '1998-09-12', 'rajesh.patel@example.com', '7777777777'),
('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890'),
('Sonal', 'Gupta', '1997-07-15', 'sonal.gupta@example.com', '9999999999'),
('Rohan', 'Joshi', '1996-03-01', 'rohan.joshi@example.com', '9090909090'),
('Manish', 'Rao', '1996-11-10', 'manish.rao@example.com', '8989891234'),
('Anita', 'Nair', '1997-04-20', 'anita.nair@example.com', '8080808080');

INSERT INTO Teacher (first_name, last_name, email)
VALUES
('Varsha', 'Patil', 'varsha.patil@example.com'),
('Seema', 'Joshi', 'seema.joshi@example.com'),
('Vikas', 'Dubey', 'vikas.patil@example.com'),
('Anjali', 'Nair', 'anjali.nair@example.com'),
('Karan', 'Shah', 'karan.shah@example.com'),
('Megha', 'Ghosh', 'megha.ghosh@example.com'),
('Suresh', 'Yadav', 'suresh.yadav@example.com'),
('Vijay', 'Thakur', 'vijay.thakur@example.com'),
('Preeti', 'Reddy', 'preeti.reddy@example.com'),
('Nisha', 'Chauhan', 'nisha.chauhan@example.com');

INSERT INTO Courses (course_name, credits, teacher_id)
VALUES
('Mathematics', 3, 1),
('Physics', 4, 2),
('Chemistry', 3, 3),
('English', 2, 1),
('History', 2, 2),
('Biology', 3, 4),
('Economics', 3, 5),
('Computer Science', 4, 6),
('Statistics', 3, 7),
('Political Science', 3, 8);

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2023-01-10'),
(2, 2, '2023-01-11'),
(3, 3, '2023-01-12'),
(4, 4, '2023-01-13'),
(5, 5, '2023-01-14'),
(6, 6, '2023-01-15'),
(7, 7, '2023-01-16'),
(8, 8, '2023-01-17'),
(9, 9, '2023-01-18'),
(10, 10, '2023-01-19');

INSERT INTO Payments (student_id, amount, payment_date)
VALUES
(1, 1000.00, '2023-02-01'),
(2, 1500.00, '2023-02-02'),
(3, 2000.00, '2023-02-03'),
(4, 2500.00, '2023-02-04'),
(5, 1200.00, '2023-02-05'),
(6, 2200.00, '2023-02-06'),
(7, 1100.00, '2023-02-07'),
(8, 1300.00, '2023-02-08'),
(9, 1400.00, '2023-02-09'),
(10, 1600.00, '2023-02-10');

select * from Students;
select * from Courses;
select * from Teacher;
select * from Enrollments;
select * from Payments;
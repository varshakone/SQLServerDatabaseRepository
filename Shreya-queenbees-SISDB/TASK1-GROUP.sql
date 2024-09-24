USE SISDB;
INSERT INTO Teacher (first_name, last_name, email)
VALUES 
('Michael', 'Scott', 'michael.scott@school.com'),
('Dwight', 'Schrute', 'dwight.schrute@school.com'),
('Jim', 'Halpert', 'jim.halpert@school.com'),
('Pam', 'Beesly', 'pam.beesly@school.com'),
('Angela', 'Martin', 'angela.martin@school.com'),
('Stanley', 'Hudson', 'stanley.hudson@school.com'),
('Kevin', 'Malone', 'kevin.malone@school.com'),
('Ryan', 'Howard', 'ryan.howard@school.com'),
('Kelly', 'Kapoor', 'kelly.kapoor@school.com'),
('Oscar', 'Martinez', 'oscar.martinez@school.com');

INSERT INTO Courses (course_name, credits, teacher_id)
VALUES 
('Database Systems', 4, 1),  -- Michael Scott
('Data Structures', 3, 2),   -- Dwight Schrute
('Operating Systems', 4, 3), -- Jim Halpert
('Networks', 3, 4),          -- Pam Beesly
('Artificial Intelligence', 4, 5), -- Angela Martin
('Machine Learning', 3, 6),        -- Stanley Hudson
('Software Engineering', 3, 7),    -- Kevin Malone
('Cloud Computing', 4, 8),         -- Ryan Howard
('Web Development', 3, 9),         -- Kelly Kapoor
('Cybersecurity', 4, 10);          -- Oscar Martinez

INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES 
('John', 'Doe', '1998-04-12', 'john.doe@example.com', '1234567890'),
('Jane', 'Smith', '2000-06-18', 'jane.smith@example.com', '0987654321'),
('Alice', 'Johnson', '1999-12-25', 'alice.johnson@example.com', '5554443333'),
('Bob', 'Brown', '2001-03-30', 'bob.brown@example.com', '7778889999'),
('Charlie', 'Davis', '1997-10-05', 'charlie.davis@example.com', '6665554444'),
('David', 'Evans', '1996-07-14', 'david.evans@example.com', '1122334455'),
('Emma', 'Wilson', '1999-11-23', 'emma.wilson@example.com', '2233445566'),
('Frank', 'Thomas', '1998-08-17', 'frank.thomas@example.com', '3344556677'),
('Grace', 'Lee', '2000-05-06', 'grace.lee@example.com', '4455667788'),
('Henry', 'Miller', '1998-03-09', 'henry.miller@example.com', '5566778899');

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES 
(1, 1, '2024-01-15'),  -- John Doe, Database Systems
(2, 2, '2024-01-16'),  -- Jane Smith, Data Structures
(3, 3, '2024-01-17'),  -- Alice Johnson, Operating Systems
(4, 4, '2024-01-18'),  -- Bob Brown, Networks
(5, 5, '2024-01-19'),  -- Charlie Davis, Artificial Intelligence
(6, 6, '2024-01-20'),  -- David Evans, Machine Learning
(7, 7, '2024-01-21'),  -- Emma Wilson, Software Engineering
(8, 8, '2024-01-22'),  -- Frank Thomas, Cloud Computing
(9, 9, '2024-01-23'),  -- Grace Lee, Web Development
(10, 10, '2024-01-24');-- Henry Miller, Cybersecurity

INSERT INTO Payments (student_id, amount, payment_date)
VALUES 
(1, 500.00, '2024-02-01'),  -- John Doe
(2, 750.00, '2024-02-02'),  -- Jane Smith
(3, 500.00, '2024-02-03'),  -- Alice Johnson
(4, 750.00, '2024-02-04'),  -- Bob Brown
(5, 1000.00, '2024-02-05'), -- Charlie Davis
(6, 650.00, '2024-02-06'),  -- David Evans
(7, 800.00, '2024-02-07'),  -- Emma Wilson
(8, 900.00, '2024-02-08'),  -- Frank Thomas
(9, 1100.00, '2024-02-09'), -- Grace Lee
(10, 1200.00, '2024-02-10');-- Henry Miller

create Database Practice;
use Practice;


CREATE TABLE Students
(
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15)
);






CREATE TABLE Courses
(
    course_id INT PRIMARY KEY,
    course_name VARCHAR(40),
    credits INT,
    teacher_id INT,
    CONSTRAINT FK_TeacherRecord
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);


CREATE TABLE Teachers
(
    teacher_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50)
);

CREATE TABLE Enrollments
(
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Payments
(
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount INT,
    payment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id)
);

INSERT INTO Students
    (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES
    ('001', 'John', 'Doe', '2000-01-15', 'john.doe@example.com', '123-456-7890'),
    ('002', 'Jane', 'Smith', '1999-05-22', 'jane.smith@example.com', '123-456-7891'),
    ('003', 'Alice', 'Johnson', '2001-03-30', 'alice.johnson@example.com', '123-456-7892'),
    ('004', 'Bob', 'Williams', '2002-07-25', 'bob.williams@example.com', '123-456-7893'),
    ('005', 'Charlie', 'Brown', '2000-12-11', 'charlie.brown@example.com', '123-456-7894'),
    ('006', 'David', 'Davis', '1999-09-17', 'david.davis@example.com', '123-456-7895'),
    ('007', 'Eva', 'Martinez', '2001-11-20', 'eva.martinez@example.com', '123-456-7896'),
    ('008', 'Frank', 'Garcia', '2002-04-08', 'frank.garcia@example.com', '123-456-7897'),
    ('009', 'Grace', 'Miller', '2000-08-12', 'grace.miller@example.com', '123-456-7898'),
    ('010', 'Henry', 'Wilson', '1999-10-30', 'henry.wilson@example.com', '123-456-7899');



INSERT INTO Teachers
    (teacher_id, first_name, last_name, email)
VALUES
    (1, 'Emily', 'Taylor', 'emily.taylor@example.com'),
    (2, 'Michael', 'Anderson', 'michael.anderson@example.com'),
    (3, 'Sarah', 'Thomas', 'sarah.thomas@example.com'),
    (4, 'James', 'Jackson', 'james.jackson@example.com'),
    (5, 'Linda', 'White', 'linda.white@example.com'),
    (6, 'Robert', 'Harris', 'robert.harris@example.com'),
    (7, 'Maria', 'Clark', 'maria.clark@example.com'),
    (8, 'William', 'Lewis', 'william.lewis@example.com'),
    (9, 'Olivia', 'Walker', 'olivia.walker@example.com'),
    (10, 'David', 'Young', 'david.young@example.com');


INSERT INTO Courses
    (course_id, course_name, credits, teacher_id)
VALUES
    (101, 'Introduction to Programming', 3, 1),
    (102, 'Data Structures', 4, 2),
    (103, 'Database Systems', 3, 3),
    (104, 'Web Development', 4, 4),
    (105, 'Operating Systems', 3, 5),
    (106, 'Algorithms', 4, 6),
    (107, 'Computer Networks', 3, 7),
    (108, 'Software Engineering', 4, 8),
    (109, 'Artificial Intelligence', 3, 9),
    (110, 'Machine Learning', 4, 10);


INSERT INTO Enrollments
    (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, '001', 101, '2024-09-01'),
    (2, '002', 102, '2024-09-01'),
    (3, '003', 103, '2024-09-02'),
    (4, '004', 104, '2024-09-02'),
    (5, '005', 105, '2024-09-03'),
    (6, '006', 106, '2024-09-03'),
    (7, '007', 107, '2024-09-04'),
    (8, '008', 108, '2024-09-04'),
    (9, '009', 109, '2024-09-05'),
    (10, '010', 110, '2024-09-05');


INSERT INTO Payments
    (payment_id, student_id, amount, payment_date)
VALUES
    (1, '001', 500, '2024-09-01'),
    (2, '002', 600, '2024-09-02'),
    (3, '003', 550, '2024-09-03'),
    (4, '004', 700, '2024-09-04'),
    (5, '005', 650, '2024-09-05'),
    (6, '006', 600, '2024-09-06'),
    (7, '007', 500, '2024-09-07'),
    (8, '008', 550, '2024-09-08'),
    (9, '009', 650, '2024-09-09'),
    (10, '010', 700, '2024-09-10');



INSERT INTO Students
VALUES
    ('011' , 'Akash', 'Baghel', '1995-08-15', 'akash@gmail.com', 1234567890);

INSERT INTO Enrollments
    (enrollment_id , student_id , course_id , enrollment_date)
VALUES
    (11 , '011', 105, GETDATE() );

Select *
FROM Enrollments;
GO

UPDATE Teachers
SET email ='babu@gmail.com'
where teacher_id = 10;
GO

SELECT *
FROM Teachers
GO

DELETE  FROM Enrollments
where student_id = '001' AND course_id =101;
GO

UPDATE Courses
SET teacher_id = 8
where course_name ='Algorithms';
GO


-- Delete a specific student from the "Students" table and remove all their enrollment records 
-- from the "Enrollments" table. Be sure to maintain referential integrity. 

CREATE PROCEDURE deleteStudent
    @stuId int
AS
BEGIN

    DELETE FROM Enrollments
  WHERE student_id  = @stuId

    DELETE FROM Payments
  WHERE student_id  = @stuId

    DELETE FROM Students
  WHERE student_id  = @stuId
END

EXEC deleteStudent @stuId = '001';
GO

-- Update the payment amount for a specific payment record in the "Payments" table. Choose any 
-- payment record and modify the payment amount. 

UPDATE Payments
 SET amount = 1200
 WHERE student_id = '010';

-- Write an SQL query to calculate the total payments made by a specific student. You will need to 
-- join the "Payments" table with the "Students" table based on the student's ID.

SELECT Students.first_name, SUM(Payments.amount) AS [Total Amount]
FROM Students
    JOIN Payments
    ON Students.student_id = Payments.student_id
WHERE Students.student_id = '010';

-- Write an SQL query to retrieve a list of courses along with the count of students enrolled in each 
-- course. Use a JOIN operation between the "Courses" table and the "Enrollments" table

SELECT Courses.course_name , COUNT( Enrollments.enrollment_id)
FROM Courses
    JOIN Enrollments
    ON  Courses.course_id = Enrollments.course_id
GROUP BY Courses.course_name;


-- Write an SQL query to find the names of students who have not enrolled in any course. Use a 
-- LEFT JOIN between the "Students" table and the "Enrollments" table to identify students 
-- without enrollments

SELECT Students.student_id , Students.first_name
FROM Students
    LEFT JOIN Enrollments
    on Students.student_id = Enrollments.student_id
WHERE  Enrollments.student_id IS Null





-- Write an SQL query to retrieve the first name, last name of students, and the names of the 
-- courses they are enrolled in. Use JOIN operations between the "Students" table and the 
-- "Enrollments" and "Courses" tables. 

SELECT CONCAT(Students.first_name ,' ', Students.last_name ) as StudentName, Courses.course_name as CourseEnrolled
FROM Students
    JOIN Enrollments
    ON Enrollments.student_id = Students.student_id
    JOIN Courses
    ON Courses.course_id = Enrollments.course_id;

-- Write an SQL query to calculate the total payments made by a specific student. You will need to 
-- join the "Payments" table with the "Students" table based on the student's ID

SELECT Students.first_name, SUM(Payments.amount) as [Total]
FROM Students
    JOIN Payments
    ON Students.student_id = Payments.student_id
WHERE Students.student_id =1
GROUP BY Students.first_name
;


-- Create a query to list the names of teachers and the courses they are assigned to. Join the 
-- "Teacher" table with the "Courses" table.

SELECT CONCAT(Teachers.first_name,' ',Teachers.last_name) as [Teachers Name] , Courses.course_name
FROM Teachers
    JOIN Courses
    ON Teachers.teacher_id = Courses.teacher_id

-- Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the 
-- "Students" table with the "Enrollments" and "Courses" tables.

SELECT CONCAT(Students.first_name,' ', Students.last_name) AS [Student name], Courses.course_name, Enrollments.enrollment_date as [Enrollement Date]
FROM Students
    JOIN Enrollments
    ON Students.student_id = Enrollments.student_id
    JOIN Courses
    ON Enrollments.course_id = Courses.course_id
WHERE Courses.course_name ='Algorithms'

-- Find the names of students who have not made any payments. Use a LEFT JOIN between the 
-- "Students" table and the "Payments" table and filter for students with NULL payment records.

SELECT Students.first_name
FROM Students
    LEFT JOIN Payments
    ON Students.student_id = Payments.student_id
WHERE Payments.student_id is NULL

-- Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN 
-- between the "Courses" table and the "Enrollments" table and filter for courses with NULL 
-- enrollment record

SELECT Courses.course_name
FROM Courses
    LEFT JOIN Enrollments
    ON Courses.course_id = Enrollments.course_id
where Enrollments.course_id is null;


-- Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" 
-- table to find students with multiple enrollment records

SELECT e1.student_id, CONCAT(s.first_name, ' ', s.last_name) AS student_name
FROM Enrollments e1
    JOIN Students s ON e1.student_id = s.student_id
    JOIN Enrollments e2 ON e1.student_id = e2.student_id
WHERE e1.course_id <> e2.course_id
GROUP BY e1.student_id, s.first_name, s.last_name
HAVING COUNT(DISTINCT e1.course_id) > 1;


--  Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" 
-- table and the "Courses" table and filter for teachers with NULL course assignments. 

SELECT Teachers.first_name
FROM Teachers
    LEFT JOIN Courses
    ON Teachers.teacher_id = Courses.teacher_id
where Courses.teacher_id IS NULL


--- TASK 3

-- Write an SQL query to calculate the average number of students enrolled in each course. Use 
-- aggregate functions and subqueries to achieve this.

SELECT AVG(studentCount) AS [Avg Counts]
FROM (
    select Courses.course_id , count(Courses.course_id) as studentCount
    from Courses
    GROUP BY Courses.course_id
) AS studentCount


-- Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
-- payment amount and then retrieve the student(s) associated with that amount.

-- Identify the student(s) who made the highest payment
SELECT Students.first_name
FROM Students
    JOIN Payments ON Students.student_id = Payments.student_id
WHERE Payments.amount = (
    SELECT MAX(amount)
FROM Payments
);








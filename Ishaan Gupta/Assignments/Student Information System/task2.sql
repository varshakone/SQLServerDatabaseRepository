INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 3, '2023-03-01'); 

UPDATE Teacher
SET email = 'ramesh.newemail@example.com'
WHERE teacher_id = 2; 

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 3;

UPDATE Courses
SET teacher_id = 2
WHERE course_id = 3; 


DELETE FROM Payments
WHERE student_id = 2;
DELETE FROM Enrollments
WHERE student_id = 2;
DELETE FROM Students
WHERE student_id = 2;


UPDATE Payments
SET amount = 1800.00
WHERE payment_id = 3;  


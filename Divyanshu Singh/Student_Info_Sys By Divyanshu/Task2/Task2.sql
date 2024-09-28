
USE SISDB;

-- Insert a new student:
INSERT INTO Students (student_id, first_name, last_name, date_of_birth, email, phone_number)
VALUES (11, 'John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');

-- Enroll a student in a course:
INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES (111, 1, 1, '2024-09-01');

-- Update a teacher's email:
UPDATE Teacher
SET email = 'newemail@example.com'
WHERE teacher_id = 11;

-- Delete an enrollment record:
DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 1;

-- Assign a teacher to a course:
UPDATE Courses
SET teacher_id = 12
WHERE course_id = 1;

-- Delete a student and maintain referential integrity:
DELETE FROM Enrollments WHERE student_id = 1;
DELETE FROM Payments WHERE student_id = 1;
DELETE FROM Students WHERE student_id = 1;

-- Update payment amount:
UPDATE Payments
SET amount = 1500.00
WHERE payment_id = 101;









USE SISDB;
INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('shreya', 'sharma', '1999-08-17', 'shreya.shar@example.com', '8529637410');

INSERT INTO Enrollments (student_id, course_id, enrollment_date)
VALUES (1, 2, '2024-09-20');

UPDATE Teacher
SET email = 'new.email@school.com'
WHERE teacher_id = 3;

DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 2;

UPDATE Courses
SET teacher_id = 5
WHERE course_id = 3;

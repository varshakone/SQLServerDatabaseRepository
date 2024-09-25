--Task 2

Q--1 

INSERT INTO Students VALUES(
11,'John','Doe','1995-08-15','john.doe@example.com',1234567890);
SELECT * FROM Students;

Q--2
INSERT INTO Enrollments VALUES(
101,2,111,'2024-01-12');
SELECT * FROM Enrollments;

Q--3
UPDATE Teacher
SET email ='kapoorraj@gmail.com' WHERE teacher_id = 11;


Q--4
DELETE FROM Enrollments
WHERE student_id = 1 AND course_id = 111;
SELECT * FROM Enrollments;

Q--5
UPDATE Courses
SET teacher_id = 11 
WHERE course_id = 999;
SELECT * FROM Courses;

Q--6
DELETE FROM Students
WHERE student_id = 8;
SELECT * FROM Students;

Q--7
UPDATE Payments
SET amount = 16000
WHERE payment_id = 32;
SELECT * FROM Payments;
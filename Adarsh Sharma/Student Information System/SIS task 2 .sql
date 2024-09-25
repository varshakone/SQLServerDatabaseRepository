--------TASK 2--------------

1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890
1....INSERT INTO Students (first_name, last_name, date_of_birth, email, phone_number)
VALUES ('John', 'Doe', '1995-08-15', 'john.doe@example.com', '1234567890');
SELECT* FROM Students
WHERE student_id = 11 


2. Write an SQL query to enroll a student in a course. Choose an existing student and course and 
insert a record into the "Enrollments" table with the enrollment date.
2...INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date)
VALUES (11,3, 5, '2024-09-24');
SELECT * FROM Enrollments WHERE enrollment_id =11

3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and 
modify their email address.
3...UPDATE Teacher 
SET email = 'smriti@gmail.com'
WHERE teacher_id = 4;
SELECT * FROM Teacher WHERE teacher_id =4 

4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select 
an enrollment record based on the student and course
4...DELETE FROM Enrollments 
WHERE student_id = 9 and course_id =9
SELECT * FROM Enrollments

5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and 
teacher from the respective tables.
5....UPDATE Courses
SET teacher_id = 2
WHERE course_id = 3;
SELECT * FROM Courses


6. Delete a specific student from the "Students" table and remove all their enrollment records 
from the "Enrollments" table. Be sure to maintain referential integrity.
6...DELETE FROM Students
WHERE student_id = 5;
DELETE FROM Enrollments
WHERE student_id = 5;

7. Update the payment amount for a specific payment record in the "Payments" table. Choose any 
payment record and modify the payment amount
7...UPDATE Payments
SET amount = 500.00
WHERE payment_id = 3;
SELECT * FROM Payments
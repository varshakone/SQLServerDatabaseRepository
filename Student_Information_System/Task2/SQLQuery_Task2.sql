-- 1. Write an SQL query to insert a new student into the "Students" table with the following details:
--	a. First Name: John
--	b. Last Name: Doe
--	c. Date of Birth: 1995-08-15
--	d. Email: john.doe@example.com
--	e. Phone Number: 1234567890

Insert into Students Values('John','Doe','1995-08-15','john.doe@example.com',1234567890)
Select * From Students

--2. Write an SQL query to enroll a student in a course. Choose an existing student and course and insert a record into the "Enrollments" table with the enrollment date.

Insert into Enrollments Values ('2024-08-15',11,4)
Select * From Enrollments

-- 3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and modify their email address.
Update Teacher SET email = 'Khushi546@yahoo.com' Where teacher_id = 7
Select * From Teacher

--4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select an enrollment record based on the student and course.

Select * From Students
Select * From Courses
Select * From Enrollments

Delete From Enrollments Where enrollment_id = 2
Select * From Enrollments

-- 5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and teacher from the respective tables.

Select * From Courses
Update Courses SET teacher_id = 3 Where course_id = 9

Select * From Courses

-- 6. Delete a specific student from the "Students" table and remove all their enrollment records from the "Enrollments" table. Be sure to maintain referential integrity.

Select * From Students
Select * From Enrollments
Select * From Payments

Delete From Enrollments Where enrollment_id = 8
Delete From Payments Where payment_id = 4
Delete From Students Where student_id = 4

-- 7. Update the payment amount for a specific payment

Select * From Payments

Update Payments SET amount = 1999.00 Where payment_id = 7

-- question 1
Insert into Students Values('John','Doe','1995-08-15','john.doe@example.com',1234567890)
Select * From Students

-- question 2
Insert into Enrollments Values ('2024-08-15',11,4)
Select * From Enrollments

-- question 3
Update Teacher SET email = 'Khushi546@yahoo.com' Where teacher_id = 7
Select * From Teacher

-- question 4
Select * From Students
Select * From Courses
Select * From Enrollments

Delete From Enrollments Where enrollment_id = 2

-- question 5

Select * From Courses

Update Courses SET teacher_id = 3 Where course_id = 9

-- question 6
Select * From Students
Select * From Enrollments
Select * From Payments

Delete From Enrollments Where enrollment_id = 8
Delete From Payments Where payment_id = 4
Delete From Students Where student_id = 4

-- question 7

Select * From Payments

Update Payments SET amount = 1999.00 Where payment_id = 7

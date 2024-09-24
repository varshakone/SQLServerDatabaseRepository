use SISDB

select * from Students
insert into Students (first_name, last_name, date_of_birth, email, Phone_number) values
('John','Doe','1995-08-15','john.doe@example.com','1234567890')

select * from Students    --question 1 

select * from enrollments
insert into enrollments (student_id, course_id, enrollment_date) values (1,5,'2024-12-05') --question 2

select * from enrollments

select * from Teacher
update Teacher set email = 'smithcommander@eg.com' where teacher_id = 1

select * from Teacher  --question 3  

select * from enrollments

delete from enrollments where student_id = 1 and course_id = 5

select * from enrollments  --question 4 


select * from Courses

update Courses set teacher_id = 1 where course_name = 'Physics'

select * from courses   --question 5 


select * from Students
select * from enrollments

delete from enrollments where student_id = 5
delete from students where student_id = 5

select * from students
select * from enrollments       --question 6 (i cant able to do this query error coming)  

select * from payments

update payments set amount = 6999 where payment_date = '2024-09-11'

select * from payments  --question 7  
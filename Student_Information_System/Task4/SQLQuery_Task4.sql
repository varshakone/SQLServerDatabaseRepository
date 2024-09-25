-- 1. Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.

Select * From Courses
Select * From Enrollments

--Update some values in Enrollments Table
Update Enrollments Set Course_id = 2 Where enrollment_id = 11

Select avg(student_count) as average_students_per_course
From (Select c.course_name, count(e.student_id) as student_count
From Courses c Join Enrollments e on c.course_id = e.course_id
Group By c.course_name) as course_enrollments


-- 2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.

Select * From Students
Select * From Payments

Select s.student_id,p.amount,s.first_name,s.last_name
From Students s Join Payments p on s.student_id = p.student_id
Where p.amount = (select Max(amount) From Payments)

-- 3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count.

Select * From Courses
Select * From Enrollments

Select Max(No_of_Enrollments) as Highest_No_Of_Enrollments ,cn
From( Select c.course_name as cn , Count(c.course_id) as No_of_Enrollments
From Courses c Join Enrollments e on c.course_id = e.course_id
Group By c.course_id,c.course_name) as course_enrollments 
Group By cn

-- 4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
Select * From Courses
Select * From Teacher
Select * From Payments
Select * From Enrollments

Select t.teacher_id, t.first_name, t.last_name, 
       (Select Sum(p.amount)
        From Payments p 
        JOIN Enrollments e on p.student_id = e.student_id
        JOIN Courses c on e.course_id = c.course_id
		Where c.teacher_id = t.teacher_id) as total_payment
FROM Teacher t;

--5. Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.

Select s.first_name, s. last_name
From Students s
Where (Select COUNT(e.course_id) 
From Enrollments e 
Where e.student_id = s.student_id) = (Select Count(c.course_id)
 From Courses c)

-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.

Select t.first_name,t.last_name 
From Teacher t
Where t.teacher_id Not In (Select teacher_id From Courses)

-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.

Select avg(age) as average_age_of_students
FROM (Select FLOOR(DATEDIFF(Year, date_of_birth, GETDATE())) as age
From Students) as studens_age;

-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.

Select c.course_name 
From Courses c Where c.course_id Not In (Select course_id From Enrollments)

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.

Select s.student_id, s.first_name, s.last_name, c.course_id, c.course_name, 

(Select SUM(p.amount)From Payments p
Join Enrollments e on p.student_id = e.student_id
Where e.course_id = c.course_id AND p.student_id = s.student_id) as total_payments

From Students s
Join Enrollments e on s.student_id = e.student_id
Join Courses c on e.course_id = c.course_id
Order By s.student_id, c.course_id;


-- 10. Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.
Select * From Students
Select * From Payments
-- Update payment table
Update Payments Set student_id = 5 Where payment_id = 7

Select student_id, first_name, last_name
From Students
Where student_id IN (Select student_id From Payments
GROUP BY student_id
HAVING COUNT(payment_id) > 1)

-- 11. Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.

Select s.student_id, s.first_name, s.last_name, SUM(p.amount) As total_payments,
Count(p.student_id) As Number_of_Payments
From Students s
Join Payments p on s.student_id = p.student_id
Group BY s.student_id, s.first_name, s.last_name;

-- 12. Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

Select c.course_name, Count(e.student_id) As students_count
From Courses c Join Enrollments e on c.course_id = e.course_id
Group By c.course_name

-- 13. Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average

Select s.student_id, s.first_name, s.last_name, Avg(p.amount) As average_payments
From Students s
Join Payments p on s.student_id = p.student_id
Group BY s.student_id, s.first_name, s.last_name;
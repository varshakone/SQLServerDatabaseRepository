-- 1. Write an SQL query to calculate the total payments made by a specific student. You will need to join the "Payments" table with the "Students" table based on the student's ID.
Select * From Students
Select * From Payments

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS Total_Payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

-- 2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.
Select * From Enrollments
Select * From Courses

Select e.student_id,c.course_name, Count(c.course_id) [Student_Count] 
From Courses c Join Enrollments e on c.course_id = e.course_id
Group By e.student_id,c.course_name
Order By c.course_name

-- 3. Write an SQL query to find the names of students who have not enrolled in any course. Use a LEFT JOIN between the "Students" table and the "Enrollments" table to identify students without enrollments.
Select s.student_id,s.first_name,s.last_name 
From Students s Left Join Enrollments e on s.student_id = e.student_id
Where e.course_id IS NULL

-- 4. Write an SQL query to retrieve the first name, last name of students, and the names of the courses they are enrolled in. Use JOIN operations between the "Students" table and the "Enrollments" and "Courses" tables.

Select s.first_name, s.last_name, c.course_name
From Students s Join Enrollments e on s.student_id = e.student_id
Join Courses c on e.course_id = c.course_id
Order By s.first_name;

-- 5. Create a query to list the names of teachers and the courses they are assigned to. Join the "Teacher" table with the "Courses" table.
Select t.first_name,t.last_name,c.course_name
From Teacher t Join Courses c on t.teacher_id = c.teacher_id
Order By t.first_name

-- 6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the "Students" table with the "Enrollments" and "Courses" tables.
Select s.first_name, s.last_name, e.enrollment_date, c.course_name
From Students s Join Enrollments e on s.student_id = e.student_id
Join Courses c on e.course_id = c.course_id
Order By s.first_name;

-- 7. Find the names of students who have not made any payments. Use a LEFT JOIN between the "Students" table and the "Payments" table and filter for students with NULL payment records.
Select s.first_name,s.last_name 
From Students s Left Join Payments p on s.student_id = p.student_id
Where p.payment_id IS NULL

-- 8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN between the "Courses" table and the "Enrollments" table and filter for courses with NULL enrollment records.
Select c.course_name
From Courses c Left Join Enrollments e on c.course_id = e.course_id
Where e.enrollment_date IS NULL

-- 9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments" table to find students with multiple enrollment records.
Select s.first_name,s.last_name, Count(e.course_id) 
From Students s Left Join Enrollments e on s.student_id = e.student_id
Group By s.first_name,s.last_name
Having Count(e.course_id)>1

-- 10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher" table and the "Courses" table and filter for teachers with NULL course assignments.

Select t.first_name, t.last_name
From Teacher t Left Join Courses c on t.teacher_id = c.teacher_id
Where c.course_id Is Null

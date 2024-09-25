-- question 1

Select * From Students
Select * From Payments

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS Total_Payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

-- question 2

Select * From Enrollments
Select * From Courses

Select e.student_id,c.course_name, Count(c.course_id) [Student_Count] 
From Courses c Join Enrollments e on c.course_id = e.course_id
Group By e.student_id,c.course_name
Order By Student_Count DESC

-- question 3

Select s.student_id,s.first_name,s.last_name 
From Students s Left Join Enrollments e on s.student_id = e.student_id
Where e.course_id IS NULL

-- question 4


-- question 5
-- question 6
-- question 7
-- question 8
-- question 9
-- question 10
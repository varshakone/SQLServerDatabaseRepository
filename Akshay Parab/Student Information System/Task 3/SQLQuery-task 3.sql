--Task 3

Q--1

SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = '3'
GROUP BY s.student_id, s.first_name, s.last_name;

Q--2
SELECT c.course_id,c.course_name, COUNT(e.student_id) AS student_count FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id,c.course_name;

Q--3
select s.student_id,s.first_name,s.last_name
from Students s
join Enrollments e on s.student_id = e.student_id
where e.course_id is null;

Q--4
select s.first_name,s.last_name,c.course_name from Students s
join Enrollments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id;

Q--5
select t.first_name,t.last_name ,c.course_name
from Teacher t
join Courses c on t.teacher_id = c.teacher_id; 

Q--6
select s.first_name ,s.last_name ,e.enrollment_date,c.course_name
from Students s
join Enrollments e on s.student_id = e.student_id
join Courses c on e.course_id = c.course_id
where c.course_id = 111;

Q--7
SELECT s.student_id, s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

Q--8
SELECT c.course_id, c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.student_id IS NULL;

Q--9 
SELECT e1.student_id, s.first_name, s.last_name, COUNT(e1.course_id) AS course_count
FROM Enrollments e1
JOIN Students s ON e1.student_id = s.student_id
GROUP BY e1.student_id, s.first_name, s.last_name
HAVING COUNT(e1.course_id) > 1;


Q--10
SELECT t.teacher_id, t.first_name,t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;

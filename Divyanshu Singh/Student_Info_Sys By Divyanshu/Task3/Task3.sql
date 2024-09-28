
USE SISDB;

-- Total Payments Made by a Specific Student:
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE s.student_id = 3
GROUP BY s.first_name, s.last_name;

-- Count of Students Enrolled in Each Course:
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY student_count DESC;

-- Students Not Enrolled in Any Course:
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id IS NULL;

-- Students and the Courses They Are Enrolled In:
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
ORDER BY s.last_name, s.first_name;

-- Teachers and the Courses They Are Assigned To:
SELECT t.first_name, t.last_name, c.course_name
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id
ORDER BY t.last_name, t.first_name;

-- Students and Their Enrollment Dates for a Specific Course:
SELECT s.first_name, s.last_name, e.enrollment_date
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Mathematics' 
ORDER BY e.enrollment_date;

-- Students Who Have Not Made Any Payments:
SELECT s.first_name, s.last_name
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
WHERE p.payment_id IS NULL;

-- Courses with No Enrollments:
SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.enrollment_id IS NULL;

-- Identify Students Enrolled in More Than One Course:
SELECT s.first_name, s.last_name, COUNT(e.course_id) AS courses_enrolled
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1;

-- Find Teachers Not Assigned to Any Courses:
SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;




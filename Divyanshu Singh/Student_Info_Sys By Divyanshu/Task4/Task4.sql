
USE SISDB;

-- Average Number of Students Enrolled in Each Course:
SELECT AVG(enrollment_count) AS avg_enrollment
FROM (
    SELECT COUNT(e.student_id) AS enrollment_count
    FROM Enrollments e
    GROUP BY e.course_id
) AS subquery;

-- Identify the Student(s) Who Made the Highest Payment:
SELECT s.first_name, s.last_name, p.amount
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);

-- Courses with the Highest Number of Enrollments:
SELECT c.course_name, enrollment_count
FROM Courses c
JOIN (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS subquery ON c.course_id = subquery.course_id
WHERE subquery.enrollment_count = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT COUNT(student_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery2
);

-- Total Payments Made to Courses Taught by Each Teacher:
SELECT t.first_name, t.last_name, (
    SELECT SUM(p.amount)
    FROM Payments p
    JOIN Enrollments e ON p.student_id = e.student_id
    WHERE e.course_id IN (
        SELECT c.course_id FROM Courses c WHERE c.teacher_id = t.teacher_id
    )
) AS total_payments
FROM Teacher t;

-- Students Enrolled in All Available Courses:
SELECT s.first_name, s.last_name
FROM Students s
WHERE NOT EXISTS (
    SELECT c.course_id
    FROM Courses c
    WHERE NOT EXISTS (
        SELECT e.course_id
        FROM Enrollments e
        WHERE e.student_id = s.student_id AND e.course_id = c.course_id
    )
);

-- Teachers Not Assigned to Any Courses:
SELECT t.first_name, t.last_name
FROM Teacher t
WHERE t.teacher_id NOT IN (
    SELECT c.teacher_id FROM Courses c
);

-- Average Age of All Students:
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age
FROM Students;

-- Courses with No Enrollments:
SELECT c.course_name
FROM Courses c
WHERE c.course_id NOT IN (
    SELECT e.course_id FROM Enrollments e
);

-- Total Payments Made by Each Student for Each Course:
SELECT s.first_name, s.last_name, c.course_name, (
    SELECT SUM(p.amount)
    FROM Payments p
    WHERE p.student_id = e.student_id
) AS total_payments
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- Students Who Have Made More Than One Payment:
SELECT s.first_name, s.last_name
FROM Students s
WHERE (SELECT COUNT(*) FROM Payments p WHERE p.student_id = s.student_id) > 1;

-- Total Payments Made by Each Student:
SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;

-- Course Names and Count of Students Enrolled:
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Average Payment Amount Made by Students:
SELECT AVG(p.amount) AS avg_payment
FROM Payments p;





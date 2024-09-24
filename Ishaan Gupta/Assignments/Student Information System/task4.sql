SELECT AVG(student_count) AS avg_enrollments
FROM (
    SELECT COUNT(e.enrollment_id) AS student_count
    FROM Courses c
    LEFT JOIN Enrollments e ON c.course_id = e.course_id
    GROUP BY c.course_id
) AS subquery;

SELECT s.first_name, s.last_name
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);


SELECT c.course_name
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
HAVING COUNT(e.enrollment_id) = (
    SELECT MAX(enrollment_count)
    FROM (
        SELECT COUNT(enrollment_id) AS enrollment_count
        FROM Enrollments
        GROUP BY course_id
    ) AS subquery
);



SELECT t.first_name, t.last_name, SUM(p.amount) AS total_payments
FROM Teacher t
JOIN Courses c ON t.teacher_id = c.teacher_id
JOIN Enrollments e ON c.course_id = e.course_id
JOIN Payments p ON e.student_id = p.student_id
GROUP BY t.first_name, t.last_name;


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

SELECT t.first_name, t.last_name
FROM Teacher t
WHERE NOT EXISTS (
    SELECT c.course_id
    FROM Courses c
    WHERE c.teacher_id = t.teacher_id
); 

SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS avg_age
FROM Students;


SELECT c.course_name
FROM Courses c
WHERE NOT EXISTS (
    SELECT e.course_id
    FROM Enrollments e
    WHERE e.course_id = c.course_id
);


SELECT s.first_name, s.last_name, c.course_name, SUM(p.amount) AS total_payment
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name, c.course_name;


SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS payment_count
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(p.payment_id) > 1;


SELECT s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;


SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name;


SELECT s.first_name, s.last_name, AVG(p.amount) AS average_payment
FROM Students s
JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.first_name, s.last_name;

USE SISDB;
SELECT S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
WHERE S.student_id = 1
GROUP BY S.first_name, S.last_name;

SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name
ORDER BY student_count DESC;

SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Enrollments E ON S.student_id = E.student_id
WHERE E.student_id IS NULL;

SELECT S.first_name, S.last_name, C.course_name
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
ORDER BY S.last_name, S.first_name;

SELECT T.first_name, T.last_name, C.course_name
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id
ORDER BY T.last_name, T.first_name;

SELECT T.first_name, T.last_name, C.course_name
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id
ORDER BY T.last_name, T.first_name;

SELECT S.first_name, S.last_name
FROM Students S
LEFT JOIN Payments P ON S.student_id = P.student_id
WHERE P.payment_id IS NULL;

SELECT C.course_name
FROM Courses C
LEFT JOIN Enrollments E ON C.course_id = E.course_id
WHERE E.enrollment_id IS NULL;

SELECT S.first_name, S.last_name, COUNT(E.course_id) AS course_count
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(E.course_id) > 1;

SELECT T.first_name, T.last_name
FROM Teacher T
LEFT JOIN Courses C ON T.teacher_id = C.teacher_id
WHERE C.course_id IS NULL;

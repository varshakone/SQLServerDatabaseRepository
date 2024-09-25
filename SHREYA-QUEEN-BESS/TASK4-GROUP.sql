USE SISDB;
--1
SELECT AVG(enrollment_count) AS average_enrollment
FROM (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments
    GROUP BY course_id
) AS CourseEnrollments;

--2
SELECT S.first_name, S.last_name, P.amount
FROM Payments P
JOIN Students S ON P.student_id = S.student_id
WHERE P.amount = (SELECT MAX(amount) FROM Payments);

--3
SELECT C.course_name, COUNT(E.student_id) AS enrollment_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name
HAVING COUNT(E.student_id) = (
    SELECT MAX(course_count)
    FROM (
        SELECT COUNT(student_id) AS course_count
        FROM Enrollments
        GROUP BY course_id
    ) AS EnrollmentCounts
);

--4
SELECT T.first_name, T.last_name, SUM(P.amount) AS total_payments
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id
JOIN Enrollments E ON C.course_id = E.course_id
JOIN Payments P ON E.student_id = P.student_id
GROUP BY T.first_name, T.last_name;

--5
SELECT S.first_name, S.last_name
FROM Students S
WHERE (SELECT COUNT(DISTINCT course_id) FROM Enrollments E WHERE E.student_id = S.student_id) = 
      (SELECT COUNT(course_id) FROM Courses);

--6
SELECT T.first_name, T.last_name
FROM Teacher T
WHERE T.teacher_id NOT IN (SELECT teacher_id FROM Courses);

--7
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students;


--8
SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT course_id FROM Enrollments);

--9
SELECT S.first_name, S.last_name, C.course_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Enrollments E ON S.student_id = E.student_id
JOIN Courses C ON E.course_id = C.course_id
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name, C.course_name;

--10
SELECT S.first_name, S.last_name, COUNT(P.payment_id) AS payment_count
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name
HAVING COUNT(P.payment_id) > 1;

--11
SELECT S.first_name, S.last_name, SUM(P.amount) AS total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;

--12
SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;

--13
SELECT S.first_name, S.last_name, AVG(P.amount) AS average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.first_name, S.last_name;
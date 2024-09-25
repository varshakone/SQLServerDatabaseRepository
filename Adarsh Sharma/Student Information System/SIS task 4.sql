---------TASK 4--------------------------

/*1. Write an SQL query to calculate the average number of students enrolled in each course. Use 
aggregate functions and subqueries to achieve this.*/

SELECT AVG(student_count) AS avg_students_per_course
FROM (
    SELECT COUNT(e.student_id) AS student_count
    FROM Enrollments e
    GROUP BY e.course_id
) AS course_enrollments;


/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum 
payment amount and then retrieve the student(s) associated with that amount.*/

SELECT s.first_name, s.last_name, p.amount
FROM Payments p
JOIN Students s ON p.student_id = s.student_id
WHERE p.amount = (SELECT MAX(amount) FROM Payments);


/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the 
course(s) with the maximum enrollment count.*/

SELECT C.course_id, C.course_name, COUNT(E.student_id) AS enrollment_count
FROM Courses C
INNER JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_id, C.course_name
HAVING COUNT(E.student_id) = (
    SELECT MAX(enrollment_count)
    FROM (SELECT COUNT(student_id) AS enrollment_count FROM Enrollments GROUP BY course_id) AS MaxEnrollments);

-- 4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses.
SELECT T.teacher_id, T.first_name, T.last_name, 
       (SELECT SUM(P.amount)
        FROM Payments P
        INNER JOIN Enrollments E ON P.student_id = E.student_id
        INNER JOIN Courses C ON E.course_id = C.course_id
        WHERE C.teacher_id = T.teacher_id
       ) AS total_payments FROM Teacher T;


/* 5. Identify students who are enrolled in all available courses.
Use subqueries to compare a student's enrollments with the total number of courses.*/
SELECT s.first_name, s.last_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id;

-- 6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
SELECT T.first_name, T.last_name
FROM Teacher T
WHERE T.teacher_id NOT IN (SELECT C.teacher_id FROM Courses C);

-- 7. Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
SELECT AVG(age) AS average_age
FROM ( SELECT FLOOR(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS age FROM Students) AS AgeCalculation;

-- 8. Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
SELECT course_name
FROM Courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM Enrollments);

-- 9. Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.
SELECT S.student_id, S.first_name, S.last_name, C.course_name, 
       (SELECT SUM(P.amount) 
        FROM Payments P 
        INNER JOIN Enrollments E2 ON P.student_id = E2.student_id 
        WHERE E2.course_id = C.course_id AND E2.student_id = S.student_id) AS total_payments
FROM Students S
INNER JOIN Enrollments E ON S.student_id = E.student_id
INNER JOIN Courses C ON E.course_id = C.course_id
ORDER BY S.student_id, C.course_name;


/*10. Identify students who have made more than one payment.
Use subqueries and aggregate functions to count payments per student
and filter for those with counts greater than one.*/
SELECT t.first_name, t.last_name
FROM Teacher t
LEFT JOIN Courses c ON t.teacher_id = c.teacher_id
WHERE c.course_id IS NULL;

/*11. Write an SQL query to calculate the total payments made by each student. 
Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.*/
SELECT S.student_id, S.first_name, S.last_name, 
(SELECT SUM(P.amount) FROM Payments P WHERE P.student_id = S.student_id) AS total_payments

/*12. Retrieve a list of course names along with the count of students enrolled in each course. 
Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.*/
SELECT C.course_name, (SELECT COUNT(E.student_id) FROM Enrollments E WHERE E.course_id = C.course_id) AS student_count
FROM Courses C;

/*13. Calculate the average payment amount made by students. 
Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average.*/
SELECT S.student_id, S.first_name, S.last_name, AVG(P.amount) AS average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id, S.first_name, S.last_name;
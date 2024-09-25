--Task 4

--Q 1 Write an SQL query to calculate the average number of students enrolled in each course. Use aggregate functions and subqueries to achieve this.
select course_id,avg(enrollment_count) as average_count
from(
select course_id, count(student_id) as enrollment_count
from Enrollments
group by course_id
)as course_enrollments
group by course_id;


--Q 2 Identify the student(s) who made the highest payment. Use a subquery to find the maximum payment amount and then retrieve the student(s) associated with that amount.
select student_id,amount
from Payments
where amount = (select max(amount) from Payments);



--Q 3 Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the course(s) with the maximum enrollment count
select course_id, enrollment_count
from(
    select course_id, COUNT(student_id) as enrollment_count
    from Enrollments
    group by course_id
) as course_enrollments
where enrollment_count = (select max(enrollment_count) from (
    select count(student_id) as enrollment_count
    from Enrollments
    group by course_id
) as subquery);

--Q 4 Calculate the total payments made to courses taught by each teacher. Use subqueries to sum payments for each teacher's courses
SELECT T.teacher_id, T.first_name, SUM(P.amount) AS total_payments
FROM Teacher T
JOIN Courses C ON T.teacher_id = C.teacher_id
JOIN Enrollments E ON C.course_id = E.course_id
JOIN Payments P ON E.student_id = P.student_id
GROUP BY T.teacher_id, T.first_name;


--Q 5 Identify students who are enrolled in all available courses. Use subqueries to compare a student's enrollments with the total number of courses.
SELECT student_id
FROM Enrollments
GROUP BY student_id
HAVING COUNT(course_id) = (SELECT COUNT(course_id) FROM Courses);
--none of the student enrolled for all available courses



--Q 6 Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to find teachers with no course assignments.
SELECT T.first_name,T.last_name
FROM Teacher T
WHERE T.teacher_id NOT IN (SELECT C.teacher_id FROM Courses C);

--Q 7 Calculate the average age of all students. Use subqueries to calculate the age of each student based on their date of birth.
SELECT AVG(DATEDIFF(YEAR, date_of_birth, GETDATE())) AS average_age
FROM Students;



--Q 8 Identify courses with no enrollments. Use subqueries to find courses without enrollment records.
SELECT course_id
FROM Courses
WHERE course_id NOT IN (SELECT course_id FROM Enrollments);

--Q 9 Calculate the total payments made by each student for each course they are enrolled in. Use subqueries and aggregate functions to sum payments.(NO course_id in payments  table so i use join operatioon here)
SELECT E.student_id, E.course_id, SUM(P.amount) AS total_payment
FROM Payments P
JOIN Enrollments E ON P.student_id = E.student_id
GROUP BY E.student_id, E.course_id;

--Q 10 Identify students who have made more than one payment. Use subqueries and aggregate functions to count payments per student and filter for those with counts greater than one.

SELECT student_id
FROM Payments
GROUP BY student_id
HAVING COUNT(payment_id) > 1;

-- Q 11 Write an SQL query to calculate the total payments made by each student. Join the "Students" table with the "Payments" table and use GROUP BY to calculate the sum of payments for each student.
SELECT S.student_id, SUM(P.amount) AS total_payments
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id;

--Q 12  Retrieve a list of course names along with the count of students enrolled in each course. Use JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to count enrollments.

SELECT C.course_name, COUNT(E.student_id) AS student_count
FROM Courses C
JOIN Enrollments E ON C.course_id = E.course_id
GROUP BY C.course_name;

--Q 13 Calculate the average payment amount made by students. Use JOIN operations between the "Students" table and the "Payments" table and GROUP BY to calculate the average
SELECT S.student_id, AVG(P.amount) AS average_payment
FROM Students S
JOIN Payments P ON S.student_id = P.student_id
GROUP BY S.student_id;





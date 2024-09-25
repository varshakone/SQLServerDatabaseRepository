use SISDB

/*select s.first_name, sum(p.amount) as total_payment from Students s
inner join Payments p on s.student_id = p.student_id
where s.first_name = 'Walter'
group by s.first_name       --question 1    

select c.course_name , count(e.student_id) as totalcount from Courses c
inner join Enrollments e on c.course_id = e.course_id
group by c.course_name  --question 2  

select s.first_name
From Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.course_id is null; --question 3 

select s.first_name, s.last_name, c.course_name from Students s
inner join Enrollments e on s.student_id = e.student_id
inner join Courses c on c.course_id = e.course_id --question 4  


select t.first_name, t.last_name, c.course_name from Teacher t
inner join Courses c on t.teacher_id = c.teacher_id --question 5

select s.first_name, s.last_name, e.enrollment_date from Students s
inner join Enrollments e on s.student_id = e.student_id
inner join Courses c on c.course_id = e.course_id
where c.course_name = 'History'  --question 6

select s.first_name, s.last_name from Students s
left join Payments p on s.student_id = p.student_id
where p.payment_date is not null --question 7 */

select c.course_name from Courses c
left join Enrollments e on c.course_id = e.course_id
where e.enrollment_id is null   --question 8

--self join question 9
select e1.student_id from enrollments e1 
join enrollments e2 on e1.student_id = e2.student_id  

select t.first_name, t.Last_name, c.course_name from Teacher t
left join Courses c on t.teacher_id = c.teacher_id
where c.course_id is null --question 10










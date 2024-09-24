use SISDB

create table Students(
	student_id int primary key identity,
	first_name varchar(30),
	last_name varchar(30),
	date_of_birth date,
	email varchar(50),
	phone_number varchar(20));

create table Teacher(
	teacher_id int primary key identity,
	first_name varchar(30),
	last_name varchar(30),
	email varchar(50));

create table Courses(
	course_id int primary key identity,
	course_name varchar(30),
	credits int,
	teacher_id int,
	foreign key (teacher_id) references Teacher(teacher_id) );

create table Enrollments(
	enrollment_id int primary key identity,
	student_id int,
	course_id int,
	enrollment_date date,
	foreign key (student_id) references Students(student_id),
	foreign key (course_id) references Courses(course_id));

create table Payments(
	payment_id int primary key identity,
	student_id int,
	amount decimal(10,2),
	payment_date date,
	foreign key (student_id) references Students(student_id));

insert into Students (first_name, last_name, date_of_birth, email, Phone_number) values
	('walter','white','2003-04-22','walt@xyz.com','9392949583'),
	('Eren', 'Yeager', '2000-03-30', 'eren.yeager@xyz.com', '9001112233'),
    ('Thorfinn', 'Thors', '2002-05-15', 'thorfinn.thors@xyz.com', '9876543210'),
    ('Jon', 'Snow', '1999-12-10', 'jon.snow@xyz.com', '9009876543'),
    ('Daenerys', 'Targaryen', '1998-07-12', 'dany@xyz.com', '9098765432'),
    ('Mikasa', 'Ackerman', '2001-02-10', 'mikasa.ackerman@xyz.com', '8890123456'),
    ('Levi', 'Ackerman', '1997-01-25', 'levi.ackerman@xyz.com', '9003456789'),
    ('Askeladd', 'Lad', '1995-11-20', 'askeladd@xyz.com', '8876543210'),
    ('Zeke', 'Yeager', '1996-06-05', 'zeke.yeager@xyz.com', '9123456780'),
    ('Reiner', 'Braun', '1998-09-18', 'reiner@xyz.com', '9998887776');

insert into Teacher (first_name, last_name, email) values
    ('Erwin', 'Smith', 'erwin.smith@xyz.com'),
    ('Hannes', 'Schmidt', 'hannes.schmidt@xyz.com'),
    ('Kisame', 'Hoshigaki', 'kisame.hoshigaki@xyz.com'),
    ('Ragnar', 'Lothbrok', 'ragnar.lothbrok@xyz.com'),
    ('Eddard', 'Stark', 'eddard.stark@xyz.com'),
    ('Tyrion', 'Lannister', 'tyrion.lannister@xyz.com'),
    ('Obito', 'Uchiha', 'obito.uchiha@xyz.com'),
    ('Madara', 'Uchiha', 'madara.uchiha@xyz.com'),
    ('Arthur', 'Morgan', 'arthur.morgan@xyz.com'),
    ('Thors', 'Odin', 'Odin@xyz.com');

insert into Courses(course_name, credits, teacher_id) values
	('History', 3, 1),
    ('Psychology', 4, 2),
    ('Mathematics', 3, 3),
    ('Physics', 4, 4),
    ('Chemistry', 3, 5),
    ('Biology', 4, 6),
    ('English', 3, 7),
    ('Computer Science', 4, 8),
    ('Economics', 3, 9),
    ('Philosophy', 4, 10);

insert into Enrollments (student_id, course_id, enrollment_date) values
	(1, 1, '2024-09-01'),
    (2, 2, '2024-09-02'),
    (3, 3, '2024-09-03'),
    (4, 4, '2024-09-04'),
    (5, 5, '2024-09-05'),
    (6, 6, '2024-09-06'),
    (7, 7, '2024-09-07'),
    (8, 8, '2024-09-08'),
    (9, 9, '2024-09-09'),
    (10, 10, '2024-09-10');

insert into Payments(student_id, amount, Payment_date) values
	(1, 5000, '2024-09-05'),
    (2, 4500, '2024-09-06'),
    (3, 6000, '2024-09-07'),
    (4, 5500, '2024-09-08'),
    (5, 5200, '2024-09-09'),
    (6, 4800, '2024-09-10'),
    (7, 5300, '2024-09-11'),
    (8, 6200, '2024-09-12'),
    (9, 5100, '2024-09-13'),
    (10, 5800, '2024-09-14');  


select * from Students
select * from Teacher
select * from Courses
select * from Enrollments
select * from Payments




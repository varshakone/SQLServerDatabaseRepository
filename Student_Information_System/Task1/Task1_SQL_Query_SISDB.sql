--create database
Create Database SISDB;

--create tables
Create Table Students(
	student_id INT Primary Key Identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	date_of_birth date,
	email varchar(max),
	phone_number varchar(20) not null
);

Create Table Teacher(
	teacher_id INT Primary Key Identity(1,1),
	first_name varchar(50) not null,
	last_name varchar(50)not null,
	email varchar(max),
);

Create Table Courses(
	course_id INT Primary Key Identity(1,1),
	course_name varchar(max) not null,
	credits decimal(10,2),
	teacher_id INT,
	Foreign Key (teacher_id) References Teacher(teacher_id)
);

Create Table Enrollments(
	enrollment_id INT Primary Key Identity(1,1),
	enrollment_date date not null,
	student_id INT,
	course_id INT,
	Foreign Key (student_id) References Students(student_id),
	Foreign Key (course_id) References Courses(course_id)
);

Create Table Payments(
	payment_id INT Primary Key Identity(1,1),
	amount decimal(10,2) not null,
	payment_date datetime not null,
	student_id INT,
	Foreign Key (student_id) References Students(student_id)
);

--Insert data in tables

Insert into Students Values
('Manisha', 'Porwal', '2001-05-21','ManishaPorwal@gmail.com',8478125321),
('Anil', 'Choudhary','2002-02-20','Choudhary32@gmail.com',7923793417),
('Ritu', 'Gupta','2002-01-26','Gupta09@gmail.com',8726790222),
('Manoj', 'Agarwal','2002-06-16','Manoj@gmail.com',7656781248),
('Dilip', 'Dosi','2001-04-19','DosiDilip@gmail.com',9516790560),
('Shubham', 'Mishra','2000-09-20','Shubham@gmail.com',8216790195),
('Avni', 'Rathore','2003-02-22','Avni20@gmail.com',8716790922),
('Harshita', 'Pandey','2002-05-30','Harshi@gmail.com',7916770827),
('Tanya', 'Sharma','2003-06-27','TanyaS02@gmail.com',9926780126),
('Rahul', 'Kumar','2000-03-12','KumarRahul@gmail.com',8916790125)

Insert into Teacher Values
('Pooja','Rathore','rathorePooja@gmail.com'),
('Rashmi','Patel','rashmi15@gmail.com'),
('Dhruv','Kumar','dhruvK@gmail.com'),
('Ronak','Dhanotiya','DhanotiyaRon@gmail.com'),
('Aman','Jain','aman11@gmail.com'),
('Nikhil','Jain','jainNikhil@gmail.com'),
('Khushi','Porwal','KhushiPorwal@gmail.com'),
('Somiya','Gupta','GuptaSom@gmail.com'),
('Yash','Prajapati','yash123@gmail.com'),
('Chahat','Chhabra','chahat@gmail.com')

Insert into Courses Values
('C# Programming',12,4),
('DBMS',10,2),
('Python Programming',12,1),
('Computer Networks',6,10),
('Operating system',8,9),
('Java Programming',12,1),
('OOPs Concept',10,5),
('Web Technologies',9,6),
('Full-Stack Web Development',15,8),
('ReactJS',9,8)

Insert into Enrollments Values
('2023-03-21',2,9),
('2022-01-30',4,1),
('2024-04-27',1,6),
('2022-06-11',6,2),
('2023-05-16',2,5),
('2023-08-17',5,8),
('2022-09-20',8,1),
('2022-06-8',4,3),
('2024-04-10',3,10),
('2022-02-28',10,7)

Insert into Payments Values 
('1499.00','2024-04-27 13:05:01',1),
('3000.00','2024-04-27 13:05:01',2),
('1499.00','2022-05-30 13:05:01',3),
('999.00','2023-06-15 13:05:01',4),
('2000.00','2024-03-10 13:05:01',5),
('1500.00','2023-02-18 13:05:01',6),
('900.00','2023-10-16 13:05:01',7),
('1500.00','2023-12-26 13:05:01',3),
('2000.00','2024-01-21 13:05:01',1),
('1000.00','2022-04-7 13:05:01',10)


-- View the records of all tables

Select * From Students;
Select * From Teacher;
Select * From Courses;
Select * From Enrollments;
Select * From Payments;



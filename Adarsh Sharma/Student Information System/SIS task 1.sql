---------------------TASK1 DATA BASE DESIGN----------------

create table  Students
(
student_id  int Primary Key,
first_name varchar (50),
last_name varchar (50),
date_of_birth date,
email varchar (60),
phone_number varchar(15)
);

insert into Students(student_id,first_name,last_name,date_of_birth,email,phone_number)
values(1,'adarsh','sharma','12-03-2002','adarsh@gmail.com','9568465871'),
       (2,'sunita','sharma','01-04-1976','sunita@gmail.com','956846525871871'),
	   (3,'khushbu','sharma','06-08-2004','khsubu@gmail.com','565456825874741'),
	   (4,'vaishali','sharma','09-08-2016','vaishali@gmail.com','654725874892147'),
	   (5,'arpit','gavshinde','11-09-2017','gavshindde@gmail.com','678258749421587'),
	   (6,'jessica','sharma','12-05-2020','jas@gmail.com','367410252587487'),
	   (7,'mohini','rathore','02-05-1972','mohi@gmail.com','647892125874456'),
	   (8,'vandana','sohani','10-12-2021','soni@gmail.com','647895425877445'),
	   (9,'sittu','gittu','02-10-2000','sigu@gmail.com','458712369825874'),
	   (10,'sonali','rajguru','06-01-2008','sahiytya@gmail.com','648523698517964');

-----------------------------------------------------------------------------------------

create table Courses(
course_id int Primary Key,
course_name varchar (100),
credits int not null check(credit > 0),
teacher_id int Foreign Key references Teacher (teacher_id)
);

INSERT INTO Courses (course_id,course_name, credits, teacher_id) VALUES
(1,'Mathematics', 3, 1),
(2,'English Literature', 3, 2),
(3,'Biology', 4, 1),
(4,'Chemistry', 4, 3),
(5,'Physics', 3, 4),
(6,'History', 3, 2),
(7,'Computer Science', 4, 3),
(8,'Art', 2, 1),
(9,'Music', 2, 4),
(10,'Economics', 3, 2);

----------------------------------------------------
create table Enrollments (
enrollment_id int Primary Key,
student_id int,
course_id int,
enrollment_date date NOT NULL,
foreign Key  (student_id) references Students(student_id),
foreign Key  (course_id) references Courses(course_id)
);

INSERT INTO Enrollments (enrollment_id,student_id, course_id, enrollment_date) VALUES
(10,1, 1, '2023-01-10'),
(9,1, 2, '2023-01-11'),
(8,2, 1, '2023-01-10'),
(7,3, 3, '2023-01-15'),
(6,4, 4, '2023-01-12'),
(5,5, 5, '2023-01-10'),
(4,6, 6, '2023-01-14'),
(3,7, 7, '2023-01-13'),
(2,8, 8, '2023-01-09'),
(1,9, 9, '2023-01-11');

--------------------------------------------------------------

create table Payments(
payment_id int Primary Key ,
student_id int Foreign Key references Students(student_id) ,
amount decimal (10,2)check (amount >=0),
payment_date date 
);

INSERT INTO Payments (payment_id,student_id, amount, payment_date) VALUES
(10,1, 500.00, '2023-02-01'),
(9,2, 300.00, '2023-02-05'),
(8,3, 400.00, '2023-02-07'),
(7,4, 200.00, '2023-02-10'),
(6,5, 350.00, '2023-02-12'),
(5,6, 450.00, '2023-02-15'),
(4,7, 600.00, '2023-02-18'),
(3,8, 250.00, '2023-02-20'),
(2,9, 700.00, '2023-02-22'),
(1,10, 550.00, '2023-02-25');
 
-------------------------------------------------------------------
create table Teacher(
teacher_id int Primary Key,
first_name varchar(50),
last_name varchar(50),
email varchar (60),
);

insert into Teacher(teacher_id,first_name,last_name,email)
values(1,'vibha','bhatore','bhtore@gmail.com'),
(2,'sandhya ','ggete','gqw@gmail.com'),
(3,'sudhir','sharma','sudhir@gmail.com'),
(4,'smriti','irani','pk@gmail.com'),
(5,'gaduda','hariye','gaduda@gmaail.com'),
(6,'vandana','sohani','sojani@gmaail.com'),
(7,'mukesh','prajapati','bhatta@gmail.com'),
(8,'shailendra','khede','khede@gmail.com'),
(9,'sarthak','sharma','siddu@gmail.com'),
(10,'gangadhar','sharma','pati@gmail.com');


-- Inserting sample records into Venue
INSERT INTO Venue (VenueName, Address) VALUES 
('Jawaharlal Nehru Stadium', 'New Delhi, India'), 
('Shivaji Park', 'Mumbai, India'), 
('Nehru Centre', 'Mumbai, India'),
('Rabindra Sadan', 'Kolkata, India'),
('Bengaluru Palace', 'Bengaluru, India'),
('Hyderabad International Convention Centre', 'Hyderabad, India'),
('Mahatma Mandir', 'Gandhinagar, India'),
('Ravindra Bharathi', 'Hyderabad, India'),
('Vasant Kunj', 'New Delhi, India'),
('Sri Chamarajendra Park', 'Mysuru, India');

-- Inserting sample records into Event
INSERT INTO Event (EventName, EventDate, EventTime, VenueID, TotalSeats, AvailableSeats, TicketPrice, EventType) VALUES 
('Bollywood Concert', '2024-10-01', '19:00:00', 1, 20000, 10000, 2000.00, 'Concert'),
('Cricket Match', '2024-11-15', '15:00:00', 2, 50000, 30000, 2500.00, 'Sports'),
('Classical Dance Performance', '2024-12-20', '20:00:00', 3, 3000, 1500, 1000.00, 'Movie'),
('Rock Band Live', '2024-10-10', '18:00:00', 4, 10000, 6000, 1500.00, 'Concert'),
('Stand-up Comedy Show', '2024-11-05', '21:00:00', 5, 2000, 1000, 800.00, 'Movie'),
('Diwali Festival', '2024-10-30', '12:00:00', 6, 30000, 25000, 500.00, 'Concert'),
('Kathakali Dance', '2024-12-10', '19:30:00', 7, 5000, 2000, 1200.00, 'Movie'),
('IPL T20 Final', '2024-11-20', '20:00:00', 8, 60000, 45000, 3000.00, 'Sports'),
('Annual Cultural Fest', '2024-09-15', '10:00:00', 9, 20000, 15000, 300.00, 'Concert'),
('Art & Craft Exhibition', '2024-12-01', '10:00:00', 10, 4000, 2500, 600.00, 'Movie');

-- Inserting sample records into Customer
INSERT INTO Customer (CustomerName, Email, PhoneNumber) VALUES 
('Aarav Sharma', 'aarav@example.com', '9876543210'),
('Vivaan Mehta', 'vivaan@example.com', '8765432109'),
('Aditya Kapoor', 'aditya@example.com', '7654321098'),
('Vihaan Singh', 'vihaan@example.com', '6543210987'),
('Krishna Reddy', 'krishna@example.com', '5432109876'),
('Ananya Rao', 'ananya@example.com', '4321098765'),
('Saanvi Desai', 'saanvi@example.com', '3210987654'),
('Dhruv Choudhary', 'dhruv@example.com', '2109876543'),
('Naina Verma', 'naina@example.com', '1098765432'),
('Ishaan Yadav', 'ishaan@example.com', '0987654321');

-- Inserting sample records into Booking
INSERT INTO Booking (CustomerID, EventID, NumOfTickets, TotalCost, BookingDate) VALUES 
(1, 1, 2, 4000.00, '2024-09-01'),
(2, 2, 4, 10000.00, '2024-09-05'),
(3, 3, 3, 3000.00, '2024-09-10'),
(4, 4, 5, 7500.00, '2024-09-15'),
(5, 5, 2, 1600.00, '2024-09-20'),
(6, 6, 10, 5000.00, '2024-09-25'),
(7, 7, 1, 1200.00, '2024-09-28'),
(8, 8, 8, 24000.00, '2024-09-29'),
(9, 9, 6, 1800.00, '2024-09-30'),
(10, 10, 3, 1800.00, '2024-09-30');

select * from Venue
select * from Event
select * from Customer
select * from Booking

update Customer set BookingID = 1 where CustomerID=1;
update Customer set BookingID = 2 where CustomerID=2;
update Customer set BookingID = 3 where CustomerID=3;
update Customer set BookingID = 4 where CustomerID=4;
update Customer set BookingID = 5 where CustomerID=5;
update Customer set BookingID = 6 where CustomerID=6;
update Customer set BookingID = 7 where CustomerID=7;
update Customer set BookingID = 8 where CustomerID=8;
update Customer set BookingID = 9 where CustomerID=9;
update Customer set BookingID = 10 where CustomerID=10;


update Event set BookingID = 1 where EventID=1;
update Event set BookingID = 2 where EventID=2;
update Event set BookingID = 3 where EventID=3;
update Event set BookingID = 4 where EventID=4;
update Event set BookingID = 5 where EventID=5;
update Event set BookingID = 6 where EventID=6;
update Event set BookingID = 7 where EventID=7;
update Event set BookingID = 8 where EventID=8;
update Event set BookingID = 9 where EventID=9;
update Event set BookingID = 10 where EventID=10;

-- 2 question
select * from Event;

--3 question
select * from Event where AvailableSeats > 0;

--4 question
-- i have no records in which eventname includes cup so i am insterting one record o demonstrate the query
insert into Event (EventName, EventDate, EventTime, VenueID, TotalSeats, AvailableSeats, TicketPrice, EventType, BookingID) 
values ('Soccer Cup Finals', '2024-10-10', '18:00:00', 1, 100, 100, 50.00, 'Sports', 1);

select * from Event where EventName like '%cup%';

--5 question
select * from Event where TicketPrice between 1000 and 2500;

--6 question
select * from Event where EventDate Between '2024-11-01' and '2024-12-31';

--7 question
select * from Event where AvailableSeats > 0 and EventType = 'Concert';

--8 question 
select * from Customer order by CustomerID 
offset 5 rows 
fetch next 5 rows only;

--9 question
select * from Booking where NumOfTickets > 4;

--10 question
select * from Customer where PhoneNumber like '%000';
--there is no customer whos phone number ends with 000

--11 question
select * from Event where TotalSeats > 15000 order by TotalSeats;

--12 question
select * from event where EventName not like 'x%' and EventName not like 'y%' and EventName not like 'z%';
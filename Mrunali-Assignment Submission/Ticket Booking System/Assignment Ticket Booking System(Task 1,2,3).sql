--GROUP CIRCLE OF HOPE
--MRUNALI RAJENDRA RAJKULE
 
--Ticket_Booking_System


--TASK 1
CREATE DATABASE TicketBookSystem;
CREATE TABLE Venues (
    venue_id INT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    address VARCHAR(255)
);
CREATE TABLE Events (
    event_id INT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    event_time TIME NOT NULL,
    venue_id INT,
    total_seats INT NOT NULL,
    available_seats INT NOT NULL,
    ticket_price DECIMAL(10, 2) NOT NULL,
    event_type VARCHAR(250),
    booking_id INT,
    --FOREIGN KEY (venue_id) REFERENCES Venue(venue_id),
    --FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    booking_id INT,
    --FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    customer_id INT,
    event_id INT,
    num_tickets INT NOT NULL,
    total_cost DECIMAL(10, 2) NOT NULL,
    booking_date DATE NOT NULL,
    --FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    --FOREIGN KEY (event_id) REFERENCES Event(event_id)
);
ALTER TABLE Events
ADD FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id);

ALTER TABLE Events
ADD FOREIGN KEY (venue_id) REFERENCES Venues(venue_id);

ALTER TABLE Customers
ADD FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id);

ALTER TABLE Bookings
ADD FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);

ALTER TABLE Bookings
ADD FOREIGN KEY (event_id) REFERENCES Events(event_id);

--TASK 2:

--1)Write a SQL query to insert at least 10 sample records into each table.INSERT INTO Venues (venue_id, venue_name, address) VALUES
(1, 'Amanora Mall', 'Near Magarpatta Hadapsar, Pune'),
(2, 'Seasons Mall', 'Near Magarpatta Hadapsar, Pune'),
(3, 'Pheonix Mall', 'Viman Nagar, Pune'),
(4, 'City Park', 'Old Pune Road, Pune'),
(5, 'Pheonix Mall of Millenium', 'Wakad, Pune'),
(6, 'Community Hall', 'Community Street, Aurangabad'),
(7, 'Royal Pavilion', 'Royal St, Delhi'),
(8, 'Civic Center', 'Civic Plane Road, Mumbai'),
(9, 'The Pavilion', 'University Road, Pune'),
(10, 'Shreenath Plaza', 'Dnyaneshwar Road, Shivaji Nagar,Pune'),
(11,'Kopa Mall','Koregoan Park,Pune');


INSERT INTO Events(event_id, event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) VALUES
(1, 'Rock Concert', '2024-10-01', '19:00:00', 3, 500, 250, 75.00, 'Concert'),
(2, 'Football Match', '2024-10-05', '15:00:00', 2, 10000, 8000, 25.00, 'Sports'),
(3, 'Art Exhibition', '2024-10-10', '10:00:00', 5, 300, 150, 15.00, 'Other'),
(4, 'Movie Night', '2024-10-15', '20:00:00', 1, 200, 150, 10.00, 'Movie'),
(5, 'Food Festival', '2024-10-20', '12:00:00', 4, 1000, 700, 20.00, 'Other'),
(6, 'Jazz Night', '2024-10-25', '18:00:00', 3, 400, 200, 40.00, 'Concert'),
(7, 'Marathon', '2024-10-30', '07:00:00', 2, 2000, 1500, 30.00, 'Sports'),
(8, 'Science Fair', '2024-11-05', '09:00:00', 5, 600, 300, 5.00, 'Other'),
(9, 'Dance Competition', '2024-11-10', '16:00:00', 1, 350, 200, 15.00, 'Other'),
(10, 'Charity Run', '2024-11-15', '08:00:00', 4, 1500, 1200, 25.00, 'Sports');


INSERT INTO Customers (customer_id, customer_name, email, phone_number) VALUES
(1,'Mrunali Rajkule','mrunali@gmail.com','1234567890'),
(2,'Sayli Rajkule','sayli@gmail.com','12399890'),
(3,'Jyoti Rajkule','jyoti@gmail.com','0004567890'),
(4,'Rajendra Rajkule','rajendra@gmail.com','1234562222'),
(5,'Harry Potter','harry@gmail.com','4564567890'),
(6,'James Potter','james@gmail.com','1878767890'),
(7,'Lily Potter','lily@gmail.com','7624567890'),
(8,'Tony Stark','tony@gmail.com','1230987690'),
(9,'Iron Man','iron@gmail.com','1111567890'),
(10,'Captain Amerika','captain@gmail.com','1222567890');




INSERT INTO Bookings (booking_id, customer_id, event_id, num_tickets, total_cost, booking_date)VALUES
(1, 1, 2, 2, 150.00, '2024-09-01'),
(2, 4, 3, 4, 100.00, '2024-09-02'),
(3, 6, 6, 1, 15.00, '2024-09-03'),
(4, 8, 4, 3, 30.00, '2024-09-04'),
(5, 5, 1, 5, 100.00, '2024-09-05'),
(6, 3, 6, 2, 80.00, '2024-09-06'),
(7, 7, 8, 6, 180.00, '2024-09-07'),
(8, 2, 7, 2, 10.00, '2024-09-08'),
(9, 9, 5, 4, 60.00, '2024-09-09'),
(10, 1, 6, 3, 75.00, '2024-09-10');

UPDATE Events SET booking_id=1 WHERE event_id=2;
UPDATE Events SET booking_id=2 WHERE event_id=3;
UPDATE Events SET booking_id=3 WHERE event_id=6;
UPDATE Events SET booking_id=4 WHERE event_id=4;
UPDATE Events SET booking_id=5 WHERE event_id=1;
UPDATE Events SET booking_id=6 WHERE event_id=6;
UPDATE Events SET booking_id=7 WHERE event_id=8;
UPDATE Events SET booking_id=8 WHERE event_id=7;
UPDATE Events SET booking_id=9 WHERE event_id=5;
UPDATE Events SET booking_id=10 WHERE event_id=16;

UPDATE Customers SET booking_id=1 WHERE customer_id=1;
UPDATE Customers SET booking_id=2 WHERE customer_id=4;
UPDATE Customers SET booking_id=3 WHERE customer_id=6;
UPDATE Customers SET booking_id=4 WHERE customer_id=8;
UPDATE Customers SET booking_id=5 WHERE customer_id=5;
UPDATE Customers SET booking_id=6 WHERE customer_id=3;
UPDATE Customers SET booking_id=7 WHERE customer_id=7;
UPDATE Customers SET booking_id=8 WHERE customer_id=2;
UPDATE Customers SET booking_id=9 WHERE customer_id=9;
UPDATE Customers SET booking_id=10 WHERE customer_id=1;

--2)
SELECT * FROM Venues;
SELECT * FROM Events;
SELECT * FROM Customers;
SELECT * FROM Bookings;

--3)
SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    available_seats > 0;

--4)Write a SQL query to select events name partial match with ‘cup’
SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    event_name LIKE '%cup%';

--5)Write a SQL query to select events with ticket price range is between 1000 to 2500.SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    ticket_price BETWEEN 1000 AND 2500;

--6)Write a SQL query to retrieve events with dates falling within a specific range
SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    event_date BETWEEN '2024-10-10' AND '2024-11-10';

--7) Write a SQL query to retrieve events with available tickets that also have "Concert" in their
SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    available_seats > 0
    AND event_name LIKE '%Concert%';

--8)Write a SQL query to retrieve users in batches of 5, starting from the 6th user.SELECT 
    customer_id,
    customer_name,
    email,
    phone_number
FROM 
    Customers
ORDER BY customer_id 
OFFSET 5 ROWS 
FETCH NEXT 5 ROWS ONLY; 

--9)Write a SQL query to retrieve bookings details contains booked no of ticket more than 4.
SELECT 
    booking_id,
    customer_id,
    event_id,
    num_tickets,
    total_cost,
    booking_date
FROM 
    Bookings
WHERE 
    num_tickets > 4;

--10)Write a SQL query to retrieve customer information whose phone number end with ‘000’

SELECT 
    customer_id,
    customer_name,
    email,
    phone_number
FROM 
    Customers
WHERE 
    phone_number LIKE '%000';

--11)Write a SQL query to retrieve the events in order whose seat capacity more than 15000.SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    total_seats > 15000
ORDER BY 
    total_seats DESC;  -- You can change to ASC for ascending order

--12)Write a SQL query to select events name not start with ‘x’, ‘y’, ‘z’
SELECT 
    event_id,
    event_name,
    event_date,
    event_time,
    total_seats,
    available_seats,
    ticket_price,
    event_type
FROM 
    Events
WHERE 
    event_name NOT LIKE 'x%' 
    AND event_name NOT LIKE 'y%' 
    AND event_name NOT LIKE 'z%';


--TASK 3
--1). Write a SQL query to List Events and Their Average Ticket Prices
SELECT event_name, AVG(ticket_price) AS Average_Ticket_Price
FROM Events
GROUP BY event_name;

--2)Write a SQL query to Calculate the Total Revenue Generated by Events.
SELECT event_name, SUM((total_seats-available_seats)*ticket_price) AS Total_Revenue
FROM Events 
GROUP BY event_name;

--3) Write a SQL query to find the event with the highest ticket sales.SELECT TOP 1 event_name , (total_seats -available_seats) AS Heighest_Ticket_SoldFROM EventsORDER BY Heighest_Ticket_Sold;--4)Write a SQL query to Calculate the Total Number of Tickets Sold for Each Event.SELECT event_name, (total_seats-available_seats) AS Tickets_soldFROM Events;--5)Write a SQL query to Find Events with No Ticket Sales.SELECT event_name FROM EventsWHERE total_seats=available_seats;--6) Write a SQL query to Find the User Who Has Booked the Most Tickets.SELECT * FROM Bookings;SELECT  TOP 1 		c.customer_id,        c.customer_name,		SUM(b.num_tickets) AS Total_tickets_bookedFROM Bookings bJoin Customers c  ON b.booking_id=c.booking_idGROUP BY c.customer_id,c.customer_nameORDER BY Total_tickets_booked DESC;--7) Write a SQL query to List Events and the total number of tickets sold for each month.SELECT 
    e.event_id,              
    e.event_name,
    YEAR(b.booking_date) AS year,
    MONTH(b.booking_date) AS month,
    SUM(b.num_tickets) AS total_tickets_sold
FROM 
    Bookings b
JOIN 
    Events e ON b.event_id = e.event_id   
GROUP BY 
    e.event_id, e.event_name, YEAR(b.booking_date), MONTH(b.booking_date)
ORDER BY 
    year, month;

--8) Write a SQL query to calculate the average Ticket Price for Events in Each Venue.SELECT 
    v.venue_id,
    v.venue_name,
    AVG(e.ticket_price) AS average_ticket_price
FROM 
    Events e
JOIN 
    Venues v ON e.venue_id = v.venue_id
GROUP BY 
    v.venue_id, v.venue_name;--9)Write a SQL query to calculate the total Number of Tickets Sold for Each Event Type.
SELECT 
    e.event_type,
    SUM(b.num_tickets) AS total_tickets_sold
FROM 
    Bookings b
JOIN 
    Events e ON b.event_id = e.event_id
GROUP BY 
    e.event_type;


--10) Write a SQL query to calculate the total Revenue Generated by Events in Each Year.
SELECT 
    YEAR(b.booking_date) AS year,
    SUM(b.num_tickets * e.ticket_price) AS total_revenue
FROM 
    Bookings b
JOIN 
    Events e ON b.event_id = e.event_id
GROUP BY 
    YEAR(b.booking_date)
ORDER BY 
    year;

--11) Write a SQL query to list users who have booked tickets for multiple events.
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT b.event_id) AS event_count
FROM 
    Customers c
JOIN 
    Bookings b ON c.customer_id = b.customer_id
GROUP BY 
    c.customer_id, c.customer_name
HAVING 
    COUNT(DISTINCT b.event_id) > 1;


--12) Write a SQL query to calculate the Total Revenue Generated by Events for Each User.
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(b.num_tickets * e.ticket_price) AS total_revenue
FROM 
    Customers c
JOIN 
    Bookings b ON c.customer_id = b.customer_id
JOIN 
    Events e ON b.event_id = e.event_id
GROUP BY 
    c.customer_id, c.customer_name

--13) Write a SQL query to calculate the Average Ticket Price for Events in Each Category and Venue.
SELECT 
    e.event_type,
    v.venue_id,
    v.venue_name,
    AVG(e.ticket_price) AS average_ticket_price
FROM 
    Events e
JOIN 
    Venues v ON e.venue_id = v.venue_id
GROUP BY 
    e.event_type, v.venue_id, v.venue_name

--14) Write a SQL query to list Users and the Total Number of Tickets They've Purchased in the Last 30Days
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(b.num_tickets) AS total_tickets_purchased
FROM 
    Customers c
JOIN 
    Bookings b ON c.customer_id = b.customer_id
WHERE 
    b.booking_date >= DATEADD(DAY, -30, GETDATE())  
GROUP BY 
    c.customer_id, c.customer_name


/* By Tanaygeet Shrivastava */


/* Task -1 - Database Design */

-- 1
CREATE DATABASE Courier_Manage;
USE Courier_Manage;


-- 2(i)
CREATE TABLE User (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT);


-- 2(ii)
CREATE TABLE Courier (
    CourierID INT PRIMARY KEY AUTO_INCREMENT,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE);


-- 2(iii)
CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY AUTO_INCREMENT,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2));


-- 2(iv)
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2));


-- 2(v)
CREATE TABLE Location (
    LocationID INT PRIMARY KEY AUTO_INCREMENT,
    LocationName VARCHAR(100),
    Address TEXT);


-- 2(vi)
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID));


-- 3(i)
INSERT INTO User (Name, Email, Password, ContactNumber, Address)
VALUES
('Tanaygeet Shrivastava', 'Tanaygeet@example.com', 'tanay123', '1234567890', 'Indore'),
('Aditya Khamare', 'Aditya@example.com', 'aditya123', '0987654321', 'Pune'),
('Latashree Shrivastava', 'Latashree@example.com', 'Lata123', '0987654321', 'Delhi'),
('Ravindra Bage', 'Ravindra@example.com', 'Ravindra123', '0987654321', 'Lucknow'),
('Kritika Sinha', 'Kritika@example.com', 'Kritika123', '0987654321', 'Irvine'),
('Soniya Tiwari', 'Soniya@example.com', 'Soniya123', '0987654321', 'Mumbai'),
('Shruti Parmar', 'Shruti@example.com', 'Shruti123', '0987654321', 'Bangalore'),
('Dev Suri', 'Dev@example.com', 'Dev123', '0987654321', 'Hyderabad'),
('Anush Jain', 'Anusha@example.com', 'Anush123', '0987654321', 'Udaipur'),
('Dhairya jain', 'Dhairya@example.com', 'Dhairya123', '0987654321', 'Chennai');


-- 3(ii)
INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES
('Tanaygeet Shrivastava', 'Indore', 'Aditya Khamare', 'Pune', 5.5, 'In Transit', 'TRK123456', '2023-09-23'),
('Aditya Khamare', 'Pune', 'Tanaygeet Shrivastava', 'Indore', 3.0, 'Delivered', 'TRK654321', '2023-09-20'),
('Latashree Shrivastava', 'Delhi', 'Ravindra Bage', 'Lucknow', 7.4, 'In Transit', 'TRK456745', '2023-09-22'),
('Ravindra Bage', 'Lucknow', 'Latashree Shrivastava', 'Delhi', 6.3, 'In Transit', 'TRK534735', '2023-09-19'),
('Kritika Sinha', 'Irvine', 'Soniya Tiwari', 'Mumbai', 9.3, 'Delivered', 'TRK984274', '2023-09-24'),
('Soniya Tiwari', 'Mumbai', 'Kritika Sinha', 'Irvine', 3.8, 'Delivered', 'TRK847263', '2023-09-18'),
('Shruti Parmar', 'Bangalore', 'Dev Suri', 'Hyderabad', 8.1, 'In Transit', 'TRK204844', '2023-09-15'),
('Dev Suri', 'Hyderabad', 'Shruti Parmar', 'Bangalore', 4.5, 'Delivered', 'TRK937541', '2023-09-07'),
('Anush Jain', 'Udaipur', 'Dhairya jain', 'Chennai', 1.9, 'Delivered', 'TRK542764', '2023-09-02'),
('Dhairya jain', 'Chennai', 'Anush Jain', 'Udaipur', 2.7, 'In Transit', 'TRK431235', '2023-09-12');


-- 3(iii)
INSERT INTO CourierServices (ServiceName, Cost)
VALUES
('Standard Delivery', 50.00),
('Express Delivery', 100.00),
('Same-Day Delivery', 150.00),
('Overnight Delivery', 120.00),
('International Delivery', 200.00),
('Economy Delivery', 40.00),
('Priority Delivery', 90.00),
('Bulk Delivery', 300.00),
('Freight Delivery', 500.00),
('Next-Morning Delivery', 130.00);


-- 3(iv)
INSERT INTO Employee (Name, Email, ContactNumber, Role, Salary)
VALUES
('Pallavi', 'Pallavi@company.com', '9122334455', 'Manager', 50000.00),
('Ronak', 'Ronak@company.com', '8566778899', 'Courier', 30000.00),
('Yogesh', 'Yogesh@company.com', '9233445566', 'Warehouse Staff', 25000.00),
('Harsh', 'Harsh@company.com', '7344556677', 'HR', 45000.00),
('Anand', 'Anand@company.com', '6455667788', 'Courier', 32000.00),
('Luv', 'Luv@company.com', '9345678972', 'Customer Support', 28000.00),
('Akshita', 'Akshita@company.com', '6677889900', 'Logistics Manager', 60000.00),
('Rishab', 'Rishab@company.com', '7788990011', 'Driver', 27000.00),
('Akshat', 'Akshat@company.com', '8899001122', 'IT Support', 35000.00),
('Ashutosh', 'Ashutosh@company.com', '9900112233', 'Operations Manager', 55000.00);


-- 3(v)
INSERT INTO Location (LocationName, Address)
VALUES
('Main Warehouse', 'Saket, Indore'),
('Branch Office', 'Magarpatta, Pune'),
('Sorting Facility', 'Whitefield, Bangalore'),
('Dispatch Center', 'Kormangla, Bangalore'),
('International Hub', 'Hinjawadi, Pune'),
('Customer Pickup Point', 'Gandhi Nagar, New Delhi'),
('Delivery Office', 'Indiranagar, Hyderabad'),
('Distribution Center', 'Rajiv Circle, Lucknow'),
('Logistics Center', 'City Hall, Mumbai'),
('Remote Hub', 'Church Street, Chennai');


-- 3(vi)
INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate)
VALUES
(1, 1, 55.00, '2023-09-23'),
(2, 2, 105.00, '2023-09-20'),
(3, 3, 120.00, '2023-09-22'),
(4, 4, 95.00, '2023-09-19'),
(5, 5, 60.00, '2023-09-21'),
(6, 6, 110.00, '2023-09-18'),
(7, 7, 80.00, '2023-09-15'),
(8, 8, 115.00, '2023-09-08'),
(9, 9, 70.00, '2023-09-12'),
(10, 10, 130.00, '2023-09-04');



-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Task - 2 */


/* Schema Adjustments Needed: 
ALTER TABLE Courier
ADD COLUMN UserID INT,
ADD CONSTRAINT fk_user FOREIGN KEY (UserID) REFERENCES User(UserID);

ALTER TABLE Courier
ADD COLUMN CreatedDate DATE;

-- Updating existing records with UserID and CreatedDate
UPDATE Courier
SET UserID = 1, CreatedDate = '2023-09-20'
WHERE CourierID = 1;

UPDATE Courier
SET UserID = 2, CreatedDate = '2023-08-12'
WHERE CourierID = 2;

UPDATE Courier
SET UserID = 3, CreatedDate = '2023-09-10'
WHERE CourierID = 3;

UPDATE Courier
SET UserID = 4, CreatedDate = '2023-09-22'
WHERE CourierID = 4;

UPDATE Courier
SET UserID = 5, CreatedDate = '2023-09-15'
WHERE CourierID = 5;

UPDATE Courier
SET UserID = 1, CreatedDate = '2023-09-18'
WHERE CourierID = 6;

UPDATE Courier
SET UserID = 2, CreatedDate = '2023-08-07'
WHERE CourierID = 7;

UPDATE Courier
SET UserID = 3, CreatedDate = '2023-09-04'
WHERE CourierID = 8;

UPDATE Courier
SET UserID = 4, CreatedDate = '2023-09-23'
WHERE CourierID = 9;

UPDATE Courier
SET UserID = 5, CreatedDate = '2023-09-12'
WHERE CourierID = 10;
*/

-- 1
SELECT * FROM User;


-- 2
SELECT * FROM Courier
WHERE SenderName = 'Tanaygeet Shrivastava';


-- 3
SELECT * FROM Courier;


-- 4 
SELECT * FROM Courier
WHERE TrackingNumber = 'TRK123456';


-- 5
SELECT * FROM Courier
WHERE CourierID = 1;


-- 6
SELECT * FROM Courier
WHERE Status <> 'Delivered';


-- 7
SELECT * FROM Courier
WHERE DeliveryDate = CURDATE();


-- 8
SELECT * FROM Courier
WHERE Status = 'In Transit';


-- 9
SELECT CourierID, COUNT(*) AS TotalPackages
FROM Courier
GROUP BY CourierID;


-- 10
SELECT CourierID, AVG(DATEDIFF(DeliveryDate, CreatedDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID;


-- 11
SELECT * FROM Courier
WHERE Weight BETWEEN 3.0 AND 6.0;


-- 12
SELECT * FROM Employee
WHERE Name LIKE '%Pallavi%';


-- 13
SELECT * FROM Courier
WHERE CourierID IN (
    SELECT CourierID FROM Payment
    WHERE Amount > 50);



-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Task - 3 */

/* Schema Adjustments Needed: 
ALTER TABLE Courier
ADD COLUMN EmployeeID INT,
ADD CONSTRAINT fk_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);

ALTER TABLE Courier
ADD COLUMN LocationID INT,
ADD CONSTRAINT fk_location FOREIGN KEY (LocationID) REFERENCES Location(LocationID);

UPDATE Courier
SET EmployeeID = (SELECT EmployeeID FROM Employee WHERE Name = 'Pallavi')
WHERE EmployeeID IS NULL;

UPDATE Courier c
JOIN Payment p ON c.CourierID = p.CourierID
SET c.LocationID = p.LocationID
WHERE c.LocationID IS NULL;
*/

-- 14
SELECT EmployeeID, COUNT(*) AS TotalCouriers
FROM Courier
GROUP BY EmployeeID;


-- 15
SELECT LocationID, SUM(Amount) AS TotalRevenue
FROM Payment
GROUP BY LocationID;


-- 16
SELECT LocationID, COUNT(*) AS TotalCouriers
FROM Courier
WHERE Status = 'Delivered'
GROUP BY LocationID;


-- 17
SELECT CourierID, AVG(DATEDIFF(DeliveryDate, CreatedDate)) AS AvgDeliveryTime
FROM Courier
GROUP BY CourierID
ORDER BY AvgDeliveryTime DESC
LIMIT 1;


-- 18
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID
HAVING TotalPayments < 60; 


-- 19
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY LocationID;


-- 20
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
WHERE LocationID = 4
GROUP BY CourierID
HAVING TotalPayments > 1000;


-- 21
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
WHERE PaymentDate > '2023-09-22'
GROUP BY CourierID
HAVING TotalPayments > 1000;


-- 22
SELECT LocationID, SUM(Amount) AS TotalPayments
FROM Payment
WHERE PaymentDate < '2023-09-15'
GROUP BY LocationID
HAVING TotalPayments > 5000;



-----------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Task - 4 */

/* Schema Adjustments Needed: 
ALTER TABLE Courier
ADD COLUMN ServiceID INT,
ADD CONSTRAINT fk_service FOREIGN KEY (ServiceID) REFERENCES CourierServices(ServiceID);

ALTER TABLE Payment
ADD COLUMN EmployeeID INT,
ADD CONSTRAINT fk_employee FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID);
*/

-- 23
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;


-- 24
SELECT p.PaymentID, p.Amount, p.PaymentDate, l.*
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID;


-- 25
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.*, l.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON p.LocationID = l.LocationID;


-- 26
SELECT p.*, c.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;


-- 27
SELECT c.CourierID, SUM(p.Amount) AS TotalPayments
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
GROUP BY c.CourierID;


-- 28
SELECT *
FROM Payment
WHERE PaymentDate = '2023-09-08';


-- 29
SELECT p.PaymentID, c.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID;


-- 30
SELECT p.*, l.*
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID;


-- 31
SELECT CourierID, SUM(Amount) AS TotalPayments
FROM Payment
GROUP BY CourierID;


-- 32
SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2023-09-10' AND '2023-09-30';


-- 33
SELECT u.*, c.*
FROM User u
LEFT JOIN Courier c ON u.UserID = c.UserID;


-- 34
SELECT c.*, s.*
FROM Courier c
LEFT JOIN CourierServices s ON c.ServiceID = s.ServiceID;


-- 35
SELECT e.*, p.*
FROM Employee e
LEFT JOIN Payment p ON e.EmployeeID = p.EmployeeID;


-- 36
SELECT u.*, s.*
FROM User u
CROSS JOIN CourierServices s;


-- 37
SELECT e.*, l.*
FROM Employee e
CROSS JOIN Location l;


-- 38
SELECT c.CourierID, c.SenderName, c.SenderAddress
FROM Courier c;


-- 39
SELECT c.CourierID, c.ReceiverName, c.ReceiverAddress
FROM Courier c;


-- 40
SELECT c.*, s.*
FROM Courier c
LEFT JOIN CourierServices s ON c.ServiceID = s.ServiceID;


-- 41
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID
GROUP BY e.EmployeeID;


-- 42
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID;


-- 43
SELECT *
FROM Courier
WHERE SenderName = 'Tanaygeet Shrivastava';


-- 44
SELECT e1.*
FROM Employee e1
JOIN Employee e2 ON e1.Role = e2.Role AND e1.EmployeeID <> e2.EmployeeID;


-- 45
SELECT p.*, c.SenderAddress
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
WHERE c.SenderAddress = 'Indore';


-- 46
SELECT *
FROM Courier
WHERE SenderAddress = 'Pune';


-- 47
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalDeliveredCouriers
FROM Employee e
JOIN Courier c ON e.EmployeeID = c.EmployeeID
WHERE c.Status = 'Delivered'
GROUP BY e.EmployeeID;


-- 48
SELECT c.CourierID, c.ServiceID, SUM(p.Amount) AS TotalPayments, s.Cost
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN CourierServices s ON c.ServiceID = s.ServiceID
GROUP BY c.CourierID
HAVING TotalPayments > s.Cost;



















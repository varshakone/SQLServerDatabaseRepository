-- Courier-Management-System 
-- Task 1, 2, 3 and 4
-- By Vivek Handa

-- "Task 1"
CREATE DATABASE CourierDB;
USE CourierDB;

-- Creating tables 

CREATE TABLE [User](
	UserID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(255),
	Email VARCHAR(255) UNIQUE,
	Password VARCHAR(255),
	ContactNumber VARCHAR(20),
	Address TEXT
);

CREATE TABLE Courier (
    CourierID INT IDENTITY(1,1) PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);

CREATE TABLE CourierServices (
	ServiceID INT IDENTITY(1,1) PRIMARY KEY,
	ServiceName VARCHAR(100),
	Cost DECIMAL(8,2)
); 

CREATE TABLE Employee (
	EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(255),
	Email VARCHAR(255) UNIQUE,
	ContactNumber VARCHAR(20),
	Role VARCHAR(50),
	Salary DECIMAL(10,2)
);

CREATE TABLE Location (
	LocationID INT IDENTITY(1,1) PRIMARY KEY,
	LocationName VARCHAR(100),
	Address TEXT
);

CREATE TABLE Payment (
	PaymentID INT IDENTITY(1,1) PRIMARY KEY,
	CourierID INT,
	LocationID INT, 
	Amount DECIMAL(10,2),
	PaymentDate DATE,
	FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
	FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

-- Inserting data into tables 
INSERT INTO [User] (Name, Email, Password, ContactNumber, Address) VALUES 
('Rishabh Dhawad', 'rishabD@example.com', 'abc@123', '1234567890', '1, Shyam Nagar'),
('Shivam Katiyar', 'shivamK@example.com', 'pass456', '9876543210', '24, Rajwada Square'),
('Satyam Katiyar', 'satyamK@example.com', 'pass156', '9876513210', '24, Airport Square'),
('Akshay Chauhan', 'akshayC@example.com', 'pass446', '9276543210', '24, Ulta Square'),
('Viral Parikh', 'viralP@example.com', 'pass145', '9871543210', '24, Choithram Square'),
('Tanay Shroff', 'tanayS@example.com', 'pass496', '9816543210', '24, Sayaji Square'),
('Mayank Mourya', 'mayankM@example.com', 'pass459', '9876543210', '24, Rajmohalla Square'),
('Tanmay Chocksey', 'tanmayC@example.com', 'pass956', '9876543110', '24, Rajesh Square'),
('Umang Laad', 'umangL@example.com', 'pass256', '9876843210', '24, Vijay nagar Square'),
('Dwij Joshi', 'dwijJ@example.com', 'pass426', '9876045210', '24, Chotiwala Square')
;

INSERT INTO CourierServices (ServiceName, Cost) VALUES 
('Standard Shipping', 10),
('Express Shipping', 20),
('Same Day Delivery', 30);

INSERT INTO Employee (Name, Email, ContactNumber, Role, Salary) VALUES 
('Shruti Nigam', 'shrutiN@example.com', '1112223333', 'Courier', 35000),
('Sherya Khanna', 'sheryaK@example.com', '4445556666', 'Manager', 60000),
('Chandrika Awasthii', 'chandrikaA@example.com', '7778889999', 'Driver', 40000);

INSERT INTO Location (LocationName, Address) VALUES 
('Main Warehouse', '29, Airport Road'),
('Delivery Center', '32, Choti Gwaltoli'),
('Pickup Point', '44, Rajwada Street');

INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate)
VALUES 
('Rishabh Dhawad', '1, Shyam Nagar', 'Satyam Katiyar', '24, Airport Square', 2.50, 'In Transit', 'TRK12345', '2024-09-25'),
('Shivam Katiyar', '24, Rajwada Square', 'Akshay Chauhan', '24, Ulta Square', 1.25, 'Delivered', 'TRK67890', '2024-09-24'),
('Mayank Mourya', '24, Rajmohalla Square', 'Umang Laad', '24, Vijay nagar Square', 3.75, 'Pending', 'TRK11223', '2024-09-26');

INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate)
VALUES 
(1, 1, 100, '2024-09-20'),
(2, 2, 50, '2024-09-21'),
(3, 3, 75, '2024-09-22');

-- "Task 2"
-- 1. List all customers: 
SELECT * FROM [User];

-- 2. List all orders for a specific customer: 
SELECT * FROM Courier
WHERE SenderName = 'Rishabh Dhawad';

-- 3. List all couriers: 
SELECT * FROM Courier;

--4. List all packages for a specific order: 
SELECT * FROM Courier WHERE TrackingNumber =  'TRK12345';

-- 5. List all deliveries for a specific courier: 
SELECT * FROM Courier WHERE CourierID = 1;

-- 6. List all undelivered packages: 
SELECT * FROM Courier WHERE Status != 'Delivered';

-- 7. List all packages that are scheduled for delivery today: 
SELECT * FROM Courier WHERE DeliveryDate = CAST(GETDATE() AS DATE);

-- 8. List all packages with a specific status: 
SELECT * FROM Courier WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each courier. 
SELECT CourierID, count(*) as TotalPackages FROM Courier GROUP BY CourierID;

-- 10. Find the average delivery time for each courier 
SELECT CourierID, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM Courier GROUP BY CourierID;

-- 11. List all packages with a specific weight range: 
SELECT * FROM Courier WHERE Weight between 1.0 and 5.0;

-- 12. Retrieve employees whose names contain 'John' 
SELECT * FROM Employee WHERE Name LIKE '%Sherya%';

-- 13. Retrieve all courier records with payments greater than $50. 
Select c.* 
FROM Courier c
JOIN Payment p
ON c.CourierID = p.CourierID
WHERE p.Amount > 50

-- "Task 3"
-- 14. Find the total number of couriers handled by each employee. 
SELECT * FROM Employee
SELECT * FROM Courier

ALTER TABLE Courier ADD EmployeeID INT;
UPDATE Courier SET EmployeeID = 1 WHERE CourierID = 1;
UPDATE Courier SET EmployeeID = 2 WHERE CourierID = 2;
UPDATE Courier SET EmployeeID = 3 WHERE CourierID = 3;

SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS TotalCouriers
FROM Employee E
LEFT JOIN Courier C ON E.EmployeeID = C.EmployeeID
GROUP BY E.EmployeeID, E.Name;

--	15. Calculate the total revenue generated by each location 
SELECT * FROM Location
SELECT * FROM Payment

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

--	16. Find the total number of couriers delivered to each location. 
SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS TotalCouriers
FROM Location l
JOIN Courier c ON l.LocationID = c.CourierID
GROUP BY l.LocationID, l.LocationName;

--	17. Find the courier with the highest average delivery time: 
SELECT TOP 1 CourierID, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM Courier Group by CourierID ORDER BY AvgDeliveryTime DESC;

-- 18. Find Locations with Total Payments Less Than a Certain Amount 
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName
HAVING SUM(p.Amount) < 80; 

-- 19. Calculate Total Payments per Location 
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

-- 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = X):  
SELECT * FROM Payment;

SELECT c.CourierID, SUM(p.Amount) AS TotalPayments
FROM Courier c
JOIN Payment p ON C.CourierID = p.CourierID
WHERE p.LocationID = 2  
GROUP BY c.CourierID
HAVING SUM(P.Amount) > 80;

-- 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD')
SELECT C.CourierID, SUM(P.Amount) AS TotalPayments
FROM Courier C
JOIN Payment P ON C.CourierID = P.CourierID
WHERE P.PaymentDate > '2024-09-21'
GROUP BY C.CourierID
HAVING SUM(P.Amount) > 40;

-- 22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD')
SELECT L.LocationID, L.LocationName, SUM(P.Amount) AS TotalPayments
FROM Location L
JOIN Payment P ON L.LocationID = P.LocationID
WHERE P.PaymentDate < '2024-09-21'
GROUP BY L.LocationID, L.LocationName
HAVING SUM(P.Amount) > 40;

-- "Task 4"
-- 23. Retrieve Payments with Courier Information 
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.TrackingNumber, c.SenderName, c.ReceiverName
FROM Payment p
INNER JOIN Courier c 
ON p.CourierID = c.CourierID;

-- 24. Retrieve Payments with Location Information 
Select * from Payment;
select * from Location;

SELECT p.PaymentID, p.Amount, p.PaymentDate, l.LocationName, l.Address
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID;

-- 25. Retrieve Payments with Courier and Location Information 
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.TrackingNumber, 
c.SenderName, c.ReceiverName, l.LocationName, l.Address
FROM Payment p
INNER JOIN Courier c ON P.CourierID = c.CourierID
INNER JOIN Location l ON P.LocationID = l.LocationID;

-- 26. List all payments with courier details 
SELECT p.PaymentID, p.Amount, p.PaymentDate, c.TrackingNumber, c.SenderName, c.ReceiverName
FROM Payment p
LEFT JOIN Courier c ON p.CourierID = c.CourierID;

-- 27. Total payments received for each courier 
SELECT c.CourierID, c.TrackingNumber, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID
GROUP BY c.CourierID, c.TrackingNumber;

-- 28. List payments made on a specific date
SELECT * FROM Payment;

SELECT PaymentID, Amount, PaymentDate
FROM Payment
WHERE PaymentDate = '2024-09-20';

-- 29. Get Courier Information for Each Payment 
SELECT p.PaymentID, p.Amount, c.TrackingNumber, c.SenderName, c.ReceiverName
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID;

-- 30. Get Payment Details with Location 
SELECT p.PaymentID, p.Amount, l.LocationName, l.Address
FROM Payment p
LEFT JOIN Location l ON p.LocationID = l.LocationID;

-- 31. Calculating Total Payments for Each Courier 
SELECT c.CourierID, c.TrackingNumber, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID
GROUP BY c.CourierID, c.TrackingNumber;

-- 32. List Payments Within a Date Range 
SELECT * FROM Payment;

SELECT PaymentID, Amount, PaymentDate
FROM Payment
WHERE PaymentDate between '2024-09-20' and '2024-09-22';  

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
SELECT u.UserID, u.Name, c.CourierID, c.TrackingNumber
FROM [User] u
FULL OUTER JOIN Courier c ON u.Name = c.SenderName;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side 
SELECT * FROM Courier;
SELECT * FROM CourierServices;

SELECT c.*, cs.*
FROM Courier c
FULL OUTER JOIN CourierServices cs
ON c.CourierID = cs.ServiceID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
SELECT e.EmployeeID, e.Name, p.PaymentID, p.Amount
FROM Employee e
FULL OUTER JOIN Payment p ON e.EmployeeID = p.PaymentID;

-- 36. List all users and all courier services, showing all possible combinations. 

SELECT * FROM [User];
SELECT * FROM CourierServices;

SELECT u.UserID, u.Name, cs.ServiceID, cs.ServiceName
FROM [User] u
CROSS JOIN CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations: 
SELECT e.EmployeeID, e.Name, l.LocationID, l.LocationName
FROM Employee e
CROSS JOIN Location l;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available) 
SELECT c.CourierID, c.TrackingNumber, c.SenderName, c.SenderAddress
FROM Courier c;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available): 
SELECT c.CourierID, c.TrackingNumber, c.ReceiverName, c.ReceiverAddress
FROM Courier c;

-- 40. Retrieve a list of couriers along with the courier service details (if available): 
SELECT C.CourierID, C.TrackingNumber, C.Status, C.DeliveryDate
FROM Courier C;
SELECT CS.ServiceID, CS.ServiceName, CS.Cost
FROM CourierServices CS;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee: 
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID
GROUP BY e.EmployeeID, e.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location: 
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName). 
SELECT SenderName, COUNT(CourierID) AS TotalCouriers
FROM Courier
GROUP BY SenderName

-- 44. List all employees who share the same role. 
SELECT Role, COUNT(EmployeeID) AS TotalEmployees
FROM Employee
GROUP BY Role

-- 45. Retrieve all payments made for couriers sent from the same location. 
SELECT p.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON c.CourierID = l.LocationID
GROUP BY l.LocationID, p.PaymentID, p.CourierID, p.LocationID, p.Amount, p.PaymentDate;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT * FROM Courier;

SELECT *
FROM Courier c
WHERE SenderAddress LIKE '1, Shyam Nagar%'

-- 47. List employees and the number of couriers they have delivered: 
SELECT E.EmployeeID, E.Name, COUNT(C.CourierID) AS DeliveredCouriers
FROM Employee E
LEFT JOIN Courier C ON E.EmployeeID = C.EmployeeID
GROUP BY E.EmployeeID, E.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services 
SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN CourierServices cs ON c.CourierID = cs.ServiceID
WHERE p.Amount > cs.Cost

-- "Extra"
-- 49. Find couriers that have a weight greater than the average weight of all couriers 
SELECT CourierID, TrackingNumber, Weight
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary: 
SELECT Name, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT SUM(Cost) AS TotalCost
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

-- 52. Find all couriers that have been paid for 
SELECT C.CourierID, C.TrackingNumber, P.Amount
FROM Courier C
INNER JOIN Payment P ON C.CourierID = P.CourierID;

-- 53. Find the locations where the maximum payment amount was made 
SELECT L.LocationID, L.LocationName, P.Amount
FROM Payment P
INNER JOIN Location L ON P.LocationID = L.LocationID
WHERE P.Amount = (SELECT MAX(Amount) FROM Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName')
SELECT * FROM Courier;

SELECT CourierID, TrackingNumber, Weight
FROM Courier
WHERE Weight > ALL (
    SELECT Weight
    FROM Courier
    WHERE SenderName = 'Shivam Katiyar'
);




























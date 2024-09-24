
CREATE DATABASE ABC;

USE ABC;
CREATE TABLE Users(
  UserID INT PRIMARY KEY IDENTITY (1,1),
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE NOT NULL,
  Password VARCHAR(255) NOT NULL,
  ContactNumber VARCHAR(20),
  Address TEXT
);

INSERT INTO Users(Name, Email, Password, ContactNumber, Address)
VALUES 
('John Doe', 'johndoe@example.com', 'password123', '123-456-7890', '123 Main St'),
('Jane Smith', 'janesmith@example.com', 'password456', '987-654-3210', '456 Elm St'),
('Bob Johnson', 'bobjohnson@example.com', 'password789', '555-123-4567', '789 Oak St'),
('Alice Williams', 'alicewilliams@example.com', 'password012', '111-222-3333', '123 Maple St'),
('Mike Davis', 'mikedavis@example.com', 'password345', '444-555-6666', '456 Pine St');

SELECT * FROM Users;

CREATE TABLE Courier (
  CourierID INT PRIMARY KEY,
  SenderName VARCHAR(255) NOT NULL,
  SenderAddress TEXT NOT NULL,
  ReceiverName VARCHAR(255) NOT NULL,
  ReceiverAddress TEXT NOT NULL,
  Weight DECIMAL(5, 2) NOT NULL,
  Status VARCHAR(50) NOT NULL DEFAULT 'Pending',
  TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
  DeliveryDate DATE
);

INSERT INTO Courier (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, TrackingNumber, DeliveryDate)
VALUES 
(1, 'John Doe', '123 Main St, New York', 'Jane Smith', '456 Elm St, Chicago', 2.50, 'CTR001', '2024-03-15'),
(2, 'Bob Johnson', '789 Oak St, Los Angeles', 'Alice Williams', '901 Maple St, Miami', 1.75, 'CTR002', '2024-03-20'),
(3, 'Mike Davis', '345 Pine St, Houston', 'Emily Chen', '678 Cedar St, Seattle', 3.25, 'CTR003', '2024-03-25'),
(4, 'Sarah Lee', '567 Spruce St, Phoenix', 'David Kim', '890 Walnut St, Boston', 2.00, 'CTR004', '2024-04-01'),
(5, 'Kevin Brown', '345 Cedar St, Denver', 'Lisa Nguyen', '678 Fir St, Dallas', 1.50, 'CTR005', '2024-04-05');

SELECT * From Courier;

CREATE TABLE CourierServices (
ServiceID INT PRIMARY KEY,
ServiceName VARCHAR(100) NOT NULL UNIQUE,
Cost DECIMAL(8, 2) NOT NULL CHECK (Cost >= 0)
);

INSERT INTO CourierServices (ServiceID, ServiceName, Cost)
VALUES 
(1, 'Express Delivery', 25.00),
(2, 'Standard Delivery', 15.00),
(3, 'Same-Day Delivery', 50.00),
(4, 'Overnight Delivery', 30.00),
(5, 'International Delivery', 100.00);

SELECT * FROM CourierServices;

CREATE TABLE Employee (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  Email VARCHAR(255) UNIQUE NOT NULL,
  ContactNumber VARCHAR(20) NOT NULL,
  Role VARCHAR(50) NOT NULL,
  Salary DECIMAL(10, 2) NOT NULL
);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary)
VALUES 
(1, 'Rahul Sharma', 'rahul.sharma@example.com', '9988776655', 'Manager', 600000.00),
(2, 'Priya Patel', 'priya.patel@example.com', '7778844555', 'Software Engineer', 450000.00),
(3, 'Rajesh Kumar', 'rajesh.kumar@example.com', '9665443322', 'Sales Manager', 550000.00),
(4, 'Sonia Singh', 'sonia.singh@example.com', '8222333444', 'Marketing Manager', 500000.00),
(5, 'Amit Gupta', 'amit.gupta@example.com', '9990088777', 'Financial Analyst', 400000.00);

SELECT * FROM Employee;

CREATE TABLE Location (
  LocationID INT PRIMARY KEY,
  LocationName VARCHAR(100) NOT NULL,
  Address TEXT NOT NULL
);

INSERT INTO Location (LocationID, LocationName, Address)
VALUES
(1, 'Mumbai Warehouse', '123, Industrial Estate, Mumbai, Maharashtra 400093'),
(2, 'Delhi Office', '456, Connaught Place, New Delhi, Delhi 110001'),
(3, 'Bangalore Hub', '789, Outer Ring Road, Bangalore, Karnataka 560103'),
(4, 'Chennai Distribution Center', '901, Anna Salai, Chennai, Tamil Nadu 600002'),
(5, 'Hyderabad Logistics Hub', '234, Hitech City, Hyderabad, Telangana 500081');

SELECT * FROM Location;

CREATE TABLE Payment (
  PaymentID INT PRIMARY KEY,
  CourierID INT NOT NULL,
  LocationID INT NOT NULL,
  Amount DECIMAL(10, 2) NOT NULL,
  PaymentDate DATE NOT NULL,
  FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
  FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);

INSERT INTO Payment (PaymentID, CourierID, LocationID, Amount, PaymentDate)
VALUES 
(1, 1, 1, 500.00, '2024-03-15'),
(2, 2, 2, 750.00, '2024-03-20'),
(3, 3, 3, 300.00, '2024-03-25'),
(4, 4, 4, 400.00, '2024-04-01'),
(5, 5, 5, 600.00, '2024-04-05');

SELECT * FROM Payment;

--TASK 2

--1
SELECT * FROM Users;

--2
SELECT CourierID AS OrderID, SenderName AS CustomerName, ReceiverName AS RecipientName, Weight, TrackingNumber, DeliveryDate
FROM Courier 
WHERE SenderName = 'John Doe' 
   OR ReceiverName = 'John Doe';

--3
SELECT * FROM Courier;

--4
SELECT * 
FROM Courier 
WHERE CourierID = 2;

--5
SELECT * 
FROM Courier 
WHERE CourierID = '3';

--6
SELECT * 
FROM Courier 
WHERE DeliveryDate IS NULL;

--7
SELECT * 
FROM Courier 
WHERE DeliveryDate = CONVERT(date, GETDATE());

--8
SELECT *
FROM Courier
WHERE Status = 'Pending';

--9
SELECT CourierID, COUNT(*) AS TotalPackages
FROM Courier
GROUP BY CourierID;

--10

--11
SELECT *
FROM Courier
WHERE Weight BETWEEN 2.5 AND 3.5;

--12
SELECT *
FROM Users
WHERE Name LIKE '%John%';

--13
SELECT *
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;

-- Task 3
--14
SELECT e.EmployeeID,e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

--15
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Location l
JOIN Payment p ON l.LocationID = P.LocationID
GROUP BY l.LocationID,  l.LocationName;

--16
SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS TotalCouriers
FROM Location l
JOIN Courier c ON l.LocationID = c.CourierID
GROUP BY l.LocationID, l.LocationName;

--17

--18
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName
HAVING SUM(p.Amount) < '600';

--19
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

--20
 --Retrieve couriers who have received payments totaling more than $1000 in a specific location 
--(LocationID = X):  
SELECT c.CourierID, SUM(p.Amount) AS TotalPayment
FROM Courier c
JOIN Payment p ON c.CourierID = p.PaymentID
WHERE p.LocationID = '4'
GROUP BY c.CourierID
HAVING SUM(p.Amount) > 300;

--21
-- Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > 'YYYY-MM-DD'):
SELECT c.CourierID, SUM(p.Amount) AS TotalPayments
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE  p.PaymentDate > '2024-03-15'
GROUP BY c.CourierID
HAVING  SUM(p.Amount) > 500;

--22
-- Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate > 'YYYY-MM-DD') 
SELECT l.LocationID, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.PaymentDate > '2024-03-20'
GROUP BY l.LocationID
HAVING SUM(p.Amount) > 500;

--TASK 4
--23 Retrieve Payments with Courier Information 
USE ABC
SELECT c.*, p.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID;

--24. Retrieve Payments with Location Information 
SELECT p.* , l.*
FROM Payment p
JOIN Location l ON p.PaymentID = l.LocationID;

--25. Retrieve Payments with Courier and Location Information 
SELECT p.*, c.*, l.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON p.LocationID = l.LocationID;

--26. List all payments with courier details  
SELECT p.* , c.*
FROM Payment p 
LEFT OUTER JOIN Courier c ON p.PaymentID = c.CourierID;

--27. Total payments received for each courier  
SELECT c.CourierID , SUM(p.Amount) AS TotalPayment
FROM Payment p
JOIN Courier c ON p.PaymentID = c.CourierID 
GROUP BY c.CourierID;

--28. List payments made on a specific date  
SELECT *
FROM Payment
WHERE PaymentDate = '2024-04-01';

-- 29, 30, 31 are repeated queries

--32. List Payments Within a Date Range 
SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2024-03-01' AND '2024-04-01';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side 
SELECT u.*, c.*
FROM Users u
FULL OUTER JOIN Courier c ON u.UserID = c.CourierID;
  
--34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT c.*,  cs.*
FROM Courier c
FULL OUTER JOIN CourierServices cs ON c.CourierID = cs.ServiceID;

--35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side  
SELECT e.*,  p.*
FROM Employee e
FULL OUTER JOIN Payment p ON e.EmployeeID = p.PaymentID;

--36. List all users and all courier services, showing all possible combinations. 
SELECT u.*, cs.*
FROM Users u
CROSS JOIN CourierServices cs;

--37. List all employees and all locations, showing all possible combinations:  
SELECT e.*,  l.*
FROM Employee e
CROSS JOIN Location l;

--38. Retrieve a list of couriers and their corresponding sender information (if available)  
SELECT c.CourierID, c.SenderName, c.SenderAddress, p.PaymentID, p.Amount, p.PaymentDate
FROM Courier c
JOIN Payment p ON c.CourierID = p.PaymentID;

--39. Retrieve a list of couriers and their corresponding receiver information (if available):  
SELECT c.CourierID, c.ReceiverName, c.ReceiverAddress, p.PaymentID, p.Amount, p.PaymentDate
FROM Courier c
JOIN Payment p ON c.CourierID = p.PaymentID;

--40. Retrieve a list of couriers along with the courier service details (if available): 
SELECT c.* , cs.*
FROM Courier c
JOIN CourierServices cs ON c.CourierID =cs.ServiceID;

--41. Retrieve a list of employees and the number of couriers assigned to each employee:  
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
LEFT JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

--42. Retrieve a list of locations and the total payment amount received at each location:  
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

--43. Retrieve all couriers sent by the same sender (based on SenderName).  
SELECT *
FROM Courier c
WHERE SenderName = 'Sarah Lee';

--44. List all employees who share the same role. 
SELECT DISTINCT e1.EmployeeID, e1.Name, e1.Role
FROM Employee e1
JOIN Employee e2 ON e1.Role = e2.Role
WHERE e1.EmployeeID != e2.EmployeeID;
-- No employees share the same role

--45. Retrieve all payments made for couriers sent from the same location.  
SELECT p.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON c.CourierID = l.LocationID
GROUP BY l.LocationID, p.PaymentID, p.CourierID, p.LocationID, p.Amount, p.PaymentDate;

--46. Retrieve all couriers sent from the same location (based on SenderAddress):
SELECT *
FROM Courier c
WHERE SenderAddress LIKE '345 Pine%'

--47. List employees and the number of couriers they have delivered:
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalDelivered
FROM Employee e
JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

--48. 48. Find couriers that were paid an amount greater than the cost of their respective courier services
SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN CourierServices cs ON c.CourierID = cs.ServiceID
WHERE p.Amount > cs.Cost

--49. find couriers that have a weight greater than the average weight of all couriers
SELECT *
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

--50. Find the names of all employees who have a salary greater than the average salary
SELECT Name, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

--51. Find the total cost of all courier services where the cost is less than the maximum cost 
SELECT ServiceName, SUM(Cost) AS COST
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)
GROUP BY ServiceName;

--52. Find all couriers that have been paid for  
SELECT *
FROM Courier
WHERE CourierID IN (SELECT CourierID FROM Payment);

--53. Find the locations where the maximum payment amount was made  
SELECT p.LocationID, l.LocationName
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
WHERE Amount = (SELECT MAX (Amount) FROM Payment);

--54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'): 
SELECT *
FROM Courier
WHERE Weight > ALL (SELECT Weight FROM Courier WHERE SenderName = 'Sarah Lee');

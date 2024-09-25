CREATE DATABASE couriermanagementsystem;
USE couriermanagementsystem;

-- User Table
CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Address TEXT NOT NULL
);

-- Courier Table
CREATE TABLE Couriers (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255) NOT NULL,
    SenderAddress TEXT NOT NULL,
    ReceiverName VARCHAR(255) NOT NULL,
    ReceiverAddress TEXT NOT NULL,
    Weight DECIMAL(5, 2) NOT NULL,
    Status VARCHAR(50) NOT NULL,
    TrackingNumber VARCHAR(20) UNIQUE NOT NULL,
    DeliveryDate DATE NOT NULL
);

-- CourierServices Table
CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100) NOT NULL,
    Cost DECIMAL(8, 2) NOT NULL
);

-- Employee Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    ContactNumber VARCHAR(20) NOT NULL,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL
);

-- Location Table
CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100) NOT NULL,
    Address TEXT NOT NULL
);

-- Payment Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

-- Inserting data into Users table
INSERT INTO Users (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1, 'Aarav Sharma', 'aarav.sharma@example.com', 'password123', '9876543210', '1234, MG Road, Bangalore'),
(2, 'Vihaan Gupta', 'vihaan.gupta@example.com', 'password123', '8765432109', '5678, 2nd Main, Delhi'),
(3, 'Aditya Verma', 'aditya.verma@example.com', 'password123', '9988776655', '910, 3rd Cross, Mumbai');

-- Inserting data into Couriers table
INSERT INTO Couriers (CourierID, SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) VALUES
(1, 'Rahul Singh', '34, 1st Block, Hyderabad', 'Priya Desai', '56, 2nd Block, Chennai', 1.50, 'In Transit', 'TRACK123', '2024-10-01'),
(2, 'Neha Reddy', '78, 3rd Street, Pune', 'Karan Mehta', '90, 4th Avenue, Kolkata', 2.00, 'Delivered', 'TRACK456', '2024-09-25'),
(3, 'Ravi Kumar', '12, 5th Lane, Ahmedabad', 'Sneha Joshi', '45, 6th Road, Surat', 3.00, 'Pending', 'TRACK789', '2024-10-05');

-- Inserting data into CourierServices table
INSERT INTO CourierServices (ServiceID, ServiceName, Cost) VALUES
(1, 'Standard Delivery', 100.00),
(2, 'Express Delivery', 250.00),
(3, 'Same Day Delivery', 500.00);

-- Inserting data into Employees table
INSERT INTO Employees (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(1, 'Sita Iyer', 'sita.iyer@example.com', '9898989898', 'Manager', 60000.00),
(2, 'Rohan Pillai', 'rohan.pillai@example.com', '9789789789', 'Courier Agent', 30000.00),
(3, 'Aisha Khan', 'aisha.khan@example.com', '9669669669', 'Operations', 40000.00);

-- Inserting data into Locations table
INSERT INTO Locations (LocationID, LocationName, Address) VALUES
(1, 'Bangalore', 'City Center, MG Road, Bangalore'),
(2, 'Mumbai', 'Marine Drive, Mumbai'),
(3, 'Delhi', 'Connaught Place, Delhi');

-- Inserting data into Payments table
INSERT INTO Payments (PaymentID, CourierID, LocationID, Amount, PaymentDate) VALUES
(1, 1, 1, 100.00, '2024-09-20'),
(2, 2, 2, 250.00, '2024-09-22'),
(3, 3, 3, 300.00, '2024-09-24');
USE couriermanagementsystem;

-- 1. List all customers:
SELECT * FROM Users;

-- 2. List all orders for a specific customer:
SELECT * FROM Couriers WHERE SenderName = 'Rahul Singh';

-- 3. List all couriers:
SELECT * FROM Couriers;

-- 4. List all payments for a specific order:
SELECT * FROM Payments WHERE CourierID = 1;

-- 5. List all deliveries for a specific courier:
SELECT * FROM Couriers WHERE CourierID = 1;

-- 6. List all undelivered packages:
SELECT * FROM Couriers WHERE Status <> 'Delivered';

-- 7. List all packages that are scheduled for delivery on a specific date:
SELECT * FROM Couriers WHERE DeliveryDate = '2024-10-01';

-- 8. List all packages with a specific status:
SELECT * FROM Couriers WHERE Status = 'In Transit';

-- 9. Calculate the total number of packages for each sender:
SELECT SenderName, COUNT(*) AS TotalPackages 
FROM Couriers 
GROUP BY SenderName;

-- 10. Find the average delivery time for each courier:
SELECT SenderName, AVG(DATEDIFF(DAY, DeliveryDate, GETDATE())) AS AverageDeliveryTime
FROM Couriers
GROUP BY SenderName;

-- 11. List all packages with a specific weight range:
SELECT * FROM Couriers WHERE Weight BETWEEN 1.00 AND 3.00;

-- 12. Retrieve employees whose names contain 'Sita':
SELECT * FROM Employees WHERE Name LIKE '%Sita%';

-- 13. Retrieve all courier records with payments greater than $50:
SELECT Couriers.* 
FROM Couriers
JOIN Payments ON Couriers.CourierID = Payments.CourierID 
WHERE Payments.Amount > 50;

-- 14. Find the total number of couriers handled by each employee:
SELECT Employees.Name, COUNT(Couriers.CourierID) AS TotalCouriers
FROM Employees
LEFT JOIN Couriers ON Employees.EmployeeID = Couriers.EmployeeID
GROUP BY Employees.Name;

ALTER TABLE Couriers ADD EmployeeID INT;


-- 15. Calculate the total revenue generated by each location:
SELECT Locations.LocationName, SUM(Payments.Amount) AS TotalRevenue
FROM Locations
JOIN Payments ON Locations.LocationID = Payments.LocationID
GROUP BY Locations.LocationName;

-- 16. Find the total number of couriers delivered to each location:
SELECT Locations.LocationName, COUNT(Couriers.CourierID) AS TotalDelivered
FROM Locations
JOIN Payments ON Locations.LocationID = Payments.LocationID
JOIN Couriers ON Couriers.CourierID = Payments.CourierID
WHERE Couriers.Status = 'Delivered'
GROUP BY Locations.LocationName;

-- 17. Find the courier with the highest average delivery time:
SELECT TOP 1 CourierID, AVG(DATEDIFF(DAY, DeliveryDate, GETDATE())) AS AvgDeliveryTime
FROM Couriers
GROUP BY CourierID
ORDER BY AvgDeliveryTime DESC;

-- 18. Find locations with total payments less than a certain amount:
SELECT Locations.LocationName, SUM(Payments.Amount) AS TotalPayments
FROM Locations
JOIN Payments ON Locations.LocationID = Payments.LocationID
GROUP BY Locations.LocationName
HAVING SUM(Payments.Amount) < 5000;

-- 19. Calculate total payments per location:
SELECT Locations.LocationName, SUM(Payments.Amount) AS TotalPayments
FROM Locations
JOIN Payments ON Locations.LocationID = Payments.LocationID
GROUP BY Locations.LocationName;

-- 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location (LocationID = 1):
SELECT Couriers.*
FROM Couriers
JOIN Payments ON Couriers.CourierID = Payments.CourierID
WHERE Payments.LocationID = 1
GROUP BY Couriers.CourierID
HAVING SUM(Payments.Amount) > 1000;

-- 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date (PaymentDate > '2024-01-01'):
SELECT Couriers.*
FROM Couriers
JOIN Payments ON Couriers.CourierID = Payments.CourierID
WHERE Payments.PaymentDate > '2024-09-24'                      
GROUP BY Couriers.CourierID
HAVING SUM(Payments.Amount) > 1000;

-- 22. Retrieve locations where the total amount received is more than $5000 before a certain date (PaymentDate < '2024-01-01'):
SELECT Locations.LocationName, SUM(Payments.Amount) AS TotalPayments
FROM Locations
JOIN Payments ON Locations.LocationID = Payments.LocationID
WHERE Payments.PaymentDate < '2024-09-24'
GROUP BY Locations.LocationName
HAVING SUM(Payments.Amount) > 1;

-- 23. Retrieve Payments with Courier Information:
SELECT Payments.*, Couriers.*
FROM Payments
INNER JOIN Couriers ON Payments.CourierID = Couriers.CourierID;

-- 24. Retrieve Payments with Location Information:
SELECT Payments.*, Locations.*
FROM Payments
INNER JOIN Locations ON Payments.LocationID = Locations.LocationID;

-- 25. Retrieve Payments with Courier and Location Information:
SELECT Payments.*, Couriers.*, Locations.*
FROM Payments
INNER JOIN Couriers ON Payments.CourierID = Couriers.CourierID
INNER JOIN Locations ON Payments.LocationID = Locations.LocationID;

-- 26. List all payments with courier details:
SELECT Payments.*, Couriers.*
FROM Payments
LEFT JOIN Couriers ON Payments.CourierID = Couriers.CourierID;

-- 27. Total payments received for each courier:
SELECT Couriers.CourierID, SUM(Payments.Amount) AS TotalPayments
FROM Couriers
LEFT JOIN Payments ON Couriers.CourierID = Payments.CourierID
GROUP BY Couriers.CourierID;

-- 28. List payments made on a specific date:
SELECT * FROM Payments WHERE PaymentDate = '2024-09-20';

-- 29. Get Courier Information for Each Payment:
SELECT Payments.*, Couriers.*
FROM Payments
INNER JOIN Couriers ON Payments.CourierID = Couriers.CourierID;

-- 30. Get Payment Details with Location:
SELECT Payments.*, Locations.*
FROM Payments
INNER JOIN Locations ON Payments.LocationID = Locations.LocationID;

-- 31. Calculating Total Payments for Each Courier:
SELECT Couriers.CourierID, SUM(Payments.Amount) AS TotalPayments
FROM Couriers
LEFT JOIN Payments ON Couriers.CourierID = Payments.CourierID
GROUP BY Couriers.CourierID;

-- 32. List Payments Within a Date Range:
SELECT * FROM Payments WHERE PaymentDate BETWEEN '2024-09-20' AND '2024-09-30';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side:
SELECT Users.*, Couriers.*
FROM Users
LEFT JOIN Couriers ON Users.Name = Couriers.SenderName;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side:
SELECT Couriers.*, CourierServices.*
FROM Couriers
LEFT JOIN CourierServices ON Couriers.CourierID = CourierServices.ServiceID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side:
SELECT Employees.*, Payments.*
FROM Employees
LEFT JOIN Payments ON Employees.EmployeeID = Payments.CourierID;

-- 36. List all users and all courier services, showing all possible combinations:
SELECT Users.*, CourierServices.*
FROM Users
CROSS JOIN CourierServices;

-- 37. List all employees and all locations, showing all possible combinations:
SELECT Employees.*, Locations.*
FROM Employees
CROSS JOIN Locations;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available):
SELECT Couriers.*, Users.Name AS SenderName
FROM Couriers
LEFT JOIN Users ON Couriers.SenderName = Users.Name;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available):
SELECT Couriers.*, Users.Name AS ReceiverName
FROM Couriers
LEFT JOIN Users ON Couriers.ReceiverName = Users.Name;

-- 40. Retrieve a list of couriers along with the courier service details (if available):
SELECT Couriers.*, CourierServices.*
FROM Couriers
LEFT JOIN CourierServices ON Couriers.CourierID = CourierServices.ServiceID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee:
SELECT Employees.Name, COUNT(Couriers.CourierID) AS TotalCouriers
FROM Employees              
LEFT JOIN Couriers ON Employees.EmployeeID = Couriers.EmployeeID   
GROUP BY Employees.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location:
SELECT Locations.LocationName, SUM(Payments.Amount) AS TotalPayments
FROM Locations
LEFT JOIN Payments ON Locations.LocationID = Payments.LocationID
GROUP BY Locations.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName):
SELECT * FROM Couriers WHERE SenderName = 'Rahul Singh';

-- 44. List all employees who share the same role:
SELECT * FROM Employees WHERE Role = 'Courier Agent';

-- 45. Retrieve all payments made for couriers sent from the same location:
SELECT Payments.*
FROM Payments
JOIN Couriers ON Payments.CourierID = Couriers.CourierID
WHERE CAST(Couriers.SenderAddress AS VARCHAR(255)) = '34, 1st Block, Hyderabad';


-- 46. Retrieve all couriers sent from the same location (based on SenderAddress):          
SELECT *
FROM Couriers
WHERE CAST(SenderAddress AS VARCHAR(MAX)) = '34, 1st Block, Hyderabad';


-- 47. List employees and the number of couriers they have delivered:
SELECT Employees.Name, COUNT(Couriers.CourierID) AS TotalDelivered
FROM Employees
JOIN Couriers ON Employees.EmployeeID = Couriers.EmployeeID                          
WHERE Couriers.Status = 'Delivered'
GROUP BY Employees.Name;

-- 48. Count the total number of payments made on a specific date:
SELECT COUNT(*) AS TotalPayments
FROM Payments WHERE PaymentDate = '2024-09-20';

-- 49. Find the total revenue generated from all payments:
SELECT SUM(Amount) AS TotalRevenue FROM Payments;

-- 50. Retrieve the last payment made by each courier:
SELECT *
FROM (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY CourierID ORDER BY PaymentDate DESC) AS rn
    FROM Payments
) AS sub
WHERE rn = 1;

-- 51. Find the average payment amount made by each location:
SELECT Locations.LocationName, AVG(Payments.Amount) AS AveragePayment
FROM Locations
JOIN Payments ON Locations.LocationID = Payments.LocationID
GROUP BY Locations.LocationName;

-- List all employees who have not delivered any couriers:
SELECT Employees.*
FROM Employees
LEFT JOIN Couriers ON Employees.EmployeeID = Couriers.AssignedEmployeeID	
WHERE Couriers.CourierID IS NULL;


-- 53. Find the most frequently used sender:
SELECT TOP 1 SenderName, COUNT(*) AS Frequency
FROM Couriers
GROUP BY SenderName
ORDER BY Frequency DESC;

-- 54. Find the courier that has the highest payment:
SELECT TOP 1 Couriers.CourierID, SUM(Payments.Amount) AS TotalPayment
FROM Couriers
JOIN Payments ON Couriers.CourierID = Payments.CourierID
GROUP BY Couriers.CourierID
ORDER BY TotalPayment DESC;


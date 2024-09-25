-- Drop existing tables if they exist
DROP TABLE IF EXISTS Transactions;  
DROP TABLE IF EXISTS Packages;      
DROP TABLE IF EXISTS Requests;      
DROP TABLE IF EXISTS Deliverers;    
DROP TABLE IF EXISTS Clients;       

-- Create Clients table
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);

-- Create Deliverers table
CREATE TABLE Deliverers (
    DelivererID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(100) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    VehicleType VARCHAR(50),
    Status VARCHAR(20) CHECK (Status IN ('Active', 'Inactive'))
);

-- Create Requests table
CREATE TABLE Requests (
    RequestID INT PRIMARY KEY IDENTITY(1,1),
    ClientID INT FOREIGN KEY REFERENCES Clients(ClientID),
    RequestDate DATETIME DEFAULT GETDATE(),
    Status VARCHAR(20) CHECK (Status IN ('Pending', 'Shipped', 'Delivered'))
);

-- Create Packages table
CREATE TABLE Packages (
    PackageID INT PRIMARY KEY IDENTITY(1,1),
    RequestID INT FOREIGN KEY REFERENCES Requests(RequestID),
    Weight DECIMAL(10,2),
    Dimensions VARCHAR(50),
    DelivererID INT FOREIGN KEY REFERENCES Deliverers(DelivererID),
    Status VARCHAR(20) CHECK (Status IN ('In Transit', 'Delivered', 'Returned')),
    DeliveryDate DATE  -- Added DeliveryDate here
);

-- Create Transactions table
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    PackageID INT FOREIGN KEY REFERENCES Packages(PackageID),
    Amount DECIMAL(10,2),
    TransactionDate DATETIME DEFAULT GETDATE(),
    PaymentMethod VARCHAR(50) CHECK (PaymentMethod IN ('Credit Card', 'Cash', 'PayPal'))
);

-- Insert sample data into Clients
INSERT INTO Clients (Name, Phone, Email, Address) VALUES
('Alice Johnson', '123-456-7890', 'alice@example.com', '123 Elm St'),
('Bob Smith', '234-567-8901', 'bob@example.com', '456 Oak St'),
('Charlie Brown', '345-678-9012', 'charlie@example.com', '789 Pine St'),
('Diana Prince', '456-789-0123', 'diana@example.com', '101 Maple Ave'),
('Ethan Hunt', '567-890-1234', 'ethan@example.com', '202 Birch Rd'),
('Fiona Gallagher', '678-901-2345', 'fiona@example.com', '303 Cedar Blvd');

-- Insert sample data into Deliverers
INSERT INTO Deliverers (Name, Phone, Email, VehicleType, Status) VALUES
('David Williams', '456-789-0123', 'david@example.com', 'Bike', 'Active'),
('Eva Green', '567-890-1234', 'eva@example.com', 'Van', 'Active'),
('George Martin', '678-901-2345', 'george@example.com', 'Truck', 'Inactive'),
('Hannah Lee', '789-012-3456', 'hannah@example.com', 'Motorcycle', 'Active'),
('Ian Malcolm', '890-123-4567', 'ian@example.com', 'Bicycle', 'Inactive'),
('Jack Sparrow', '901-234-5678', 'jack@example.com', 'Ship', 'Active');

-- Insert sample data into Requests
INSERT INTO Requests (ClientID, RequestDate, Status) VALUES
(1, GETDATE(), 'Pending'),
(2, GETDATE(), 'Shipped'),
(3, GETDATE(), 'Delivered'),
(4, GETDATE(), 'Pending'),
(5, GETDATE(), 'Shipped'),
(6, GETDATE(), 'Pending');

-- Insert sample data into Packages
INSERT INTO Packages (RequestID, Weight, Dimensions, DelivererID, Status) VALUES
(1, 5.0, '10x10x10', 1, 'In Transit'),
(2, 2.5, '5x5x5', 2, 'Delivered'),
(3, 3.0, '8x8x8', 1, 'In Transit'),
(4, 1.5, '6x6x6', 2, 'In Transit'),
(5, 4.0, '12x12x12', 1, 'In Transit'),
(6, 2.0, '7x7x7', 2, 'Returned');

-- Insert sample data into Transactions
INSERT INTO Transactions (PackageID, Amount, TransactionDate, PaymentMethod) VALUES
(1, 25.00, GETDATE(), 'Credit Card'),
(2, 15.00, GETDATE(), 'Cash'),
(3, 30.00, GETDATE(), 'PayPal'),
(4, 20.00, GETDATE(), 'Credit Card'),
(5, 50.00, GETDATE(), 'Cash'),
(6, 18.00, GETDATE(), 'PayPal');

-- Queries to retrieve various information

-- 1. List all customers:
SELECT * FROM Clients;

-- 2. List all orders for a specific customer (replace ClientID = 1 with actual ID):
SELECT * FROM Requests WHERE ClientID = 1;  -- Replace 1 with the actual ClientID

-- 3. List all couriers (deliverers):
SELECT * FROM Deliverers;

-- 4. List all packages for a specific order (replace RequestID = 1 with actual ID):
SELECT * FROM Packages WHERE RequestID = 1;  -- Replace 1 with the actual RequestID

-- 5. List all deliveries for a specific courier (replace DelivererID = 1 with actual ID):
SELECT * FROM Packages WHERE DelivererID = 1;  -- Replace 1 with the actual DelivererID

-- 6. List all undelivered packages (i.e., Status is not 'Delivered'):
SELECT * FROM Packages WHERE Status <> 'Delivered';

-- 7. List all packages scheduled for delivery today:
SELECT * FROM Packages WHERE DeliveryDate = CAST(GETDATE() AS DATE);

-- 8. List all packages with a specific status (replace 'In Transit' with the desired status):
SELECT * FROM Packages WHERE Status = 'In Transit';  -- Replace 'In Transit' with the actual status you are interested in

-- 9. Calculate the total number of packages for each courier:
SELECT DelivererID, COUNT(*) AS TotalPackages FROM Packages GROUP BY DelivererID;

-- 10. Find the average delivery time (in days) for each courier:
SELECT P.DelivererID, AVG(DATEDIFF(DAY, R.RequestDate, P.DeliveryDate)) AS AverageDeliveryTime
FROM Packages P
JOIN Requests R ON P.RequestID = R.RequestID
WHERE P.DeliveryDate IS NOT NULL
GROUP BY P.DelivererID;

-- 11. List all packages with a specific weight range (replace 1.0 and 5.0 with desired range):
SELECT * FROM Packages WHERE Weight BETWEEN 1.0 AND 5.0;  -- Replace with actual weight range

-- 12. Retrieve employees (deliverers) whose names contain 'John':
SELECT * FROM Deliverers WHERE Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50:
SELECT D.* FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
JOIN Transactions T ON P.PackageID = T.PackageID
WHERE T.Amount > 50;

-- 14. Find the total number of couriers handled by each employee (deliverer):
SELECT D.DelivererID, D.Name, COUNT(*) AS TotalCouriersHandled
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
GROUP BY D.DelivererID, D.Name;

-- 15. Calculate the total revenue generated by each deliverer
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalRevenue
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY D.DelivererID, D.Name;

-- 16. Find the total number of packages delivered by each deliverer
SELECT D.DelivererID, 
       D.Name, 
       COUNT(P.PackageID) AS TotalPackagesDelivered
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
WHERE P.Status = 'Delivered'
GROUP BY D.DelivererID, D.Name;

-- 17. Find the deliverer with the highest average delivery time
SELECT TOP 1 D.DelivererID, 
              D.Name, 
              AVG(DATEDIFF(DAY, R.RequestDate, P.DeliveryDate)) AS AvgDeliveryTime
FROM Packages P
JOIN Requests R ON P.RequestID = R.RequestID
JOIN Deliverers D ON P.DelivererID = D.DelivererID
WHERE P.DeliveryDate IS NOT NULL
GROUP BY D.DelivererID, D.Name
ORDER BY AvgDeliveryTime DESC;

-- 18. Find total payments received less than a certain amount by deliverers
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalPayments
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY D.DelivererID, D.Name
HAVING SUM(T.Amount) < 2000;  -- Replace 2000 with the desired amount

-- 19. Calculate total payments received by each deliverer
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalPayments
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY D.DelivererID, D.Name;

-- 20. Retrieve deliverers who have received payments totaling more than $1000
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalPayments
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY D.DelivererID, D.Name
HAVING SUM(T.Amount) > 1000;

-- 21. Retrieve deliverers who have received payments totaling more than $1000 after a certain date
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalPayments
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
JOIN Transactions T ON P.PackageID = T.PackageID
WHERE T.TransactionDate > '2023-01-01'  -- Replace with the desired date
GROUP BY D.DelivererID, D.Name
HAVING SUM(T.Amount) > 1000;

-- 22. Retrieve the total amount received by all deliverers before a certain date
SELECT SUM(T.Amount) AS TotalPayments
FROM Transactions T
WHERE T.TransactionDate < '2023-01-01';  -- Replace with the desired date
-- 23. Retrieve Payments with Courier Information
SELECT T.TransactionID, 
       T.Amount, 
       T.TransactionDate, 
       D.DelivererID, 
       D.Name AS DelivererName
FROM Transactions T
INNER JOIN Packages P ON T.PackageID = P.PackageID
INNER JOIN Deliverers D ON P.DelivererID = D.DelivererID;

-- 24. List all payments with courier details
SELECT T.TransactionID, 
       T.Amount, 
       T.TransactionDate, 
       D.DelivererID, 
       D.Name AS DelivererName
FROM Transactions T
LEFT JOIN Packages P ON T.PackageID = P.PackageID
LEFT JOIN Deliverers D ON P.DelivererID = D.DelivererID;

-- 25. Total payments received for each courier
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalPayments
FROM Deliverers D
LEFT JOIN Packages P ON D.DelivererID = P.DelivererID
LEFT JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY D.DelivererID, D.Name;

-- 26. List payments made on a specific date
SELECT T.TransactionID, 
       T.Amount, 
       T.TransactionDate
FROM Transactions T
WHERE CAST(T.TransactionDate AS DATE) = '2023-01-01';  -- Replace with the specific date

-- 27. Get Courier Information for Each Payment
SELECT T.TransactionID, 
       T.Amount, 
       T.TransactionDate, 
       D.DelivererID, 
       D.Name AS DelivererName
FROM Transactions T
RIGHT JOIN Packages P ON T.PackageID = P.PackageID
RIGHT JOIN Deliverers D ON P.DelivererID = D.DelivererID;

-- 28. Calculating Total Payments for Each Courier
SELECT D.DelivererID, 
       D.Name, 
       SUM(T.Amount) AS TotalPayments
FROM Deliverers D
FULL OUTER JOIN Packages P ON D.DelivererID = P.DelivererID
FULL OUTER JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY D.DelivererID, D.Name;

-- 29. List Payments Within a Date Range
SELECT T.TransactionID, 
       T.Amount, 
       T.TransactionDate
FROM Transactions T
WHERE T.TransactionDate BETWEEN '2023-01-01' AND '2023-12-31';  -- Replace with actual date range

-- 30. Retrieve a list of all users (clients) and their corresponding courier records, including cases where there are no matches on either side
SELECT C.ClientID, 
       C.Name AS ClientName, 
       D.DelivererID, 
       D.Name AS DelivererName
FROM Clients C
FULL OUTER JOIN Requests R ON C.ClientID = R.ClientID  -- Join requests to clients
FULL OUTER JOIN Packages P ON R.RequestID = P.RequestID  -- Join packages to requests
FULL OUTER JOIN Deliverers D ON P.DelivererID = D.DelivererID;

-- 37. List all deliverers and all clients, showing all possible combinations:
SELECT D.DelivererID, 
       D.Name AS DelivererName, 
       C.ClientID, 
       C.Name AS ClientName
FROM Deliverers D
CROSS JOIN Clients C;

-- 39. Retrieve a list of packages and their corresponding clients (if available):
SELECT P.PackageID, 
       P.Weight, 
       C.ClientID AS ReceiverID, 
       C.Name AS ReceiverName
FROM Packages P
LEFT JOIN Requests R ON P.RequestID = R.RequestID
LEFT JOIN Clients C ON R.ClientID = C.ClientID;

-- 40. Retrieve a list of packages along with their transactions details (if available):
SELECT P.PackageID, 
       P.Weight, 
       T.TransactionID, 
       T.Amount
FROM Packages P
LEFT JOIN Transactions T ON P.PackageID = T.PackageID;

-- 41. Retrieve a list of deliverers and the number of packages assigned to each deliverer:
SELECT D.DelivererID, 
       D.Name AS DelivererName, 
       COUNT(P.PackageID) AS NumberOfPackages
FROM Deliverers D
LEFT JOIN Packages P ON D.DelivererID = P.DelivererID
GROUP BY D.DelivererID, D.Name;

-- 42. Retrieve a list of clients and the total payment amount received from each client:
SELECT C.ClientID, 
       C.Name AS ClientName, 
       SUM(T.Amount) AS TotalPayments
FROM Clients C
JOIN Requests R ON C.ClientID = R.ClientID
JOIN Packages P ON R.RequestID = P.RequestID
JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY C.ClientID, C.Name;

-- 43. Retrieve all packages sent by the same client (based on ClientID).
SELECT P.PackageID, 
       P.Weight, 
       C.ClientID, 
       C.Name AS ClientName
FROM Packages P
JOIN Requests R ON P.RequestID = R.RequestID
JOIN Clients C ON R.ClientID = C.ClientID
WHERE C.Name = 'Alice Johnson';  -- Replace 'Alice Johnson' with the actual client name

-- 44. List all deliverers who share the same vehicle type.
SELECT D1.DelivererID, 
       D1.Name AS DelivererName
FROM Deliverers D1
WHERE EXISTS (
    SELECT 1
    FROM Deliverers D2
    WHERE D1.VehicleType = D2.VehicleType AND D1.DelivererID <> D2.DelivererID
);

-- 45. Retrieve all transactions made for packages sent from a specific client location.
SELECT T.TransactionID, 
       T.Amount
FROM Transactions T
JOIN Packages P ON T.PackageID = P.PackageID
JOIN Requests R ON P.RequestID = R.RequestID
JOIN Clients C ON R.ClientID = C.ClientID
WHERE C.Address = '123 Elm St';  -- Replace with actual client address

-- 46. Retrieve all packages sent from the same address (based on Address).
SELECT P.PackageID, 
       P.Weight
FROM Packages P
JOIN Requests R ON P.RequestID = R.RequestID
JOIN Clients C ON R.ClientID = C.ClientID
WHERE C.Address = '123 Elm St';  -- Replace with actual sender address

-- 47. List deliverers and the number of packages they have delivered:
SELECT D.DelivererID, 
       D.Name AS DelivererName, 
       COUNT(P.PackageID) AS NumberOfDeliveries
FROM Deliverers D
JOIN Packages P ON D.DelivererID = P.DelivererID
WHERE P.Status = 'Delivered'  -- Assuming Status field exists in Packages
GROUP BY D.DelivererID, D.Name;

-- 48. Find packages that were paid an amount greater than a specified threshold.
SELECT P.PackageID, 
       P.Weight
FROM Packages P
JOIN Transactions T ON P.PackageID = T.PackageID
WHERE T.Amount > 20.00;  -- Replace with your actual threshold value

-- 49. Find packages that have a weight greater than the average weight of all packages.
SELECT P.PackageID, 
       P.Weight
FROM Packages P
WHERE P.Weight > (SELECT AVG(Weight) FROM Packages);

-- 50. Find the names of all clients who have spent more than the average amount.
SELECT C.Name
FROM Clients C
WHERE C.ClientID IN (
    SELECT R.ClientID
    FROM Requests R
    JOIN Packages P ON R.RequestID = P.RequestID
    JOIN Transactions T ON P.PackageID = T.PackageID
    GROUP BY R.ClientID
    HAVING SUM(T.Amount) > (SELECT AVG(TotalSpent)
                             FROM (SELECT SUM(T.Amount) AS TotalSpent
                                   FROM Transactions T
                                   JOIN Packages P ON T.PackageID = P.PackageID
                                   GROUP BY P.PackageID) AS Subquery)
);
-- 51. Find the total cost of all transactions where the amount is less than the maximum amount.
SELECT SUM(T.Amount) AS TotalCost
FROM Transactions T
WHERE T.Amount < (SELECT MAX(Amount) FROM Transactions);

-- 52. Find all packages that have been paid for.
SELECT P.PackageID, 
       P.Weight
FROM Packages P
JOIN Transactions T ON P.PackageID = T.PackageID;

-- 53. Find the clients (senders) where the maximum payment amount was made.
SELECT C.ClientID, 
       C.Name AS ClientName, 
       MAX(T.Amount) AS MaximumPayment
FROM Clients C
JOIN Requests R ON C.ClientID = R.ClientID
JOIN Packages P ON R.RequestID = P.RequestID
JOIN Transactions T ON P.PackageID = T.PackageID
GROUP BY C.ClientID, C.Name
HAVING MAX(T.Amount) = (SELECT MAX(Amount) FROM Transactions);

-- 54. Find all packages whose weight is greater than the weight of all packages sent by a specific client.
SELECT P1.PackageID, 
       P1.Weight
FROM Packages P1
WHERE P1.Weight > (SELECT AVG(P2.Weight)
                   FROM Packages P2
                   JOIN Requests R ON P2.RequestID = R.RequestID
                   JOIN Clients C ON R.ClientID = C.ClientID
                   WHERE C.Name = 'Alice Johnson');  -- Replace 'Alice Johnson' with the actual sender's name

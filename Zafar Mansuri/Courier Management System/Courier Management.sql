-- Courier-Management-System  by ZAFAR MANSURI

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
INSERT INTO [User] (Name, Email, Password, ContactNumber, Address) 
VALUES 
('Aarav Patel', 'aaravP@mydomain.com', 'qwerty123', '9812345678', '12, Sarvoday Nagar'),
('Vivaan Desai', 'vivaanD@mydomain.com', 'secure456', '9876543210', '43, Laxmi Colony'),
('Ishaan Rao', 'ishaanR@mydomain.com', 'safePass789', '9901234567', '18, Green Park'),
('Advait Kapoor', 'advaitK@mydomain.com', 'pass890', '9823456789', '9, North Avenue'),
('Siddharth Mehta', 'siddharthM@mydomain.com', 'strongP@55', '9801234567', '20, Govindpura Square'),
('Aryan Shah', 'aryanS@mydomain.com', 'testPass654', '9765432109', '15, Central Avenue'),
('Devansh Verma', 'devanshV@mydomain.com', 'newPass456', '9834567890', '33, Jagatpura Main Road'),
('Daksh Thakur', 'dakshT@mydomain.com', 'pass4321', '9898765432', '7, Vipin Nagar'),
('Mihir Jain', 'mihirJ@mydomain.com', 'alphaPass678', '9753214568', '19, Maheshwari Lane'),
('Ritvik Singh', 'ritvikS@mydomain.com', 'betaPass987', '9812365478', '25, Vivekanand Marg');


INSERT INTO CourierServices (ServiceName, Cost) 
VALUES 
('Economy Delivery', 15),
('Priority Shipping', 25),
('One-Day Express', 35);


INSERT INTO Employee (Name, Email, ContactNumber, Role, Salary) 
VALUES 
('Kavya Menon', 'kavyaM@courierhub.com', '9212345678', 'Courier', 38000),
('Manisha Roy', 'manishaR@courierhub.com', '9234567890', 'Manager', 62000),
('Deepak Sharma', 'deepakS@courierhub.com', '9256789012', 'Driver', 42000);


INSERT INTO Location (LocationName, Address) 
VALUES 
('Central Depot', '12, MG Road'),
('South Dispatch Center', '56, Palasia Square'),
('East Hub', '78, Vijaynagar Street');


INSERT INTO Courier (SenderName, SenderAddress, ReceiverName, ReceiverAddress, Weight, Status, TrackingNumber, DeliveryDate) 
VALUES 
('Aarav Patel', '12, Sarvoday Nagar', 'Ishaan Rao', '18, Green Park', 2.75, 'In Transit', 'TRK54321', '2024-09-25'),
('Vivaan Desai', '43, Laxmi Colony', 'Advait Kapoor', '9, North Avenue', 1.50, 'Delivered', 'TRK98765', '2024-09-24'),
('Devansh Verma', '33, Jagatpura Main Road', 'Mihir Jain', '19, Maheshwari Lane', 3.90, 'Pending', 'TRK44556', '2024-09-26');


INSERT INTO Payment (CourierID, LocationID, Amount, PaymentDate) 
VALUES 
(1, 1, 110, '2024-09-20'),
(2, 2, 60, '2024-09-21'),
(3, 3, 85, '2024-09-22');


--Task - 2
--Solution-1
SELECT * FROM [User];

--Solution-2
SELECT * FROM Courier 
WHERE SenderName = 'Aarav Patel'; 

--Solution-3
SELECT * FROM Courier;

--Solution-4
SELECT * FROM Courier 
WHERE TrackingNumber = 'TRK54321'; 

--Solution-5
SELECT * FROM Courier 
WHERE Status = 'Delivered';

--Solution-6
SELECT * FROM Courier 
WHERE Status != 'Delivered';

--Solution-7
SELECT * FROM Courier 
WHERE DeliveryDate = CONVERT(DATE, GETDATE());

--Solution-8
SELECT * FROM Courier 
WHERE Status = 'In Transit';

--Solution-9
SELECT COUNT(CourierID) AS TotalPackages, SenderName 
FROM Courier 
GROUP BY SenderName;

--Solution-10
SELECT SenderName, AVG(DATEDIFF(DAY, DeliveryDate, GETDATE())) AS AverageDeliveryTime 
FROM Courier 
WHERE Status = 'Delivered'
GROUP BY SenderName;

--Solution-11
SELECT * FROM Courier 
WHERE Weight BETWEEN 1.00 AND 3.00;

--Solution-12
SELECT * FROM Employee 
WHERE Name LIKE '%John%';

--Solution-13
SELECT * FROM Payment 
WHERE Amount > 50;



-- Task - 3
--Solution-14
SELECT e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
LEFT JOIN Courier c ON e.Name = c.SenderName -- Assuming the sender might be an employee
GROUP BY e.Name;

--Solution-15
SELECT l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationName;

--Solution-16
SELECT L.LocationName,COUNT(C.CourierID) AS TotalCouriersDelivered
FROM Courier C
JOIN Payment P ON C.CourierID = P.CourierID
JOIN Location L ON P.LocationID = L.LocationID
WHERE C.Status = 'Delivered'
GROUP BY L.LocationID, L.LocationName;

--Solution-17
SELECT TOP 1 c.SenderName, AVG(DATEDIFF(DAY, c.DeliveryDate, GETDATE())) AS AvgDeliveryTime
FROM Courier c
WHERE c.Status = 'Delivered'
GROUP BY c.SenderName
ORDER BY AvgDeliveryTime DESC;


--Solution-18
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationName
HAVING SUM(p.Amount) < 100;

--Solution-19
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID
GROUP BY l.LocationName;

--Solution-20
SELECT c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Courier c
INNER JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.LocationID = 1
GROUP BY c.SenderName
HAVING SUM(p.Amount) > 1000;


--Solution-21
SELECT c.SenderName, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Courier c ON p.CourierID = c.CourierID
WHERE p.PaymentDate > '2024-09-21' 
GROUP BY c.SenderName
HAVING SUM(p.Amount) > 1000;

--Solution-22
SELECT l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Payment p
INNER JOIN Location l ON p.LocationID = l.LocationID
WHERE p.PaymentDate < '2024-09-01' -- Replace with the desired date
GROUP BY l.LocationName
HAVING SUM(p.Amount) > 5000;


-- Task - 4
--Solution-23
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    C.SenderName, 
    C.ReceiverName, 
    C.TrackingNumber
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID;

--Solution-24
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    L.LocationName, 
    L.Address
FROM 
    Payment P
INNER JOIN 
    Location L ON P.LocationID = L.LocationID;

--Solution-25
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    C.SenderName, 
    C.ReceiverName, 
    C.TrackingNumber, 
    L.LocationName, 
    L.Address
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
INNER JOIN 
    Location L ON P.LocationID = L.LocationID;

--Solution-26
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight, 
    C.Status
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID;

--Solution-27
SELECT 
    C.CourierID, 
    C.TrackingNumber, 
    SUM(P.Amount) AS TotalPaymentsReceived
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
GROUP BY 
    C.CourierID, C.TrackingNumber;

--Solution-28
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    C.SenderName, 
    C.ReceiverName
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
WHERE 
    P.PaymentDate = '2024-09-24'; 

--Solution-29
SELECT 
    P.PaymentID, 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight, 
    C.Status
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID;

--Solution-30
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    L.LocationName, 
    L.Address
FROM 
    Payment P
INNER JOIN 
    Location L ON P.LocationID = L.LocationID;

--Solution-31
SELECT 
    C.CourierID, 
    C.TrackingNumber, 
    SUM(P.Amount) AS TotalPayments
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
GROUP BY 
    C.CourierID, C.TrackingNumber;

--Solution-32
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    C.SenderName, 
    C.ReceiverName
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
WHERE 
    P.PaymentDate BETWEEN '2024-09-25' AND '2024-09-26'; 

--Solution-33
SELECT 
    U.UserID, 
    U.Name AS UserName, 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName
FROM 
    [User] U
LEFT JOIN 
    Courier C ON U.Name = C.SenderName OR U.Name = C.ReceiverName;

--Solution-34
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    CS.ServiceID, 
    CS.ServiceName
FROM 
    Courier C
LEFT JOIN 
    CourierServices CS ON C.CourierID = CS.ServiceID;

--Solution-35
SELECT 
    E.EmployeeID, 
    E.Name AS EmployeeName, 
    P.PaymentID, 
    P.Amount
FROM 
    Employee E
LEFT JOIN 
    Payment P ON E.EmployeeID = P.CourierID;

--Solution-36
SELECT 
    U.UserID, 
    U.Name AS UserName, 
    CS.ServiceID, 
    CS.ServiceName
FROM 
    [User] U
CROSS JOIN 
    CourierServices CS;

--Solution-37
SELECT 
    E.EmployeeID, 
    E.Name AS EmployeeName, 
    L.LocationID, 
    L.LocationName
FROM 
    Employee E
CROSS JOIN 
    Location L;

--Solution-38
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.SenderAddress, 
    C.Weight
FROM 
    Courier C;

--Solution-39
SELECT 
    C.CourierID, 
    C.ReceiverName, 
    C.ReceiverAddress, 
    C.Weight
FROM 
    Courier C;

--Solution-40
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    CS.ServiceID, 
    CS.ServiceName
FROM 
    Courier C
LEFT JOIN 
    CourierServices CS ON C.CourierID = CS.ServiceID;

--Solution-41
SELECT 
    E.EmployeeID, 
    E.Name AS EmployeeName, 
    COUNT(C.CourierID) AS NumberOfCouriersAssigned
FROM 
    Employee E
LEFT JOIN 
    Courier C ON E.EmployeeID = C.CourierID; 
GROUP BY 
    E.EmployeeID, E.Name;  --incorrect

--Solution-42
SELECT 
    L.LocationID, 
    L.LocationName, 
    SUM(P.Amount) AS TotalPayments
FROM 
    Location L
LEFT JOIN 
    Payment P ON L.LocationID = P.LocationID
GROUP BY 
    L.LocationID, L.LocationName;

--Solution-43
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight
FROM 
    Courier C
WHERE 
    C.SenderName = 'Aarav Patel';

--Solution-44
SELECT 
    E.Role, 
    E.EmployeeID, 
    E.Name AS EmployeeName
FROM 
    Employee E
WHERE 
    E.Role = 'Courier';

--Solution-45
SELECT 
    P.PaymentID, 
    P.Amount, 
    P.PaymentDate, 
    C.SenderName, 
    C.ReceiverName
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
WHERE 
    CAST(C.SenderAddress AS VARCHAR(MAX)) = '12, Sarvoday Nagar'; 

--Solution-46
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight
FROM 
    Courier C
WHERE 
    CAST(C.SenderAddress AS VARCHAR(MAX)) = '12, Sarvoday Nagar'; 

--Solution-47
SELECT 
    E.EmployeeID, 
    E.Name AS EmployeeName, 
    COUNT(C.CourierID) AS NumberOfCouriersDelivered
FROM 
    Employee E
LEFT JOIN 
    Courier C ON E.EmployeeID = C.CourierID 
GROUP BY 
    E.EmployeeID, E.Name;

--Solution-48
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    P.Amount AS PaymentAmount, 
    CS.Cost AS ServiceCost
FROM 
    Payment P
INNER JOIN 
    Courier C ON P.CourierID = C.CourierID
INNER JOIN 
    CourierServices CS ON C.CourierID = CS.ServiceID
WHERE 
    P.Amount > CS.Cost;


--Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All
--Solution-49
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight
FROM 
    Courier C
WHERE 
    C.Weight > (SELECT AVG(Weight) FROM Courier);

--Solution-50
SELECT 
    E.Name
FROM 
    Employee E
WHERE 
    E.Salary > (SELECT AVG(Salary) FROM Employee);

--Solution-51
SELECT 
    SUM(CS.Cost) AS TotalCost
FROM 
    CourierServices CS
WHERE 
    CS.Cost < (SELECT MAX(Cost) FROM CourierServices);

--Solution-52
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight
FROM 
    Courier C
INNER JOIN 
    Payment P ON C.CourierID = P.CourierID;

--Solution-53
SELECT 
    L.LocationID, 
    L.LocationName, 
    P.Amount
FROM 
    Location L
INNER JOIN 
    Payment P ON L.LocationID = P.LocationID
WHERE 
    P.Amount = (SELECT MAX(Amount) FROM Payment);

--Solution-54
SELECT 
    C.CourierID, 
    C.SenderName, 
    C.ReceiverName, 
    C.Weight
FROM 
    Courier C
WHERE 
    C.Weight > (
        SELECT AVG(C2.Weight)
        FROM Courier C2
        WHERE C2.SenderName = 'Aarav Patel' 
    );


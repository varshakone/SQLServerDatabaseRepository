-- Courier-Management-System 
-- Task 1, 2 and 3 
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
-- Answer 1
SELECT * FROM [User];

-- Answer 2
SELECT * FROM Courier
WHERE SenderName = 'Rishabh Dhawad';

-- Answer 3
SELECT * FROM Courier;

--Answer 4
SELECT * FROM Courier WHERE TrackingNumber =  'TRK12345';

-- Answer 5
SELECT * FROM Courier WHERE CourierID = 1;

-- Answer 6
SELECT * FROM Courier WHERE Status != 'Delivered';

-- Answer 7 
SELECT * FROM Courier WHERE DeliveryDate = CAST(GETDATE() AS DATE);

-- Answer 8
SELECT * FROM Courier WHERE Status = 'In Transit';

-- Answer 9
SELECT CourierID, count(*) as TotalPackages FROM Courier GROUP BY CourierID;

-- Answer 10
SELECT CourierID, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM Courier GROUP BY CourierID;

-- Answer 11
SELECT * FROM Courier WHERE Weight between 1.0 and 5.0;

-- Answer 12
SELECT * FROM Employee WHERE Name LIKE '%Sherya%';

-- Answer 13 (It's a join question)


-- "Task 3"
-- Answer 14 (It's a join question)

--	Answer 15 (It's a join question)

--	Answer 16 (It's a join question)

--	Answer 17
SELECT TOP 1 CourierID, AVG(DATEDIFF(DAY, GETDATE(), DeliveryDate)) AS AvgDeliveryTime
FROM Courier Group by CourierID ORDER BY AvgDeliveryTime DESC;

-- Answer 18 (It's a join question)

-- Answer 19 (It's a join question)

-- Answer 20 (It's a join question)

-- Answer 21 (It's a join question)

-- Answer 22 (It's a join question)







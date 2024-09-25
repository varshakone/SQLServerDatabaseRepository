create database CourierManagementSystem;

create table Users(
UserID INT PRIMARY KEY IDENTITY,
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
Password VARCHAR(255),
ContactNumber VARCHAR(20),
Address TEXT
);

create table Couriers(
CourierID INT PRIMARY KEY IDENTITY(100,1),
SenderName VARCHAR(255),
SenderAddress TEXT,
ReceiverName VARCHAR(255),
ReceiverAddress TEXT,
Weight DECIMAL(5, 2),
Status VARCHAR(50),
TrackingNumber VARCHAR(20) UNIQUE,
DeliveryDate DATE);

create table CourierServices(
ServiceID INT PRIMARY KEY IDENTITY(200,2),
CourierID INT,
CONSTRAINT fk_Couriers FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
ServiceName VARCHAR(100),
Cost DECIMAL(8, 2));

create table Employees(
EmployeeID INT PRIMARY KEY IDENTITY(50,2),
Name VARCHAR(255),
Email VARCHAR(255) UNIQUE,
ContactNumber VARCHAR(20),
Role VARCHAR(50),
Salary DECIMAL(10, 2));

create table Locations(
LocationID INT PRIMARY KEY IDENTITY(104,2),
LocationName VARCHAR(100),
Address TEXT);

create table Payments(
PaymentID INT PRIMARY KEY IDENTITY(1000,1),
CourierID INT,
CONSTRAINT fk_Courier FOREIGN KEY (CourierID) REFERENCES Couriers(CourierID),
LocationId INT,
CONSTRAINT fk_Locations FOREIGN KEY (LocationID) REFERENCES Locations(LocationID),
Amount DECIMAL(10, 2),
PaymentDate DATE);

INSERT INTO Users(Name,Email,Password,ContactNumber,Address) VALUES
('Stuart','stuartsmith@gmail.com','Smith','94514683365','10A,Princep street,Kolkatta'),
('Mary','marybron@gmail.com','Brown','9123876451','1,RamaKrishna Nagar,Mumbai'),
('James','jamesdavis@gmail.com','Davis','9812345672','7,Hill Erest,Mumbai'),
('Nancy','nancydavis@gmail.com','Davis','9871234563','7,Hill Road,Mumbai'),
('Sarah','sarahjones@gmail.com','Jones','9876123454','9B,Sharma Complex,Bangalore'),
('Thomas','thomaswilliam@gmail.com','William','9876512345','6/a,Lalae road,Chennai'),
('Jane','janeclark@gmail.com','Clark','9876541236','109,Kazhi street,Chennai'),
('Monica','monicageller@gmail.com','Geller','9876543210','5,Greems road,Chennai');

INSERT INTO Couriers(SenderName,SenderAddress,ReceiverName,ReceiverAddress,Weight,Status,TrackingNumber,DeliveryDate) VALUES
('Stuart','10A,Princep street,Kolkatta','Alice','123,Oak Street,Pune',10.5,'undelivered','TRK12345678','2024-09-25'),
('Mary','1,RamaKrishna Nagar,Mumbai','Bob','21,Elms street ,Kolkatta',6.3,'delivered','TRK23456789','2024-09-19'),
('James','7,Hill Erest,Mumbai','Charlie','6/19,Cedar street,Bangalore',2.7,'delivered','TRK34567890','2024-10-23'),
('Nancy','7,Hill Erest,Mumbai','Diana','106,Beach street, Chennai',4.9,'undelivered','TRK45678901','2024-10-10'),
('Sarah','9B,Sharma Complex,Bangalore','Goutham','35,Radio street,Chennai',3.4,'delivered','TRK56789012','2024-09-24'),
('Thomas','6/a,Lalae road,Chennai','Raj','2,Pleasant road,Mumbai',4.1,'undelivered','TRK67890123','2024-10-25'),
('Jane','109,Kazhi street,Chennai','Luke','22,Walnut street,Madurai',5.0,'undelivered','TRK78901234','2024-09-24'),
('Monica','5,Greems road,Chennai','Haley','10,Cathedral street,Chennai',3.3,'delivered','TRK89012345','2024-09-22');

INSERT INTO CourierServices(CourierID,ServiceName,Cost) VALUES
(100,'Standard Service', 80.50),
(101,'Express Service', 30.00),
(102,'Standard Service', 8.50),
(103,'Standard Service', 15.00),
(104,'Express Service', 202.50),
(105,'Express Service', 35.50),
(106,'Standard Service', 75.00),
(107,'Express Service', 40.00);

INSERT INTO Employees(Name,Email,ContactNumber,Role,Salary) VALUES
('John Doe', 'john.doe@example.com', '9234567890', 'Aministrator', 75000.00),
('Alice Smith', 'alice.smith@example.com', '92345678901', 'Dispatcher', 50000.00),
('Bob Johnson', 'bob.johnson@example.com', '9456789012', 'Courier Person', 30000.00),
('Johnathan Brown', 'johnathan.brown@example.com', '9567890123', 'Dispatcher', 50000.00),
('Sara Connor', 'sara.connor@example.com', '9678901234', 'Customer Service', 50000.00),
('Michael White', 'michael.white@example.com', '9789012345', 'Administrator',75000.00),
('Emily Davis', 'emily.davis@example.com', '9890123456', 'Courier Person', 30000.00),
('John Smith', 'john.smith@example.com', '9901234567', 'Customer Service', 50000.00);

INSERT INTO Locations(LocationName,Address) VALUES
('Warehouse A', '123 Industrial Estate, Kolkatta'),
('Warehouse B', '456 Commerce St, Bengaluru, Mumbai'),
('Main Office', '789 Business Park, Mumbai'),
('Branch Office', '321 Corporate Plaza, Mumbai'),
('Distribution Center', '654 Shipping Lane, Bangalore'),
('Retail Outlet', '852 Logistics Ave, Chennai'),
('Service Center', '753 Service St,Chennai'),
('Retailer Outlet', '852 Logistics Ave, Chennai');

INSERT INTO Payments(CourierID,LocationId,Amount,PaymentDate) VALUES
(100,104,1000.50, '2024-09-23'),
(101,106,1500.75, '2024-09-19'),
(102,108,2000.00, '2024-09-01'),
(103,110,7500.20, '2024-09-10'),
(104,112,120.00, '2024-09-23'),
(104,114,800.00, '2024-09-22'),
(106,116,950.50, '2024-09-15'),
(107,118,1100.00,'2024-09-22');

SELECT* FROM Users;
SELECT* FROM Couriers;
SELECT* FROM CourierServices;
SELECT* FROM Employees;
SELECT* FROM Locations;
SELECT* FROM Payments;
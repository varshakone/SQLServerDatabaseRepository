--create database CarConnect;
--use CarConnect;

--CREATE TABLE Customer (
--    CustomerID INT PRIMARY KEY IDENTITY(1,1), 
--    FirstName VARCHAR(50) NOT NULL,   
--    LastName VARCHAR(50) NOT NULL,   
--    Email VARCHAR(100) NOT NULL UNIQUE,  
--    PhoneNumber VARCHAR(10) NOT NULL,   
--    Address VARCHAR(255) NOT NULL,  
--    Username VARCHAR(50) NOT NULL UNIQUE,  
--    Password VARCHAR(50) NOT NULL,  
--    RegistrationDate DATETIME DEFAULT GETDATE() NOT NULL  
--);

--CREATE TABLE Vehicle (
--    VehicleID INT PRIMARY KEY IDENTITY(1,1),  
--    Model VARCHAR(100) NOT NULL, 
--    Make VARCHAR(100) NOT NULL,   
--    Year INT NOT NULL,  
--    Color VARCHAR(50) NOT NULL, 
--    RegistrationNumber VARCHAR(50) NOT NULL UNIQUE,   
--    Availability BIT NOT NULL DEFAULT 1,  
--    DailyRate DECIMAL(10, 2) NOT NULL  
--);

--CREATE TABLE Reservation (
--    ReservationID INT IDENTITY(1,1) PRIMARY KEY,
--    CustomerID INT NOT NULL,
--    VehicleID INT NOT NULL,
--    StartDate DATETIME NOT NULL,
--    EndDate DATETIME NOT NULL,
--    TotalCost DECIMAL(10, 2) CHECK (TotalCost >= 0),
--    Status VARCHAR(20) DEFAULT 'pending' NOT NULL,   
--    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
--    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
--    CHECK (EndDate > StartDate) 
--);

--CREATE TABLE Admin (
--    AdminID INT IDENTITY(1,1) PRIMARY KEY,
--    FirstName VARCHAR(50) NOT NULL,
--    LastName VARCHAR(50) NOT NULL,
--    Email VARCHAR(100) UNIQUE NOT NULL,
--    PhoneNumber VARCHAR(10) NOT NULL,
--    Username VARCHAR(50) UNIQUE NOT NULL,
--    Password VARCHAR(50) NOT NULL, 
--    Role VARCHAR(50) CHECK (Role IN ('super admin', 'fleet manager')) NOT NULL,
--    JoinDate DATETIME DEFAULT GETDATE() NOT NULL
--);


INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate)
VALUES
('Ishaan', 'Gupta', 'ishaangupta@gmail.com', '9876543210', '45A, Vasant Kunj, New Delhi', 'ishaan_g', 'securepass123', '2024-01-15'),
('Adarsh', 'Sharma', 'adarshsharma@gmail.com', '9123456789', '78 MG Road, Indore, Madhya Pradesh', 'adarsh_s', 'pass@9876', '2024-02-10'),
('Raj', 'Mehta', 'raj.mehta@gmail.com', '9988776655', '12, Shivaji Nagar, Pune, Maharashtra', 'raj_mehta', 'raj123!pass', '2024-03-05'),
('Neha', 'Gupta', 'neha.gupta@gmail.com', '7890654321', '23, Sector 15, Noida, Uttar Pradesh', 'neha_gupta', 'nehagupta@321', '2024-04-20'),
('Ravi', 'Verma', 'ravi.verma@gmail.com', '8765432190', '89, MG Road, Indore, Madhya Pradesh', 'ravi_verma', 'verma@1234', '2024-05-10');

INSERT INTO Vehicle (Model, Make, Year, Color, RegistrationNumber, Availability, DailyRate)
VALUES
('Swift Dzire', 'Maruti Suzuki', 2020, 'White', 'HR26AB1234', 1, 1500.00),
('Innova Crysta', 'Toyota', 2019, 'Silver', 'KA03MN5678', 1, 2500.00),
('Creta', 'Hyundai', 2021, 'Black', 'MH12PQ4321', 0, 1800.00), 
('XUV500', 'Mahindra', 2022, 'Red', 'UP16JK6789', 1, 3000.00),
('Baleno', 'Maruti Suzuki', 2020, 'Blue', 'MP09XY9876', 1, 1700.00);

INSERT INTO Reservation (CustomerID, VehicleID, StartDate, EndDate, TotalCost, Status)
VALUES
(1, 1, '2024-06-01', '2024-06-05', 7500.00, 'confirmed'),
(2, 2, '2024-06-10', '2024-06-15', 12500.00, 'completed'),
(3, 4, '2024-06-20', '2024-06-25', 15000.00, 'pending'),
(4, 5, '2024-07-01', '2024-07-05', 8500.00, 'confirmed'),
(5, 3, '2024-07-15', '2024-07-20', 9000.00, 'pending');

INSERT INTO Admin (FirstName, LastName, Email, PhoneNumber, Username, Password, Role, JoinDate)
VALUES
('Rohan', 'Malhotra', 'rohan.malhotra@gmail.com', '9988776655', 'rohan_malhotra', 'adminpass123', 'super admin', '2023-01-01'),
('Sneha', 'Patel', 'sneha.patel@gmail.com', '9123456789', 'sneha_patel', 'admin@987', 'fleet manager', '2023-02-10'),
('Arjun', 'Singh', 'arjun.singh@gmail.com', '9876543210', 'arjun_singh', 'arjun1234', 'super admin', '2023-03-15'),
('Vikram', 'Rao', 'vikram.rao@gmail.com', '8765432190', 'vikram_rao', 'vikram@5678', 'fleet manager', '2023-04-05'),
('Deepika', 'Kaur', 'deepika.kaur@gmail.com', '7890654321', 'deepika_kaur', 'deepika@321', 'super admin', '2023-05-20');

select * from Customer;
select * from Vehicle;
select * from Reservation;
select * from Admin;
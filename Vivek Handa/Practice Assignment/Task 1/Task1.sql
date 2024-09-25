-- Vivek Handa Assignment 1 Task 1
create database TechShop;
use TechShop;

-- Schema of Tables
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(50) UNIQUE,
    Phone varchar(15),
    Address varchar(100)
);

CREATE TABLE Products (
	ProductID INT PRIMARY KEY IDENTITY(1,1),
	ProductName VARCHAR(50),
	Description VARCHAR(150),
	Price DECIMAL(10,2)
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY IDENTITY(1,1),
	CustomerID INT,
	OrderDate DATETIME,
	TotalAmount DECIMAL(10,2),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inserting Values into tables 
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Tanmay', 'Nagar', 'tn@example.com', '1111111111', '2, Ulti gali '),
('Bhoot', 'Bhaiya', 'bb@example.com', '2222222222', '5, Bhandara Street'),
('Dadu', 'Jain', 'dj@example.com', '3333333333', '12, Kajukatli gali'),
('Sandeep', 'Tiwari', 'st1@example.com', '4444444444', '32, Rajendra Nagar'),
('Gaurav', 'Singh', 'gs@example.com', '5555555555', '22, Khatri Road'),
('Emily', 'Khatri', 'ek@example.com', '6666666666', '211, Bijasan Colony'),
('David', 'Guetta', 'dg@example.com', '7777777777', '3, Chaar Nagar'),
('Astha', 'Soni', 'as@example.com', '8888888888', '6, Tapuka Nagar'),
('Shyam', 'Tiwari', 'st2@example.com', '9999999999', '8, Badapur Colony'),
('Ram', 'Bhalo', 'rb@example.com', '91111111111', '99, Nagin Nagar');

INSERT INTO Products (ProductName, Description, Price)
VALUES 
('Smartphone', 'Latest 5G smartphone', 20000),
('Laptop', 'High-performance laptop', 45000),
('Tablet', 'Portable tablet with stylus', 10000),
('Smartwatch', 'Wearable fitness tracker', 2300),
('Wireless Earbuds', 'Noise-cancelling earbuds', 9500),
('Gaming Console', 'Next-gen gaming console', 75000),
('Camera', 'Digital camera with 4K video', 80000),
('Bluetooth Speaker', 'Portable Bluetooth speaker', 25000),
('Drone', 'Quadcopter with HD camera', 15000),
('Smart TV', '4K Ultra HD Smart TV', 35000);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(17, '2024-09-10', 200000),
(11, '2024-09-11', 10000),
(16, '2024-09-12', 45000),
(12, '2024-09-13', 22000),
(15, '2024-09-14', 2000),
(14, '2024-09-15', 23000),
(19, '2024-09-16', 870000),
(13, '2024-09-17', 45000),
(18, '2024-09-18', 66000),
(10, '2024-09-19', 34000);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(2, 1, 1),  
(3, 2, 1),  
(4, 1, 1),  
(5, 4, 1),  
(6, 2, 1),  
(7, 5, 1),  
(8, 2, 2),  
(9, 9, 1),  
(10, 10, 1), 
(11, 8, 1);  

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES 
(1, 100, '2024-09-01'),
(2, 50, '2024-09-01'),
(3, 75, '2024-09-01'),
(4, 200, '2024-09-01'),
(5, 300, '2024-09-01'),
(6, 30, '2024-09-01'),
(7, 20, '2024-09-01'),
(8, 150, '2024-09-01'),
(9, 60, '2024-09-01'),
(10, 40, '2024-09-01');

-- Displaying data of the tables
SELECT * From Customers;
SELECT * From Products;
SELECT * From Orders;
SELECT * From OrderDetails;
SELECT * From Inventory;


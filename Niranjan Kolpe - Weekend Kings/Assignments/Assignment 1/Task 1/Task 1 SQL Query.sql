-- Niranjan Kolpe - C# Batch-2
-- SQL - Assignment 1 - Electronic Gadgets
USE master;
CREATE DATABASE NiranjanDB;
USE NiranjanDB;

CREATE TABLE Customers (CustomerID INT PRIMARY KEY, FirstName TEXT NOT NULL, LastName TEXT, Email VARCHAR(50), Phone DECIMAL NOT NULL, Address VARCHAR(100));
INSERT INTO Customers VALUES (1,  'Niranjan', 'Kolpe',    'niranjan@gmail.com', 9999999991, 'San Fransisco');
INSERT INTO Customers VALUES (2,  'Steve',    'Rogers',   'steve@gmail.com',    9999999992, 'Brooklyn');
INSERT INTO Customers VALUES (3,  'Tony',     'Stark',    'tony@gmail.com',     9999999993, 'New York');
INSERT INTO Customers VALUES (4,  'Natasha',  'Romanoff', 'natasha@gmail.com',  9999999994, 'New York');
INSERT INTO Customers VALUES (5,  'Bruce',    'Banner',   'bruce@gmail.com',    9999999995, 'Delhi');
INSERT INTO Customers VALUES (6,  'Thor',     'Odinson',  'thor@gmail.com',     9999999996, 'Washington');
INSERT INTO Customers VALUES (7,  'Clint',    'Barton',   'clint@gmail.com',    9999999997, 'Chennai');
INSERT INTO Customers VALUES (8,  'Wanda',    'Maximoff', 'wanda@gmail.com',    9999999998, 'Mumbai');
INSERT INTO Customers VALUES (9,  'Sam',      'Wilson',   'sam@gmail.com',      9999999999, 'San Fransisco');
INSERT INTO Customers VALUES (10, 'Peter',    'Parker',   'peter@gmail.com',    9999999981, 'Queens');
SELECT * FROM Customers;

CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName TEXT NOT NULL, Description VARCHAR(100), Price INT NOT NULL);
INSERT INTO Products VALUES (1,  'Smartphone', 'Android Smartphone',        10000);
INSERT INTO Products VALUES (2,  'Powerbank',  'Powerbank for Smartphones', 3000);
INSERT INTO Products VALUES (3,  'Airpods',    'Wireless Airpods',          1000);
INSERT INTO Products VALUES (4,  'Earphones',  'Wired Earphones',           100);
INSERT INTO Products VALUES (5,  'USB Cable',  'USB Cable',                 100);
INSERT INTO Products VALUES (6,  'Mouse',      'Wired Mouse',               300);
INSERT INTO Products VALUES (7,  'Router',     'Wifi Router',               1500);
INSERT INTO Products VALUES (8,  'Monitor',    'Desktop Monitor',           4000);
INSERT INTO Products VALUES (9,  'Keyboard',   'PC Keyboard',               1000);
INSERT INTO Products VALUES (10, 'Charger',    'Mobile Charger',            200);
SELECT * FROM Products;

CREATE TABLE Orders (OrderID INT PRIMARY KEY, CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID), OrderDate DATE, TotalAmount INT);
INSERT INTO Orders VALUES (1,  5,  '2024-09-01', 1000);
INSERT INTO Orders VALUES (2,  7,  '2024-09-02', 3000);
INSERT INTO Orders VALUES (3,  6,  '2024-09-02', 10000);
INSERT INTO Orders VALUES (4,  4,  '2024-09-03', 4000);
INSERT INTO Orders VALUES (5,  9,  '2024-09-04', 2000);
INSERT INTO Orders VALUES (6,  2,  '2024-09-06', 500);
INSERT INTO Orders VALUES (7,  1,  '2024-09-15', 200);
INSERT INTO Orders VALUES (8,  3,  '2024-09-16', 10000);
INSERT INTO Orders VALUES (9,  8,  '2024-09-17', 6000);
INSERT INTO Orders VALUES (10, 10, '2024-09-18', 7000);
SELECT * FROM Orders;

CREATE TABLE OrderDetails (OrderDetailID INT PRIMARY KEY, OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
						   ProductID INT FOREIGN KEY REFERENCES Products(ProductID), Quantity INT);
INSERT INTO OrderDetails VALUES (1,  1,  3,  1);
INSERT INTO OrderDetails VALUES (2,  2,  2,  1);
INSERT INTO OrderDetails VALUES (3,  3,  1,  1);
INSERT INTO OrderDetails VALUES (4,  4,  8,  1);
INSERT INTO OrderDetails VALUES (5,  5,  9,  2);
INSERT INTO OrderDetails VALUES (6,  6,  4,  5);
INSERT INTO OrderDetails VALUES (7,  7,  10, 1);
INSERT INTO OrderDetails VALUES (8,  8,  9,  10);
INSERT INTO OrderDetails VALUES (9,  9,  7,  4);
INSERT INTO OrderDetails VALUES (10, 10, 3,  7);
SELECT * FROM OrderDetails;

CREATE TABLE Inventory (InventoryID INT PRIMARY KEY, ProductID INT FOREIGN KEY REFERENCES Products(ProductID), QuantityInStock INT, LastStockUpdate DATETIME);
INSERT INTO Inventory VALUES (1,  1,  23, '2024-09-19');
INSERT INTO Inventory VALUES (2,  2,  26, '2024-09-19');
INSERT INTO Inventory VALUES (3,  3,  63, '2024-09-19');
INSERT INTO Inventory VALUES (4,  4,  52, '2024-09-19');
INSERT INTO Inventory VALUES (5,  5,  92, '2024-09-19');
INSERT INTO Inventory VALUES (6,  6,  12, '2024-09-19');
INSERT INTO Inventory VALUES (7,  7,  38, '2024-09-19');
INSERT INTO Inventory VALUES (8,  8,  84, '2024-09-20');
INSERT INTO Inventory VALUES (9,  9,  97, '2024-09-20');
INSERT INTO Inventory VALUES (10, 10, 14, '2024-09-20');
SELECT * FROM Inventory;
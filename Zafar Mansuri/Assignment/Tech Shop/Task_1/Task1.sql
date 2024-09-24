
CREATE DATABASE TechShop;

USE TechShop;

-- Defining table structure for customer data
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(50),
    Phone NVARCHAR(50),
    Address NVARCHAR(50)
);

-- Creating table to hold product information
CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(50),
    Description NVARCHAR(50),
    Price DECIMAL(18, 2)
);

-- Setting up the orders table to store customer orders
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(18, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Table to record details about the individual products in each order
CREATE TABLE OrderDetails
(
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Table to manage product stock levels and inventory updates
CREATE TABLE Inventory
(
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Populating the customer table with sample data
USE TechShop;
INSERT INTO Customers
VALUES
    (1, 'Rohan', 'Chopra', 'rohan.chopra@gmail.com', 9998764512, 'Kanpur'),
    (2, 'Meera', 'Bajaj', 'meera.bajaj@gmail.com', 9998764532, 'Surat'),
    (3, 'Sahil', 'Desai', 'sahil.desai@gmail.com', 9898764555, 'Vadodara'),
    (4, 'Pooja', 'Khanna', 'pooja.khanna@gmail.com', 9798764577, 'Jaipur'),
    (5, 'Deepak', 'Bhatt', 'deepak.bhatt@gmail.com', 9698764599, 'Dehradun'),
    (6, 'Anjali', 'Ahuja', 'anjali.ahuja@gmail.com', 9598764611, 'Bhopal'),
    (7, 'Manish', 'Garg', 'manish.garg@gmail.com', 9498764633, 'Jodhpur'),
    (8, 'Nikita', 'Rana', 'nikita.rana@gmail.com', 9398764655, 'Amritsar'),
    (9, 'Varun', 'Jain', 'varun.jain@gmail.com', 9298764677, 'Indore'),
    (10, 'Kavita', 'Patil', 'kavita.patil@gmail.com', 9198764699, 'Thane');

-- Adding entries for products available in the store
INSERT INTO Products
VALUES
    (1, 'Smartphone', 'Xiaomi Smartphone', 18000),
    (2, 'Smartwatch', 'Amazfit Smartwatch', 6000),
    (3, 'Bluetooth Speaker', 'JBL Speaker', 3500),
    (4, 'Power Bank', 'Mi Power Bank', 1500),
    (5, 'Router', 'TP-Link Router', 1200),
    (6, 'Hard Drive', 'WD External HDD', 4000),
    (7, 'Webcam', 'Logitech Webcam', 3000),
    (8, 'Graphics Card', 'Nvidia GTX 1660', 25000),
    (9, 'Gaming Mouse', 'Razer Gaming Mouse', 5000),
    (10, 'VR Headset', 'Oculus VR Headset', 32000);

-- Recording sample customer orders in the orders table
INSERT INTO Orders
VALUES
    (1, 1, '2021-02-01', 18000),
    (2, 2, '2021-02-05', 6000),
    (3, 3, '2021-02-10', 3500),
    (4, 4, '2021-02-15', 1500),
    (5, 5, '2021-02-18', 1200),
    (6, 6, '2021-02-21', 4000),
    (7, 7, '2021-02-25', 3000),
    (8, 8, '2021-02-28', 25000),
    (9, 9, '2021-03-03', 5000),
    (10, 10, '2021-03-07', 32000);

-- Logging details of individual products within each order
INSERT INTO OrderDetails
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 1),
    (3, 3, 3, 1),
    (4, 4, 4, 1),
    (5, 5, 5, 1),
    (6, 6, 6, 1),
    (7, 7, 7, 1),
    (8, 8, 8, 1),
    (9, 9, 9, 1),
    (10, 10, 10, 1);

-- Adding inventory details for products in stock
INSERT INTO Inventory
VALUES
    (1, 1, 15, '2021-02-01'),
    (2, 2, 25, '2021-02-05'),
    (3, 3, 35, '2021-02-10'),
    (4, 4, 45, '2021-02-15'),
    (5, 5, 55, '2021-02-18'),
    (6, 6, 65, '2021-02-21'),
    (7, 7, 75, '2021-02-25'),
    (8, 8, 85, '2021-02-28'),
    (9, 9, 95, '2021-03-03'),
    (10, 10, 105, '2021-03-07');

-- Verifying data by retrieving all records from the tables
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;

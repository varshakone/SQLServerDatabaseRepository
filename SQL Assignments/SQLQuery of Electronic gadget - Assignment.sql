

-- TASK 1

-- Create the TechShop database
CREATE DATABASE TechShop;
USE TechShop;

-- Create the Customers table 
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

-- Create the Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Create the Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Create the OrderDetails
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Create the Inventory table 
CREATE TABLE Inventory (
    InventoryID INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- INSERT VALUES INTO CUSTOMERS TABLE
-- Insert 10 records into the Customers table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES
('Arun', 'Kumar', 'arun.kumar@gmail.com', '9876543210', '12 Gandhi St, Chennai, Tamil Nadu'),
('Lakshmi', 'Prabha', 'lakshmi.prabha@gmail.com', '9445567890', '34 Nehru St, Coimbatore, Tamil Nadu'),
('Ravi', 'Shankar', 'ravi.shankar@gmail.com', '9966778899', '56 Kamaraj St, Madurai, Tamil Nadu'),
('Meena', 'Devi', 'meena.devi@gmail.com', '9444433221', '78 Anna Nagar, Salem, Tamil Nadu'),
('Vignesh', 'Raj', 'vignesh.raj@gmail.com', '9000088888', '23 Ooty Road, Erode, Tamil Nadu'),
('Priya', 'Darshini', 'priya.darshini@gmail.com', '9500000001', '89 MG Road, Trichy, Tamil Nadu'),
('Karthik', 'S', 'karthik.s@gmail.com', '9845023456', '45 KK Nagar, Tirunelveli, Tamil Nadu'),
('Bala', 'Murugan', 'bala.murugan@gmail.com', '9567231234', '67 Gandhipuram, Vellore, Tamil Nadu'),
('Sowmiya', 'Ravi', 'sowmiya.ravi@gmail.com', '9877654321', '12 TVS Nagar, Thanjavur, Tamil Nadu'),
('Anbu', 'Selvan', 'anbu.selvan@gmail.com', '9888776655', '98 Poompuhar St, Tuticorin, Tamil Nadu');

select * from Customers;

--INSERT VALUES INTO PRODUCTS
INSERT INTO Products (ProductName, Description, Price)
VALUES
('Dell Inspiron Laptop', '15-inch display, Intel i7 processor, 16GB RAM, 512GB SSD', 85000.00),
('Samsung Galaxy S21', '6.5-inch AMOLED display, 128GB storage, 48MP camera', 25000.00),
('Sony WH-1000XM4 Headphones', 'Noise-canceling, Bluetooth 5.0, 30-hour battery life', 5500.00),
('PlayStation 5 Console', '4K resolution, 1TB storage, Wireless controllers included', 45000.00),
('Apple Watch Series 6', 'Fitness tracking, Heart rate monitor, GPS, 7-day battery', 12000.00),
('iPad Air', '10-inch display, 64GB storage, Wi-Fi + LTE', 18000.00),
('Seagate External Hard Drive', '2TB storage, USB 3.0, Portable', 4500.00),
('JBL Flip 5 Bluetooth Speaker', 'Water-resistant, 12-hour battery, Deep bass', 3000.00),
('Dell 27-Inch Monitor', '27-inch LED, 144Hz refresh rate, 1ms response time', 20000.00),
('Logitech MX Keyboard & Mouse Combo', 'Mechanical keyboard, RGB backlight, Wireless mouse', 3500.00);

select * from Products;

--INSERT VALUES INTO ORDERS
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES
(1, '2023-09-01', 85000.00),
(2, '2023-09-02', 25000.00),
(3, '2023-09-03', 5500.00),
(4, '2023-09-04', 45000.00),
(5, '2023-09-05', 12000.00),
(6, '2023-09-06', 18000.00),
(7, '2024-04-07', 4500.00),
(8, '2024-05-08', 3000.00),
(9, '2024-05-09', 20000.00),
(10, '2024-07-10', 3500.00);

select * from Orders;

-- INSERT VALUES INTO ORDERDETAILS
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1),  
(2, 2, 2),  
(3, 3, 2),  
(4, 4, 1),  
(5, 5, 3),  
(6, 6, 1),  
(7, 7, 1),  
(8, 8, 2),  
(9, 9, 1),  
(10, 10, 4);

select * from OrderDetails;


--INSERT VALUES INTO INVENTORY
INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 50, '2024-08-01'),
(2, 40, '2024-08-01'),
(3, 30, '2024-08-01'),
(4, 20, '2024-08-01'),
(5, 15, '2024-08-01'),
(6, 10, '2024-08-01'),
(7, 60, '2024-08-01'),
(8, 35, '2024-08-01'),
(9, 80, '2024-08-01'),
(10, 100, '2024-08-01');

select * from Inventory;

--TO DISPLAY THE VALUES OF EACH TABLE
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;

-- TASK 2

--Retrieve customer names and emails
SELECT FirstName, LastName, Email 
FROM Customers;

-- List all orders with order dates and customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

-- Insert a new customer record
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Suresh', 'Reddy', 'suresh.reddy@gmail.com', '9876543212', '90 Park Street, Chennai, Tamil Nadu');

-- Update the prices of electronic gadgets by increasing them by 10%
UPDATE Products
SET Price = Price * 1.10;
SELECT *FROM Customers;
SELECT *FROM Products;

-- Delete a specific order and its associated order details  
DELETE FROM OrderDetails WHERE OrderID = 2;
DELETE FROM Orders WHERE OrderID = 2;

SELECT *FROM Orders;
SELECT *FROM OrderDetails;

-- Insert a new order into the Orders table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (11, '2024-09-15', 50000.00);
SELECT *FROM Orders;

-- Insert OrderDetails for the new order
INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES (11, 3, 2); 
SELECT *FROM OrderDetails;

SELECT *FROM Orders;
SELECT *FROM OrderDetails;

-- Update contact information of a specific customer
UPDATE Customers
SET Email = 'arun@gmail.com', Address = 'Marudhamalai, Coimbatore, Tamil Nadu'
WHERE CustomerID = 1;
SELECT *FROM Customers;

-- Recalculate and update the total cost of each order

SELECT * FROM Orders;
SELECT * FROM OrderDetails;
select * from Products;

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(Products.Price * OrderDetails.Quantity)
    FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID = Products.ProductID
    WHERE OrderDetails.OrderID = Orders.OrderID
)
SELECT *FROM Orders;

-- Delete all orders and associated order details for a specific customer

DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 1);
DELETE FROM Orders WHERE CustomerID = 1;
SELECT *FROM Orders;
SELECT *FROM OrderDetails;


-- Insert a new electronic gadget product into the Products table
INSERT INTO Products (ProductName, Description, Price)
VALUES ('Samsung The Frame', '55-inch OLED, 4K resolution, Smart features', 65000.00);
SELECT *FROM Products;

-- Update the status of a specific order
-- Add a Status column to the Orders table
ALTER TABLE Orders
ADD Status VARCHAR(20);

UPDATE Orders
SET Status = 
    CASE 
        WHEN OrderDate >= DATEADD(DAY, -7, GETDATE()) THEN 'Shipped'
        WHEN OrderDate >= DATEADD(DAY, -14, GETDATE()) THEN 'Pending'
        ELSE 'Delivered'
    END;
SELECT *FROM Orders;
-- to update specific order status
UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 11;
SELECT *FROM Orders;

-- Calculate and update the number of orders placed by each customer
ALTER TABLE Customers
ADD NumberOfOrders INT DEFAULT 0;

UPDATE Customers
SET NumberOfOrders = (
    SELECT COALESCE(COUNT(DISTINCT o.OrderID), 0)
    FROM Orders o
    WHERE o.CustomerID = Customers.CustomerID
);


SELECT *FROM Customers;
SELECT *FROM Orders;
SELECT *FROM OrderDetails;

--TASK 3

-- Retrieve All Orders with Customer Info
SELECT o.OrderID, o.OrderDate, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, c.Email, c.Phone, c.Address
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID;

--Total Revenue by Each Product
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName;

--List Customers with Atleast one Purchase
SELECT DISTINCT c.FirstName, c.LastName, c.Email, c.Phone, c.Address
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID;

--Find the Most Popular Gadget By Total Quantity Ordered
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalQuantity DESC;

--Retrieve Electronic Gadgets with Categories
ALTER TABLE Products
ADD CategoryName VARCHAR(50);

UPDATE Products
SET CategoryName = 
    CASE 
        WHEN ProductName LIKE '%Laptop%' THEN 'Computers'
        WHEN ProductName LIKE '%Samsung Galaxy%' THEN 'Smartphones'
        WHEN ProductName LIKE '%Headphones%' THEN 'Audio Devices'
        WHEN ProductName LIKE '%Console%' THEN 'Gaming'
        WHEN ProductName LIKE '%Watch%' THEN 'Wearables'
        WHEN ProductName LIKE '%iPad%' THEN 'Tablets'
        WHEN ProductName LIKE '%Hard Drive%' THEN 'Storage Devices'
        WHEN ProductName LIKE '%Speaker%' THEN 'Audio Devices'
        WHEN ProductName LIKE '%Monitor%' THEN 'Monitors'
        WHEN ProductName LIKE '%Keyboard%' THEN 'Accessories'
        WHEN ProductName LIKE '%Frame%' THEN 'SmartTV'
        ELSE 'Other'
    END;

SELECT ProductName, CategoryName
FROM Products
GROUP BY ProductName, CategoryName;

--Average Order Value for Each Customer
SELECT c.FirstName, c.LastName, AVG(o.TotalAmount) AS AverageOrderValue
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--Find Order with Highest Total Revenue
SELECT TOP 1 o.OrderID, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName, o.TotalAmount
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
ORDER BY o.TotalAmount DESC;

--List Products and Order Counts
SELECT p.ProductName, COUNT(od.OrderDetailID) AS TimesOrdered
FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductName;

--Find Customers Who Purchased a Specific Product
SELECT DISTINCT c.FirstName, c.LastName
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'iPad Air';  

--Calculate Total Revenue for a Time Period
SELECT SUM(o.TotalAmount) AS TotalRevenue
FROM Orders o
WHERE o.OrderDate BETWEEN '2023-09-05' AND '2023-09-09' ; 

-- TASK 4

--customers who have not placed any orders
SELECT c.FirstName, c.LastName
FROM Customers c
WHERE c.CustomerID NOT IN (SELECT o.CustomerID FROM Orders o);

--total number of products available for sale
SELECT (SELECT COUNT(ProductID) FROM Products) AS TotalProductsAvailable;

--total revenue generated by TechShop
SELECT (SELECT SUM(TotalAmount) FROM Orders) AS TotalRevenue;

--calculate average quantity ordered for products in specific category
DECLARE @CategoryName VARCHAR(50);
SET @CategoryName = 'Monitors';  -- User can input the category name here

SELECT AVG(od.Quantity) AS AverageQuantity
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.CategoryName = @CategoryName;

--Calculate the total revenue generated by a specific customer
DECLARE @CustomerID INT;
SET @CustomerID = 6;  -- User can input the CustomerID here

SELECT (SELECT SUM(o.TotalAmount)
        FROM Orders o
        WHERE o.CustomerID = @CustomerID) AS TotalRevenue;

--customers who have placed the most orders
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OrderCount DESC;

--Find the most popular product category (highest total quantity ordered)
SELECT TOP 1 p.CategoryName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.CategoryName
ORDER BY TotalQuantityOrdered DESC;
 
--customer who has spent the most money
SELECT TOP 1 c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpending DESC;

--the average order value for all customers
SELECT SUM(TotalAmount) / COUNT(OrderID) AS AverageOrderValue
FROM Orders;

--total number of orders placed by each customer
SELECT c.FirstName, c.LastName, COUNT(o.OrderID) AS OrderCount
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;







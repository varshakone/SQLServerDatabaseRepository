create database TechShop

USE TechShop

CREATE TABLE Customers(CustomerID int primary key identity,FirstName varchar(50), LastName varchar(50),Email varchar(100),Phone varchar(15),Address varchar(255));

CREATE TABLE Products(ProductID int primary key identity ,ProductName varchar(100),Description text,Price decimal(10,2));

CREATE TABLE Orders(OrderID int primary key identity, CustomerID int, OrderDate Datetime, TotalAmount decimal(10,2),foreign key(CustomerID) references Customers(CustomerID));

CREATE TABLE OrderDetails(OrderDetailID int primary key identity, OrderID int,ProductID int,foreign key(ProductID) references Products(ProductID), foreign key(OrderID) references Orders(OrderID), Quantity int );

CREATE TABLE Inventory (InventoryID int primary key identity, ProductID int, QuantityInStock int, LastStockUpdate datetime, foreign key(ProductID) references Products(ProductID));

INSERT INTO Products (ProductName,Description, Price) VALUES
('Desktop PC', 'High-performance gaming desktop', 75000.00),
('Earbuds', 'Noise-cancelling wireless earbuds', 5000.00),
('E-reader', '6-inch e-reader with front light', 12000.00),
('Monitor', '27-inch 4K ultra HD monitor', 20000.00),
('External Hard Drive', '1TB portable external hard drive', 4500.00),
('Fitness Tracker', 'Waterproof fitness band with heart-rate monitor', 3500.00),
('Drone', 'Quadcopter with 4K camera and GPS', 45000.00),
('Gaming Controller', 'Wireless controller with haptic feedback', 4000.00),
('Printer', 'All-in-one inkjet printer with Wi-Fi', 6000.00),
('Router', 'Dual-band gigabit Wi-Fi router', 3500.00);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) VALUES
('Aarav', 'Singh', 'aarav.singh@example.com', '9123456789', '101, Lakeview Apartments, Lucknow'),
('Meera', 'Chopra', 'meera.chopra@example.com', '9112345678', '202, Residency Road, Bhopal'),
('Dhruv', 'Shah', 'dhruv.shah@example.com', '9101234567', '303, MG Road, Surat'),
('Sanya', 'Jain', 'sanya.jain@example.com', '9098765432', '404, Civil Lines, Jaipur'),
('Kabir', 'Malhotra', 'kabir.malhotra@example.com', '9087654321', '505, Golf Course Road, Gurgaon'),
('Tara', 'Deshmukh', 'tara.deshmukh@example.com', '9076543210', '606, Koregaon Park, Pune'),
('Rishi', 'Bhatt', 'rishi.bhatt@example.com', '9065432109', '707, MG Marg, Shimla'),
('Isha', 'Rao', 'isha.rao@example.com', '9054321098', '808, Brigade Road, Bangalore'),
('Aditya', 'Kulkarni', 'aditya.kulkarni@example.com', '9043210987', '909, Peddar Road, Mumbai'),
('Nidhi', 'Verma', 'nidhi.verma@example.com', '9032109876', '1010, Park Street, Kolkata');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, GETDATE(), 45000.00),
(2, GETDATE(), 15000.00),
(3, GETDATE(), 40000.00),
(4, GETDATE(), 15000.00),
(5, GETDATE(), 20000.00),
(6, GETDATE(), 12000.00),
(7, GETDATE(), 42000.00),
(8, GETDATE(), 15000.00),
(9, GETDATE(), 32000.00),
(10, GETDATE(), 12000.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 2, 2),
(2, 3, 1),
(3, 4, 3),
(4, 5, 1),
(5, 6, 2),
(6, 7, 1),
(7, 8, 3),
(8, 9, 2),
(9, 10, 1),
(10, 1, 2);

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 20, GETDATE()),
(2, 30, GETDATE()),
(3, 45, GETDATE()),
(4, 15, GETDATE()),
(5, 25, GETDATE()),
(6, 50, GETDATE()),
(7, 17, GETDATE()),
(8, 37, GETDATE()),
(9, 18, GETDATE()),
(10, 42, GETDATE());

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Inventory;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

SELECT FirstName,LastName,Email FROM Customers;

SELECT Orders.OrderID,Orders.OrderDate,CONCAT(Customers.FirstName, ' ', Customers.LastName) AS CustomerName FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)VALUES 
('Anisha', 'Kabeer', 'anishakabeers@example.com', '123456', 'indian street');

UPDATE Products SET Price = Price * 1.10;

DELETE FROM OrderDetails WHERE OrderID = 4;
DELETE FROM Orders WHERE OrderID = 4;

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)VALUES
 (11, '2024-09-21', 25000.50);

UPDATE Customers SET Email = 'sanyajain20.email@example.com', Address = '456 New St' WHERE CustomerID = 4;

UPDATE Orders SET TotalAmount = (SELECT SUM(Products.Price * OrderDetails.Quantity)FROM OrderDetails
                   JOIN Products ON OrderDetails.ProductID = Products.ProductID
                   WHERE OrderDetails.OrderID = Orders.OrderID);

DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 2);
DELETE FROM Orders WHERE CustomerID = 2;

INSERT INTO Products (ProductName, Description, Price)
VALUES ('Smartwatch', 'Wearable device with health features', 5000.00);

ALTER TABLE Orders
ADD Status VARCHAR(20);
UPDATE Orders
SET Status = 'Pending';
UPDATE Orders SET Status = 'Shipped' WHERE OrderID = 1;

ALTER TABLE Customers
ADD OrderCount INT DEFAULT 0;
UPDATE Customers
SET OrderCount = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);






Adarsh sharma C# batch2
Assignment : 1 ( Task 1 )

--Create the Database--
CREATE DATABASE TechShop;
USE TechShop;

--Define Schema for the Tables--
--Customers Table--
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15) NOT NULL UNIQUE,
    Address VARCHAR(255)
);

--Products Table--
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

--Orders Table--
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--OrderDetails Table--
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Inventory Table--
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT NOT NULL,
    LastStockUpdate DATETIME NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--ER Diagram attached with the file--

--Primary and Foreign Key Constraints have been included in above schema--

--Inserting Sample Records--
insert into Customers(CustomerID,FirstName,LastName,Email,Phone,Address)
values ('2','sunita','sharma','sunita@gmail.com','9568465871','indore'),
	   ('3','khushbu','sharma','khsubu@gmail.com','5654568741','dhule'),
	   ('4','vaishali','sharma','vaishali@gmail.com','6547892147','sirpur'),
	   ('5','arpit','gavshinde','gavshindde@gmail.com','6789421587','amravati'),
	   ('6','jessica','sharma','jas@gmail.com','3697412587','raipur'),
	   ('7','mohini','rathore','mohi@gmail.com','6478921456','bhopal'),
	   ('8','vandana','sohani','soni@gmail.com','6478954456','sihor'),
	   ('9','sittu','gittu','sigu@gmail.com','4587123698','gurgao'),
	   ('10','sonali','rajguru','sahiytya@gmail.com','6485217964','dhar');

INSERT INTO Products (ProductName, Description, Price)
VALUES 
insert into Products(ProductID,ProductName,Description,Price)
values('1','laptop1','blue','40219'),
('2','laptop','gray','60142'),
('3','tufgaming pc','balck','69852'),
('4','zephyrus laptop',' devil-pearl','97548'),
('5',' iphone 15 pro','gray titanium','1554780'),
('6','realme xt','milky white','65421'),
('7','air pods pro','white','45652'),
('8','dell laptop','black','697554'),
('9','oneplus nord','dark gray','534534663'),
('10','nord ce3 lite','apple green','45223');

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2020-09-01', 100.98),
(2, '2021-09-03', 95659.99),
(3, '2021-09-05', 69954.99),
(4, '2023-09-06', 52449.99),
(5, '2022-09-07', 14199.98),
(6, '2024-09-08', 4319.98),
(7, '2024-09-09', 9799.99),
(8, '2024-09-10', 1619.98),
(9, '2024-09-11', 909.99),
(10, '2024-09-12', 369.99);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1, 1, 10),
(1, 2, 10),
(2, 2, 16),
(3, 3, 15),
(4, 4, 14),
(5, 5, 1),
(5, 6, 12),
(6, 7, 13),
(6, 8, 18),
(7, 1, 16);

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES 
(1, 50, '2022-03-05'),
(2, 30, '2021-05-03'),
(3, 40, '2026-08-08'),
(4, 25, '2023-02-07'),
(5, 35, '2020-03-05'),
(6, 20, '2025-01-04'),
(7, 45, '2023-02-03'),
(8, 60, '2020-03-01'),
(9, 15, '2024-08-07'),
(10, 10, '2024-07-07');

--Displaying Table--
SELECT * FROM Customers
SELECT * FROM Inventory
SELECT * FROM OrderDetails
SELECT * FROM Orders
SELECT * FROM Products

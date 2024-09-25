CREATE DATABASE TechShop;  
USE TechShop;

CREATE TABLE Customers (  
    CustomerID INT PRIMARY KEY IDENTITY,  
    FirstName VARCHAR(50) NOT NULL,  
    LastName VARCHAR(50) NOT NULL,  
    Email VARCHAR(100) UNIQUE NOT NULL,  
    Phone VARCHAR(15),  
    Address VARCHAR(255),  
    City VARCHAR(50),     
    State VARCHAR(50)       
);
CREATE TABLE Categories (  
    CategoryID INT PRIMARY KEY IDENTITY,  
    CategoryName VARCHAR(100) NOT NULL  
); 
CREATE TABLE Products (  
    ProductID INT PRIMARY KEY IDENTITY,  
    ProductName VARCHAR(100) NOT NULL,  
    Price DECIMAL(10, 2) NOT NULL,  
    ModelYear INT,  
    CategoryID INT,  
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)  
);
CREATE TABLE Orders (  
    OrderID INT PRIMARY KEY IDENTITY,  
    CustomerID INT,  
    OrderDate DATETIME NOT NULL,  
    TotalAmount DECIMAL(10, 2) NOT NULL,  
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)  
);
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State)  
VALUES   
('ram', 'singh', 'ram@example.com', '1234567890', '123 tam nagar', 'jaipur', 'RJ'),  
('tara', 'rathod', 'tara@example.com', '0987654321', '456 talwandi', 'kota', 'RJ'),  
('Mike', 'John', 'mike.john@example.com', '5555555555', '789 shyam nagar', 'ajmer', 'RJ');

INSERT INTO Categories (CategoryName)  
VALUES   
('Computers'),   
('Mobile Devices'),   
('gadgets');

INSERT INTO Products (ProductName, Price, ModelYear, CategoryID)  
VALUES   
('Laptop', 1900.00, 2021, 1),  
('phone', 800.00, 2022, 2),  
('Tablet', 400.00, 2018, 1),  
('Headphones', 299.99, 2020, 3);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)  
VALUES   
(1, '2023-01-15 10:00:00', 1200.00),  
(2, '2023-02-20 11:30:00', 800.00),  
(1, '2023-03-05 15:45:00', 150.00);

--1st query
SELECT * FROM Customers  
ORDER BY FirstName DESC;

--2nd query
SELECT FirstName, LastName, City FROM Customers  
ORDER BY City, FirstName;

--3rd query
SELECT ProductID, ProductName, Price  
FROM Products  
ORDER BY Price DESC  
;

--4 query
SELECT * FROM Products  
WHERE Price > 300 AND ModelYear = 2018;

--5
SELECT * FROM Products  
WHERE Price > 3000 OR ModelYear = 2018;

--6
SELECT * FROM Products  
WHERE Price BETWEEN 1899 AND 1999.99;

--7
SELECT * FROM Products  
WHERE Price IN (299.99, 466.99, 489.99);

--8
SELECT * FROM Customers  
WHERE LastName LIKE 'A%' OR LastName LIKE 'B%' OR LastName LIKE 'C%';

--9
SELECT * FROM Customers  
WHERE FirstName NOT LIKE 'A%';

--10
SELECT State, City, COUNT(*) AS CustomerCount  
FROM Customers  
GROUP BY State, City;

--11
SELECT CustomerID, YEAR(OrderDate) AS OrderYear, COUNT(*) AS OrderCount  
FROM Orders  
GROUP BY CustomerID, YEAR(OrderDate);

--12
SELECT CategoryID, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice  
FROM Products  
GROUP BY CategoryID  
HAVING MAX(Price) <= 4000 AND MIN(Price) >= 500;


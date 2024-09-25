CREATE DATABASE TempDB;
USE TempDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    ListPrice DECIMAL(10,2),
    ModelYear INT,
    CategoryID INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Inserting data into Customers
INSERT INTO Customers (FirstName, LastName, City, State) 
VALUES 
    ('Rahul', 'Deshmukh', 'Nashik', 'Maharashtra'),
    ('Sneha', 'Patel', 'Thane', 'Maharashtra'),
    ('Aditi', 'Kumar', 'Bhopal', 'Madhya Pradesh');

-- Inserting data into Products
INSERT INTO Products (ProductName, ListPrice, ModelYear, CategoryID)
VALUES 
    ('Swift', 550000.00, 2019, 1),
    ('Avenger', 130000.00, 2021, 2),
    ('Air Conditioner', 30000.00, 2022, 3),
    ('Tablet', 19999.99, 2020, 4),
    ('Desktop', 45000.00, 2023, 5);

-- Inserting data into Orders
INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
    (1, '2024-09-02'),
    (2, '2024-09-06'),
    (1, '2024-09-11'),
    (3, '2024-09-16'),
    (2, '2024-09-21');

-- Question 1
SELECT * FROM Customers ORDER BY FirstName DESC;

-- Question 2
SELECT FirstName, LastName, City FROM Customers ORDER BY City, FirstName;

-- Question 3
SELECT * FROM Products ORDER BY ListPrice DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;

-- Question 4
SELECT * FROM Products WHERE ListPrice > 400 AND ModelYear = 2019;

-- Question 5
SELECT * FROM Products WHERE ListPrice > 4000 OR ModelYear = 2019;

-- Question 6
INSERT INTO Products VALUES ('Smartwatch', 2500.00, 2021, 6);
SELECT * FROM Products WHERE ListPrice BETWEEN 2499 AND 2599.99;

-- Question 7
INSERT INTO Products (ProductName, ListPrice, ModelYear, CategoryID)
VALUES 
    ('Notebook', 199.99, 2023, 7),  
    ('Colors', 349.99, 2024, 7);  

SELECT * FROM Products WHERE ListPrice IN (199.99, 349.99, 499.99);

-- Question 8 
INSERT INTO Customers VALUES ('Anil', 'Sharma', 'Jaipur', 'Rajasthan');
SELECT * FROM Customers WHERE LastName LIKE '[D-F]%';

-- Question 9
SELECT * FROM Customers WHERE FirstName NOT LIKE 'S%';

-- Question 10
SELECT State, City, COUNT(*) AS CustomerCount FROM Customers GROUP BY State, City;

-- Question 11
SELECT CustomerID, YEAR(OrderDate) AS OrderYear, COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerID, YEAR(OrderDate);

-- Question 12
SELECT CategoryID, MAX(ListPrice) AS MaxPrice, MIN(ListPrice) AS MinPrice 
FROM Products 
GROUP BY CategoryID 
HAVING MAX(ListPrice) >= 10000 OR MIN(ListPrice) <= 300;

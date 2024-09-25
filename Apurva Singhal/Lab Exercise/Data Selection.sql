create database CustomerDB;
use CustomerDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    ListPrice DECIMAL(10, 2),
    ModelYear INT,
    CategoryID INT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, City, State) VALUES
(1, 'John', 'Doe', 'New York', 'NY'),
(2, 'Jane', 'Smith', 'Los Angeles', 'CA'),
(3, 'Alice', 'Johnson', 'Chicago', 'IL'),
(4, 'Bob', 'Anderson', 'Houston', 'TX'),
(5, 'Catherine', 'Brown', 'Miami', 'FL'),
(6, 'David', 'Clark', 'New York', 'NY'),
(7, 'Eva', 'Adams', 'Phoenix', 'AZ'),
(8, 'Frank', 'Baker', 'Los Angeles', 'CA'),
(9, 'George', 'Davis', 'Chicago', 'IL'),
(10, 'Hannah', 'Evans', 'Houston', 'TX');

INSERT INTO Products (ProductID, ProductName, ListPrice, ModelYear, CategoryID) VALUES
(1, 'Product A', 250.00, 2019, 1),
(2, 'Product B', 300.00, 2018, 1),
(3, 'Product C', 4000.00, 2020, 2),
(4, 'Product D', 1500.00, 2017, 2),
(5, 'Product E', 500.00, 2020, 3),
(6, 'Product F', 6000.00, 2018, 3),
(7, 'Product G', 200.00, 2019, 4),
(8, 'Product H', 3000.00, 2019, 4),
(9, 'Product I', 700.00, 2021, 5),
(10, 'Product J', 299.99, 2022, 5);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-01-01'),
(2, 1, '2023-01-02'),
(3, 2, '2023-02-01'),
(4, 3, '2023-03-01'),
(5, 3, '2023-03-02'),
(6, 4, '2023-04-01'),
(7, 5, '2023-05-01'),
(8, 6, '2023-06-01'),
(9, 7, '2023-07-01'),
(10, 8, '2023-08-01');

--1
SELECT * FROM Customers
ORDER BY FirstName DESC;

--2
SELECT FirstName, LastName, City FROM Customers
ORDER BY City, FirstName;

--3
SELECT TOP 3 * FROM Products
ORDER BY ListPrice DESC;

--4
SELECT * FROM Products
WHERE ListPrice > 300 AND ModelYear = 2018;

--5 
SELECT * FROM Products
WHERE ListPrice > 3000 OR ModelYear = 2018;

--6
SELECT * FROM Products
WHERE ListPrice BETWEEN 1899 AND 1999.99;

--7 
SELECT * FROM Products
WHERE ListPrice IN (299.99, 466.99, 489.99);

--8
SELECT * FROM Customers
WHERE LEFT(LastName, 1) IN ('A', 'B', 'C');

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
SELECT CategoryID, MAX(ListPrice) AS MaxPrice, MIN(ListPrice) AS MinPrice
FROM Products
GROUP BY CategoryID
HAVING MAX(ListPrice) <= 4000 AND MIN(ListPrice) >= 500;


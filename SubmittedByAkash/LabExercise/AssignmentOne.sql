create DATABASE LabOne;

USE LabOne;

--Schema for customer
CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50),
);

--Schema for Products
CREATE TABLE Products
(
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ListPrice DECIMAL(18, 2),
    ModelYear INT,
    CategoryID INT,
);

--Schema for Orders
CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Schema for OrderDetails
CREATE Table OrderDetails
(
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)

)

--Insert into Customers

INSERT INTO Customers
    (FirstName, LastName, City, State)
values
    ('Akash', 'Singh', 'Gorakhpur', 'Uttar Pradeesh'),
    ( 'Niranjan' , 'Kolpe', 'Pune', 'Mumbai'),
    ('Ishaan', 'Khattar', 'Delhi', 'Delhi'),
    ('Rahul', 'Kumar', 'Patna', 'Bihar'),
    ('Raj', 'Kumar', 'Patna', 'Bihar'),
    ('Nagarjun', 'Patel', 'Vijaywada', 'AP'),
    ('Anjali', 'Sharma', 'Jaipur', 'Rajasthan'),
    ('Vikas', 'Singh', 'Lucknow', 'Uttar Pradesh'),
    ('Priya', 'Verma', 'Chennai', 'Tamil Nadu'),
    ('Amit', 'Joshi', 'Mumbai', 'Maharashtra');

INSERT into Customers
    (FirstName, LastName, City, State)
VALUES
    ('Ram' , 'Charan', 'Hyderabad', 'Telangana');

SELECT *
FROM Customers;

--Insert into Products
INSERT INTO Products
    (ListPrice, ModelYear, CategoryID)
VALUES
    (1000, 2020, 1),
    (2000, 2021, 2),
    (3000, 2022, 3),
    (4000, 2023, 4),
    (5000, 2024, 5),
    (6000, 2025, 6),
    (7000, 2026, 7),
    (8000, 2027, 8),
    (9000, 2028, 9),
    (10000, 2029, 10);

SELECT *
From Products;

--Insert into Orders

INSERT INTO Orders
    (CustomerID, OrderDate)
VALUES
    (1, '2021-03-15'),
    (2, '2021-07-22'),
    (3, '2021-05-18'),
    (4, '2021-09-30'),
    (5, '2021-02-11'),
    (6, '2021-12-25'),
    (7, '2021-04-07'),
    (8, '2021-08-19'),
    (9, '2021-06-03'),
    (10, '2021-11-14');

SELECT *
FROM Orders;

--Insert into OrderDetails

INSERT INTO OrderDetails
    (OrderID, ProductID, Quantity)
VALUES
    (1, 3, 5),
    (2, 7, 2),
    (3, 1, 4),
    (4, 5, 3),
    (5, 2, 6),
    (6, 8, 1),
    (7, 4, 7),
    (8, 6, 2),
    (9, 9, 3),
    (10, 10, 4);

SELECT *
FROM Products;


--Queries for Lab Exercise


-- 1 ->query to display customer list by the first name in descending order.

SELECT *
FROM Customers
ORDER BY LastName DESC;

-- 2- query to display the first name, last name, and city of the customers. It sorts the customer list by the city first and then by the first name.
SELECT FirstName, LastName, City
FROM Customers
ORDER BY City, FirstName;

-- 3 -query to returns the top three most expensive products
SELECT TOP 3
    ProductID, ListPrice
FROM Products
ORDER BY ListPrice DESC;


--4 - query to finds the products whose list price is greater than 3000 and model year is 2023
SELECT *
FROM Products
WHERE ListPrice > 3000 AND ModelYear > 2023;

-- 5-  query to finds products whose list price is greater than 3,000 or model year is 2023. Any product that meets one of these conditions is included in the result set
SELECT *
FROM Products
WHERE ListPrice > 3000 OR ModelYear = 2023;

-- 6 - query to find the products whose list prices are between 1000 and  2000
SELECT *
FROM Products
WHERE ListPrice BETWEEN 1000 AND 2000;

--7 -query uses the IN operator to find products whose list price is 3000 or 4000 or 5000
SELECT *
FROM Products
WHERE ListPrice IN (3000, 4000, 5000);

-- 8 - query to the customers where the first character in the last name is the letter in the range A through C
SELECT *
FROM Customers
WHERE LastName LIKE '[A-C]%';


-- 9 -query using NOT LIKE operator to find customers where the first character in the first name is not the letter A

SELECT *
FROM Customers
WHERE LastName NOT LIKE 'A%';

-- 10 query to return the number of customers by state and city group state and city.

SELECT State, City, COUNT(*) AS NumberOfCustomers
FROM Customers
GROUP BY State, City;

-- 11 -  query to return the number of orders placed by the customer group by customer id and year.

SELECT CustomerID, YEAR(OrderDate) AS OrderYear, COUNT(*) AS NumberOfOrders
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate);

-- 12 -  query to finds the maximum and minimum list group by category id. Then, it filters out the category which has the maximum list price greater than 4,000 or the minimum list price less than 500.

SELECT CategoryID, MAX(ListPrice) AS MaxListPrice, MIN(ListPrice) AS MinListPrice
FROM Products
GROUP BY CategoryID
HAVING MAX(ListPrice) > 4000 OR MIN(ListPrice) < 500;
        
       
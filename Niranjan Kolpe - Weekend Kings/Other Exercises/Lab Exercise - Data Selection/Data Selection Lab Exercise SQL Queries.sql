-- MS-SQL Server 
-- Lab Exercise: Data Selection
-- Name: Niranjan Kolpe, Batch: C# batch-2

-- Setup Queries for Lab Questions
USE master;
CREATE DATABASE ExerciseDB;
USE ExerciseDB;

CREATE TABLE Customers (CustomerID INT PRIMARY KEY IDENTITY, FirstName VARCHAR(20) NOT NULL,
						LastName VARCHAR(20), City VARCHAR(20), State VARCHAR(20));
INSERT INTO Customers VALUES ('Niranjan', 'Kolpe',   'Mumbai',    'Maharashtra');
INSERT INTO Customers VALUES ('Mark',     'Ruffalo', 'Bengaluru', 'Karnataka');
INSERT INTO Customers VALUES ('Sam',      'Wilson',  'Chennai',   'Tamilnadu');
INSERT INTO Customers VALUES ('John',     'Wick',    'Chennai',   'Tamilnadu');
INSERT INTO Customers VALUES ('Steve',    'Rogers',  'Mumbai',    'Maharashtra');
INSERT INTO Customers VALUES ('Tony',     'Stark',   'Indore',    'Madhya Pradesh');
INSERT INTO Customers VALUES ('Astro',    'Austin',  'Lucknow',   'Uttar Pradesh');
INSERT INTO Customers VALUES ('Charlie',  'Chester', 'Pune',      'Maharashtra');
SELECT * FROM Customers;

CREATE TABLE Products (ProductID INT PRIMARY KEY IDENTITY, ProductName VARCHAR(20) NOT NULL,
					   ModelYear INT NOT NULL, Price FLOAT NOT NULL);
INSERT INTO Products VALUES ('Smartphone', 2018, 1929.99);
INSERT INTO Products VALUES ('Laptop',     2021, 39999.99);
INSERT INTO Products VALUES ('Speaker',    2022, 299.99);
INSERT INTO Products VALUES ('Charger',    2021, 489.99);
INSERT INTO Products VALUES ('Earpods',    2023, 466.99);
SELECT * FROM Products;

CREATE TABLE Orders (OrderID INT PRIMARY KEY IDENTITY,
					 CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
					 ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
					 Quantity INT NOT NULL DEFAULT 0,
					 OrderYear INT NOT NULL);
INSERT INTO Orders VALUES (1, 1, 1, 2018);
INSERT INTO Orders VALUES (2, 2, 1, 2021);
INSERT INTO Orders VALUES (3, 3, 1, 2022);
INSERT INTO Orders VALUES (4, 4, 1, 2021);
INSERT INTO Orders VALUES (5, 5, 1, 2023);
INSERT INTO Orders VALUES (2, 4, 1, 2023);
INSERT INTO Orders VALUES (3, 1, 1, 2021);
INSERT INTO Orders VALUES (5, 2, 1, 2023);
SELECT * FROM Orders;

CREATE TABLE Categories (CategoryID INT PRIMARY KEY IDENTITY, MaxListPrice FLOAT NOT NULL, MinListPrice FLOAT NOT NULL);
INSERT INTO Categories VALUES (489.99,  89.99);
INSERT INTO Categories VALUES (2599.99, 416.99);
INSERT INTO Categories VALUES (2999.99, 250.99);
INSERT INTO Categories VALUES (4999.99, 1559.99);
INSERT INTO Categories VALUES (5299.99, 379.99);
INSERT INTO Categories VALUES (11999.99, 749.99);
INSERT INTO Categories VALUES (3499.99, 599.99);
INSERT INTO Categories VALUES (3899.99, 799.99);
SELECT * FROM Categories;

-- 1. Write a query to display customer list by the first name in descending order.
SELECT FirstName FROM Customers ORDER BY FirstName ASC;

--2. Write a query to display the first name, last name, and city of the customers.
--   It sorts the customer list by the city first and then by the first name.
SELECT FirstName, LastName, City FROM Customers ORDER BY City ASC, FirstName ASC;

--3. Write a query to returns the top three most expensive products.
SELECT TOP 3 ProductName, Price FROM Products ORDER BY Price DESC;

--4. Write a query to finds the products whose list price is greater than 300 and model year is 2018.
SELECT * FROM Products WHERE Price>300.00 AND ModelYear=2018;

--5. Write a query to finds products whose list price is greater than 3,000 or model year is 2018.
--   Any product that meets one of these conditions is included in the result set.
SELECT * FROM Products WHERE Price>3000.00 OR ModelYear=2018;

--6. Write a query to find the products whose list prices are between 1,899 and 1,999.99.
SELECT * FROM Products WHERE Price>1899.00 AND Price<1999.99;

--7.Write a query uses the IN operator to find products whose list price is 299.99 or 466.99 or 489.99.
SELECT * FROM Products WHERE Price IN (SELECT Price FROM Products WHERE Price=299.99 OR Price=466.99 OR Price=489.99);

--8. Write a query to the customers where the first character in the last name is the letter in the range A through C:
SELECT * FROM Customers WHERE LastName LIKE ('[a-c]%');

--9. Write a query using NOT LIKE operator to find customers,
--   where the first character in the first name is not the letter A:
SELECT * FROM Customers WHERE FirstName NOT LIKE ('a%');

--10. Write a query to return the number of customers by state and city group state and city.
SELECT State, City, COUNT(*) AS CustomerCount FROM Customers GROUP BY State, City ORDER BY State ASC, City ASC;

--11. Write a query to return the number of orders placed by the customer group by customer id and year.
SELECT CustomerID, OrderYear, COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerID, OrderYear ORDER BY CustomerID ASC, OrderYear ASC;

--12. Write query to finds the maximum and minimum list group by category id.
--    Then, it filters out the category which has the maximum list price,
--    greater than 4,000 or the minimum list price less than 500.
SELECT * FROM Categories WHERE MaxListPrice=(SELECT MAX(MaxListPrice) FROM Categories) OR MaxListPrice>4000.00 OR MinListPrice<500.00 GROUP BY CategoryID, MaxListPrice, MinListPrice;

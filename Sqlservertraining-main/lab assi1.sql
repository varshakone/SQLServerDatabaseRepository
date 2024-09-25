use TechShop;
select CustomerName from Customers order by CustomerName DESC;

ALTER TABLE Customers
ADD City VARCHAR(100);

UPDATE Customers
SET City = 'New York' WHERE CustomerID = 1;

UPDATE Customers
SET City = 'Los Angeles' WHERE CustomerID = 2;

UPDATE Customers
SET City = 'Chicago' WHERE CustomerID = 3;

UPDATE Customers
SET City = 'Houston' WHERE CustomerID = 4;

UPDATE Customers
SET City = 'Phoenix' WHERE CustomerID = 5;

UPDATE Customers
SET City = 'Philadelphia' WHERE CustomerID = 6;

UPDATE Customers
SET City = 'San Antonio' WHERE CustomerID = 7;

UPDATE Customers
SET City = 'San Diego' WHERE CustomerID = 8;

UPDATE Customers
SET City = 'Dallas' WHERE CustomerID = 9;

UPDATE Customers
SET City = 'San Jose' WHERE CustomerID = 10;

SELECT CustomerName, City from Customers ORDER BY City ASC, CustomerName ASC;

SELECT TOP 3 ProductName, Price
FROM Products
ORDER BY Price DESC;

SELECT ProductName, Price
FROM Products
WHERE Price > 300 


ALTER TABLE Products
ADD ModelYear INT;  
UPDATE Products
SET ModelYear = '2011' WHERE ProductID = 1;
UPDATE Products
SET ModelYear = '2012' WHERE ProductID = 2;
UPDATE Products
SET ModelYear = '2014' WHERE ProductID = 3;
UPDATE Products
SET ModelYear = '2016' WHERE ProductID = 4;
UPDATE Products
SET ModelYear = '2015' WHERE ProductID = 5;
UPDATE Products
SET ModelYear = '2018' WHERE ProductID = 6;
UPDATE Products
SET ModelYear = '2019' WHERE ProductID = 7;
UPDATE Products
SET ModelYear = '2020' WHERE ProductID = 8;
UPDATE Products
SET ModelYear = '2021' WHERE ProductID = 9;
UPDATE Products
SET ModelYear = '2022' WHERE ProductID = 10;

SELECT ProductName, Price, ModelYear
FROM Products
WHERE Price > 3000 OR ModelYear = 2018;

SELECT ProductName, Price
FROM Products
WHERE Price BETWEEN 1899 AND 1999.99;

SELECT ProductName, Price
FROM Products
WHERE Price IN (299.99, 466.99, 489.99);

SELECT CustomerName
FROM Customers
WHERE CustomerName LIKE '[A-C]%';

SELECT CustomerName
FROM Customers
WHERE CustomerName NOT LIKE 'A%';

SELECT State, City, COUNT(CustomerID) AS CustomerCount
FROM Customers
GROUP BY State, City;

SELECT CustomerID, YEAR(OrderDate) AS OrderYear, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID, YEAR(OrderDate);


SELECT Category, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM Products
GROUP BY Category
HAVING MAX(Price) > 4000 OR MIN(Price) < 500;






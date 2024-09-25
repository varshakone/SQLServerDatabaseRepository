--TASK4
USE TechShop;

--1
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;

--2
SELECT COUNT(*) AS TotalProducts
FROM Products;


--3 
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;

--4
DECLARE @CategoryName VARCHAR(50) = 'Electronics'; 
SELECT AVG(od.Quantity) AS AverageQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Category = @CategoryName;

--5
DECLARE @CustomerID INT = 2; 
SELECT c.CustomerID, c.FirstName, c.LastName, ISNULL(SUM(o.TotalAmount), 0) AS TotalRevenue
FROM  Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE c.CustomerID = @CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

--6
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY NumberOfOrders DESC;

--7
SELECT TOP 1 p.Category, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalQuantityOrdered DESC;

--8
SELECT TOP 1 c.CustomerID, c.FirstName, c.LastName, SUM(o.TotalAmount) AS TotalSpending
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.Category = 'Electronics'
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpending DESC;

--9
SELECT AVG(TotalAmount) AS AverageOrderValue
FROM Orders;

--10
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    COUNT(o.OrderID) AS NumberOfOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY NumberOfOrders DESC;  





--TASK 3 done by Srinithi R
USE TechShop;

--1
SELECT O.OrderID, O.OrderDate, C.FirstName,C.Email, C.Phone
FROM Orders O
FULL JOIN Customers C ON O.CustomerID = C.CustomerID;

--2
SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalRevenue
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalRevenue DESC;


--3
SELECT DISTINCT C.FirstName, C.Email, C.Phone
FROM Customers C
INNER JOIN Orders O ON C.CustomerID = O.CustomerID;

--4
SELECT TOP 1 p.ProductName, SUM(od.Quantity) AS TotalQuantityOrdered
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY  p.ProductName
ORDER BY TotalQuantityOrdered DESC;



--5
ALTER TABLE Products
ADD Category VARCHAR(50);
UPDATE Products
SET Category = 'Electronics'
WHERE ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Headphones', 'Keyboard', 'Mouse', 'Monitor', 'Printer', 'Router', 'Webcam');

--6
SELECT C.FirstName, AVG(O.TotalAmount) AS AvgOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.FirstName;

--7
SELECT TOP 1 O.OrderID, C.FirstName, O.TotalAmount
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.TotalAmount DESC;

--8
SELECT P.ProductName, COUNT(OD.OrderID) AS Number_of_times_ordered
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductName;

--9
DECLARE @ProductName NVARCHAR(100);  
SET @ProductName = 'Laptop';  

SELECT C.FirstName
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = @ProductName;

--10
DECLARE @StartDate DATE, @EndDate DATE;  
SET @StartDate = '2024-01-01';  
SET @EndDate = '2024-12-31';    

SELECT SUM(O.TotalAmount) AS TotalRevenue
FROM Orders O
WHERE O.OrderDate BETWEEN @StartDate AND @EndDate;










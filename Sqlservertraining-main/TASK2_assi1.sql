--TASK 2
USE TechShop;
--1
SELECT FirstName, LastName, Email FROM Customers;

--2
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--3
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St, City');

--4
UPDATE Products
SET Price = Price * 1.10
WHERE ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Headphones', 'Keyboard', 'Mouse', 'Monitor', 'Printer', 'Router', 'Webcam');

--5
DECLARE @OrderID INT = 1; 

DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;

--6
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2024-09-15', 500.00);

--7
DECLARE @CustomerID INT = 1; 
DECLARE @NewEmail VARCHAR(100) = 'jeny.email@example.com';
DECLARE @NewAddress VARCHAR(255) = '456 Mandir St, Delhi';

UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID;

--8
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);

--9
DECLARE @CustomerID INT = 1; 

DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);

DELETE FROM Orders 
WHERE CustomerID = @CustomerID;

--10
INSERT INTO Products (ProductName, Description, Price)
VALUES ('Smartwatch', 'Smartwatch with fitness tracking features', 250.00);

--11
ALTER TABLE Orders
ADD Status VARCHAR(50);

DECLARE @OrderID INT = 1; 
DECLARE @NewStatus VARCHAR(50) = 'Shipped';

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID;

--12
SELECT c.CustomerID, c.FirstName, c.LastName,
       (SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID) AS NumberOfOrders
FROM Customers c;

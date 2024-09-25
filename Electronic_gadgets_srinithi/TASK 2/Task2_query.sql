--TASK 2
USE TechShop;
--to retrieve the names and emails of all customers
SELECT FirstName, LastName, Email FROM Customers;

--to list all orders with their order dates and corresponding customer names
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--to insert a new customer record into the "Customers" table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Raha', 'Khan', 'raha.khan@example.com', '1234567890', '123 Main St, City');

SELECT *FROM Customers;

--to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products
SET Price = Price * 1.10
WHERE ProductName IN ('Laptop', 'Smartphone', 'Tablet', 'Headphones', 'Keyboard', 'Mouse', 'Monitor', 'Printer', 'Router', 'Webcam')
SELECT *FROM Products;

--to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables
DECLARE @OrderID INT = 1; 

DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;
SELECT *FROM OrderDetails
SELECT *FROM Orders;

--to insert a new order into the "Orders" table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2024-09-15', 500.00)
SELECT *FROM Orders;

--to update the contact information of a specific customer 
DECLARE @CustomerID INT = 1; 
DECLARE @NewEmail VARCHAR(100) = 'jeny.email@example.com';
DECLARE @NewAddress VARCHAR(255) = '456 Mandir St, Delhi';

UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID;
SELECT *FROM Customers;

--to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);
SELECT *FROM Orders;

-- to delete all orders and their associated order details for a specific customer
DECLARE @CustomerID INT = 1; 

DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);

DELETE FROM Orders 
WHERE CustomerID = @CustomerID;
SELECT *FROM OrderDetails
SELECT *FROM Orders;

--to insert a new electronic gadget product
INSERT INTO Products (ProductName, Description, Price)
VALUES ('Smartwatch', 'Smartwatch with fitness tracking features', 250.00);
SELECT *FROM Products;

--to update the status of a specific order
ALTER TABLE Orders
ADD Status VARCHAR(50);

DECLARE @OrderID INT = 1; 
DECLARE @NewStatus VARCHAR(50) = 'Shipped';

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID;

SELECT *FROM Orders;

--to calculate and update the number of orders placed by each customer 
SELECT c.CustomerID, c.FirstName, c.LastName,
       (SELECT COUNT(*) FROM Orders o WHERE o.CustomerID = c.CustomerID) AS NumberOfOrders
FROM Customers c;

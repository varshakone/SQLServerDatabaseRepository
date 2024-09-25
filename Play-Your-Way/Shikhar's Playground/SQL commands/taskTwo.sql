-- 1. Retrieve the names and emails of all customers.

SELECT FirstName, LastName, Email 
FROM Customers;


-- 2. List all orders with their order dates and corresponding customer names.

SELECT o.OrderID, o.OrderDate, CONCAT(c.FirstName, ' ', c.LastName) AS CustomerName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID;


--  3. Insert a new customer record into the "Customers" table.

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Sahil', 'Sharma', 'sahil.sharma@example.com', '9876543210', '456 MG Road, Bangalore, Karnataka');

Select * from Customers;

-- 4. Update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.

Select * from Products;

UPDATE Products
SET Price = Price * 1.10;

Select * from Products;

--  5. Delete a specific order and its associated order details.

DECLARE @OrderID INT = 1; 

DELETE FROM OrderDetails 
WHERE OrderID = @OrderID;

DELETE FROM Orders 
WHERE OrderID = @OrderID;

Select * from Orders;

-- 6. Insert a new order into the "Orders" table.

Select * from Orders;

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (1, '2024-09-25', 1500.00); 

Select * from Orders;

-- 7. Update the contact information of a specific customer.

DECLARE @CustomerID INT = 1; 
DECLARE @NewEmail VARCHAR(100) = 'new.email@example.com';
DECLARE @NewAddress VARCHAR(255) = 'New Address, City, State';

UPDATE Customers
SET Email = @NewEmail, Address = @NewAddress
WHERE CustomerID = @CustomerID;

SELECT * from Customers;


-- 8. Recalculate and update the total cost of each order.

UPDATE Orders
SET TotalAmount = (
    SELECT SUM(p.Price * od.Quantity)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);

SELECT * from Orders;


-- 9. Delete all orders and their associated order details for a specific customer.



DECLARE @CustomersID INT; 
SET @CustomerID = 1; 
DELETE FROM OrderDetails 
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);

DELETE FROM Orders 
WHERE CustomerID = @CustomerID;

Select * from customers;

--  10. Insert a new electronic gadget product into the "Products" table.

INSERT INTO Products (ProductName, Description, Price)
VALUES ('Bluetooth Speaker', 'Portable speaker with excellent sound quality', 2500.00);

Select * from products;

-- 11. Update the status of a specific order.

DECLARE @OrdersID INT = 1; 
DECLARE @NewStatus VARCHAR(50) = 'Shipped';

UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID; 

Select * from Orders;


-- 12. Calculate and update the number of orders placed by each customer.

UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

Select * from Customers;
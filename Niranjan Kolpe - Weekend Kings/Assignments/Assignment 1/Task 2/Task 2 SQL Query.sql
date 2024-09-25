-- Niranjan Kolpe - C# Batch-2
-- SQL - Assignment 1 - Electronic Gadgets
-- Task 2

-- 1. Write an SQL query to retrieve the names and emails of all customers.
USE NiranjanDB;
SELECT FirstName, LastName, Email FROM Customers;

-- 2. Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT OrderID, FirstName, LastName, OrderDate FROM Orders, Customers WHERE Orders.CustomerID=Customers.CustomerID;

-- 3. Write an SQL query to insert a new customer record into the "Customers" table.
-- Include customer information such as name, email, and address.
INSERT INTO Customers VALUES (11, 'Benedict', 'Cumberbatch', 'benedict@gmail.com', 9999999982, 'Chennai');
SELECT * FROM Customers;

-- 4. Write an SQL query to update the prices of all electronic gadgets in the "Products" table by
-- increasing them by 10%.
UPDATE Products SET Price=Price+(Price*10/100);
SELECT * FROM Products;

-- 5. Write an SQL query to delete a specific order and its associated order details from the
-- "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.
declare @OrderID int = 10;

--before deletion
select * from Orders;
select * from OrderDetails;

--after deletion
delete from OrderDetails
where OrderID=@OrderID;

delete from Orders
where OrderID = @OrderID;

Select * from Orders;
select * from OrderDetails;

-- 6. Write an SQL query to insert a new order into the "Orders" table. Include the customer ID,
-- order date, and any other necessary information.
INSERT INTO Orders VALUES (10, 2, '2024-09-19', 1000);
SELECT * FROM Orders;

-- 7. Write an SQL query to update the contact information (e.g., email and address) of a specific
-- customer in the "Customers" table. Allow users to input the customer ID and new contact
-- information.
DECLARE @CustomerID int = 7;
DECLARE @Email varchar(50) = 'clintbarton@gmail.com';

SELECT * FROM Customers WHERE CustomerID = @CustomerID;
UPDATE Customers SET Email = @Email WHERE CustomerID = @CustomerID;
SELECT * from Customers WHERE CustomerID = @CustomerID;

-- 8. Write an SQL query to recalculate and update the total cost of each order in the "Orders"
-- table based on the prices and quantities in the "OrderDetails" table.
SELECT * FROM Orders;
-- The "TotalAmount" column has already been set according to the "Price" and "Quantity" columns,
-- when the order was placed and the record for it was inserted.

-- 9. Write an SQL query to delete all orders and their associated order details for a specific
-- customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID
-- as a parameter.
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
BEGIN TRANSACTION;
DECLARE @CustomerID INT = 6;
DELETE FROM OrderDetails WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);
DELETE FROM Orders WHERE CustomerID = @CustomerID;
COMMIT TRANSACTION;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

-- 10. Write an SQL query to insert a new electronic gadget product into the "Products" table,
-- including product name, category, price, and any other relevant details.
BEGIN TRANSACTION;
SELECT * FROM Products;
INSERT INTO Products (ProductID, ProductName, Description, Price) VALUES (11, 'Speaker', 'Bluetooth Speaker', 2000);
SELECT * FROM Products;
COMMIT TRANSACTION;

-- 11. Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from
-- "Pending" to "Shipped"). Allow users to input the order ID and the new status.
UPDATE Orders SET Status='Pending';
SELECT * FROM Orders;
BEGIN TRANSACTION;
DECLARE @OrderID INT = 8;
UPDATE Orders SET Status='Shipped' WHERE OrderID=@OrderID;
SELECT * FROM Orders;
COMMIT TRANSACTION;

-- 12. Write an SQL query to calculate and update the number of orders placed by each customer
-- in the "Customers" table based on the data in the "Orders" table.
BEGIN TRANSACTION;
UPDATE Customers SET NumberOfOrders = (SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID);
SELECT * FROM Customers;
COMMIT TRANSACTION;
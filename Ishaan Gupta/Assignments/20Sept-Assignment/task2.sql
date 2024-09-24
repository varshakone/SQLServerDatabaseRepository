--1) Write an SQL query to retrieve the names and emails of all customers. 
SELECT FirstName, LastName, Email FROM Customers;


-- 2) Write an SQL query to list all orders with their order dates and corresponding customer names.
SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName FROM Orders O 
JOIN Customers C ON O.CustomerID = C.CustomerID;


-- 3) Write an SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Parth', 'Sharma', 'ps@email.com', '+91-78901-22122', 'West Delhi, New Delhi, India');


-- 4) Write an SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%.
UPDATE Products
SET Price = Price * 1.10;


-- 5) Write an SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.DECLARE @OrderID INT = 1;  
DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;


-- 6) Write an SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES (1, '2024-09-20', 499.99)


-- 7) Write an SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information
DECLARE @CustomerID INT = 5
UPDATE Customers
SET Email = 'updated.email@example.com',
    Address = '456 Updated Address'
WHERE CustomerID = @CustomerID;


-- 8) Write an SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.
UPDATE Orders
SET TotalAmount = ISNULL((
    SELECT SUM(OD.Quantity * P.Price)
    FROM OrderDetails OD
    JOIN Products P ON OD.ProductID = P.ProductID
    WHERE OD.OrderID = Orders.OrderID
), 0);


-- 9) Write an SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter.
DECLARE @CustomerID INT = 6;  
DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = @CustomerID);
DELETE FROM Orders
WHERE CustomerID = @CustomerID;


-- 10) Write an SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
INSERT INTO Products (ProductName, Description, Price) VALUES ('Charger', 'Wireless Charger', 299.99);


-- 11) Write an SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status
ALTER TABLE Orders ADD Status VARCHAR(20);
DECLARE @OrderID INT = 1;  
DECLARE @NewStatus VARCHAR(20) = 'Shipped';
UPDATE Orders
SET Status = @NewStatus
WHERE OrderID = @OrderID


-- 12) Write an SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.ALTER TABLE Customers ADD OrderCount INT DEFAULT 0; 
UPDATE Customers
SET OrderCount = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);
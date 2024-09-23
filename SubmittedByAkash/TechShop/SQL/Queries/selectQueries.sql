
--Task 1 ------
-- 1 ->SQL query to retrieve the names and emails of all customers

USE TechShop;
GO

SELECT FirstName, LastName, Email
FROM Customers;
GO

-- 2  SQL query to list all orders with their order dates and corresponding customer names.
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
    JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID;
GO

-- 3--> SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address. 
INSERT INTO Customers
    (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (12 , 'Modi JI', 'Narendra', 'modi@gmail.com', '1234567890', 'Delhi');
GO

SELECT *
FROM Customers;
GO

--4 -->SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%
UPDATE Products
SET Price = Price * 1.1;
GO

-- 5---> SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter

-- Create a stored procedure to delete an order and its associated order details
CREATE PROCEDURE DeleteOrderDetailz
    @OrderID INT
AS
BEGIN
    -- Delete from OrderDetails first to avoid foreign key constraint issues
    DELETE FROM OrderDetails WHERE OrderID = @OrderID;

    -- Delete from Orders
    DELETE FROM Orders WHERE OrderID = @OrderID;
END;
GO

-- Execute the stored procedure to delete an order and its associated order details
EXEC DeleteOrderDetailz @OrderID = 10;
GO

-- Verify that the order and its details have been deleted
SELECT *
FROM Orders;
GO

-- 6 SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information
INSERT INTO Orders
    (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (13, 1, '2022-01-01', 100.00);
GO

-- 7 SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information as parameters.

-- Create a stored procedure to update customer contact information
CREATE PROCEDURE UpdateCustomerContactInfo
    @CustomerID INT,
    @Email NVARCHAR(50),
    @Address NVARCHAR(50)
AS
BEGIN
    UPDATE Customers
    SET Email = @Email,
        Address = @Address
    WHERE CustomerID = @CustomerID;
END;
GO

-- Execute the stored procedure to update customer contact information
EXEC UpdateCustomerContactInfo @CustomerID = 1, @Email = 'changeAkash@gmail.com', @Address = 'Sirusiri IT Park';
GO

--8 SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
WHERE Orders.OrderID = od.OrderID
);
GO

SELECT TotalAmount
FROM Orders;
GO

-- 9 SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter

-- Create a stored procedure to delete all orders and their associated order details for a specific customer
CREATE PROCEDURE DeleteOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    -- Delete from OrderDetails first to avoid foreign key constraint issues
    DELETE FROM OrderDetails
    WHERE OrderID IN (SELECT OrderID
    FROM Orders
    WHERE CustomerID = @CustomerID);

    -- Delete from Orders
    DELETE FROM Orders WHERE CustomerID = @CustomerID;
END;
GO

-- Execute the stored procedure to delete all orders and their associated order details for a specific customer
EXEC DeleteOrdersByCustomer @CustomerID = 1;
GO

-- Verify that the orders and their details have been deleted
SELECT *
FROM Orders;
GO

-- 10 SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.
INSERT INTO Products
    (ProductID, ProductName, Description, Price)
VALUES
    (13, 'Ipad ', 'Apple ', 5600.00);
GO

-- 11 SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status as parameters.

ALTER TABLE Orders
ADD Status NVARCHAR(57);
GO

UPDATE Orders
SET Status = 'Pending';
GO

-- Create a stored procedure to update the status of a specific order
CREATE PROCEDURE updateStatus
    @OrderID INT,
    @Status NVARCHAR(50)
AS
BEGIN
    UPDATE Orders
    SET Status = @Status
    WHERE OrderID = @OrderID;
END;
GO

-- Execute the stored procedure to update the status of a specific order
EXEC updateStatus @OrderID = 10, @Status = 'Shipped';
GO

-- Verify that the order status has been updated
SELECT *
FROM Orders;
GO

--12  SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table
UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
FROM Orders
WHERE Orders.CustomerID = Customers.CustomerID
);
GO





-------TASK 3 ---------

-- 1 - SQL query to retrieve a list of all orders along with customer information (e.g.,customer name) for each order

SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName , Orders.TotalAmount
FROM Orders
    JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID;
GO


-- 2 - SQL query to find the total revenue generated by each electronic gadget product.Include the product name and the total revenue.

SELECT Products.ProductName, SUM(OrderDetails.Quantity * Products.Price) AS TotalRevenue
FROM OrderDetails
    JOIN Products
    ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.ProductName;
GO



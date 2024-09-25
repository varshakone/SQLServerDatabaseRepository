
-- 1 ->SQL query to retrieve the names and emails of all customers

USE TechShop;
SELECT FirstName, LastName, Email
FROM Customers;

-- 2  SQL query to list all orders with their order dates and corresponding customer names.
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
    JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID;

-- 3--> SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address. 

-- Add a new customer entry with personal details like name, email, and address.
INSERT INTO Customers
    (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
    (11 , 'Rajesh', 'Sharma', 'rajesh.sharma@example.com', '9876543210', 'Mumbai');

SELECT *
FROM Customers;

-- 4 -->SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%

-- Adjust prices of all products in the "Products" table by a 10% increase.
UPDATE Products
SET Price = Price * 1.1;

-- 5---> SQL query to delete a specific order and its associated order details from the "Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter

-- Stored procedure to remove an order and its related order details, based on the provided OrderID.
CREATE PROCEDURE DeleteOrderDetailz
    @OrderID INT
AS
BEGIN
    -- First, remove the details of the order to avoid any foreign key conflicts.
    DELETE FROM OrderDetails WHERE OrderID = @OrderID;

    -- Now, delete the order itself from the "Orders" table.
    DELETE FROM Orders WHERE OrderID = @OrderID;
END;

-- Run the stored procedure to remove the selected order and its details.
EXEC DeleteOrderDetailz @OrderID = 9;

-- Check to confirm the deletion of the order and its details.
USE TechShop;
SELECT *
FROM Orders;

-- 6 SQL query to insert a new order into the "Orders" table. Include the customer ID, order date, and any other necessary information

-- Insert a new record in the "Orders" table with necessary details such as CustomerID, date, and amount.
INSERT INTO Orders
    (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
    (9, 1, '2022-01-01', 100.00);

-- 7 SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table. Allow users to input the customer ID and new contact information as parameters.

-- Procedure to change the contact information of a customer by providing the new email and address.
CREATE PROCEDURE UpdateCustomerContactInfo
    @CustomerID INT,
    @Email NVARCHAR(50),
    @Address NVARCHAR(50)
AS
BEGIN
    -- Update the email and address of the given customer ID.
    UPDATE Customers
    SET Email = @Email,
        Address = @Address
    WHERE CustomerID = @CustomerID;
END;

-- Execute the procedure to update contact details for the specified customer.
EXEC UpdateCustomerContactInfo @CustomerID = 1, @Email = 'ThisIsChanged@gmail.com', @Address = 'Church Street Mumbai';

-- 8 SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table

-- Recalculate the total cost for each order based on product prices and quantities.
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
WHERE Orders.OrderID = od.OrderID
);

-- Display the updated total amounts for all orders.
SELECT TotalAmount
FROM Orders;

-- 9 SQL query to delete all orders and their associated order details for a specific customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter

-- A procedure to remove all orders and their associated details for a specific customer.
CREATE PROCEDURE DeleteOrdersByCustomer
    @CustomerID INT
AS
BEGIN
    -- Start by removing all related order details to avoid any foreign key issues.
    DELETE FROM OrderDetails
    WHERE OrderID IN (SELECT OrderID
    FROM Orders
    WHERE CustomerID = @CustomerID);

    -- Remove the orders for the customer after deleting the details.
    DELETE FROM Orders WHERE CustomerID = @CustomerID;
END;

-- Run the procedure to delete all orders and related details for the given customer.
EXEC DeleteOrdersByCustomer @CustomerID = 1;

-- Verify that the orders and related details have been deleted.
SELECT *
FROM Orders;

-- 10 SQL query to insert a new electronic gadget product into the "Products" table, including product name, category, price, and any other relevant details.

-- Insert a new product entry into the "Products" table, providing details like name, description, and price.
INSERT INTO Products
    (ProductID, ProductName, Description, Price)
VALUES
    (11, 'Dell XPS', 'Dell Laptop', 500.00);

-- 11 SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). Allow users to input the order ID and the new status as parameters.

-- Add a new column "Status" to the "Orders" table to track order states.
ALTER TABLE Orders
ADD Status NVARCHAR(50);

-- Set the status of all orders to "Pending" initially.
UPDATE Orders
SET Status = 'Pending';

-- Create a procedure to change the status of an order based on the order ID and new status.
CREATE PROCEDURE updateStatus
    @OrderID INT,
    @Status NVARCHAR(50)
AS
BEGIN
    -- Update the status of the specified order.
    UPDATE Orders
    SET Status = @Status
    WHERE OrderID = @OrderID;
END;

-- Run the procedure to set the status of the order to "Shipped."
EXEC updateStatus @OrderID = 10, @Status = 'Shipped';

-- Verify that the status update was successful by retrieving the order data.
SELECT *
FROM Orders;

-- 12  SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table

-- Update the "Customers" table to reflect the total number of orders each customer has made.
UPDATE Customers
SET NumberOfOrders = (
    SELECT COUNT(*)
FROM Orders
WHERE Orders.CustomerID = Customers.CustomerID
);

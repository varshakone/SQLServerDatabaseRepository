Adarsh sharma C# batch 2
Assignment : 1 ( Task 2 )--

--SQL query to retrieve the names and emails of all customers.--
SELECT FirstName, LastName, Email
FROM Customers;

-- SQL query to list all orders with their order dates and corresponding customer names.--
SELECT O.OrderID, O.OrderDate, C.FirstName, C.LastName
FROM Orders O
INNER JOIN Customers C ON O.CustomerID = C.CustomerID;

--SQL query to insert a new customer record into the "Customers" table. Include customer information such as name, email, and address.--
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('rajesh', 'vaghle', 'vaghle@gmail.com', '507543210', '789 gopur jabalpur');

--SQL query to update the prices of all electronic gadgets in the "Products" table by increasing them by 10%--
UPDATE Products
SET Price = Price * 1.10
WHERE ProductName IN ('laptop1','laptop','tufgaming pc','zephyrus laptop',' iphone 15 pro','realme xt','air pods pro','oneplus nord','nord ce3 lite');

--SQL query to delete a specific order and its associated order details from the 
--"Orders" and "OrderDetails" tables. Allow users to input the order ID as a parameter.--
DELETE FROM Orders
WHERE OrderID = 5;

--SQL query to insert a new order into the "Orders" table. Include the customer ID,
--order date, and any other necessary information--
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (3, '2024-09-15', 249.99);

--SQL query to update the contact information (e.g., email and address) of a specific customer in the "Customers" table.
--Allow users to input the customer ID and new contact information--
UPDATE Customers
SET Email = 'yz@gmail.com',
    Address = 89
WHERE CustomerID = 7;

-- SQL query to recalculate and update the total cost of each order in the "Orders" table based on the prices and quantities in the "OrderDetails" table.--
UPDATE Orders
SET TotalAmount = (
    SELECT SUM(OD.Quantity * P.Price)
    FROM OrderDetails OD
    INNER JOIN Products P ON OD.ProductID = P.ProductID
    WHERE OD.OrderID = Orders.OrderID
    GROUP BY OD.OrderID
)
WHERE OrderID IN (SELECT DISTINCT OrderID FROM OrderDetails);

--SQL query to delete all orders and their associated order details for a specific
--customer from the "Orders" and "OrderDetails" tables. Allow users to input the customer ID as a parameter--
DELETE FROM OrderDetails
WHERE OrderID IN (
    SELECT OrderID FROM Orders WHERE CustomerID = 7
);

DELETE FROM Orders
WHERE CustomerID = 7;

-- SQL query to insert a new electronic gadget product into the "Products" table, including product name, 
--category, price, and any other relevant details.--
INSERT INTO Products (ProductName, Description, Price)
VALUES ('Wireless Earbuds', 'High-quality wireless earbuds with noise cancellation', 149.99);

--SQL query to update the status of a specific order in the "Orders" table (e.g., from "Pending" to "Shipped"). 
--Allow users to input the order ID and the new status.--
ALTER TABLE Orders
ADD Status NVARCHAR(20) DEFAULT 'pending';

UPDATE Orders
SET Status = 'pending'
WHERE Status IS NULL;

UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 5;

-- SQL query to calculate and update the number of orders placed by each customer in the "Customers" table based on the data in the "Orders" table.--
ALTER TABLE Customers
ADD OrderCount INT DEFAULT 0;

UPDATE Customers
SET OrderCount = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);

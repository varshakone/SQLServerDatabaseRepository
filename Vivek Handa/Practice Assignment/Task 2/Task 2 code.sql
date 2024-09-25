USE TechShop;

-- Answer 1
SELECT FirstName, LastName, Email
FROM Customers;

--Answer 2
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--Answer 3
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES ('Vivek', 'Handa', 'vh1@example.com', '91212121212', '21, Diwalipur Colony');
SELECT * FROM Customers;

--Answer 4
UPDATE Products set Price = Price * 1.10;
SELECT * FROM Products;

--Answer 5
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

DECLARE @OrderID int = 4;
DELETE FROM OrderDetails WHERE OrderID = @OrderID;
DELETE FROM Orders WHERE OrderID = @OrderID;

SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--Answer 6
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES (20, '2024-09-20', 12000);
SELECT * FROM Orders;

--Answer 7
UPDATE Customers SET Email = 'newemail@example.com', Address = 'New Address 123'
WHERE CustomerID = 12;
SELECT * FROM Customers;

--Answer 8
UPDATE Orders SET TotalAmount = (
    SELECT SUM(od.Quantity * p.Price)
    FROM OrderDetails od
    JOIN Products p ON od.ProductID = p.ProductID
    WHERE od.OrderID = Orders.OrderID
);
SELECT * FROM Orders;

--Answer 9
DELETE from OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 14);

DELETE from Orders
WHERE CustomerID = 14;

SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--Answer 10
INSERT INTO Products (ProductName, Description, Price)
VALUES ('New Car', 'This car is a electric car', 1900000);
SELECT * FROM Products;

--Answer 11
ALTER TABLE Orders ADD Status VARCHAR(50);  
UPDATE Orders SET Status = 'Shipped'
WHERE OrderID = 1;
SELECT * FROM Orders;

--Answer 12
ALTER TABLE Customers ADD NumberOfOrders INT;
UPDATE Customers SET NumberOfOrders = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);
SELECT *FROM Customers;











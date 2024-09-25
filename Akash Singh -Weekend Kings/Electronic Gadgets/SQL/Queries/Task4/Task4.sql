

--TASK 4 Subquery and its type

--Write an SQL query to find out which customers have not placed any orders.
use techshop;
SELECT Customers.FirstName
FROM Customers
    LEFT JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.CustomerID IS NULL;

--2 Write an SQL query to find the total number of products available for sale

SELECT SUM(QuantityInStock) AS TotalProductsAvailable
FROM Inventory;




--3 -Write an SQL query to calculate the total revenue generated by TechShop.

SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;
GO




-- 4 Write an SQL query to calculate the average quantity ordered for products in a specific category. Allow users to input the category name as a parameter


CREATE PROCEDURE getAvg
    @categoryName NVARCHAR(50)
AS
BEGIN
    SELECT AVG(od.Quantity) AS AverageQuantityOrdered
    FROM OrderDetails od
        JOIN Products p ON od.ProductID = p.ProductID
    WHERE p.Category = @categoryName;
END
GO

EXEC getAvg @categoryName = 'Electric';
GO






-- 5 Write an SQL query to calculate the total revenue generated by a specific customer. Allow users to input the customer ID as a parameter
CREATE PROCEDURE getRevenue
    @CustomerID INT
AS
BEGIN
    SELECT SUM(od.Quantity * p.Price) AS TotalRevenue
    FROM Orders o
        JOIN OrderDetails od ON o.OrderID = od.OrderID
        JOIN Products p ON od.ProductID = p.ProductID
    WHERE o.CustomerID = @CustomerID;
END
GO

EXEC getRevenue @CustomerID = 3;



--6 -Write an SQL query to find the customers who have placed the most orders. List their names and the number of orders they've placed.

SELECT TOP 1
    Customers.FirstName, Customers.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Customers
    JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName




--7- Write an SQL query to find the most popular product category, which is the one with the highest total quantity ordered across all orders.

SELECT TOP 1
    Products.Category, SUM(OrderDetails.Quantity) AS TotalQuantityOrdered
FROM OrderDetails
    JOIN Products
    ON OrderDetails.ProductID = Products.ProductID
GROUP BY Products.Category
ORDER BY TotalQuantityOrdered DESC;
GO



-- 8 Write an SQL query to find the customer who has spent the most money (highest total revenue) on electronic gadgets. List their name and total spending.

SELECT TOP 1
    Customers.FirstName, Customers.LastName, SUM(OrderDetails.Quantity * Products.Price) AS TotalSpending
FROM Customers
    JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
    JOIN OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
    JOIN Products
    ON OrderDetails.ProductID = Products.ProductID
WHERE Products.Category = 'Electric'
GROUP BY Customers.FirstName, Customers.LastName
ORDER BY TotalSpending DESC;
GO


-- 9n Write an SQL query to calculate the average order value (total revenue divided by the number of orders) for all customers

SELECT
    Customers.FirstName, Customers.LastName,
    SUM(Orders.TotalAmount) / COUNT(Orders.OrderID) AS AverageOrderValue
FROM Customers
    JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.FirstName, Customers.LastName;
GO



-- 10 Write an SQL query to find the total number of orders placed by each customer and list their names along with the order count.

SELECT Customers.LastName , COUNT(Orders.OrderID) AS OrderCount
FROM Customers
    JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.LastName;
    GO
    


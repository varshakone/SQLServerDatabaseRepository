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
=======

-- 1. Query to display customer list by the first name in descending order:
   
   SELECT first_name
   FROM customers
   ORDER BY first_name DESC;
   
-- 2. Query to display the first name, last name, and city of the customers, sorted by city first and then by first name:
   
   SELECT first_name, last_name, city
   FROM customers
   ORDER BY city, first_name;
   

-- 3. Query to return the top three most expensive products:

   SELECT TOP 3 product_name, list_price
   FROM products
   ORDER BY list_price DESC;

-- 4. Query to find the products whose list price is greater than 300 and model year is 2018:

   SELECT product_name, list_price, model_year
   FROM products
   WHERE list_price > 300 AND model_year = 2018;

-- 5. Query to find products whose list price is greater than 3,000 or model year is 2018:

   SELECT product_name, list_price, model_year
   FROM products
   WHERE list_price > 3000 OR model_year = 2018;

-- 6. Query to find products whose list prices are between 1,899 and 1,999.99:

   SELECT product_name, list_price
   FROM products
   WHERE list_price BETWEEN 1899 AND 1999.99;

-- 7. Query using the IN operator to find products whose list price is 299.99, 466.99, or 489.99:

   SELECT product_name, list_price
   FROM products
   WHERE list_price IN (299.99, 466.99, 489.99);

-- 8. Query to find customers where the first character in the last name is in the range A through C:

   SELECT first_name, last_name
   FROM customers
   WHERE last_name LIKE '[A-C]%';

-- 9. Query using NOT LIKE operator to find customers where the first character in the first name is not the letter A:

   SELECT first_name, last_name
   FROM customers
   WHERE first_name NOT LIKE 'A%';

-- 10. Query to return the number of customers by state and city, grouped by state and city:

    SELECT state, city, COUNT(*) AS number_of_customers
    FROM customers
    GROUP BY state, city;


-- 11. Query to return the number of orders placed by the customer, grouped by customer ID and year:

    SELECT customer_id, YEAR(order_date) AS order_year, COUNT(*) AS number_of_orders
    FROM orders
    GROUP BY customer_id, YEAR(order_date);

-- 12. Query to find the maximum and minimum list price, grouped by category ID, and filter out categories where the maximum list price is greater than 4,000 or the minimum list price is less than 500:

    SELECT category_id, MAX(list_price) AS max_list_price, MIN(list_price) AS min_list_price
    FROM products
    GROUP BY category_id
    HAVING MAX(list_price) > 4000 OR MIN(list_price) < 500;


SELECT * FROM Customers;
--Task 2
--1)
SELECT CustomerName, ContactEmail FROM Customers;

--2)
SELECT  o.OrderDate, c.CustomerName,o.OrderId ,o.TotalAmount,o.ShippingAddress,o.Status
FROM Orders o
JOIN Customers c ON o.CustomerId=c.CustomerId;

--3)
INSERT INTO Customers VALUES(113,'Mrunali Rajkule','mrunali@gmail.com','837889899','ABC-Chowk','Pune','India');
SELECT * FROM Customers;

--4)
UPDATE Products 
SET Price=Price*1.10
SELECT * FROM Products;

--5)
CREATE PROCEDURE DeleteOrders
@OrderId int
AS
BEGIN
DELETE FROM OrderDetails
WHERE OrderId=@OrderId;

DELETE FROM Orders
WHERE OrderId=@OrderId;
END;

EXEC DeleteOrders @OrderId=305;

SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--6)
INSERT INTO Orders
VALUES(313,105,'2024-09-16',614.00,'654 Spruce Rd, Berlin,Germany','Processing')
SELECT * FROM Orders;

--7)
SELECT * FROM Customers;
CREATE PROCEDURE UpdateContacts
	@CustomerId int,
	@email varchar(200),
	@Address varchar(200),
	@Phone varchar(200)
AS
BEGIN
	UPDATE Customers
	SET ContactEmail=@Email,
	Address=@address,
	ContactPhone=@Phone
	WHERE CustomerId=@CustomerId;
END;

EXEC UpdateContacts @CustomerId=103,@Email='alicej@gmail.com',@address='485-Privet Drive',@Phone='7653467889'
SELECT * FROM Customers;

--8)
UPDATE o
SET o.TotalAmount = subquery.TotalCost
FROM Orders o
JOIN (
    -- Subquery to calculate the total cost for each order
    SELECT od.OrderId, SUM(od.Quantity * od.Price) AS TotalCost
    FROM OrderDetails od
    GROUP BY od.OrderId
) subquery ON o.OrderId = subquery.OrderId;

SELECT * FROM Orders;

--9)
CREATE PROCEDURE DeleteOrderForCustomer
@customerid int
AS
BEGIN
	DELETE FROM Orders
	WHERE CustomerId=@customerid;

	DELETE FROM OrderDetails
	WHERE OrderId IN(
	SELECT OrderId FROM Orders WHERE CustomerId=@customerid
	);
END;

EXEC DeleteOrderForCustomer @customerid=111;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

--10)
INSERT INTO Products 
VALUES(213,'MOTOROLA G34','Electronics',11999,12);
SELECT * FROM Products;

--11)
SELECT * FROM Orders;

CREATE PROCEDURE StatusUpdate
@orderid int
AS
BEGIN
	UPDATE Orders
	Set Status='Shipped'
	WHERE OrderId=@orderid
END;	

EXEC StatusUpdate @orderid=310
SELECT * FROM Orders;

--12)
--UPDATING AND ADDING MORE ORDERS FOR A SPECIFIC CUSTOMER
INSERT INTO Orders 
Values
(314,102,'2024-09-15',499.99,'456 Oak St, Mumbai, India', 'Processing'),
(315,107,'2024-09-15',499.99,'432 Cedar St, Madrid, Spain', 'Shipped');

INSERT INTO Orders 
Values
(316,103,'2024-09-17',799.99,'789 Pine St, London, UK', 'Delivered'),
(317,109,'2024-09-19',600.00,'321 Ash St, New York, USA', 'Shipped');

SELECT CustomerId, COUNT(distinct OrderId) as TotalOrders
FROM Orders
GROUP BY CustomerId; 


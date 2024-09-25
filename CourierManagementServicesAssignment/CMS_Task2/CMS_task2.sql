--TASK 2: Select,Where
USE CourierManagementSystem;

--list all customers
SELECT Name FROM Users; 

--list all orders for a specific customer
SELECT * FROM Couriers WHERE SenderName='Nancy';

--list all couriers
SELECT * FROM Couriers;

--list all packages for a specific order
SELECT * FROM Couriers WHERE CourierID=107;

--list all deliveries for a specific courier
SELECT * FROM Couriers WHERE CourierID IN (SELECT ServiceName FROM CourierServices WHERE ServiceName='Express Delivery');--no output

--list all undelivered packages:
SELECT * FROM Couriers WHERE Status='undelivered';

--list all packages that are scheduled for delivery today
SELECT * FROM Couriers WHERE DeliveryDate= CAST(GETDATE() AS DATE);

--list all packages with a specific status
SELECT * FROM Couriers WHERE Status='delivered';

--calculate the total number of packages for each courier
SELECT ServiceName,COUNT(*)  AS no_of_packages FROM CourierServices WHERE ServiceName IN('Standard Service','Express Service') GROUP BY ServiceName;

--find the average delivery time for each courier
                                                   --no output

--list all packages with a specific weight range
SELECT * FROM Couriers WHERE Weight> 2.0 AND Weight< 5.0;

--retrieve employees whose names contain 'John'
SELECT * FROM Employees WHERE Name LIKE ('%John%');

--retrieve all courier records with payments greater than $50
SELECT * FROM Couriers WHERE CourierID IN (SELECT CourierID FROM Payments WHERE Amount > 50);


--Scope: Inner Queries, Non Equi Joins, Equi joins,Exist,Any,All
USE CourierManagementSystem;

--Find couriers that have a weight greater than the average weight of all couriers
SELECT * FROM Couriers WHERE Weight > (SELECT AVG(Weight) FROM Couriers);


--Find the names of all employees who have a salary greater than the average salary:
SELECT Name FROM Employees WHERE Salary > (SELECT AVG(Salary) FROM Employees);


--Find the total cost of all courier services where the cost is less than the maximum cost
SELECT SUM(Cost) AS Total_cost FROM CourierServices WHERE Cost < (SELECT MAX(Cost)  FROM CourierServices);


--Find all couriers that have been paid for
SELECT * FROM Couriers WHERE CourierID IN (SELECT CourierID FROM Payments);


--Find the locations where the maximum payment amount was made
SELECT LocationID FROM Payments WHERE Amount = (SELECT MAX(Amount) FROM Payments);


--Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
SELECT * FROM Couriers WHERE Weight > (SELECT Weight FROM Couriers WHERE SenderName = 'Thomas');
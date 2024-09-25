--TASK 4 : Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join

USE CourierManagementSystem;

--Retrieve Payments with Courier Information
SELECT  c.CourierID, p.PaymentID, p.Amount, p.PaymentDate FROM Payments p INNER JOIN  Couriers c ON p.CourierID= c.CourierID;


--Retrieve Payments with Location Information
SELECT l.LocationID, p.PaymentID, p.Amount ,p.PaymentDate FROM Payments p INNER JOIN Locations l ON p.LocationID= l.LocationID;


--Retrieve Payments with Courier and Location Information
SELECT c.CourierID, l.LocationID, p.Amount, p.PaymentDate FROM Payments p INNER JOIN Couriers c ON p.CourierID=c.CourierID 
INNER JOIN Locations l ON p.LocationId= l.LocationID;


--List all payments with courier details
SELECT * FROM Payments p LEFT JOIN Couriers c ON p.CourierID=c.CourierID; 
 

--Total payments received for each courier
--Calculating Total Payments for Each Courier
SELECT SUM(p.Amount) AS Total_payment,cs.ServiceName FROM Payments p  INNER JOIN CourierServices cs 
ON p.CourierID=cs.CourierID GROUP BY cs.ServiceName ,cs.CourierID;


--List payments made on a specific date
 SELECT * FROM Payments WHERE PaymentDate='2024-09-22';


--List Payments Within a Date Range
SELECT * FROM Payments WHERE PaymentDate BETWEEN '2024-09-01' AND '2024-09-15';


--Retrieve a list of all users and their corresponding courier records, including cases where there are no matches on either side
--Retrieve a list of couriers and their corresponding sender information (if available)
SELECT u.Name[Users], c.* FROM Users u INNER JOIN Couriers c ON u.Name=c.SenderName;


--Retrieve a list of all couriers and their corresponding services, including cases where there are no matches on either side
SELECT cs.*, c.* FROM Couriers c INNER JOIN CourierServices cs ON c.CourierID=cs.CourierID;


--Retrieve a list of all employees and their corresponding payments, including cases where there are no matches on either side
SELECT e.*, p.* FROM Employees e LEFT JOIN Payments p  ON e.EmployeeID =p.CourierID ;


--List all users and all courier services, showing all possible combinations.
SELECT u.*, cs.* FROM Users u CROSS JOIN CourierServices cs;

--List all employees and all locations, showing all possible combinations
SELECT e.*, l.* FROM Employees e CROSS JOIN Locations l;


--Retrieve a list of couriers and their corresponding receiver information (if available)
SELECT c.CourierID ,c.ReceiverName,c.ReceiverAddress FROM Couriers c;


--Retrieve a list of couriers along with the courier service details (if available)
SELECT c.*, cs.* FROM Couriers c LEFT JOIN CourierServices cs ON c.CourierID = cs.ServiceID;


--Retrieve a list of employees and the number of couriers assigned to each employee
SELECT e.EmployeeID, COUNT(c.CourierID) AS CourierCount FROM Employees e LEFT JOIN Couriers c ON e.EmployeeID = c.CourierID GROUP BY e.EmployeeID;


--Retrieve a list of locations and the total payment amount received at each location
SELECT l.LocationId, SUM(p.Amount) AS TotalPayments FROM Locations l LEFT JOIN Payments p ON l.LocationId = p.LocationID GROUP BY l.LocationId;


--Retrieve all couriers sent by the same sender (based on SenderName)
SELECT c.SenderName,cs.* FROM Couriers c INNER JOIN CourierServices cs ON c.CourierID=cs.CourierID  ;



--List all employees who share the same role.
SELECT e.Name [Employee], e.Role[emp_role] FROM Employees e	WHERE e.Role='Dispatcher';


--Retrieve all payments made for couriers sent from the same location.
SELECT p.* FROM Payments p INNER JOIN Couriers c ON p.CourierID = c.CourierID INNER JOIN Locations l ON l.LocationID=p.LocationId;


--Retrieve all couriers sent from the same location (based on SenderAddress).
SELECT c.* FROM Couriers c INNER JOIN Payments p ON c.CourierID=p.CourierID INNER JOIN Locations l ON l.LocationID=p.LocationId;


--List employees and the number of couriers they have delivered:
SELECT e.EmployeeID, COUNT(c.CourierID) AS DeliveredCount FROM Employees e LEFT JOIN Couriers c ON e.EmployeeID = c.CourierID 
GROUP BY e.EmployeeID;--some error


--Find couriers that were paid an amount greater than the cost of their respective courier services
SELECT c.*, p.* FROM Couriers c INNER JOIN Payments p ON c.CourierID = p.CourierID 
INNER JOIN CourierServices cs ON p.Amount > cs.Cost;



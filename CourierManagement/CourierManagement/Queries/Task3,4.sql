SELECT e.EmployeeID,e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue
FROM Location l
JOIN Payment p ON l.LocationID = P.LocationID
GROUP BY l.LocationID,  l.LocationName;

SELECT l.LocationID, l.LocationName, COUNT(c.CourierID) AS TotalCouriers
FROM Location l
JOIN Courier c ON l.LocationID = c.CourierID
GROUP BY l.LocationID, l.LocationName;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName
HAVING SUM(p.Amount) < '600';

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

SELECT c.CourierID, SUM(p.Amount) AS TotalPayment
FROM Courier c
JOIN Payment p ON c.CourierID = p.PaymentID
WHERE p.LocationID = '4'
GROUP BY c.CourierID
HAVING SUM(p.Amount) > 300;

SELECT c.CourierID, SUM(p.Amount) AS TotalPayments
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
WHERE  p.PaymentDate > '2024-03-15'
GROUP BY c.CourierID
HAVING  SUM(p.Amount) > 500;

SELECT l.LocationID, SUM(p.Amount) AS TotalPayments
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
WHERE p.PaymentDate > '2024-03-20'
GROUP BY l.LocationID
HAVING SUM(p.Amount) > 500;

USE Courier_Management;
SELECT c.*, p.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID;

SELECT p.* , l.*
FROM Payment p
JOIN Location l ON p.PaymentID = l.LocationID;

SELECT p.*, c.*, l.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON p.LocationID = l.LocationID;

SELECT p.* , c.*
FROM Payment p 
LEFT OUTER JOIN Courier c ON p.PaymentID = c.CourierID;

SELECT c.CourierID , SUM(p.Amount) AS TotalPayment
FROM Payment p
JOIN Courier c ON p.PaymentID = c.CourierID 
GROUP BY c.CourierID;

SELECT *
FROM Payment
WHERE PaymentDate = '2024-04-01';

SELECT *
FROM Payment
WHERE PaymentDate BETWEEN '2024-03-01' AND '2024-04-01';

SELECT u.*, c.*
FROM Users u
FULL OUTER JOIN Courier c ON u.UserID = c.CourierID;

SELECT c.*,  cs.*
FROM Courier c
FULL OUTER JOIN CourierServices cs ON c.CourierID = cs.ServiceID;

SELECT e.*,  p.*
FROM Employee e
FULL OUTER JOIN Payment p ON e.EmployeeID = p.PaymentID;

SELECT u.*, cs.*
FROM Users u
CROSS JOIN CourierServices cs;

SELECT e.*,  l.*
FROM Employee e
CROSS JOIN Location l;

SELECT c.CourierID, c.SenderName, c.SenderAddress, p.PaymentID, p.Amount, p.PaymentDate
FROM Courier c
JOIN Payment p ON c.CourierID = p.PaymentID;

SELECT c.CourierID, c.ReceiverName, c.ReceiverAddress, p.PaymentID, p.Amount, p.PaymentDate
FROM Courier c
JOIN Payment p ON c.CourierID = p.PaymentID;

SELECT c.* , cs.*
FROM Courier c
JOIN CourierServices cs ON c.CourierID =cs.ServiceID;

SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriers
FROM Employee e
LEFT JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment
FROM Location l
JOIN Payment p ON l.LocationID = p.LocationID
GROUP BY l.LocationID, l.LocationName;

SELECT *
FROM Courier c
WHERE SenderName = 'John';

SELECT DISTINCT e1.EmployeeID, e1.Name, e1.Role
FROM Employee e1
JOIN Employee e2 ON e1.Role = e2.Role
WHERE e1.EmployeeID != e2.EmployeeID;

SELECT p.*
FROM Payment p
JOIN Courier c ON p.CourierID = c.CourierID
JOIN Location l ON c.CourierID = l.LocationID
GROUP BY l.LocationID, p.PaymentID, p.CourierID, p.LocationID, p.Amount, p.PaymentDate;

SELECT *
FROM Courier c
WHERE SenderAddress LIKE '345 Pine%'

SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalDelivered
FROM Employee e
JOIN Courier c ON e.EmployeeID = c.CourierID
GROUP BY e.EmployeeID, e.Name;

SELECT c.*
FROM Courier c
JOIN Payment p ON c.CourierID = p.CourierID
JOIN CourierServices cs ON c.CourierID = cs.ServiceID
WHERE p.Amount > cs.Cost

SELECT *
FROM Courier
WHERE Weight > (SELECT AVG(Weight) FROM Courier);

SELECT Name, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

SELECT ServiceName, SUM(Cost) AS COST
FROM CourierServices
WHERE Cost < (SELECT MAX(Cost) FROM CourierServices)
GROUP BY ServiceName;

SELECT *
FROM Courier
WHERE CourierID IN (SELECT CourierID FROM Payment);


SELECT p.LocationID, l.LocationName
FROM Payment p
JOIN Location l ON p.LocationID = l.LocationID
WHERE Amount = (SELECT MAX (Amount) FROM Payment);


SELECT *
FROM Courier
WHERE Weight > ALL (SELECT Weight FROM Courier WHERE SenderName = 'Hari');
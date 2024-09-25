USE CourierManagement;

ALTER TABLE Courier
ADD UserID INT;

ALTER TABLE Courier
ADD CONSTRAINT FK_Courier_Users FOREIGN KEY (UserID) REFERENCES Users(UserID);

SELECT * 
FROM Courier
WHERE UserID = 5;

SELECT * 
FROM Courier;

SELECT * 
FROM Courier
WHERE UserID = 5;

SELECT * 
FROM Courier
WHERE CourierID = 15;

SELECT [CourierID], [SenderName], [SenderAddress], [ReceiverName], [ReceiverAddress], 
       [Weight], [Status], [TrackingNumber], [DeliveryDate], [UserID]
FROM [dbo].[Courier]
WHERE [Status] != 'Delivered';

SELECT *
FROM [Courier]
WHERE [Status] = 'Shipped';

ALTER TABLE [dbo].[Courier]
ADD [ServiceID] INT;

ALTER TABLE [dbo].[Courier]
ADD CONSTRAINT FK_Courier_CourierServices FOREIGN KEY ([ServiceID])
REFERENCES [dbo].[CourierServices]([ServiceID]);

SELECT ServiceID, COUNT(*) AS ServiceCount
FROM Courier
GROUP BY ServiceID;

SELECT [ReceiverName],[Weight], [UserID]
FROM Courier;

SELECT *
FROM Employees
WHERE Name LIKE '%John%';

SELECT c.*
FROM Courier c
JOIN Payments p ON c.CourierID = p.CourierID
WHERE p.Amount > 50;


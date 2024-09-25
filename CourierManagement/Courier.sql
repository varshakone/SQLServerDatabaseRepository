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



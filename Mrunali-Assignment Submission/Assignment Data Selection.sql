Database GrpAssign;
CREATE TABLE Customer_data (
    CustomerId INT PRIMARY KEY ,          
    FName VARCHAR(100) NOT NULL,  
    LName VARCHAR(100) NOT NULL,           
	City VARCHAR(100), 
	State VARCHAR(100)
);

create table Product_Data(
	ProductId INT PRIMARY KEY ,           
    ProductName VARCHAR(100) NOT NULL, 
	Price DECIMAL(10, 2) NOT NULL,
    ModelYear INT,
	CategoryId INT
);
CREATE TABLE Order_data (
    OrderId INT PRIMARY KEY ,              
    CustomerId INT NOT NULL,              
    OrderDate DATE NOT NULL,                                
    FOREIGN KEY (CustomerId) REFERENCES Customer_data(CustomerId) 
);
INSERT INTO Customer_data VALUES
 (1,'Vinay','Solanki','Pune','Maharashtra'),
 (2,'Mrunali','Rajkule','Pune','Maharashtra'),
 (3,'Sejal','Sihare','Mandla','Madhya Pradesh');

INSERT INTO Product_Data VALUES
(1,'Dell Laptop',57950.00,2024,100),
(2,'Boat Headset',2999.00,2022,200),
(3,'Book Shelf',3500.00,2020,300); 

INSERT INTO Order_data VALUES
(100,3,'2024-09-20'),
(101,2,'2024-08-18'),
(102,1,'2024-09-15');

INSERT INTO Customer_data VALUES
 (4,'Rohit','Sharma','Mumbai','Maharashtra'),
 (5,'Aman','Kapoor','Chennai','Tamil Nadu'),
 (6,'Sneha','Singh','Jaipur','Rajasthan'),
 (7,'Arjun','Verma','Indore','Madhya Pradesh'),
 (8,'Karan','Mehta','Surat','Gujarat'),
 (9,'Divya','Kumar','Bangalore','Karnataka'),
 (10,'Priya','Patel','Ahmedabad','Gujarat');

INSERT INTO Product_Data VALUES
(4,'Samsung TV',45000.00,2021,400),
(5,'Sony Headphones',3500.00,2023,200),
(6,'HP Printer',15000.00,2023,500),
(7,'Office Chair',5000.00,2022,300),
(8,'Microwave Oven',8000.00,2020,600),
(9,'Apple iPhone',90000.00,2023,100),
(10,'Fitbit Smartwatch',12000.00,2023,700);

INSERT INTO Order_data VALUES
(103,7,'2023-09-10'),
(104,2,'2023-09-12'),
(105,3,'2023-09-15'),
(106,4,'2023-09-18'),
(107,5,'2023-09-20'),
(108,6,'2023-09-22'),
(109,7,'2023-09-25'),
(110,8,'2023-09-28');

--1)
SELECT * 
FROM Customer_data
ORDER BY FName DESC;

--2)
SELECT FName, LName, City
FROM Customer_data
ORDER BY City ASC, FName ASC;

--3)
SELECT TOP 3 ProductName, Price
FROM Product_Data
ORDER BY Price DESC;

--4)
INSERT INTO Product_Data VALUES
(11,'Table Lamp',4500.00,2018,400);

SELECT ProductName, Price, ModelYear
FROM Product_Data
WHERE Price > 300 
AND ModelYear = 2018;

--5)
SELECT ProductName, Price, ModelYear
FROM Product_Data
WHERE Price > 3000
OR ModelYear = 2018;

--6)
SELECT ProductName, Price
FROM Product_Data
WHERE Price BETWEEN 1899 AND 1999.99;

--7)
SELECT ProductName, Price
FROM Product_Data
WHERE Price IN (299.99, 466.99, 489.99);

--8)
SELECT FName, LName, City
FROM Customer_data
WHERE LName LIKE 'A%' OR LName LIKE 'B%' OR LName LIKE 'C%';

--9)
SELECT FName, LName, City
FROM Customer_data
WHERE FName NOT LIKE 'A%';

--10)
SELECT State, City, COUNT(*) AS NumberOfCustomers
FROM Customer_data
GROUP BY State, City
ORDER BY State, City;

--11)
SELECT CustomerId, YEAR(OrderDate) AS OrderYear, COUNT(*) AS NumberOfOrders
FROM Order_data
GROUP BY CustomerId, YEAR(OrderDate)
ORDER BY CustomerId, OrderYear;

--12)
SELECT CategoryId, MAX(Price) AS MaxPrice, MIN(Price) AS MinPrice
FROM Product_Data
GROUP BY CategoryId
HAVING MAX(Price) <= 4000 AND MIN(Price) >= 500;




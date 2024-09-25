create database Practicedb1;
use Practicedb1;

CREATE TABLE Customers(
CustomerID int primary key identity(1,1),
FirstName varchar(50),
LastName varchar(50),
City varchar(50),
State varchar(50),
);

CREATE TABLE Products (
ProductID int primary key identity(1,1),
ProductName varchar(100),
ListPrice decimal(10,2),
ModelYear int,
CategoryID int
);

Create table Orders(
OrderID int primary key identity(1,1),
CustomerID int,
OrderDate date,
foreign key (CustomerID) references Customers(CustomerID)
);


INSERT INTO Customers (FirstName , LastName ,City ,State) 
values ('Vivek','Handa','Indore','MP'),
('Shivam','Katiyar','Indore','MP'),
('Satyam','Katiyar','Ujjain','MP');

INSERT INTO Products (ProductName, ListPrice, ModelYear, CategoryID)
VALUES 
('Tata Tiago', 750000, 2018, 1),
('Tata Tigore', 700000, 2020, 2),
('Tata Curvv', 1800000, 2021, 3),
('Tata Safari', 3000000, 2020, 4),
('Tata Nano', 54999, 2019, 5);

INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
(1, '2024-09-01'),
(2, '2024-09-05'),
(1, '2024-09-10'),
(3, '2024-09-15'),
(2, '2024-09-20');


-- Answer 1
SELECT * from Customers order by FirstName desc;

-- Answer 2
SELECT FirstName , LastName, City from Customers order by City, FirstName;

-- Answer 3
SELECT * from Products order by ListPrice desc offset 0 rows fetch next 3 rows only;

-- Answer 4
SELECT * from Products where ListPrice > 300 and ModelYear = 2018;

-- Answer 5
SELECT * from Products where ListPrice > 3000 or ModelYear = 2018;

-- Answer 6
INSERT into Products values('Speaker',1900,2021,6);
SELECT * from Products where ListPrice between 1899 and 1999.99;

-- Answer 7
INSERT into Products (ProductName, ListPrice, ModelYear, CategoryID)
values 
('Carpet', 299, 2021, 7),  
('Mud Guard', 466, 2022, 7);  

SELECT * from Products where ListPrice in(299.99,466.99,489.99);

-- Answer 8
INSERT into Customers values ('Rajkumar','Joshi','Dewas','MP');
SELECT * from Customers where LastName like'[A-C]%';

-- Answer 9
SELECT * from Customers where FirstName not like 'A%';

-- Answer 10
SELECT State,City, COUNT(*) as CustomerCount FROM Customers group by State,  City;

-- Answer 11
SELECT CustomerID, YEAR(OrderDate) as OrderYear, COUNT(*) as OrderCount FROM Orders group by CustomerID , YEAR(OrderDate);

-- Answer 12
SELECT CategoryID , MAX(ListPrice) as MaxPrice, MIN(ListPrice) as MinPrice 
FROM Products 
group by CategoryID having MAX(ListPrice) >= 4000 or MIN(ListPrice) <= 500;
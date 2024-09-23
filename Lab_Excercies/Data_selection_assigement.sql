create database Practice;
use Practice;

create table Customers(
CustomerID int primary key identity(1,1),
FirstName varchar(50),
LastName varchar(50),
City varchar(50),
State varchar(50),
);

create table Products (
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


insert into Customers (FirstName , LastName,City,State) 
values ('Vinay','Solanki','Pune','Maharashtra'),
('Mrunali','Rajkule','Mumbai','Maharashtra'),
('Sejal','Sihare','Mandla','Madhya Pradesh');

INSERT INTO Products (ProductName, ListPrice, ModelYear, CategoryID)
VALUES 
('Nano', 299999.99, 2018, 1),
('Pulsar', 120000.00, 2020, 2),
('Refrigerator', 25000.00, 2021, 3),
('Galaxy', 15999.99, 2020, 4),
('Laptop', 54999.00, 2019, 5);

INSERT INTO Orders (CustomerID, OrderDate)
VALUES 
(1, '2024-09-01'),
(2, '2024-09-05'),
(1, '2024-09-10'),
(3, '2024-09-15'),
(2, '2024-09-20');


-- question 1

select * from Customers order by FirstName desc;

--question 2
select FirstName , LastName, City from Customers order by City, FirstName;

-- question 3
select * from Products order by ListPrice desc offset 0 rows fetch next 3 rows only;

--question 4
select * from Products where ListPrice > 300 and ModelYear = 2018;

--question 5
select * from Products where ListPrice > 3000 or ModelYear = 2018;

-- question 6
insert into Products values('Mobile',1900.00,2021,6);
select * from Products where ListPrice between 1899 and 1999.99;

-- question 7
insert into Products (ProductName, ListPrice, ModelYear, CategoryID)
values 
('Book', 299.99, 2021, 7),  
('Sketch', 466.99, 2022, 7);  


select * from Products where ListPrice in(299.99,466.99,489.99);

-- question 8 
insert into Customers values ('Manoj','choudhary','Jaipur','Rajasthan');
select * from Customers where LastName like'[A-C]%';

--question 9
select * from Customers where FirstName not like 'A%';

-- question 10
select State,City, COUNT(*) as CustomerCount from Customers group by State,  City;

--question 11
select CustomerID, YEAR(OrderDate) as OrderYear, COUNT(*) as OrderCount from Orders group by CustomerID , YEAR(OrderDate);

--question 12
select CategoryID , MAX(ListPrice) as MaxPrice, MIN(ListPrice) as MinPrice 
from Products 
group by CategoryID having MAX(ListPrice) >= 4000 or MIN(ListPrice) <= 500;



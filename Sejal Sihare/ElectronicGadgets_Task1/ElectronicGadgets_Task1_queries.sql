create database TechShop;
use TechShop;
create table Customers(CustomerID INT NOT NULL primary key, FirstName  VARCHAR(50) , LastName VARCHAR(50) , Email VARCHAR(50), Phone VARCHAR(50), Address VARCHAR(50));
create table Products(ProductID INT NOT NULL primary key, ProductName  VARCHAR(50) , Description VARCHAR(50) , Price VARCHAR(50));
create table Orders(OrderID INT NOT NULL primary key, CustomerID  INT , OrderDate VARCHAR(50) , TotalAmount BIGINT, foreign key(CustomerID) references Customers(CustomerID) on delete cascade);
create table OrderDetails(OrderDetailID INT NOT NULL primary key, OrderID INT,ProductID  INT , Quantity INT ,  foreign key(OrderID) references Orders(OrderID) on delete cascade,foreign key(ProductID) references Products(ProductID) on delete cascade);
create table Inventory(InventoryID INT NOT NULL primary key,ProductID INT,QuantityInStock INT,LastStockUpdate varchar(50),foreign key(ProductID) references Products(ProductID) on delete cascade);

insert into Customers(CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES (01, 'Agam', 'Rajpoot', 'ar@gmail.com', '9124543290', 'Manipur'),
(02, 'chandrika', 'Nagar', 'ChandraN@gmail.com', '9124541290', 'Nagpur'),
(03, 'Deepak', 'Kakar', 'deepak@gmail.com', '9876587698', 'Ahemdabad'),
(04, 'Deepika', 'Pal', 'dpal@gmail.com', '9556587698', 'Chennai'),
(05, 'Eshita', 'Sharma', 'sharmae@gmail.com', '9876587222', 'Bhopal'),
(06, 'Garima', 'Chatri', 'chatriji@gmail.com', '9732587698', 'Mumbai'),
(07, 'Harsh', 'Shivhare', 'hShivhare@gmail.com', '9882587698', 'Nagpur'),
(08, 'Komal', 'Agrawal', 'komalll@gmail.com', '9777587698', 'Delhi'),
(09, 'Sejal', 'Sihare', 'siharese@gmail.com', '9764533785', 'Indore'),
(10, 'Teena', 'Ahuja', 'ahujateena@gmail.com', '9882587698', 'Mumbai');

select * from Customers;


insert into Products(ProductID ,ProductName ,Description ,Price) values
(001, 'Ultra X pro laptop','Electronic Gadget', 22000),
(002, 'Gaming Mouse','Electronic Gadget', 1200),
(003, 'Titan Keyboard','Electronic Gadget', 2200),
(004, 'Bluetooth Speaker','Electronic Gadget', 2200),
(005, 'Noise ancelling Headphones','Electronic Gadget Headphones', 2000),
(006, 'Pro Webcam','Electronic Gadget', 2000),
(007, 'Powercore 20000 Power Bank','Electronic Gadget', 4000),
(008, 'LED Bulb','Electronic Gadget', 240),
(009, 'Rapid Charger','Laptop Gadget', 2000),
(010, 'Earpods','Electronic Gadget', 2000);
select * from Products;




insert into Orders(OrderID,CustomerID ,OrderDate,TotalAmount ) values
(10,1,'2024-09-12',22000),
(20,2,'2024-09-13',1200),
(30,3,'2024-09-15',2200),
(40,4,'2024-09-17',2200),
(50,5,'2024-09-18',2000),
(60,6,'2024-09-19',2000),
(70,7,'2024-09-19',400),
(80,8,'2024-09-20',480),
(90,9,'2024-09-20',2000),
(100,10,'2024-09-20',4000);


select * from orders;

insert into OrderDetails(OrderDetailID,  OrderID,ProductID ,Quantity) values
(1,10,1,1),
(2,20,2,1),
(3,30,3,1),
(4,40,4,1),
(5,50,5,1),
(6,60,6,1),
(7,70,7,1),
(8,80,8,2),
(9,90,9,1),
(10,100,10,2);


select* from orderDetails;

alter table Inventory


insert into Inventory(InventoryID ,ProductID,QuantityInStock,LastStockUpdate ) values
(100,1,500,'2024-07-11'),
(200,2,20,'2024-05-10'),
(300,3,300,'2024-09-19'),
(400,4,20,'2024-08-09'),
(500,5,30,'2024-08-17'),
(600,6,700,'2024-09-08'),
(700,7,400,'2024-04-09'),
(800,8,2,'2024-01-10'),
(900,9,1000,'2024-09-11'),
(1000,10,2,'2024-09-12');
select * from Inventory;

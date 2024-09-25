use TechShop;
--1 retrive names and email from customer--
select  FirstName ,Email from Customers;


--2 TO List all orders with there order details--
select Orders.OrderID,Orders.OrderDate,Customers.FirstName from  Orders JOIN Customers on Orders.CustomerID = Customers.CustomerID;


--3 insert a new customer record--

insert into Customers values(12,'Laxmi','shivhare','Lshiv@gmail.com','8878704409','Kanpur');
select * from Customers;



--4 sql query to update price of all electronic gadghets) by 10%--
  update Products Set Price = Price*1.10  where Description like 'Electronic Gadget%';
  select * from Products;


 -- 5 delete orders and ordersdetails from repective table --
 declare @OrderID int = 20;
 delete from Orders where OrderID = @OrderID;
 delete from OrderDetails where OrderID = @OrderID;
 select * from Orders;
 select * from OrderDetails;


  --6 write insert new order into orders table--
   insert into Orders values(120,12,'2024-08-19',2000);
   select* from Orders;
   
   --7 update customers email and address--
   declare @CustomerID  int = 1;
   declare @Email  varchar(50)='abc@gmail.com';
   declare @Address  varchar(50) = 'Manipur';
   update Customers  Set Email = @Email , Address = @Address where CustomerID = @CustomerID;
   select * from Customers;
   

   --8 recalculate  the Orders TotalAmount
   update Orders set TotalAmount =( Products.Price* OrderDetails.Quantity) from OrderDetails join
   Products on  OrderDetails.ProductID = Products.ProductID ;
   select * from Orders;




  --9 delete  all orders and there order details--
  declare @CustomeID  int = 1;
  delete from  OrderDetails  where OrderID in( select OrderID from Orders  where Orders.CustomerID = @CustomeID); 
delete from Orders where CustomerID = @CustomeID; 
  select * from Orders;
  select * from OrderDetails;


  --10 insert a new  Product in Product table--
  insert into Products values(12, 'Vacume leaner','Electronic Gadget',5000);
  select * from Products;

--11 update  the orderdate  in the Order table---
 declare @OrderId int = 40;
 declare @OrderDate Date = '2024-09-18';
 update Orders set OrderDate = @OrderDate where OrderID = @OrderId;
 select * from Orders;

 --12--
  update Customers set  NumberOfOrders = (select count(*) from Orders where Orders.CustomerID = Customers.CustomerID);;
  select * from Customers;
  
 

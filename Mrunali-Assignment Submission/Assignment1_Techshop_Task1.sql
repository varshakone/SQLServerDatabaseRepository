CREATE TABLE Customers (
    CustomerId INT PRIMARY KEY,          
    CustomerName VARCHAR(100) NOT NULL,  
    ContactEmail VARCHAR(100),           
    ContactPhone VARCHAR(20),            
    CustomerAddress VARCHAR(255),
	City VARCHAR(100), 
	Country VARCHAR(255)
);
CREATE TABLE Products (
    ProductId INT PRIMARY KEY,           
    ProductName VARCHAR(100) NOT NULL,   
    Category VARCHAR(100),               
    Price DECIMAL(10, 2) NOT NULL,       
    StockQuantity INT NOT NULL          
);
CREATE TABLE Orders (
    OrderId INT PRIMARY KEY,              
    CustomerId INT NOT NULL,              
    OrderDate DATE NOT NULL,              
    TotalAmount DECIMAL(10, 2) NOT NULL,  
    ShippingAddress VARCHAR(255),         
    Status VARCHAR(50),                   
    FOREIGN KEY (CustomerId) REFERENCES Customers(CustomerId) 
);
CREATE TABLE OrderDetails (
    OrderDetailId INT PRIMARY KEY,       
    OrderId INT NOT NULL,                 
    ProductId INT NOT NULL,               
    Quantity INT NOT NULL,                
    Price DECIMAL(10, 2) NOT NULL,        
    Total DECIMAL(10, 2) NOT NULL,        
    FOREIGN KEY (OrderId) REFERENCES Orders(OrderId),  
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)  
);
CREATE TABLE Inventory (
    InventoryId INT PRIMARY KEY,          
    ProductId INT NOT NULL,               
    StockQuantity INT NOT NULL,           
    LastUpdated DATE NOT NULL,           
    WarehouseLocation VARCHAR(100),       
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)  
);
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;

INSERT INTO Customers (CustomerId, CustomerName, ContactEmail, ContactPhone, CustomerAddress, City, Country)
VALUES
(101, 'Rajesh Kumar', 'rajeshkumar@gmail.com', '123-456-7890', '123 Main St', 'New Delhi', 'India'),
(102, 'Priya Sharma', 'priyasharma@gmail.com', '123-555-7890', '456 Oak St', 'Mumbai', 'India'),
(103, 'Alice Johnson', 'alicejohnson@gmail.com', '234-555-7890', '789 Pine St', 'London', 'UK'),
(104, 'Robert Brown', 'robertbrown@gmail.com', '987-654-3210', '321 Maple Ave', 'Toronto', 'Canada'),
(105, 'Suresh Patel', 'sureshpatel@gmail.com', '555-444-1111', '654 Spruce Rd', 'Berlin', 'Germany'),
(106, 'Neha Desai', 'nehadesai@gmail.com', '654-555-7890', '876 Elm St', 'Sydney', 'Australia'),
(107, 'Maria Garcia', 'mariagarcia@gmail.com', '765-555-3210', '432 Cedar St', 'Madrid', 'Spain'),
(108, 'Kiran Rao', 'kiranrao@gmail.com', '555-333-2222', '765 Birch St', 'Dubai', 'UAE'),
(109, 'Pooja Iyer', 'poojaiyer@gmail.com', '123-888-7890', '321 Ash St', 'New York', 'USA'),
(110, 'James Wilson', 'jameswilson@gmail.com', '555-222-3333', '987 Walnut St', 'San Francisco', 'USA'),
(111, 'Rohit Naik', 'rohitnaik@gmail.com', '999-555-1234', '654 Fir St', 'Boston', 'USA'),
(112, 'Emily Clarke', 'emilyclarke@gmail.com', '888-555-4321', '321 Redwood St', 'Paris', 'France');

SELECT * FROM Customers;

INSERT INTO Products (ProductId, ProductName, Category, Price, StockQuantity)
VALUES
(201, 'Dell Laptop', 'Electronics', 699.99, 50),
(202, 'iPhone 12', 'Electronics', 999.99, 30),
(203, 'Sony Headphones', 'Accessories', 59.99, 100),
(204, 'Samsung TV', 'Electronics', 799.99, 25),
(205, 'Nike Running Shoes', 'Footwear', 120.00, 200),
(206, 'Adidas Jacket', 'Clothing', 80.00, 150),
(207, 'HP Printer', 'Electronics', 129.99, 40),
(208, 'Sony PlayStation 5', 'Gaming', 499.99, 20),
(209, 'Apple Watch', 'Accessories', 299.99, 70),
(210, 'MacBook Pro', 'Electronics', 1299.99, 15),
(211, 'Logitech Mouse', 'Accessories', 19.99, 300),
(212, 'Amazon Echo', 'Electronics', 79.99, 100);

SELECT * FROM Products;

INSERT INTO Orders (OrderId, CustomerId, OrderDate, TotalAmount, ShippingAddress, Status)
VALUES
(301, 101, '2024-09-01', 719.98, '123 Main St, New Delhi, India', 'Shipped'),
(302, 102, '2024-09-03', 1079.98, '456 Oak St, Mumbai, India', 'Processing'),
(303, 103, '2024-09-05', 139.98, '789 Pine St, London, UK', 'Delivered'),
(304, 104, '2024-09-06', 799.99, '321 Maple Ave, Toronto, Canada', 'Delivered'),
(305, 105, '2024-09-07', 200.00, '654 Spruce Rd, Berlin, Germany', 'Pending'),
(306, 106, '2024-09-08', 499.99, '876 Elm St, Sydney, Australia', 'Shipped'),
(307, 107, '2024-09-09', 239.98, '432 Cedar St, Madrid, Spain', 'Processing'),
(308, 108, '2024-09-10', 100.00, '765 Birch St, Dubai, UAE', 'Delivered'),
(309, 109, '2024-09-11', 1319.98, '321 Ash St, New York, USA', 'Shipped'),
(310, 110, '2024-09-12', 1099.98, '987 Walnut St, San Francisco, USA', 'Pending'),
(311, 111, '2024-09-13', 299.99, '654 Fir St, Boston, USA', 'Delivered'),
(312, 112, '2024-09-14', 399.99, '321 Redwood St, Paris, France', 'Delivered');

SELECT * FROM Orders;

INSERT INTO OrderDetails (OrderDetailId, OrderId, ProductId, Quantity, Price, Total)
VALUES
(401, 301, 201, 1, 699.99, 699.99),
(402, 301, 211, 1, 19.99, 19.99),
(403, 302, 202, 1, 999.99, 999.99),
(404, 302, 205, 1, 120.00, 120.00),
(405, 303, 203, 2, 59.99, 119.98),
(406, 304, 204, 1, 799.99, 799.99),
(407, 305, 205, 2, 100.00, 200.00),
(408, 306, 208, 1, 499.99, 499.99),
(409, 307, 209, 1, 239.98, 239.98),
(410, 308, 203, 2, 50.00, 100.00),
(411, 309, 210, 1, 1299.99, 1299.99),
(412, 310, 202, 1, 999.99, 999.99);

SELECT * FROM OrderDetails;

INSERT INTO Inventory (InventoryId, ProductId, StockQuantity, LastUpdated, WarehouseLocation)
VALUES
(501, 201, 50, '2024-09-01', 'New Delhi, India'),
(502, 202, 30, '2024-09-02', 'Mumbai, India'),
(503, 203, 100, '2024-09-03', 'London, UK'),
(504, 204, 25, '2024-09-04', 'Berlin, Germany'),
(505, 205, 200, '2024-09-05', 'Toronto, Canada'),
(506, 206, 150, '2024-09-06', 'Sydney, Australia'),
(507, 207, 40, '2024-09-07', 'Dubai, UAE'),
(508, 208, 20, '2024-09-08', 'Madrid, Spain'),
(509, 209, 70, '2024-09-09', 'San Francisco, USA'),
(510, 210, 15, '2024-09-10', 'New York, USA'),
(511, 211, 300, '2024-09-11', 'Boston, USA'),
(512, 212, 100, '2024-09-12', 'Paris, France');

SELECT * FROM Inventory;


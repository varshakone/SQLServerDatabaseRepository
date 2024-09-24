CREATE DATABASE TechShop;

USE MyShopDB;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10, 2)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Shikhar', 'Tiwari', 'shikhar.tiwari@example.com', '9876543210', '123 MI Road, Jaipur, Rajasthan'),
('Priya', 'Verma', 'priya.verma@example.com', '9123456789', '456 Park Street, Kolkata, West Bengal'),
('Amit', 'Singh', 'amit.singh@example.com', '9898765432', '789 Sector 22, Noida, Uttar Pradesh'),
('Sneha', 'Patil', 'sneha.patil@example.com', '9001234567', '101 Jayanagar, Bangalore, Karnataka'),
('Vikas', 'Kumar', 'vikas.kumar@example.com', '9559876543', '202 Andheri East, Mumbai, Maharashtra');


INSERT INTO Products (ProductName, Description, Price)
VALUES 
('Parle-G Biscuits', 'Popular Indian biscuits', 10.00),
('Tata Salt', 'Iodized salt for daily use', 20.00),
('Amul Butter', 'Famous Indian dairy butter', 45.00),
('Haldiram Namkeen', 'Traditional Indian snacks', 60.00),
('Dettol Soap', 'Antibacterial soap for hygiene', 30.00);

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-09-10', 100.00),
(2, '2024-09-11', 200.00),
(3, '2024-09-12', 150.00),
(4, '2024-09-13', 75.00),
(5, '2024-09-14', 180.00);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES 
(1, 1, 10),
(1, 3, 2),
(7, 3 ,2),
(5, 4, 5),
(5, 2, 2),
(5, 1, 6);


INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES 
(1, 500, '2024-09-01'),
(2, 300, '2024-09-05'),
(3, 150, '2024-09-08'),
(4, 250, '2024-09-09'),
(5, 100, '2024-09-10');
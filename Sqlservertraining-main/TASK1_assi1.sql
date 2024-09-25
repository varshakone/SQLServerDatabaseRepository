CREATE DATABASE TechShop;


CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
GO
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address) 
VALUES
('Rohan', 'Sharma', 'rohan.sharma@example.com', '9876543210', '12 MG Road, New Delhi'),
('Priya', 'Verma', 'priya.verma@example.com', '9876543211', '45 Rajendra Nagar, Mumbai'),
('Vikram', 'Rao', 'vikram.rao@example.com', '9876543212', '78 Koramangala, Bangalore'),
('Sneha', 'Patel', 'sneha.patel@example.com', '9876543213', '91 Ghatkopar, Mumbai'),
('Amit', 'Singh', 'amit.singh@example.com', '9876543214', '16 Civil Lines, Lucknow'),
('Sanya', 'Nair', 'sanya.nair@example.com', '9876543215', '32 Panampilly Nagar, Kochi'),
('Rahul', 'Gupta', 'rahul.gupta@example.com', '9876543216', '23 Salt Lake, Kolkata'),
('Ananya', 'Desai', 'ananya.desai@example.com', '9876543217', '50 Satellite Road, Ahmedabad'),
('Arjun', 'Mehta', 'arjun.mehta@example.com', '9876543218', '18 Alkapuri, Vadodara'),
('Aisha', 'Kapoor', 'aisha.kapoor@example.com', '9876543219', '70 Defence Colony, Delhi');
GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100),
    Description VARCHAR(MAX),
    Price DECIMAL(10,2),
    );
GO
INSERT INTO Products (ProductName, Description, Price) VALUES
('Laptop',  'High-end laptop with 16GB RAM and 512GB SSD',1200.00),
('Smartphone', 'Latest smartphone with 5G capability',800.00),
('Tablet', '10-inch tablet with 128GB storage',500.00 ),
('Headphones', 'Noise-cancelling over-ear headphones',150.00),
('Keyboard', 'Mechanical keyboard with RGB lighting', 70.00),
('Mouse',  'Wireless mouse with ergonomic design',50.00),
('Monitor',  '27-inch 4K monitor',300.00),
('Printer',  'All-in-one printer with scanning and copying functions',200.00),
('Router',  'Dual-band wireless router', 120.00),
('Webcam', '1080p webcam for video conferencing', 90.00);
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);
GO

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-09-01', 1300.00),
(2, '2024-09-02', 800.00),
(3, '2024-09-03', 600.00),
(4, '2024-09-04', 150.00),
(5, '2024-09-05', 450.00),
(6, '2024-09-06', 1200.00),
(7, '2024-09-07', 800.00),
(8, '2024-09-08', 350.00),
(9, '2024-09-09', 400.00),
(10, '2024-09-10', 900.00);
GO

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    CONSTRAINT FK_OrderDetails_Orders FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    CONSTRAINT FK_OrderDetails_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
GO
INSERT INTO OrderDetails (OrderID, ProductID, Quantity) VALUES
(1, 1, 1),
(1, 5, 5),
(2, 2, 3),
(3, 3, 2),
(3, 6, 1),
(4, 4, 3),
(5, 7, 1),
(5, 10, 1),
(6, 1, 7),
(7, 2, 4);
GO

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    Stock INT,
    LastUpdated DATE,
    CONSTRAINT FK_Inventory_Products FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);
GO
INSERT INTO Inventory (ProductID, Stock, LastUpdated) VALUES
(1, 100, '2024-09-01'),
(2, 150, '2024-09-01'),
(3, 200, '2024-09-01'),
(4, 250, '2024-09-01'),
(5, 180, '2024-09-01'),
(6, 300, '2024-09-01'),
(7, 220, '2024-09-01'),
(8, 130, '2024-09-01'),
(9, 175, '2024-09-01'),
(10, 190, '2024-09-01');
GO

SELECT *FROM Customers;
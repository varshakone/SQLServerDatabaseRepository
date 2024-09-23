-- creating database commands
CREATE DATABASE TechShop;
GO
USE TechShop;
GO

-- Creating Tables (Customers, Products, Orders, OrderDetails and Inventory) commands

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(15),
    Address NVARCHAR(255)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT NOT NULL,
    QuantityInStock INT NOT NULL,
    LastStockUpdate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Inserting data into tables

INSERT INTO Customers (FirstName, LastName, Email, Phone, Address)
VALUES 
('Ishaan', 'Gupta', 'ishaan.gupta@email.com', '+91-98765-43210', 'Vasant Kunj, New Delhi, India'),
('Varsha', 'Patil', 'varsha.patil@email.com', '+91-98765-12345', '45 Shivaji Nagar, Pune, India'),
('Sudha', 'G', 'sudha.g@email.com', '+91-78901-23456', '78 Whitefield, Bengaluru, India'),
('Sowmya', 'Rama', 'sowmya.rama@email.com', '+91-99876-54321', '32 Anna Salai, Chennai, India'),
('Anil', 'Singh', 'anil.singh@email.com', '+91-91234-56789', '10 Civil Lines, Jaipur, India');

INSERT INTO Products (ProductName, Description, Price)
VALUES
('Smartphone', 'Android smartphone', 699.99),
('Laptop', 'Gaming laptop', 999.99),
('Tablet', '12-inch tablet', 299.99),
('Headphones', 'Wireless headphones', 199.99),
('Smartwatch', 'Fitness smartwatch', 149.99); 

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount)
VALUES 
(1, '2024-07-25', 899.99),
(2, '2024-06-20', 1299.99),
(3, '2024-08-30', 249.98),
(4, '2024-09-15', 699.99),
(5, '2024-07-11', 579.98);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity)
VALUES
(1, 1, 1),  -- Ishaan bought 1 Smartphone
(1, 2, 1),  -- Varsha bought 1 Laptop
(2, 3, 2),  -- Sudha bought 2 Tablets
(3, 4, 1),  -- Sowmiya bought 1 Headphones
(4, 5, 1);  -- Anil bought 1 Smartwatch

INSERT INTO Inventory (ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 50, '2024-01-01'),
(2, 30, '2024-02-05'),
(3, 100, '2024-04-10'),
(4, 75, '2024-02-12'),
(5, 60, '2024-03-15');



-- Displaying all tables data

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;
SELECT * FROM Inventory;


-- Inser Data into customers
use TechShop;
INSERT INTO Customers
VALUES
    (1, 'Akash', 'Baghel', 'akash@gmail.com', 9888764532, 'GorakhPur'),
    (2, 'Rahul', 'Singh', 'rahul@gmail.com', 9888764532, 'Dero'),
    (3, 'Raj', 'Singh', 'raj@gmail.com', 9888764533, 'Lucknow'),
    (4, 'Sita', 'Sharma', 'sita@gmail.com', 9888764534, 'Delhi'),
    (5, 'Gita', 'Verma', 'gita@gmail.com', 9888764535, 'Mumbai'),
    (6, 'Ravi', 'Kumar', 'ravi@gmail.com', 9888764536, 'Chennai'),
    (7, 'Amit', 'Patel', 'amit@gmail.com', 9888764537, 'Ahmedabad'),
    (8, 'Neha', 'Gupta', 'neha@gmail.com', 9888764538, 'Pune'),
    (9, 'Vijay', 'Rao', 'vijay@gmail.com', 9888764539, 'Hyderabad'),
    (10, 'Anita', 'Joshi', 'anita@gmail.com', 9888764540, 'Bangalore');

-- Inser Data into Products

INSERT INTO Products
VALUES
    (1, 'Laptop', 'Dell Laptop', 50000),
    (2, 'Mobile', 'Samsung Mobile', 20000),
    (3, 'Tablet', 'Apple Tablet', 30000),
    (4, 'Headphone', 'Sony Headphone', 5000),
    (5, 'Mouse', 'Logitech Mouse', 1000),
    (6, 'Keyboard', 'Dell Keyboard', 1500),
    (7, 'Monitor', 'LG Monitor', 10000),
    (8, 'Printer', 'HP Printer', 8000),
    (9, 'Scanner', 'Canon Scanner', 5000),
    (10, 'Projector', 'Epson Projector', 20000);


-- Inser Data into Orders

INSERT INTO Orders
VALUES
    (1, 1, '2021-01-01', 50000),
    (2, 2, '2021-01-02', 20000),
    (3, 3, '2021-01-03', 30000),
    (4, 4, '2021-01-04', 5000),
    (5, 5, '2021-01-05', 1000),
    (6, 6, '2021-01-06', 1500),
    (7, 7, '2021-01-07', 10000),
    (8, 8, '2021-01-08', 8000),
    (9, 9, '2021-01-09', 5000),
    (10, 10, '2021-01-10', 20000);

-- Inser Data into OrderDetails

INSERT INTO OrderDetails
VALUES
    (1, 1, 1, 1),
    (2, 2, 2, 1),
    (3, 3, 3, 1),
    (4, 4, 4, 1),
    (5, 5, 5, 1),
    (6, 6, 6, 1),
    (7, 7, 7, 1),
    (8, 8, 8, 1),
    (9, 9, 9, 1),
    (10, 10, 10, 1);

-- Inser Data into Inventory


INSERT INTO Inventory
VALUES
    (1, 1, 10, '2021-01-01'),
    (2, 2, 20, '2021-01-02'),
    (3, 3, 30, '2021-01-03'),
    (4, 4, 40, '2021-01-04'),
    (5, 5, 50, '2021-01-05'),
    (6, 6, 60, '2021-01-06'),
    (7, 7, 70, '2021-01-07'),
    (8, 8, 80, '2021-01-08'),
    (9, 9, 90, '2021-01-09'),
    (10, 10, 100, '2021-01-10');
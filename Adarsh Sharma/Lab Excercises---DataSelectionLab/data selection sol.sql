CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    City VARCHAR(50),
    State VARCHAR(50)
);

INSERT INTO Customers (CustomerID, FirstName, LastName, City, State) VALUES
(1, 'John', 'Doe', 'New York', 'NY'),
(2, 'Jane', 'Smith', 'Los Angeles', 'CA'),
(3, 'Alice', 'Johnson', 'Chicago', 'IL'),
(4, 'Bob', 'Brown', 'Houston', 'TX'),
(5, 'Charlie', 'Adams', 'Phoenix', 'AZ'),
(6, 'Diana', 'Baker', 'San Francisco', 'CA'),
(7, 'Eva', 'Carter', 'Dallas', 'TX');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    ListPrice DECIMAL(10, 2),
    ModelYear INT,
    CategoryID INT
);

INSERT INTO Products (ProductID, ProductName, ListPrice, ModelYear, CategoryID) VALUES
(1, 'Product A', 299.99, 2019, 1),
(2, 'Product B', 466.99, 2018, 1),
(3, 'Product C', 489.99, 2018, 1),
(4, 'Product D', 3500.00, 2018, 2),
(5, 'Product E', 4200.00, 2019, 2),
(6, 'Product F', 1500.00, 2017, 3),
(7, 'Product G', 2000.00, 2020, 3),
(8, 'Product H', 1800.00, 2019, 2),
(9, 'Product I', 350.00, 2021, 2);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(1, 1, '2023-01-15'),
(2, 1, '2023-02-20'),
(3, 2, '2023-01-25'),
(4, 3, '2023-03-05'),
(5, 3, '2023-04-10'),
(6, 4, '2023-05-15'),
(7, 5, '2023-06-20');

--1. Display customer list by first name in descending order.--

SELECT * FROM Customers ORDER BY FirstName DESC;

--2. Display the first name, last name, and city of the customers sorted by city and then by first name.--
SELECT City,FirstName,LastName FROM Customers ORDER BY City ASC, FirstName ASC, LastName ASC;

--3.Return the top three most expensive products.--
SELECT TOP 3 * FROM Products ORDER BY ListPrice DESC;

--4.Find the products whose list price is greater than 300 and model year is 2018.--
SELECT * FROM Products WHERE ListPrice > 300 and ModelYear = 2018;

--5.Find products whose list price is greater than 3,000 or model year is 2018.--
SELECT * FROM Products WHERE ListPrice > 3000 or ModelYear = 2018;

--6.Find the products whose list prices are between 1,899 and 1,999.99.--
SELECT * FROM Products WHERE ListPrice BETWEEN 1899 and 1999;

--7.Use the IN operator to find products whose list price is 299.99, 466.99, or 489.99.--
SELECT * FROM Products WHERE ListPrice IN (299.99, 466.99, 489.99);

--8.Find customers where the first character in the last name is in the range A through C.--
SELECT * FROM Customers WHERE LastName LIKE '[A-C]%';

--9.Use NOT LIKE operator to find customers where the first character in the first name is not the letter A.--
SELECT * FROM Customers WHERE FirstName NOT LIKE 'A%';

--10.Return the number of customers by state and city.--
SELECT State, City, COUNT(*) AS NumberOfCustomers From Customers GROUP BY State, City;

--11.Return the number of orders placed by the customer grouped by customer ID and year.--
SELECT CustomerID, YEAR(OrderDate) AS OrderYear, COUNT(*) AS NumberOfOrders From Orders GROUP BY CustomerID, Year(OrderDate);

--12.Find the maximum and minimum list price grouped by category ID, filtering out categories with max list price > 4,000 or min list price < 500.--
SELECT CategoryID, MAX(ListPrice) AS MaxPrice, MIN(ListPrice) AS MinPrice From Products GROUP BY CategoryID HAVING MAX(ListPrice)<=4000 AND MIN(ListPrice)>=500;



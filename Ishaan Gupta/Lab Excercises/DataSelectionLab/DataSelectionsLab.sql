-- Ishaan Gupta
CREATE DATABASE DataSelectionLab;
USE DataSelectionLab; 

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY IDENTITY(1,1),
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    list_price DECIMAL(10, 2) NOT NULL,
    model_year INT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(50),
    state VARCHAR(50)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);



INSERT INTO Categories (category_id, category_name) VALUES 
(1, 'Electronics'),
(2, 'Furniture'),
(3, 'Clothing'),
(5, 'Appliances'),
(6, 'Sports Equipment'),
(7, 'Luxury Items');


INSERT INTO Products (product_name, category_id, list_price, model_year) VALUES
('Smartphone', 1, 489.99, 2018),
('Laptop', 1, 2599.99, 2019),
('T-shirt', 3, 250.99, 2020),
('Refrigerator', 5, 4999.99, 2018),
('Tennis Racket', 6, 379.99, 2021),
('Diamond Necklace', 7, 11999.99, 2022);


INSERT INTO Customers (first_name, last_name, city, state) VALUES
('Raj', 'Sharma', 'Mumbai', 'Maharashtra'),
('Priya', 'Patel', 'Ahmedabad', 'Gujarat'),
('Amit', 'Singh', 'Delhi', 'Delhi'),
('Sunita', 'Gupta', 'Jaipur', 'Rajasthan'),
('Anand', 'Kumar', 'Chennai', 'Tamil Nadu');


INSERT INTO Orders (customer_id, order_date) VALUES
(1, '2023-01-15'),
(2, '2023-02-20'),
(3, '2023-03-10'),
(4, '2023-04-05'),
(5, '2023-05-12');


-- Write a query to display customer list by the first name in descending order
SELECT first_name, last_name FROM Customers ORDER BY first_name DESC;


-- Write a query to display the first name, last name, and city of the customers. It sorts the customer list by the city first and then by the first name.
SELECT first_name, last_name, city FROM Customers ORDER BY city, first_name;


-- Write a query to returns the top three most expensive products.
SELECT * FROM products ORDER BY list_price DESC OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY;


-- Write a query to finds the products whose list price is greater than 300 and model year is 2018.
SELECT product_name, list_price, model_year FROM Products WHERE list_price > 300 AND model_year = 2018;


-- Write a query to finds products whose list price is greater than 3,000 or model year is 2018. Any product that meets one of these conditions is included in the result set.
SELECT product_name, list_price, model_year FROM Products WHERE list_price > 3000 OR model_year = 2018;


-- Write a query to find the products whose list prices are between 1,899 and 1,999.99.                        
SELECT product_name, list_price FROM Products WHERE list_price BETWEEN 1899 AND 1999.99;


-- Write a query uses the IN operator to find products whose list price is 299.99 or 466.99 or 489.99.
SELECT product_name, list_price FROM Products WHERE list_price IN (299.99, 466.99, 489.99);


-- Write a query to the customers where the first character in the last name is the letter in the range A through C:
SELECT first_name, last_name FROM Customers WHERE last_name LIKE '[A-C]%';


-- Write a query using NOT LIKE operator to find customers where the first character in the first name is not the letter A
SELECT first_name, last_name FROM Customers 
WHERE first_name NOT LIKE 'A%';


-- Write a query to return the number of customers by state and city group state and city.
SELECT state, city, COUNT(*) as customer_count 
FROM Customers 
GROUP BY state, city;


-- Write a query to return the number of orders placed by the customer group by customer id and year
SELECT customer_id, YEAR(order_date) as order_year, COUNT(*) as order_count 
FROM Orders 
GROUP BY customer_id, YEAR(order_date);


-- Write query to finds the maximum and minimum list group by category id. Then, it filters out the category which has the maximum list price greater than 4,000 or the minimum list price less than 500.
SELECT c.category_id, 
       MAX(p.list_price) as max_price, 
       MIN(p.list_price) as min_price
FROM Categories c
JOIN Products p ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name
HAVING MAX(p.list_price) >= 4000 OR MIN(p.list_price) <= 500;
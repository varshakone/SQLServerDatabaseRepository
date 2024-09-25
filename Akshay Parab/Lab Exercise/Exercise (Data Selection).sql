Create database Exercise1;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    city VARCHAR(100),
    state VARCHAR(100)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    list_price DECIMAL(10, 2),
    model_year INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY ,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO categories 
VALUES 
(100,'Electronics'),
(200,'Furniture'),
(300,'Appliances');

INSERT INTO products
VALUES 
(1,'Smartphone', 999.99, 2020, 100),
(2,'Laptop', 1299.99, 2021, 100),
(3,'Office Chair', 299.99, 2019, 200),
(4,'Refrigerator', 1899.99, 2020, 300),
(5,'Washing Machine', 1799.99, 2018, 300),
(6,'Gaming Console', 499.99, 2022, 100),
(7,'Smart TV', 466.99, 2018, 100),
(8,'Dining Table', 489.99, 2021, 200),
(9,'Air Conditioner', 3500.00, 2019, 100),
(10,'Sofa', 2500.00, 2020, 200);



INSERT INTO customers 
VALUES 
(1,'Akshay', 'parab', 'New York', 'NY'),
(2,'Divyanshu', 'Sing', 'Los Angeles', 'CA'),
(3,'Vijay', 'kulkarni', 'Chicago', 'IL'),
(4,'Chetan', 'Anay', 'maharashtra', 'mum'),
(5,'Dev', 'chopra', 'Miami', 'FL');

INSERT INTO orders
VALUES 
(10,'2024-01-15', 1),
(20,'2024-02-20', 2),
(30,'2024-03-10', 3),
(40,'2024-04-05', 4),
(50,'2024-05-25', 5);

INSERT INTO order_items
VALUES 
(111, 10, 1,3, 999.99),    
(222, 20, 1,2, 1299.99),  
(333, 30, 2,4, 299.99),    
(444, 40, 4,1, 1899.99),   
(555, 50, 6,5, 499.99); 


Q--1
select first_name from customers order by first_name desc;

Q--2
select first_name,city from customers order by city asc,first_name asc;

Q--3
select top 3 product_name,list_price from products order by list_price desc 

Q--4
select product_name, list_price, model_year from products where list_price > 300
and model_year = 2018;

Q--5
select product_name, list_price, model_year from products where list_price > 3000
or model_year = 2018;

Q--6
select product_name, list_price from products where list_price between 1899 and 1999.99;

Q--7
select product_name, list_price from products where list_price in (299.99 , 466.99 , 489.99);

Q--8
select first_name , last_name from customers where last_name like ' [A-C]%';

Q--9
select first_name , last_name from customers where last_name not like 'A%';

Q--10
select state,city,COUNT(*) as customer_count from customers group by state, city;

Q--11
select customer_id, YEAR(order_date) as order_year, count(*) as order_count from orders group by customer_id, YEAR(order_date);

Q--12
select category_id, max(list_price) as max_price, min(list_price) as min_price from products group by category_id having max(list_price) > 4000 or min(list_price) < 500;



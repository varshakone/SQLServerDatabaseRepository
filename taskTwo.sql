
-- 1. Query to display customer list by the first name in descending order:
   
   SELECT first_name
   FROM customers
   ORDER BY first_name DESC;
   
-- 2. Query to display the first name, last name, and city of the customers, sorted by city first and then by first name:
   
   SELECT first_name, last_name, city
   FROM customers
   ORDER BY city, first_name;
   

-- 3. Query to return the top three most expensive products:

   SELECT TOP 3 product_name, list_price
   FROM products
   ORDER BY list_price DESC;

-- 4. Query to find the products whose list price is greater than 300 and model year is 2018:

   SELECT product_name, list_price, model_year
   FROM products
   WHERE list_price > 300 AND model_year = 2018;

-- 5. Query to find products whose list price is greater than 3,000 or model year is 2018:

   SELECT product_name, list_price, model_year
   FROM products
   WHERE list_price > 3000 OR model_year = 2018;

-- 6. Query to find products whose list prices are between 1,899 and 1,999.99:

   SELECT product_name, list_price
   FROM products
   WHERE list_price BETWEEN 1899 AND 1999.99;

-- 7. Query using the IN operator to find products whose list price is 299.99, 466.99, or 489.99:

   SELECT product_name, list_price
   FROM products
   WHERE list_price IN (299.99, 466.99, 489.99);

-- 8. Query to find customers where the first character in the last name is in the range A through C:

   SELECT first_name, last_name
   FROM customers
   WHERE last_name LIKE '[A-C]%';

-- 9. Query using NOT LIKE operator to find customers where the first character in the first name is not the letter A:

   SELECT first_name, last_name
   FROM customers
   WHERE first_name NOT LIKE 'A%';

-- 10. Query to return the number of customers by state and city, grouped by state and city:

    SELECT state, city, COUNT(*) AS number_of_customers
    FROM customers
    GROUP BY state, city;


-- 11. Query to return the number of orders placed by the customer, grouped by customer ID and year:

    SELECT customer_id, YEAR(order_date) AS order_year, COUNT(*) AS number_of_orders
    FROM orders
    GROUP BY customer_id, YEAR(order_date);

-- 12. Query to find the maximum and minimum list price, grouped by category ID, and filter out categories where the maximum list price is greater than 4,000 or the minimum list price is less than 500:

    SELECT category_id, MAX(list_price) AS max_list_price, MIN(list_price) AS min_list_price
    FROM products
    GROUP BY category_id
    HAVING MAX(list_price) > 4000 OR MIN(list_price) < 500;


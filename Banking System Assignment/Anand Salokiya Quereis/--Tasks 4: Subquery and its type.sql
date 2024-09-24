--Tasks 4: Subquery and its type

--1.customer(s) with the highest account balance

SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    MAX(a.balance) AS highest_balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
HAVING 
    MAX(a.balance) = (
        SELECT 
            MAX(balance) 
        FROM 
            Accounts
    );

--2.average account balance for customers who have more than one account.

SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    AVG(a.balance) AS average_balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
HAVING 
    COUNT(a.account_id) > 1;

--3. accounts with transactions whose amounts exceed the average transaction amount
SELECT 
    a.account_id, 
    a.account_type, 
    t.transaction_id, 
    t.amount
FROM 
    Accounts a
JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.amount > (
        SELECT 
            AVG(amount) 
        FROM 
            Transactions
    );

--4.customers who have no recorded transactions
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    c.email, 
    c.address
FROM 
    Customers c
LEFT JOIN 
    Transactions t ON c.customer_id = t.transaction_id
WHERE 
    t.transaction_id IS NULL;

--5. total balance of accounts with no recorded transactions
SELECT 
    SUM(a.balance) AS total_balance
FROM 
    Accounts a
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_id IS NULL;

--6. transactions for accounts with the lowest balance
SELECT 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date, 
    a.account_id, 
    a.balance
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
WHERE 
    a.balance = (SELECT MIN(balance) FROM Accounts);

--7.customers who have accounts of multiple types.

SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(DISTINCT a.account_type) AS account_type_count
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name
HAVING 
    COUNT(DISTINCT a.account_type) > 1;

--8.the percentage of each account type out of the total number of accounts
SELECT 
    account_type,
    COUNT(*) AS account_count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage
FROM 
    Accounts
GROUP BY 
    account_type;

--9.all transactions for a customer with a given customer_id

SELECT 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date, 
    a.account_id
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
WHERE 
    a.customer_id = 3;

--10.the total balance for each account type, including a subquery within the SELECT clause.

SELECT 
    account_type, 
    SUM(balance) AS total_balance,
    (SELECT SUM(balance) FROM Accounts) AS overall_balance
FROM 
    Accounts
GROUP BY 
    account_type;






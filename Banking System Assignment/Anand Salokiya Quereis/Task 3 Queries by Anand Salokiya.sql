
--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins--

--1. query to Find the average account balance for all customers--
SELECT 
    AVG(balance) AS average_balance
FROM 
    Accounts;

--2.query to Retrieve the top 10 highest account balances--
SELECT TOP 10 
    account_id, 
    balance
FROM 
    Accounts
ORDER BY 
    balance DESC;

--3.query to Calculate Total Deposits for All Customers in specific date--
SELECT 
    SUM(amount) AS total_deposits
FROM 
    Transactions
WHERE 
    transaction_type = 'Deposit' 
    AND transaction_date = '2024-01-01';

--4.query to Find the Oldest and Newest Customers.--

-- Oldest Customer
SELECT TOP 1 
    first_name, 
    last_name, 
    dob
FROM 
    Customers
ORDER BY 
    dob ASC;

-- Newest Customer
SELECT TOP 1 
    first_name, 
    last_name, 
    dob
FROM 
    Customers
ORDER BY 
    dob DESC;

--5.query to Retrieve transaction details along with the account type.
SELECT 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date, 
    a.account_type
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id;

--6. query to Get a list of customers along with their account details.
SELECT 
    c.first_name, 
    c.last_name, 
    c.email, 
    c.address, 
    a.account_id, 
    a.account_type, 
    a.balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id;

--7.query to Retrieve transaction details along with customer information for a specific account

SELECT 
    t.transaction_id, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date, 
    c.first_name, 
    c.last_name, 
    c.email, 
    c.address
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id
JOIN 
    Customers c ON a.customer_id = c.customer_id
WHERE 
    a.account_id = 7;

--8.query to Identify customers who have more than one account.

SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    COUNT(a.account_id) AS account_count
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

--9.query to Calculate the difference in transaction amounts between deposits and withdrawals.

SELECT 
    SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS total_withdrawals,
    SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE 0 END) - 
    SUM(CASE WHEN transaction_type = 'Withdrawal' THEN amount ELSE 0 END) AS difference
FROM 
    Transactions;

	CREATE TABLE DailyBalances (
    balance_id INT PRIMARY KEY IDENTITY(1,1),
    account_id INT,
    balance DECIMAL(18, 2),
    balance_date DATE,
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)
);

INSERT INTO DailyBalances (account_id, balance, balance_date) VALUES
(1, 1500.00, '2024-01-01'),
(1, 1600.00, '2024-01-02'),
(2, 5000.00, '2024-01-01'),
(2, 5200.00, '2024-01-02'),
(3, 3000.00, '2024-01-01'),
(3, 3100.00, '2024-01-02'),
(4, 4500.00, '2024-01-01'),
(4, 4600.00, '2024-01-02'),
(5, 2500.00, '2024-01-01'),
(5, 2700.00, '2024-01-02'),
(6, 4000.00, '2024-01-01'),
(6, 4200.00, '2024-01-02'),
(7, 3500.00, '2024-01-01'),
(7, 3700.00, '2024-01-02'),
(8, 6000.00, '2024-01-01'),
(8, 6100.00, '2024-01-02'),
(9, 2000.00, '2024-01-01'),
(9, 2200.00, '2024-01-02'),
(10, 8000.00, '2024-01-01'),
(10, 8100.00, '2024-01-02');


--10.query to Calculate the average daily balance for each account over a specifie period.
SELECT 
    account_id,
    AVG(balance) AS average_daily_balance
FROM 
    DailyBalances
WHERE 
    balance_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY 
    account_id;

--11.total balance for each account type

SELECT 
    account_type, 
    SUM(balance) AS total_balance
FROM 
    Accounts
GROUP BY 
    account_type;

--12.accounts with the highest number of transactions order by descending order

SELECT 
    a.account_id, 
    COUNT(t.transaction_id) AS transaction_count
FROM 
    Accounts a
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
GROUP BY 
    a.account_id
ORDER BY 
    transaction_count DESC;

--13.customers with high aggregate account balances, along with their account types
SELECT 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.account_type, 
    SUM(a.balance) AS total_balance
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id
GROUP BY 
    c.customer_id, 
    c.first_name, 
    c.last_name, 
    a.account_type
ORDER BY 
    total_balance DESC;

--14. duplicate transactions based on transaction amount, date, and account.
SELECT 
    transaction_type, 
    amount, 
    transaction_date, 
    account_id, 
    COUNT(*) AS transaction_count
FROM 
    Transactions
GROUP BY 
    transaction_type, 
    amount, 
    transaction_date, 
    account_id
HAVING 
    COUNT(*) > 1
ORDER BY 
    transaction_date, 
    account_id;









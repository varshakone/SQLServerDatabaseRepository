CREATE DATABASE HMBank;

USE HMBank;

-- Create Customers table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY IDENTITY(1,1),  
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,  
    email VARCHAR(100) NOT NULL UNIQUE,  
    phone_number VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Create Accounts table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY IDENTITY(1,1),  
    customer_id INT NOT NULL,  
    account_type VARCHAR(20) NOT NULL CHECK (account_type IN ('savings', 'current', 'zero_balance')),  
    balance DECIMAL(18,2) NOT NULL CHECK (balance >= 0),  
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
);

-- Create Transactions table
CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY IDENTITY(1,1),  
    account_id INT NOT NULL,  
    transaction_type VARCHAR(20) NOT NULL CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),  
    amount DECIMAL(18,2) NOT NULL CHECK (amount > 0),  
    transaction_date DATETIME NOT NULL DEFAULT GETDATE(),  
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id)  
);

------------------------------------------------------------------------------------------------------------------------------------------------

--Task 2. Select, Where, Between, AND, LIKE--

-- Insert 10 sample customers into the Customers table
INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address)
VALUES
('Rahul', 'Sharma', '1990-01-15', 'rahul.sharma@gmail.com', '9876543210', '123 MG Road, Delhi'),
('Sneha', 'Patel', '1985-03-22', 'sneha.patel@gmail.com', '9876543211', '456 LG Street, Mumbai'),
('Amit', 'Verma', '1992-07-30', 'amit.verma@gmail.com', '9876543212', '789 PG Avenue, Bangalore'),
('Neha', 'Singh', '1988-12-10', 'neha.singh@gmail.com', '9876543213', '234 RK Puram, Hyderabad'),
('Vikram', 'Rao', '1995-08-19', 'vikram.rao@gmail.com', '9876543214', '876 MG Road, Pune'),
('Pooja', 'Gupta', '1991-11-05', 'pooja.gupta@gmail.com', '9876543215', '321 JJ Road, Kolkata'),
('Ravi', 'Kumar', '1993-09-25', 'ravi.kumar@gmail.com', '9876543216', '654 NK Road, Chennai'),
('Priya', 'Nair', '1987-04-17', 'priya.nair@gmail.com', '9876543217', '432 JK Nagar, Kochi'),
('Anil', 'Yadav', '1990-06-14', 'anil.yadav@gmail.com', '9876543218', '543 KK Marg, Jaipur'),
('Divya', 'Iyer', '1994-02-28', 'divya.iyer@gmail.com', '9876543219', '345 LL Circle, Ahmedabad'),;

-- Insert 10 sample accounts into the Accounts table
INSERT INTO Accounts (customer_id, account_type, balance)
VALUES
(1, 'savings', 25000.50),
(2, 'current', 50000.00),
(3, 'savings', 10000.00),
(4, 'zero_balance', 0.00),
(5, 'savings', 30000.00),
(6, 'current', 45000.00),
(7, 'savings', 15000.75),
(8, 'zero_balance', 0.00),
(9, 'current', 60000.00),
(10, 'savings', 20000.00);

-- Insert 10 sample transactions into the Transactions table
INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date)
VALUES
(1, 'deposit', 5000.00, '2023-09-01'),
(2, 'withdrawal', 10000.00, '2023-09-05'),
(3, 'deposit', 2000.00, '2023-09-08'),
(4, 'withdrawal', 500.00, '2023-09-10'),
(5, 'transfer', 1500.00, '2023-09-12'),
(6, 'deposit', 3000.00, '2023-09-15'),
(7, 'withdrawal', 2000.00, '2023-09-18'),
(8, 'deposit', 10000.00, '2023-09-20'),
(9, 'transfer', 5000.00, '2023-09-22'),
(10,'deposit', 4000.00,'2023-09-25');

SELECT * FROM Customers;
SELECT * FROM Accounts;
SELECT * FROM Transactions;

-- 1. Query to retrieve the name, account type and email of all customers--
SELECT 
    c.first_name + ' ' + c.last_name AS full_name,  -- Concatenate first and last names
    a.account_type,
    c.email
FROM 
    Customers c
JOIN 
    Accounts a
ON 
    c.customer_id = a.customer_id;

--2.Query to list all transaction corresponding customer--
SELECT 
    c.first_name + ' ' + c.last_name AS full_name,  
    c.email,
    a.account_type,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id  
JOIN 
    Customers c ON a.customer_id = c.customer_id  

--3.Query to increase the balance of a specific account by a certain amount--

UPDATE Accounts
SET balance = balance + 8000
WHERE account_id = 8;

select * from Accounts


--4.Query to Combine first and last names of customers as a full_name--
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM 
    Customers;

--5.Query to remove accounts with a balance of zero where the account type is savings--
DELETE FROM Accounts
WHERE account_type = 'savings' AND balance = 0;

--6.Query to Find customers living in a specific city--
SELECT 
    customer_id, 
    first_name, 
    last_name, 
    email, 
    phone_number, 
    address
FROM 
    Customers
WHERE 
    address LIKE '%Delhi%'; 

--7.Query to Get the account balance for a specific account--
SELECT 
    account_id, 
    balance
FROM 
    Accounts
WHERE 
    account_id = 5;  

--8.Query to List all current accounts with a balance greater than $1,000--
SELECT 
    account_id, 
    customer_id, 
    balance
FROM 
    Accounts
WHERE 
    account_type = 'current' AND balance > 1000;

--9.Query to Retrieve all transactions for a specific account--
SELECT 
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_date
FROM 
    Transactions
WHERE 
    account_id = 3;  


--10.Query to Calculate the interest accrued on savings accounts based on a given interest rate-- 
SELECT 
    account_id,
    customer_id,
    balance,
    (balance * 5 / 100) AS interest_accrued  
FROM 
    Accounts
WHERE 
    account_type = 'savings';  

--11.Query to Identify accounts where the balance is less than a specified overdraft limit--
SELECT 
    account_id,
    customer_id,
    balance
FROM 
    Accounts
WHERE 
    balance < 4000.00;

--12.Query to Find customers not living in a specific city--
SELECT 
    customer_id, 
    first_name, 
    last_name, 
    email, 
    phone_number, 
    address
FROM 
    Customers
WHERE 
    address NOT LIKE '%Delhi%';  

------------------------------------------------------------------------------------------------------------------------
--Tasks 3: Aggregate functions, Having, Order By, GroupBy and Joins--

--1.Query to Find the average account balance for all customers--
SELECT 
    AVG(balance) AS average_balance
FROM 
    Accounts;

--2.Query to Retrieve the top 10 highest account balances--
SELECT 
    account_id,
    customer_id,
    balance
FROM 
    Accounts
ORDER BY 
    balance DESC

--3.Query to Calculate Total Deposits for All Customers in specific date--
SELECT 
    SUM(amount) AS total_deposits
FROM 
    Transactions
WHERE 
    transaction_type = 'deposit' 
	AND transaction_date = '2023-09-01';

--4.Query to Find the Oldest and Newest Customers--
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


--5.Query to Retrieve transaction details along with the account type--
SELECT 
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    a.account_type
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id; 

--6.Query to Get a list of customers along with their account details--
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    c.address,
    a.account_id,
    a.account_type,
    a.balance
FROM 
    Customers c
LEFT JOIN 
    Accounts a ON c.customer_id = a.customer_id;

--7.Query to Retrieve transaction details along with customer information for a specific account--
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone_number,
    t.transaction_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id  
JOIN 
    Customers c ON a.customer_id = c.customer_id  
WHERE 
    a.account_id = 5;  

--8.Query to Identify customers who have more than one account--
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
    c.customer_id, c.first_name, c.last_name
HAVING 
    COUNT(a.account_id) > 1;  

--9.Query to Calculate the difference in transaction amounts between deposits and withdrawals--
SELECT 
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) AS total_deposits,
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS total_withdrawals,
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) - 
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS difference
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


--10.Query to Calculate the average daily balance for each account over a specified period--
SELECT 
    account_id,
    AVG(balance) AS average_daily_balance
FROM 
    DailyBalances
WHERE 
    balance_date BETWEEN '2024-01-01' AND '2024-01-31'
GROUP BY 
    account_id;

--11.Calculate the total balance for each account type--
SELECT 
    account_type,
    SUM(balance) AS total_balance
FROM 
    Accounts
GROUP BY 
    account_type;

--12.Identify accounts with the highest number of transactions order by descending order--
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

--13.List customers with high aggregate account balances, along with their account types--
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
    c.customer_id, c.first_name, c.last_name, a.account_type
ORDER BY 
    total_balance DESC;  

--14.Identify and list duplicate transactions based on transaction amount, date, and account--
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

-------------------------------------------------------------------------------------------------------------------------------

--Tasks 4: Subquery and its type

--1.Retrieve the customer(s) with the highest account balance--
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

--2.Calculate the average account balance for customers who have more than one account--
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

--3.Retrieve accounts with transactions whose amounts exceed the average transaction amount--
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


--4.Identify customers who have no recorded transactions--
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

--5.Calculate the total balance of accounts with no recorded transactions--
SELECT 
    SUM(a.balance) AS total_balance
FROM 
    Accounts a
LEFT JOIN 
    Transactions t ON a.account_id = t.account_id
WHERE 
    t.transaction_id IS NULL;

--6.Retrieve transactions for accounts with the lowest balance--
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

--7.Identify customers who have accounts of multiple types--
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
    c.customer_id, c.first_name, c.last_name
HAVING 
    COUNT(DISTINCT a.account_type) > 1;  

--8.Calculate the percentage of each account type out of the total number of accounts--
SELECT 
    a.account_type,
    COUNT(*) AS account_count,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS percentage
FROM 
    Accounts a
GROUP BY 
    a.account_type;

--9.Retrieve all transactions for a customer with a given customer_id--
SELECT 
    t.transaction_id,
    t.account_id,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    Transactions t
JOIN 
    Accounts a ON t.account_id = a.account_id  
WHERE 
    a.customer_id = 4;  

--10.Calculate the total balance for each account type, including a subquery within the SELECT clause--
SELECT 
    account_type, 
    SUM(balance) AS total_balance,
    (SELECT SUM(balance) FROM Accounts) AS overall_balance
FROM 
    Accounts
GROUP BY 
    account_type;

----------------------------------------------------------------------------END------------------------------------------------------------------















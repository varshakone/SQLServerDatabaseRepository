--Task 2. Select, Where, Between, AND, LIKE--

Insert into Customers(customer_id,first_name,last_name,DOB,email,phone_number,address)values
(11,'Anand','Salokiya','2003-06-06','salokiyanand@gmail.com','7509301102','Vijay Nagar Indore'),
(22,'Amit', 'Sharma', '1985-07-10', 'amit.sharma@example.com', '9876543210', '123 MG Road, Indore, Madhya Pradesh'),
(33,'Pooja', 'Verma', '1990-08-22', 'pooja.verma@example.com', '8765432109', '456 Kharadi, Pune, Maharashtra'),
(44,'Rajesh', 'Gupta', '1975-04-15', 'rajesh.gupta@example.com', '7654321098', '789 Sector 18, Noida, Uttar Pradesh'),
(55,'Sunita', 'Patel', '1995-11-30', 'sunita.patel@example.com', '6543210987', '101 Vashi, Navi Mumbai, Maharashtra'),
(66,'Vikram', 'Kumar', '1988-01-25', 'vikram.kumar@example.com', '5432109876', '202 Sector 10, Dwarka, Delhi'),
(77,'Anjali', 'Rao', '1992-09-13', 'anjali.rao@example.com', '4321098765', '303 IT Park, Hyderabad, Telangana'),
(88,'Ravi', 'Joshi', '1980-03-03', 'ravi.joshi@example.com', '3210987654', '404 Lal Kothi, Jaipur, Rajasthan'),
(99,'Sneha', 'Desai', '1998-06-18', 'sneha.desai@example.com', '2109876543', '505 Andheri West, Mumbai, Maharashtra'),
(111,'Arjun', 'Singh', '1983-12-09', 'arjun.singh@example.com', '1098765432', '606 Kormangala, Bangalore, Karnataka'),
(222,'Meena', 'Thakur', '2000-02-20', 'meena.thakur@example.com', '9988776655', '707 Gandhi Nagar, Bhopal, Madhya Pradesh');

select * from Customers;


INSERT INTO Accounts (customer_id, account_type, balance) VALUES
(11, 'Savings', 2000.00),
(22, 'Current', 5000.00),
(33, 'Savings', 1500.00),
(44, 'Fixed', 30000.00),
(55, 'Current', 1000.50),
(66, 'Savings', 2500.75),
(77, 'Current', 3500.00),
(88, 'Fixed', 15000.00),
(99, 'Savings', 4000.00),
(111, 'Current', 6000.00),
(222, 'Savings', 3000.00);

select * from Accounts;

INSERT INTO Transactions (account_id, transaction_type, amount, transaction_date) VALUES
(1, 'Deposit', 1000.00, '2024-01-01'),
(1, 'Withdrawal', 500.00, '2024-01-05'),
(2, 'Deposit', 2500.00, '2024-01-10'),
(2, 'Withdrawal', 300.00, '2024-01-15'),
(3, 'Deposit', 1500.00, '2024-01-20'),
(4, 'Deposit', 5000.00, '2024-01-25'),
(5, 'Withdrawal', 1000.00, '2024-01-30'),
(6, 'Deposit', 2000.00, '2024-02-01'),
(7, 'Withdrawal', 750.00, '2024-02-05'),
(8, 'Deposit', 1200.00, '2024-02-10'),
(9, 'Withdrawal', 500.00, '2024-02-15'),
(10, 'Deposit', 3000.00, '2024-02-20');

--1. query to retrieve the name, account type and email of all customers--

SELECT 
    c.first_name, 
    c.last_name, 
    a.account_type, 
    c.email
FROM 
    Customers c
JOIN 
    Accounts a ON c.customer_id = a.customer_id;

--2. query to list all transaction corresponding customer.--
SELECT 
    c.first_name, 
    c.last_name, 
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
    Customers c ON a.customer_id = c.customer_id;

--3. query to increase the balance of a specific account by a certain amount.--

UPDATE Accounts
SET balance = balance + 2000
WHERE account_id = 2;

select * from Accounts

--4.query to Combine first and last names of customers as a full_name--
SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM 
    Customers;

--5. query to remove accounts with a balance of zero where the account type is savings.--
DELETE FROM Accounts
WHERE balance = 0.00
AND account_type = 'Savings';

--6.query to Find customers living in a specific city--

SELECT 
    first_name, 
    last_name, 
    email, 
    address
FROM 
    Customers
WHERE 
    address LIKE '%Indore%';

--7. query to Get the account balance for a specific account.--

SELECT 
    balance
FROM 
    Accounts
WHERE 
    account_id = 7;


--8.query to List all current accounts with a balance greater than $1,000--
SELECT 
    account_id, 
    customer_id, 
    balance
FROM 
    Accounts
WHERE 
    account_type = 'Current' 
    AND balance > 1000.00;

--9. query to Retrieve all transactions for a specific account.--
SELECT 
    transaction_id, 
    transaction_type, 
    amount, 
    transaction_date
FROM 
    Transactions
WHERE 
    account_id = 9;

--10.query to Calculate the interest accrued on savings accounts based on a given interest rate.--
SELECT 
    account_id, 
    balance, 
    (balance * 5 / 100) AS interest_accrued
FROM 
    Accounts
WHERE 
    account_type = 'Savings';

--11.query to Identify accounts where the balance is less than a specified overdraft limit.--
SELECT 
    account_id, 
    customer_id, 
    balance
FROM 
    Accounts
WHERE 
    balance < 4000.00;

--12. query to Find customers not living in a specific city.--
SELECT 
    first_name, 
    last_name, 
    email, 
    address
FROM 
    Customers
WHERE 
    address NOT LIKE '%Indore%';












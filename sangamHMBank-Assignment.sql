--TASK 1



CREATE DATABASE HMBank;
alter database BankSystem modify name= HMBank
use HMBank;

CREATE TABLE Customers (  
    customer_id INT PRIMARY KEY IDENTITY(1,1),  
    first_name VARCHAR(50) NOT NULL,  
    last_name VARCHAR(50) NOT NULL,  
    DOB DATE NOT NULL,  
    email VARCHAR(100) UNIQUE NOT NULL,  
    phone_number VARCHAR(15),  
    address VARCHAR(255)  
);
CREATE TABLE Accounts (  
    account_id INT PRIMARY KEY IDENTITY(1,1), 
    customer_id INT NOT NULL,  
    account_type VARCHAR(20) NOT NULL,         
    balance DECIMAL(10, 2) DEFAULT 0.00,  
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE,  
    CHECK (account_type IN ('savings', 'current', 'zero_balance'))   
);
CREATE TABLE Transactions (  
    transaction_id INT PRIMARY KEY IDENTITY(1,1),  
    account_id INT NOT NULL,  
    transaction_type VARCHAR(20) NOT NULL,  
    amount DECIMAL(10, 2) NOT NULL,  
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,  
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE,
	CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer'))
);


INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address)  
VALUES   
('Ram', 'Dobaji', '1985-06-15', 'ram.d@example.com', '1234567890', 'talwandi, kota, RJ'),  
('Riya', 'Sriya', '1990-09-22', 'riya.s@example.com', '0987654321', 'Patel nagar, jaipur, RJ'),
('shyam', 'singh', '2005-01-05', 'singh.shyam@example.com', '3434567560', 'taldi, neemach, MP'),  
('haran', 'dubey', '1999-08-12', 'haran.d@example.com', '0987655671', 'rajapark, jaipur, RJ'),
('john', 'dey', '2000-09-02', 'john.d@example.com', '9987654321', '98, tripura, TN'),
('Amit', 'Verma', '1982-11-30', 'amit.v@example.com', '9876543210', 'Gandhi Nagar, Hyderabad, TG'),  
('Neha', 'Patel', '2002-07-15', 'neha.p@example.com', '8765432109', 'Mahatma Gandhi Road, Ahmedabad, GJ'),  
('Raj', 'Kumar', '2022-05-20', 'raj.kumar@example.com', '7654321098', 'Model Town, Delhi, DL'),  
('Sneha', 'Desai', '2019-04-25', 'sneha.d@example.com', '6543210987', 'Jayshree Nagar, Surat, GJ'),  
('Vishal', 'Chaudhary', '2018-12-03', 'vishal.c@example.com', '5432109876', 'Nehru Place, Kolkata, WB');

INSERT INTO Accounts (customer_id, account_type, balance)  
VALUES   
(1, 'savings', 1500.00),  
(3, 'current', 2000.00),   
(2, 'savings', 5000.00),
(6, 'zero_balance', 0.00),
(5, 'zero_balance', 0.00), 
(7, 'zero_balance', 0.00),
(8, 'savings', 6000.00),
(9, 'savings', 500.00),
(4, 'current', 8000.00),   
(10, 'savings', 7000.00); 

INSERT INTO Transactions (account_id, transaction_type, amount)  
VALUES   
(1, 'deposit', 500.00),    
(2, 'withdrawal', 200.00),  
(3, 'deposit', 1000.00),   
(5, 'transfer', 2500.00),
(6, 'deposit', 900.00),    
(4, 'withdrawal', 100.00),  
(7, 'deposit', 8000.00),   
(9, 'transfer', 500.00),
(8, 'deposit', 300.00),    
(10, 'transfer', 200.00) 
;  
select * from customers;

select * from Accounts;

select * from Transactions;


--task 2




--1 query
SELECT   
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,   
    a.account_type,   
    c.email  
FROM   
    Customers c  
JOIN   
    Accounts a ON c.customer_id = a.customer_id;

--2 query
SELECT   
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,   
    t.transaction_type,   
    t.amount,   
    t.transaction_date  
FROM   
    Customers c  
JOIN   
    Accounts a ON c.customer_id = a.customer_id  
JOIN   
    Transactions t ON a.account_id = t.account_id;

--3
UPDATE   
    Accounts  
SET   
    balance = balance + 1000   
WHERE   
    account_id = 9;  

--4
SELECT   
    CONCAT(first_name, ' ', last_name) AS full_name   
FROM   
    Customers;

--5
DELETE FROM   
    Accounts  
WHERE   
    balance = 0 AND account_type = 'savings';

--6
SELECT   
    CONCAT(first_name, ' ', last_name) AS full_name   
FROM   
    Customers  
WHERE   
    address LIKE '%jaipur%';  

--7
SELECT   
    balance   
FROM   
    Accounts  
WHERE   
    account_id = 8; 	

--9
SELECT   
    t.transaction_type,   
    t.amount,   
    t.transaction_date   
FROM   
    Transactions t  
WHERE   
    t.account_id = 1; 

--11
SELECT   
    (SELECT CONCAT(first_name, ' ', last_name) FROM Customers WHERE customer_id = Accounts.customer_id) AS full_name,   
    account_id,   
    balance  
FROM   
    Accounts  
WHERE   
    balance < -2000;  

--12
SELECT   
    CONCAT(first_name, ' ', last_name) AS full_name   
FROM   
    Customers  
WHERE   
    address NOT LIKE '%jaipur%'; 


--task 3






--1
SELECT   
    AVG(balance) AS average_balance   
FROM   
    Accounts;

--2
SELECT   
    account_id,   
    balance   
FROM   
    Accounts  
ORDER BY   
    balance DESC   
OFFSET 0 ROWS;

--3
SELECT   
    SUM(amount) AS total_deposits   
FROM   
    Transactions   
WHERE   
    transaction_type = 'deposit' AND transaction_date = '2002-07-15';  

--4
SELECT   
    MIN(registration_date) AS oldest_date,  
    MAX(registration_date) AS newest_date   
FROM   
    Customers;

--5
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

--6
SELECT   
    c.customer_id,  
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,  
    a.account_id,  
    a.balance,  
    a.account_type  
FROM   
    Customers c  
JOIN   
    Accounts a ON c.customer_id = a.customer_id;

--7
SELECT   
    t.transaction_id,  
    t.transaction_type,  
    t.amount,  
    t.transaction_date,  
    c.customer_id,  
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name   
FROM   
    Transactions t  
JOIN   
    Accounts a ON t.account_id = a.account_id  
JOIN   
    Customers c ON a.customer_id = c.customer_id  
WHERE   
    a.account_id = 1; 

--8
SELECT   
    c.customer_id,  
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,  
    COUNT(a.account_id) AS account_count  
FROM   
    Customers c  
JOIN   
    Accounts a ON c.customer_id = a.customer_id  
GROUP BY   
    c.customer_id  ,
	c.first_name  ,
	c.last_name
HAVING   
    COUNT(a.account_id) > 1;

--10
SELECT   
    a.account_id,  
    AVG(t.amount) AS average_daily_balance   
FROM   
    Accounts a  
JOIN   
    Transactions t ON a.account_id = t.account_id  
WHERE   
    t.transaction_date BETWEEN '1998-06-01' AND '2002-10-02'  
GROUP BY   
    a.account_id;

--11
SELECT   
    account_type,  
    SUM(balance) AS total_balance   
FROM   
    Accounts   
GROUP BY   
    account_type;

--12
SELECT   
    a.account_id,  
    COUNT(t.transaction_id) AS transaction_count  
FROM   
    Accounts a  
JOIN   
    Transactions t ON a.account_id = t.account_id  
GROUP BY   
    a.account_id  
ORDER BY   
    transaction_count DESC;

--13
SELECT   
    c.customer_id,  
    CONCAT(c.first_name, ' ', c.last_name) AS full_name,  
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
HAVING   
    SUM(a.balance) > 5000; 

--14
SELECT   
    t.account_id,  
    t.amount,  
    t.transaction_date,  
    COUNT(*) AS duplicate_count  
FROM   
    Transactions t  
GROUP BY   
    t.account_id, t.amount, t.transaction_date  
HAVING   
    COUNT(*) > 1;





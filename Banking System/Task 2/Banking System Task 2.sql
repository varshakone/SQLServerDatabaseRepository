use HMBank;

-- task 2
-- Question 1
select c.First_name, c.Last_name,c.Email, a.Account_Type 
from Customers c Join Accounts a on c.CustomerID=a.CustomerID

--Question 2
select t.TransactionID,t.Transaction_type,t.Amount,t.Transaction_date,c.First_name, c.Last_name, a.AccountID
from Transactions t join Accounts a on t.AccountID=a.AccountID join Customers c on a.CustomerID = c.CustomerID

--Question 3
update Transactions
set Amount = Amount * 1.10
select * from Transactions

--Question 4
SELECT 
    CONCAT(First_name, ' ', Last_name) AS full_name
FROM 
    Customers;

--Question 5
delete from Accounts
where Balance=0 and Account_Type='savings'
select * from Accounts

--Question 6
select * from Customers
where Address='Jaipur'

-- Question 7
SELECT *
FROM Accounts
WHERE AccountID = 1;

--question 8
select * from Accounts
where Balance > 1000

--Question 9
SELECT 
    TransactionID, 
    Transaction_type, 
    Amount, 
    Transaction_Date
FROM 
    Transactions
WHERE 
    AccountID = 5;

--Question 10
SELECT 
    AccountID, 
    Balance, 
    (Balance * 0.05) AS interest_accrued
FROM 
    Accounts
WHERE 
    Account_Type = 'savings';

--Question 11
SELECT *
FROM 
    Accounts
WHERE 
    balance < 75000;

-- question 12
select * from Customers
where Address != 'Delhi'



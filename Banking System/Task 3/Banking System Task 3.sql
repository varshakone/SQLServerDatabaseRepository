--Task 3
Use HMBank
--Question 1
select avg(Balance) as Avg_Balance
from Accounts;

--Question 2
select top 10 
Balance from Accounts
order by Balance Desc

--Question 3
select c.First_name, SUM(t.Amount) As total_deposit
from Transactions t join Accounts a on a.AccountID = t.AccountID join
Customers c on a.CustomerID = c.CustomerID
where t.Transaction_type = 'deposit'
group by c.CustomerID,c.First_name

--Question 4
select top 1
First_name, Last_name, DOB
from Customers
order by DOB desc

select top 1
First_name, Last_name, DOB
from Customers
order by DOB asc

--Question 5
select t.accountID, t.Transaction_type,t.amount, t.Transaction_Date, a.account_type
from Transactions t join Accounts a on t.AccountID=a.AccountID

-- Question 6
select c.*, a.account_type, a.balance
from Customers c join Accounts a on c.CustomerID = a.CustomerID

--Question 7
select c.CustomerID,c.first_name, c.last_name, a.Account_Type, a.AccountID, t.*
from Customers c join Accounts a on c.CustomerID=a.CustomerID
JOIN Transactions t ON a.AccountID = t.AccountID
where t.AccountID=1

--Question 8
SELECT C.CustomerID, C.first_name, C.last_name, COUNT(A.AccountID) AS account_count
FROM Customers C
JOIN Accounts A ON C.CustomerID = A.CustomerID
GROUP BY C.CustomerID, C.first_name, C.last_name
HAVING COUNT(A.AccountID) = 1;

--Question 9
SELECT 
    SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
    SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS transaction_difference
FROM Transactions;

--Question 10
select AccountID , avg(Balance) as avg_daily_basis
from Accounts
group by AccountID

--Question 11
select Account_Type , SUM(Balance) as Total_balance
from Accounts
group by Account_Type

--Question 12
SELECT A.AccountID, COUNT(T.TransactionID) AS transaction_count
FROM Accounts A
LEFT JOIN Transactions T ON A.AccountID = T.AccountID
GROUP BY A.AccountID
ORDER BY transaction_count DESC;

--Question 13
SELECT 
    C.CustomerID, 
    C.first_name, 
    C.last_name, 
    A.account_type, 
    SUM(A.balance) AS total_balance
FROM 
    Customers C
JOIN 
    Accounts A ON C.CustomerID = A.CustomerID
GROUP BY 
    C.CustomerID, 
    C.first_name, 
    C.last_name, 
    A.account_type
ORDER BY 
    total_balance DESC;

--Question 14
SELECT 
    T.amount, 
    T.transaction_date, 
    T.AccountID, 
    COUNT(*) AS duplicate_count
FROM 
    Transactions T
GROUP BY 
    T.amount, 
    T.transaction_date, 
    T.AccountID
HAVING 
    COUNT(*) > 1
ORDER BY 
    duplicate_count DESC;








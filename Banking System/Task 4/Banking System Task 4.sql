--Task 4
Use HMBank

--Question 1
SELECT 
    c.CustomerID, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    c.email, 
    a.AccountID, 
    a.balance
FROM 
    Accounts a
JOIN 
    Customers c 
ON 
    a.CustomerID = c.CustomerID
WHERE 
    a.balance = (SELECT MAX(balance) FROM Accounts);

--Question 2
SELECT 
    CustomerID, 
    AVG(balance) AS average_balance
FROM 
    Accounts
GROUP BY 
    CustomerID
HAVING 
    COUNT(AccountID) > 1;

SELECT 
    CustomerID, 
    AVG(balance) AS average_balance
FROM 
    Accounts
GROUP BY 
    CustomerID
HAVING 
    COUNT(AccountID) = 1; -- As in my database Count =1 so tried with Count =1

-- Question 3
SELECT 
    t.TransactionID, 
    t.AccountID, 
    t.amount, 
    t.transaction_date
FROM 
    Transactions t
WHERE 
    t.amount > (SELECT AVG(amount) FROM Transactions);

-- Question 4
SELECT 
    c.CustomerID, 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
    c.email
FROM 
    Customers c
LEFT JOIN 
    Accounts a ON c.CustomerID = a.CustomerID
LEFT JOIN 
    Transactions t ON a.AccountID = t.AccountID
WHERE 
    t.TransactionID IS NULL;

-- Question 5
SELECT 
    SUM(a.balance) AS total_balance
FROM 
    Accounts a
LEFT JOIN 
    Transactions t ON a.AccountID = t.AccountID
WHERE 
    t.TransactionID IS NULL;

-- Question 6
SELECT 
    t.TransactionID, 
    t.AccountID, 
    t.transaction_type, 
    t.amount, 
    t.transaction_date
FROM 
    Transactions t
WHERE 
    t.AccountID = (
        SELECT TOP 1 AccountID 
        FROM Accounts
        ORDER BY balance ASC
    );

-- Question 7
SELECT 
    CustomerID, 
    COUNT(DISTINCT Account_Type) AS AccountTypeCount
FROM 
    Accounts
GROUP BY 
    CustomerID
HAVING 
    COUNT(DISTINCT Account_Type) > 1; -- null

-- Question 8
SELECT 
    Account_Type,
    COUNT(*) AS AccountCount,
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts)) AS Percentage
FROM 
    Accounts
GROUP BY 
    Account_Type;

-- Question 9
SELECT 
    t.TransactionID,
    t.AccountID,
    a.CustomerID,
    t.transaction_type,
    t.amount,
    t.transaction_date
FROM 
    Transactions t
JOIN 
    Accounts a ON t.AccountID = a.AccountID
WHERE 
    a.CustomerID = 1;

	--Question 10
	SELECT 
    account_type,
    SUM(balance) AS total_balance,
    (SELECT SUM(balance) FROM Accounts WHERE account_type = a.account_type) AS total_balance_for_type
FROM 
    Accounts a
GROUP BY 
    account_type;







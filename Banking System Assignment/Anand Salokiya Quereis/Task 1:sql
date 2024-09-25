--Task 1. Database Design--

Create Database HMBank

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,  
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    DOB DATE,
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY IDENTITY(1,1),  
    customer_id INT, 
    account_type VARCHAR(20) NOT NULL, 
    balance DECIMAL(18, 2) DEFAULT 0.00, 
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions(
	transaction_id INT PRIMARY KEY IDENTITY(1,1),
	account_id INT,
	transaction_type VARCHAR(50),
	amount DECIMAL(10,2),
	transaction_date DATE,
	FOREIGN KEY (account_id) REFERENCES Accounts(account_id));






Create Database HMBank;
use HMBank;

Create Table Customers(
	CustomerID int identity primary key not null,
	First_name VARCHAR(50) not null,
	Last_name VARCHAR(50) not null,
	DOB Date not null,
	Email VARCHAR(100) unique not null,
	Phone VARCHAR(100) ,
	Address VARCHAR(100)
);

Create Table Accounts(
	AccountID int identity(1,1) primary key,
    CustomerID int, 
	Account_Type VARCHAR(100) not null,
	Balance Decimal(10,2) not null,
	Foreign key (CustomerID) references Customers(CustomerID)
);


Create Table Transactions(
	TransactionID int identity primary key not null,
	AccountID int,
	Transaction_type VARCHAR(100),
	Amount decimal(10,2) not null,
	Transaction_Date DATETIME not null,
	Foreign key (AccountID) references Accounts(AccountID)
);

insert into Customers Values 
('Ayaan', 'Sharma', '2000-05-15', 'ayaan.sharma@example.com', '9876543210', 'Delhi'),
('Maya', 'Verma', '2002-06-20', 'maya.verma@example.com', '9876543211', 'Delhi'),
('Riya', 'Singh', '1991-03-12', 'riya.singh@example.com', '9876543212', 'Mumbai'),
('Saanvi', 'Patel', '1989-09-18', 'saanvi.patel@example.com', '9876543213', 'Jaipur'),
('Reyansh', 'Reddy', '2003-04-25', 'reyansh.reddy@example.com', '9876543214', 'Bangalore'),
('Isha', 'Kumar', '1994-02-14', 'isha.kumar@example.com', '9876543215', 'Bangalore'),
('Vihaan', 'Ghosh', '1995-11-01', 'vihaan.ghosh@example.com', '9876543216', 'Kolkata'),
('Nisha', 'Chatterjee', '1988-07-30', 'nisha.chatterjee@example.com', '9876543217', 'Kolkata'),
('Riya', 'Mehta', '1990-10-15', 'riya.mehta@example.com', '9876543218', 'Jaipur'),
('Arjun', 'Iyer', '1992-12-11', 'arjun.iyer@example.com', '9876543219', 'Hyderabad');

Insert into Accounts Values
(1, 'savings', 50000.00),
(2, 'current', 100000.00),
(3, 'savings', 150000.50),
(4, 'zero_balance', 0.00),
(5, 'savings', 75000.75),
(6, 'current', 200000.00),
(7, 'savings', 30000.25),
(8, 'zero_balance', 0.00),
(9, 'current', 120000.00),
(10, 'savings', 60000.00);

Insert into Transactions Values
(1, 'deposit', 20000.00, '2024-01-15 10:00:00'),
(2, 'withdrawal', 5000.00, '2024-01-20 12:00:00'),
(3, 'deposit', 30000.00, '2024-01-18 14:30:00'),
(4, 'withdrawal', 15000.00, '2024-01-25 09:00:00'),
(5, 'deposit', 50000.00, '2024-01-12 11:45:00'),
(6, 'withdrawal', 2000.00, '2024-01-30 16:00:00'),
(7, 'deposit', 15000.00, '2024-01-22 13:15:00'),
(8, 'transfer', 25000.00, '2024-01-10 08:30:00'),
(9, 'withdrawal', 500.00, '2024-01-28 17:00:00'),
(10, 'deposit', 750.00, '2024-01-05 15:00:00')

select * from Customers
SELECT * FROM Accounts;
select * from Transactions


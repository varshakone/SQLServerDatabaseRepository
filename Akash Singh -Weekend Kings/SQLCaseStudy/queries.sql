
create Database Company;
use Company;
-- Schema For Employees
CREATE TABLE Employees
(
    employee_ID INT PRIMARY KEY,
    name NVARCHAR(50),
    department NVARCHAR(50),
    email NVARCHAR(50),
    password NVARCHAR(50)
);

-- Schema for Assets
CREATE TABLE Assets
(
    asset_ID INT PRIMARY KEY,
    name NVARCHAR(50),
    type NVARCHAR(50),
    purchase_date DATETIME,
    location NVARCHAR(50),
    status NVARCHAR(50),
    owner_ID INT,
    FOREIGN KEY (owner_ID) REFERENCES Employees(employee_ID)
);


-- Schema for maintenance_records

CREATE TABLE maintenance_records
(
    maintenance_id INT PRIMARY KEY,
    asset_ID INT,
    maintenance_date DATETIME,
    description NVARCHAR(50),
    cost DECIMAL(18, 2),
    FOREIGN KEY (asset_ID) REFERENCES Assets(asset_ID)
);


-- Schema for asset_allocations

CREATE TABLE asset_allocations
(
    allocation_id INT PRIMARY KEY,
    asset_ID INT,
    employee_ID INT,
    allocation_date DATETIME,
    return_Date DATETIME,
    FOREIGN KEY (asset_ID) REFERENCES Assets(asset_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employees(employee_ID)
);

--Schema for reservations

CREATE TABLE reservations
(
    reservation_id INT PRIMARY KEY,
    asset_ID INT,
    employee_ID INT,
    reservation_date DATETIME,
    start_Date DATETIME,
    end_Date DATETIME,
    status NVARCHAR(50),
    FOREIGN KEY (asset_ID) REFERENCES Assets(asset_ID),
    FOREIGN KEY (employee_ID) REFERENCES Employees(employee_ID)
);


-- Insert   records into Employees 
INSERT INTO Employees
    (employee_ID, name, department, email, password)
VALUES
    (1, 'Akash', 'HR', 'Akash@gmail.com', 'Akash123'),
    (2, 'Niranjan', 'Finance', 'Niranjan@gmail.com', 'Niranjan123'),
    (3, 'vijay', 'IT', 'vijay@gmail.com', 'vijay123'),
    (4, 'Vinay', 'Marketing', 'Vinay@gmail.com', 'Vinay123'),
    (5, 'Vikram', 'Sales', 'vikram@gmail.com', 'vikram123'),
    (6, 'Anand', 'HR', 'Anand@gmail.com', 'Anand123'),
    (7, 'Sejal', 'Finance', 'Sejal@gmail.com', 'Sejal123'),
    (8, 'Glanet', 'IT', 'Glanet@gmail.com', 'Glanet123'),
    (9, 'Suresh', 'Marketing', 'suresh@gmail.com', 'suresh123'),
    (10, 'Neha', 'Sales', 'neha@gmail.com', 'neha123');

-- Insert records into Assets
INSERT INTO Assets
    (asset_ID, name, type, purchase_date, location, status, owner_ID)
VALUES
    (1, 'Laptop', 'Electronics', '2021-01-01', 'Bangalore', 'Available', 1),
    (2, 'Office Chair', 'Furniture', '2021-02-15', 'Mumbai', 'In Use', 2),
    (3, 'Printer', 'Electronics', '2021-03-10', 'Delhi', 'Available', 3),
    (4, 'Projector', 'Electronics', '2021-04-05', 'Chennai', 'In Use', 4),
    (5, 'Desk', 'Furniture', '2021-05-20', 'Kolkata', 'Available', 5),
    (6, 'Laptop', 'Electronics', '2021-06-25', 'Bangalore', 'In Use', 6),
    (7, 'Desktop', 'Electronics', '2021-07-30', 'Mumbai', 'Available', 7),
    (8, 'Whiteboard', 'Office Supplies', '2021-08-15', 'Delhi', 'In Use', 8),
    (9, 'Projector', 'Electronics', '2021-09-10', 'Chennai', 'Available', 9),
    (10, 'Scanner', 'Electronics', '2021-10-05', 'Kolkata', 'In Use', 10);



-- Insert records into maintenance_records
INSERT INTO maintenance_records
    (maintenance_id, asset_ID, maintenance_date, description, cost)
VALUES
    (1, 1, '2021-01-15', 'Replaced battery', 150.00),
    (2, 2, '2021-02-20', 'Fixed broken wheel', 75.00),
    (3, 3, '2021-03-25', 'Replaced ink cartridge', 50.00),
    (4, 4, '2021-04-30', 'Cleaned lens', 30.00),
    (5, 5, '2021-05-10', 'Repaired drawer', 40.00),
    (6, 6, '2021-06-15', 'Updated software', 100.00),
    (7, 7, '2021-07-20', 'Replaced hard drive', 200.00),
    (8, 8, '2021-08-25', 'Cleaned surface', 20.00),
    (9, 9, '2021-09-30', 'Replaced bulb', 60.00),
    (10, 10, '2021-10-05', 'Repaired scanner head', 90.00);

-- Insert records into asset_allocations
INSERT INTO asset_allocations
    (allocation_id, asset_ID, employee_ID, allocation_date, return_date)
VALUES
    (1, 1, 1, '2021-01-01', '2021-06-01'),
    (2, 2, 2, '2021-02-15', '2021-07-15'),
    (3, 3, 3, '2021-03-10', '2021-08-10'),
    (4, 4, 4, '2021-04-05', '2021-09-05'),
    (5, 5, 5, '2021-05-20', '2021-10-20'),
    (6, 6, 6, '2021-06-25', '2021-11-25'),
    (7, 7, 7, '2021-07-30', '2021-12-30'),
    (8, 8, 8, '2021-08-15', '2022-01-15'),
    (9, 9, 9, '2021-09-10', '2022-02-10'),
    (10, 10, 10, '2021-10-05', '2022-03-05');


-- Insert records into reservations
INSERT INTO reservations
    (reservation_id, asset_ID, employee_ID, reservation_date, start_date, end_date, status)
VALUES
    (1, 1, 1, '2021-01-01', '2021-01-05', '2021-01-10', 'Confirmed'),
    (2, 2, 2, '2021-02-01', '2021-02-05', '2021-02-10', 'Confirmed'),
    (3, 3, 3, '2021-03-01', '2021-03-05', '2021-03-10', 'Cancelled'),
    (4, 4, 4, '2021-04-01', '2021-04-05', '2021-04-10', 'Confirmed'),
    (5, 5, 5, '2021-05-01', '2021-05-05', '2021-05-10', 'Pending'),
    (6, 6, 6, '2021-06-01', '2021-06-05', '2021-06-10', 'Confirmed'),
    (7, 7, 7, '2021-07-01', '2021-07-05', '2021-07-10', 'Cancelled'),
    (8, 8, 8, '2021-08-01', '2021-08-05', '2021-08-10', 'Confirmed'),
    (9, 9, 9, '2021-09-01', '2021-09-05', '2021-09-10', 'Pending'),
    (10, 10, 10, '2021-10-01', '2021-10-05', '2021-10-10', 'Confirmed');


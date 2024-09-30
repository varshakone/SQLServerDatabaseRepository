use Asset_Management

/*create table employees(
	employee_id int primary key identity,
	name varchar(50),
	department varchar(30),
	email varchar(50),
	password varchar(30))

create table assets(
	asset_id int primary key identity,
	type varchar(30),
	serial_number int not null,
	purchase_date date,
	location text,
	status varchar(50),
	owner_id int not null,
	foreign key (owner_id) references employees(employee_id))

create table maintenance_records(
	maintenance_id int primary key identity,
	asset_id int,
	maintenance_date date,
	description text,
	cost decimal(10,2)
	foreign key (asset_id) references assets(asset_id))

create table asset_allocations(
	allocation_id int primary key identity,
	asset_id int,
	employee_id int,
	allocation_date date not null,
	return_date date
	foreign key(asset_id) references assets(asset_id),
	foreign key (employee_id) references employees(employee_id))

create table reservations(
	reservation_id int primary key identity,
	asset_id int,
	employee_id int,
	reservation_date date,
	start_date date,
	end_date date,
	status varchar(30)
	foreign key(asset_id) references assets(asset_id),
	foreign key (employee_id) references employees(employee_id))*/


SELECT * 
FROM information_schema.tables 
WHERE table_type = 'BASE TABLE';


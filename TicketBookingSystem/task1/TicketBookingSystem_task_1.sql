create database TicketBookingSystem;
use TicketBookingSystem;

create table Venue (
VenueID int primary key identity(1,1),
VenueName varchar(100) not null,
Address varchar(255) not null
);

create table Booking(
BookingID int primary key identity(1,1),
CustomerID int,
EventID int,
NumOfTickets int not null,
TotalCost decimal(10,2) not null,
BookingDate date not null,
);

create table Customer(
CustomerID int primary key identity(1,1),
CustomerName varchar(100) not null,
Email varchar(100) not null,
PhoneNumber varchar(15) not null,
BookingID int,
foreign key (BookingID) references Booking(BookingID)
);

create table Event (
EventID int primary key identity(1,1),
EventName varchar(100) not null,
EventDate date not null,
EventTime time not null,
VenueID int,
TotalSeats int not null,
AvailableSeats int not null,
TicketPrice decimal(10,2) not null,
EventType varchar(50) check (EventType in ('Movie','Sports','Concert')),
BookingID int,
foreign key (VenueID) references Venue(VenueID),
foreign key (BookingID) references Booking(BookingID)
);

alter table Booking
add constraint FK_Booking_Customer foreign key (CustomerID)
references Customer(CustomerID);

alter table Booking
add constraint FK_Booking_Event foreign key (EventID)
references Event(EventID);



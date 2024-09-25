
--task 4 of TicketBookingSystem by Vinay Solanki

--question 1
select v.VenueName,
(select avg(TicketPrice) from Event where VenueID = v.VenueID) as AverageTicketPrice
from 
Venue v;

--question 2
select EventName
from Event e
where (TotalSeats - AvailableSeats) > (select (TotalSeats/2) from Event where EventID = e.EventID );

--question 3
select e.EventName,(e.TotalSeats - e.AvailableSeats) as TotalTicketSold
from Event e;

--question 4
select c.CustomerName
from Customer c
where not exists (select 1 from Booking b where b.CustomerID = c.CustomerID);
--there is not such customer in customer table who have not book  any ticket so i am adding new customer
insert into Customer (CustomerName,Email,PhoneNumber) values('Mrunali Rajkule','mrunali@gamil.com','1234567890');

--question 5
select EventName from Event e
where EventID not in (select EventID from Booking);

--question 6
select EventType ,
sum(TotalTicketsSold) as TotalTicketsSold
from (select EventID,EventType, (TotalSeats - AvailableSeats) as TotalTicketsSold from Event) as SoldTickets
group by EventType;

--question 7
select EventName 
from Event
where TicketPrice > (select avg(TicketPrice) from Event);

--question 8
select c.CustomerName,
(select sum(e.TicketPrice * b.NumOfTickets) 
from Booking b 
join Event e on b.EventID = e.EventID 
where b.CustomerID = c.CustomerID) as TotalRevenue
from Customer c;

--question 9
declare @GivenVenueID int = 1;
select c.CustomerName
from Customer c
where CustomerID in (select b.CustomerID from Booking b join Event e on b.EventID=e.EventID where e.VenueID = @GivenVenueID);

--question 10
select e1.EventType,
(select sum(NumOfTickets) from Booking b join event e on b.EventID = e.EventID where e.EventType = e1.EventType) as TotalTicketsSold
from Event e1
group by EventType;

--question 11
declare @GivenMonth int = 11; 
select c.CustomerName
from Customer c
where CustomerID in (select b.CustomerID from Booking b 
join Event e 
on b.EventID = e.EventID 
where month(e.EventDate) = @GivenMonth);

--question 12
select v.VenueName,
(select avg(TicketPrice) from Event where VenueID = v.VenueID) as AverageTicketPrice
from Venue v;
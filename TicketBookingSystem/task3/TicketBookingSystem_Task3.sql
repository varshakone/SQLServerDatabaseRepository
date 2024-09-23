
--1 question
select EventType ,AVG(TicketPrice) as AverageTicketPrice 
from Event 
group by EventType;

--2 question
select sum(TotalCost) as TotalRevenue from Booking;

--3 question
select EventID, sum(NumOfTickets) as TotalSales from Booking
group by EventID
order by TotalSales desc
offset 0 rows
fetch next 1 rows only;

--4 question
select EventID , sum(NumOFTickets) as TotalTicketsSold from Booking
group by EventID;

--5 question
select * from Event 
where EventID not in (select distinct EventID from Booking);

--6 question
select CustomerID , sum(NumOfTickets) as TotalBookedTickets 
from Booking
group by CustomerID
order by TotalBookedTickets desc
offset 0 rows
fetch next 1 rows only;

--7 question
select Month(BookingDate) as month, sum(NumOfTickets) as TotalTickets from Booking
group by month(BookingDate);

--8 question
select VenueID , avg(TicketPrice)  as AverageTicketPrice from Event group by VenueID;

--9 question
select EventType,  sum(NumOfTickets) as TotalTicketsSold 
from Event 
join Booking on Event.EventID = Booking.EventID
group by EventType;

--10 question
select year(BookingDate) as Year, sum(TotalCost) as TotalRevenue
from Booking
group by year(BookingDate);

--11 question 
select CustomerID 
from Booking 
group by CustomerID
having Count(distinct EventID) > 1;

--12 question
select CustomerID, sum(TotalCost) as TotalRevenue
from Booking
group by CustomerID;

--13 question
select EventType ,VenueID,avg(TicketPrice) as AverageTicketPrice 
from Event
group by EventType, VenueID;

--14 question
select CustomerID ,sum(NumOfTickets) as TotalTickets
from Booking
where BookingDate >= DATEADD(day,-30,getdate())
group by CustomerID;
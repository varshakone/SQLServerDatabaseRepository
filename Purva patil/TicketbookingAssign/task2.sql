-- Task 2: SQL Queries

-- 1. List all Events
SELECT * FROM Event;

-- 2. Select events with available tickets
SELECT * FROM Event WHERE available_seats > 0;

-- 3. Select events with name partial match 'cup'
SELECT * FROM Event WHERE event_name LIKE '%cup%';

-- 4. Select events with ticket price between 1000 to 2500
SELECT * FROM Event WHERE ticket_price BETWEEN 1000 AND 2500;

-- 5. Retrieve events with dates in a specific range
SELECT * FROM Event WHERE event_date BETWEEN '2024-09-01' AND '2024-12-31';

-- 6. Retrieve events with available tickets that have "Concert" in their name
SELECT * FROM Event WHERE available_seats > 0 AND event_name LIKE '%Concert%';

-- 7. Retrieve users in batches of 5, starting from the 6th user
SELECT * FROM Customer ORDER BY customer_id OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;

-- 8. Retrieve bookings with more than 4 tickets
SELECT * FROM Booking WHERE num_tickets > 4;

-- 9. Retrieve customer information whose phone number ends with '000'
SELECT * FROM Customer WHERE phone_number LIKE '%000';

-- 10. Retrieve events ordered by seat capacity more than 15000
SELECT * FROM Event WHERE total_seats > 15000 ORDER BY total_seats;

-- 11. Select events name not starting with 'x', 'y', 'z'
SELECT * FROM Event WHERE event_name NOT LIKE 'x%' AND event_name NOT LIKE 'y%' AND event_name NOT LIKE 'z%';
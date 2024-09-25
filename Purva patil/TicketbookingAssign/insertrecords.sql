-- Insert Sample Records into Venue Table
INSERT INTO Venue (venue_name, address) VALUES 
('Stadium A', '123 Main St, City A'),
('Theater B', '456 Elm St, City B'),
('Concert Hall C', '789 Pine St, City C');

-- Insert Sample Records into Event Table
INSERT INTO Event (event_name, event_date, event_time, venue_id, total_seats, available_seats, ticket_price, event_type) VALUES 
('Movie Night', '2024-10-01', '19:00:00', 1, 200, 150, 1500.00, 'Movie'),
('Concert Live', '2024-11-15', '20:00:00', 3, 500, 300, 2500.00, 'Concert'),
('Football Match', '2024-09-20', '15:00:00', 1, 10000, 5000, 1000.00, 'Sports'),
('Play: The Lion King', '2024-12-05', '18:30:00', 2, 300, 100, 2000.00, 'Movie'),
('Jazz Night', '2024-11-25', '19:30:00', 3, 400, 200, 1800.00, 'Concert');

-- Insert Sample Records into Customer Table
INSERT INTO Customer (customer_name, email, phone_number) VALUES 
('Purva Patil', 'purva@example.com', '1234567890'),
('anisha', 'anisha@example.com', '0987654321'),
('Adhyatm Mishra', 'adhy@example.com', '5555555555'),
('Sahil More', 'sahil@example.com', '4444444444'),
('Eva Green', 'eva@example.com', '3333333333');

-- Insert Sample Records into Booking Table
INSERT INTO Booking (customer_id, event_id, num_tickets, total_cost, booking_date) VALUES 
(1, 1, 2, 3000.00, '2024-09-01'),
(2, 2, 4, 10000.00, '2024-09-05'),
(3, 3, 10, 10000.00, '2024-09-10'),
(4, 4, 1, 2000.00, '2024-09-15'),
(5, 5, 3, 5400.00, '2024-09-20');

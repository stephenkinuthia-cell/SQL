-- Insert data into Car
INSERT INTO car_rental.Car (CarModel, Manufacturer, Year, Color, RentalRate, Availability) VALUES
('Corolla', 'Toyota', 2021, 'White', 4500.00, 1),
('Civic', 'Honda', 2022, 'Black', 5000.00, 1),
('CX-5', 'Mazda', 2020, 'Red', 5500.00, 1),
('Rav4', 'Toyota', 2023, 'Silver', 6000.00, 1),
('X-Trail', 'Nissan', 2019, 'Blue', 4200.00, 1);

--- Insert data into Customer
INSERT INTO car_rental.Customer (FirstName, LastName, Email, PhoneNumber, Address) VALUES
('Stephen', 'Njoroge', 'stephen.njoroge@gmail.com', '0712345678', 'Nyeri, Kenya'),
('Alice', 'Mwangi', 'alice.mwangi@gmail.com', '0722334455', 'Nairobi, Kenya'),
('Brian', 'Otieno', 'brian.otieno@gmail.com', '0799887766', 'Kisumu, Kenya'),
('Faith', 'Kariuki', 'faith.kariuki@gmail.com', '0744556677', 'Nakuru, Kenya'),
('Dennis', 'Mutua', 'dennis.mutua@gmail.com', '0700123456', 'Mombasa, Kenya');

--- Insert into Booking
INSERT INTO car_rental.Booking (CarID, CustomerID, RentalStartDate, RentalEndDate, TotalAmount) VALUES
(1, 1, '2025-09-20', '2025-09-25', 22500.00),
(2, 2, '2025-09-21', '2025-09-23', 10000.00),
(3, 3, '2025-09-10', '2025-09-14', 22000.00),
(4, 4, '2025-09-05', '2025-09-10', 30000.00),
(5, 5, '2025-09-01', '2025-09-03', 8400.00);

-- Insert into Payment
INSERT INTO car_rental.Payment (BookingID, PaymentDate, Amount, PaymentMethod) VALUES
(1, '2025-09-19', 22500.00, 'Mpesa'),
(2, '2025-09-20', 10000.00, 'Card'),
(3, '2025-09-09', 22000.00, 'Cash'),
(4, '2025-09-04', 30000.00, 'Mpesa'),
(5, '2025-09-01', 8400.00, 'Card');

-- Insert into Insurance
INSERT INTO car_rental.Insurance (CarID, InsuranceProvider, PolicyNumber, StartDate, EndDate) VALUES
(1, 'Jubilee Insurance', 'POL-12345', '2025-01-01', '2025-12-31'),
(2, 'Britam', 'POL-22345', '2025-02-01', '2026-01-31'),
(3, 'APA Insurance', 'POL-32345', '2025-03-01', '2026-02-28'),
(4, 'Madison', 'POL-42345', '2025-04-01', '2026-03-31'),
(5, 'UAP', 'POL-52345', '2025-05-01', '2026-04-30');

--- Insert into Location
INSERT INTO car_rental.Location (CarID, LocationName, Address, ContactNumber) VALUES
(1, 'Nyeri Branch', 'Kimathi Street, Nyeri', '0711223344'),
(2, 'Nairobi CBD', 'Moi Avenue, Nairobi', '0722334455'),
(3, 'Kisumu Center', 'Oginga Odinga Rd, Kisumu', '0733445566'),
(4, 'Nakuru Hub', 'Kenyatta Ave, Nakuru', '0744556677'),
(5, 'Mombasa Office', 'Moi Ave, Mombasa', '0755667788');

--- Insert into Reservation
INSERT INTO car_rental.Reservation (CarID, CustomerID, ReservationDate, PickupDate, ReturnDate) VALUES
(1, 1, '2025-09-10', '2025-09-20', '2025-09-25'),
(2, 2, '2025-09-15', '2025-09-21', '2025-09-23'),
(3, 3, '2025-09-05', '2025-09-10', '2025-09-14'),
(4, 4, '2025-09-01', '2025-09-05', '2025-09-10'),
(5, 5, '2025-08-28', '2025-09-01', '2025-09-03');

---- Insert into Maintenance

INSERT INTO car_rental.Maintenance (CarID, MaintenanceDate, Description, Cost) VALUES
(1, '2025-08-15', 'Oil Change', 3000.00),
(2, '2025-08-20', 'Tire Replacement', 12000.00),
(3, '2025-07-30', 'Brake Check', 4500.00),
(4, '2025-09-02', 'Full Service', 15000.00),
(5, '2025-06-25', 'Battery Replacement', 8000.00);


-- SQL Server SELECT

--- Selecting all columns from car table
SELECT *
FROM
	car_rental.Car;

--- Selecting columns from customer table but specifying which columns from that table i want in this case i want to select 
		----- FirstName, LastName, Email, and Address columns from customer table
SELECT 
	FirstName,
	LastName,
	Email,
	Address
FROM
	car_rental.Customer;

-- Selecting the TotalAmount column from Booking table but applying the SUM function on that column and the giving the column an alias (Total)
SELECT SUM(TotalAmount) AS Total
FROM
	car_rental.Booking;


-- Filtering data

-- Cars with rental rate above 5000
SELECT * 
FROM 
	car_rental.Car
WHERE 
	RentalRate > 5000;

-- Customers from Nyeri
SELECT * 
FROM 
	car_rental.Customer
WHERE 
	Address LIKE '%Nyeri%';

-- Reservation Where CarID = 1 and CustomerID = 1
SELECT 
  * 
FROM 
  car_rental.Reservation
WHERE 
  CarID = 1 AND CustomerID = 1;


-- Sort cars by rental rate 
SELECT 
	CarModel, 
	Manufacturer, 
	RentalRate
FROM 
	car_rental.Car
ORDER BY 
	RentalRate DESC;

-- Sort customers using their last name
SELECT 
	FirstName, 
	LastName
FROM 
	car_rental.Customer
ORDER BY LastName ASC;

-- Geting all unique manufacturers
SELECT DISTINCT Manufacturer
FROM 
	car_rental.Car;

-- Count the total number of cars
SELECT COUNT(*) AS TotalCars 
FROM 
	car_rental.Car;

--- Average rental rate
SELECT AVG(RentalRate) AS AverageRate 
FROM 
	car_rental.Car;

-- Most expensive car rate
SELECT MAX(RentalRate) AS HighestRate 
FROM 
	car_rental.Car;

-- Total payments made
SELECT SUM(Amount) AS TotalPayments 
FROM 
	car_rental.Payment;

--- Total amount spent per customer
SELECT 
	CustomerID, 
	SUM(TotalAmount) AS TotalSpent
FROM 
	car_rental.Booking
GROUP BY CustomerID;

-- Count cars per manufacturer
SELECT 
	Manufacturer, 
	COUNT(*) AS CarCount
FROM 
	car_rental.Car
GROUP BY Manufacturer;

-- Show manufacturers with more than 1 car
SELECT 
	Manufacturer, 
	COUNT(*) AS CarCount
FROM 
	car_rental.Car
GROUP BY Manufacturer
HAVING COUNT(*) > 1;

-- Customers who spent more than 15,000
SELECT 
	CustomerID, 
	SUM(TotalAmount) AS TotalSpent
FROM 
	car_rental.Booking
GROUP BY CustomerID
HAVING SUM(TotalAmount) > 15000;

-- Update rental rate for Toyota cars
UPDATE 
	car_rental.Car
SET RentalRate = RentalRate + 500
WHERE 
	Manufacturer = 'Toyota';

-- Update a customer’s phone number
UPDATE 
	car_rental.Customer
SET PhoneNumber = '0711999888'
WHERE 
	CustomerID = 1;


-- Delete a specific booking that is booking ID 5 from Booking table
DELETE 
FROM 
	car_rental.Booking
WHERE BookingID = 5;

-- Delete customers from Mombasa
DELETE 
FROM 
	car_rental.Customer
WHERE Address LIKE '%Mombasa%';

-- Writing query inside a query
-- Find cars with rate above average
SELECT 
	CarModel, 
	RentalRate
FROM 
	car_rental.Car
WHERE RentalRate > (SELECT AVG(RentalRate) FROM car_rental.Car);

-- Customers who made a booking
SELECT 
	FirstName, 
	LastName
FROM 
	car_rental.Customer
WHERE CustomerID IN (SELECT DISTINCT CustomerID FROM car_rental.Booking);

-- Concatenate or join together the first and last names of customers
SELECT CONCAT(FirstName, ' ', LastName) AS FullName
FROM 
	car_rental.Customer;

-- Days between rental start and end
SELECT 
	BookingID, 
	DATEDIFF(DAY, RentalStartDate, RentalEndDate) AS RentalDays
FROM car_rental.Booking;

-- Label cars based on rental rate
SELECT 
	CarModel, 
	RentalRate,
    CASE
        WHEN RentalRate < 4500 THEN 'Economy'
        WHEN RentalRate BETWEEN 4500 AND 5500 THEN 'Standard'
        ELSE 'Luxury'
    END AS Category
FROM car_rental.Car;

-- Classify payment methods
SELECT PaymentMethod,
    CASE PaymentMethod
        WHEN 'Mpesa' THEN 'Mobile Payment'
        WHEN 'Card' THEN 'Bank Transaction'
        ELSE 'Cash Payment'
    END AS PaymentType
FROM car_rental.Payment;


-- Top 3 most expensive cars
SELECT 
	TOP 3 CarModel, 
	RentalRate
FROM car_rental.Car
ORDER BY RentalRate DESC;

-- Top 2 customers with most bookings
SELECT 
	TOP 2 CustomerID, 
	COUNT(*) AS BookingCount
FROM 
	car_rental.Booking
GROUP BY CustomerID
ORDER BY BookingCount DESC;

INSERT INTO car_rental.Car (CarModel, Manufacturer, Year, Color, RentalRate, Availability) VALUES
('Camry', 'Toyota', 2024, 'Gray', 6500.00, 1),
('Accord', 'Honda', 2023, 'White', 6700.00, 1),
('Forester', 'Subaru', 2022, 'Green', 6200.00, 1),
('Altima', 'Nissan', 2021, 'Black', 5800.00, 1),
('Model 3', 'Tesla', 2024, 'Red', 12000.00, 1);

SELECT *
FROM car_rental.Car

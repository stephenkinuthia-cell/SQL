--1. INNER JOIN
    ---An INNER JOIN returns only the rows that have matching values in the tables being joined.
    ---If a record in one table does not have a matching record in the other table, it will not appear in the final result.


    -- see all all bookings with their car model, customer name, and payment details.
SELECT 
    b.BookingID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    ca.CarModel,
    b.RentalStartDate,
    b.RentalEndDate,
    p.Amount AS PaymentAmount,
    p.PaymentMethod
FROM car_rental.Booking b
INNER JOIN car_rental.Customer c ON b.CustomerID = c.CustomerID
INNER JOIN car_rental.Car ca ON b.CarID = ca.CarID
INNER JOIN car_rental.Payment p ON b.BookingID = p.BookingID;


-- 2. LEFT JOIN
    ---- A LEFT JOIN returns,All records from the left table, The matching records from the right table, 
    `   ---If there is no match, the result shows NULL values for columns from the right table.
SELECT 
    b.BookingID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    ca.CarModel,
    b.RentalStartDate,
    b.RentalEndDate,
    p.Amount AS PaymentAmount,
    p.PaymentMethod
FROM car_rental.Booking b
LEFT JOIN car_rental.Customer c ON b.CustomerID = c.CustomerID
LEFT JOIN car_rental.Car ca ON b.CarID = ca.CarID
LEFT JOIN car_rental.Payment p ON b.BookingID = p.BookingID;


-- 3.RIGHT JOIN
--- A RIGHT JOIN returns, All records from the right table, The matching records from the left table,
        ----If no match exists in the left table, you’ll get NULLs for its columns.

SELECT 
    b.BookingID,
    c.FirstName + ' ' + c.LastName AS CustomerName,
    ca.CarModel,
    b.RentalStartDate,
    b.RentalEndDate,
    p.Amount AS PaymentAmount,
    p.PaymentMethod
FROM car_rental.Booking b
RIGHT JOIN car_rental.Payment p ON b.BookingID = p.BookingID
LEFT JOIN car_rental.Customer c ON b.CustomerID = c.CustomerID
LEFT JOIN car_rental.Car ca ON b.CarID = ca.CarID;

-- see all cars and bookings, even if some cars haven’t been booked or bookings have missing car info.
SELECT 
    ca.CarModel,
    b.BookingID,
    b.RentalStartDate,
    b.RentalEndDate
FROM car_rental.Car ca
FULL OUTER JOIN car_rental.Booking b ON ca.CarID = b.CarID;

--- see every car’s location, insurance provider, and last maintenance activity.
SELECT 
    ca.CarModel,
    l.LocationName,
    i.InsuranceProvider,
    m.MaintenanceDate,
    m.Description AS MaintenanceTask
FROM car_rental.Car ca
INNER JOIN car_rental.Location l ON ca.CarID = l.CarID
INNER JOIN car_rental.Insurance i ON ca.CarID = i.CarID
INNER JOIN car_rental.Maintenance m ON ca.CarID = m.CarID;

SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    ca.CarModel,
    p.Amount,
    p.PaymentMethod
FROM car_rental.Booking b
INNER JOIN car_rental.Customer c ON b.CustomerID = c.CustomerID
INNER JOIN car_rental.Car ca ON b.CarID = ca.CarID
INNER JOIN car_rental.Payment p ON b.BookingID = p.BookingID
WHERE p.PaymentMethod = 'Mpesa'
ORDER BY p.Amount DESC;

SELECT 
    c.FirstName + ' ' + c.LastName AS CustomerName,
    ca.CarModel
FROM car_rental.Customer c
CROSS JOIN car_rental.Car ca;

-- cars without insurannce
SELECT c.CarModel
FROM car_rental.Car c
LEFT JOIN car_rental.Insurance i ON c.CarID = i.CarID
WHERE i.InsuranceID IS NULL;

-- cars with no maintainance record
SELECT c.CarModel
FROM car_rental.Car c
LEFT JOIN car_rental.Maintenance m ON c.CarID = m.CarID
WHERE m.MaintenanceID IS NULL;



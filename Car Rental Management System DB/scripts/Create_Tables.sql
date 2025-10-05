-- Creating Car Rental Management System Database
CREATE DATABASE CarRentalManagementSystem;

--- Create Schema
CREATE SCHEMA car_rental;

--- Create Tables in the Schema
-- Car Table
CREATE TABLE car_rental.Car (
    CarID INT IDENTITY(1,1) PRIMARY KEY,
    CarModel VARCHAR(100),
    Manufacturer VARCHAR(100),
    Year INT,
    Color VARCHAR(50),
    RentalRate DECIMAL(10,2),
    Availability BIT DEFAULT 1
);

-- Customer Table
CREATE TABLE car_rental.Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(150) UNIQUE,
    PhoneNumber VARCHAR(20),
    Address NVARCHAR(255)
);


-- Booking Table
CREATE TABLE car_rental.Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT FOREIGN KEY REFERENCES car_rental.Car(CarID) ON DELETE CASCADE,
    CustomerID INT FOREIGN KEY REFERENCES car_rental.Customer(CustomerID) ON DELETE CASCADE,
    RentalStartDate DATE,
    RentalEndDate DATE,
    TotalAmount DECIMAL(10,2)
);


-- Payment Table
CREATE TABLE car_rental.Payment (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    BookingID INT FOREIGN KEY REFERENCES car_rental.Booking(BookingID) ON DELETE CASCADE,
    PaymentDate DATE,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(50)
);


-- Insurance Table
CREATE TABLE car_rental.Insurance (
    InsuranceID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT FOREIGN KEY REFERENCES car_rental.Car(CarID) ON DELETE CASCADE,
    InsuranceProvider VARCHAR(100),
    PolicyNumber VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);


-- Location Table
CREATE TABLE car_rental.Location (
    LocationID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT FOREIGN KEY REFERENCES car_rental.Car(CarID) ON DELETE CASCADE,
    LocationName VARCHAR(100),
    Address NVARCHAR(255),
    ContactNumber VARCHAR(20)
);


-- Reservation Table
CREATE TABLE car_rental.Reservation (
    ReservationID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT FOREIGN KEY REFERENCES car_rental.Car(CarID) ON DELETE CASCADE,
    CustomerID INT FOREIGN KEY REFERENCES car_rental.Customer(CustomerID) ON DELETE CASCADE,
    ReservationDate DATE,
    PickupDate DATE,
    ReturnDate DATE
);

-- Maintenance Table
CREATE TABLE car_rental.Maintenance (
    MaintenanceID INT IDENTITY(1,1) PRIMARY KEY,
    CarID INT FOREIGN KEY REFERENCES car_rental.Car(CarID) ON DELETE CASCADE,
    MaintenanceDate DATE,
    Description NVARCHAR(255),
    Cost DECIMAL(10,2)
);
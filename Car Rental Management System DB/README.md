# Car Rental Management System DB

A relational database project that models a car rental company, built using **SQL Server / T-SQL**.  
This repository contains the schema, sample data, and example queries for exploring how cars, customers, bookings, payments, insurance, maintenance, and branches relate in a real-world system.

### Project Structure
- `erd/` holds your ER diagram image.  
- `scripts/` groups the SQL scripts (creatind DB, Schema and table,inserting data into tables, quering tables and joining tables).  
- The README gives context and guidance; scripts contain the actual SQL.


### Project Overview

The purpose of this project is to:

- Design a normalized database schema for a car rental business  
- Demonstrate relationships between entities (cars, customers, bookings, etc.)  
- Populate the database with sample data to simulate real operations  
- Write queries that show how data from multiple tables interrelates  
- Provide a reference ER diagram that visualizes the data model  


### Database Design & Schema

The database is organized under a schema (namespace) named `car_rental`, which groups all relevant tables together.  
This schema includes eight core tables, each modeling a critical aspect of a car rental business:

1. **Car** — information about each vehicle (model, make, year, color, rate, availability)  
2. **Customer** — personal and contact information for clients  
3. **Booking** — rental transactions linking customers and cars, with start/end dates and total cost  
4. **Payment** — payment details tied to bookings (amount, method, date)  
5. **Insurance** — insurance policies for vehicles (provider, policy number, validity dates)  
6. **Location** — branch or outlet information where cars are held  
7. **Reservation** — preliminary holds before finalizing a booking  
8. **Maintenance** — records of maintenance tasks, dates, costs, and descriptions  

These tables are interrelated through **primary keys** and **foreign key constraints**, ensuring referential integrity (e.g. a booking must reference a valid car and customer, a payment must refer to a booking, etc.).


### Entity-Relationship (ER) Diagram

Below is the visual representation of the entities and how they relate (primary / foreign keys, cardinalities):

![ER Diagram for Car Rental DB](erd/ERD_CarRental.png)


### Goals & Learning Outcomes
This project is designed to help in:

- Understanding relational database modeling with real-world entities  
- Learning how to enforce relationships using foreign keys  
- See how SQL join types work in practice.
- Developing skills in writing clean, structured SQL scripts  
- Presenting a full database project with documentation (schema, data, queries, ERD).

#### Final Note
This project serves as a demonstration of the concepts and skills I have learned during Week 3 of the QA/QE Training Program at Teach2Give. It reflects my growing understanding of database design, SQL querying, and data management practices.

A big thank you to my trainer, Brian Kemboi, for his invaluable guidance and mentorship throughout this learning journey.
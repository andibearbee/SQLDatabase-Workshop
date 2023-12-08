-- make it so that it can be run continuously
DROP DATABASE IF EXISTS CarDealership;

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS CarDealership;


-- use the created database
USE CarDealership;

/*create Table 1: dealerships
--------------------
Columns:
dealership_id int, auto-increment, primary key
name varchar(50)
address varchar(50)
phone varchar(12)
*/
CREATE TABLE dealerships (
dealership_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
address VARCHAR(50),
phone VARCHAR(12)
);


/* create Table 2: vehicles
------------------
Columns:
you decide
VIN should be the primary key
VIN should NOT be auto-increment
include a column called SOLD
*/
CREATE TABLE vehicles (
vin VARCHAR(17) PRIMARY KEY NOT NULL,
make VARCHAR(50),
model VARCHAR(50),
color VARCHAR(50),
year INT,
price FLOAT,
sold BOOLEAN,
dealership_id INT
);

/* ALTER TABLE vehicles
ADD COLUMN dealership_id INT;
*/



/* create Table 3: inventory (track which dealership has the vehicle)
------------------------------------------------------------
Columns:
dealership_id
VIN
*/
CREATE TABLE inventory (
vin VARCHAR(50),
dealership_id INT PRIMARY KEY,
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);


/* create Table 4: sales_contracts
-------------------------
Columns:
you decide
id should be auto-incremented
use a foreign key (VIN) to link to the vehicle
*/
CREATE TABLE sales_contracts (
sales_contract_id INT AUTO_INCREMENT PRIMARY KEY,
date DATE,
buyer_first_name VARCHAR(50),
buyer_last_name VARCHAR(50),
vin VARCHAR(50),
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

/* create Table 5: (OPTIONAL) lease_contracts
------------------------------------
Columns:
you decide
id should be auto-incremented
use a foreign key (VIN) to link to the vehicle
*/
CREATE TABLE lease_contracts (
lease_contract_id INT AUTO_INCREMENT PRIMARY KEY,
vin VARCHAR(50),
total_price FLOAT,
monthly_price FLOAT,
FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- insert data into each table 
INSERT INTO dealerships (name, address, phone) VALUES
('Splendors of Corusant', '1248 Kessel Way', '323-412-8775'),
('Now This is Podracing', '1249 Kessel Way', '323-816-6542'),
('Bucket of Bolts Traders', '1247 Kessel Way', '323-473-8421');

    

INSERT INTO vehicles (vin, make, model, color, year, price, sold, dealership_id) VALUES
('3hN7kD2pR9oV8jL1w', 'HONDA', 'CIVIC', 'black', 2006, 28000.99, TRUE, 2),
('5gF6sA9dH2lP4qO8e', 'Mini Cooper', 'C3', 'Forest Green', 2015, 58000.99, FALSE, 1),
('1bR3mX7nY5zT9uI2c', 'Thunderbird', 'Throwback', 'Eggshell Blue', 1998, 75000.99, FALSE, 1),
('6vK8jW2oH4qR7tN3l', 'Mercury', 'Beater', 'Yellow', 1972, 3540.99, TRUE, 3),
('9sU2iL3yG5fE8pA7r', 'Lexus', 'RX300', 'Black', 45000.99, 2001, TRUE, 2);


INSERT INTO inventory (vin, dealership_id) VALUES
('3hN7kD2pR9oV8jL1w', 2),
('5gF6sA9dH2lP4qO8e', 1),
('1bR3mX7nY5zT9uI2c', 1),
('6vK8jW2oH4qR7tN3l', 3),
('9sU2iL3yG5fE8pA7r', 2);


INSERT INTO sales_contracts (date, buyer_first_name, buyer_last_name, vin) VALUES
(2022-10-14, 'Noah', 'Burke', '3hN7kD2pR9oV8jL1w'),
(2022-07-30, 'Andi', 'Burke', '9sU2iL3yG5fE8pA7r'),
(2016-04-13, 'Bob', 'Johns',  '6vK8jW2oH4qR7tN3l');

-- INSERT INTO lease_contracts ( vin, total_price, monthly_price) VALUES




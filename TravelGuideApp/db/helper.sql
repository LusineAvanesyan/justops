-- Drop the database if it exists
DROP DATABASE IF EXISTS traveldb;

-- Create the database
CREATE DATABASE traveldb;

-- Connect to the database
\c traveldb;

-- Create the places table
CREATE TABLE places (
id SERIAL PRIMARY KEY,
country VARCHAR(255),
city VARCHAR(255),
mustsee VARCHAR(255));

-- Insert data into the places table
INSERT INTO places (id, country, city, mustsee)
VALUES
(1, 'Armenia', 'Yerevan', 'Cascade'),
(2, 'Italy', 'Rome', 'Vatican'),
(3, 'Spain', 'Barcelona', 'Sagrada Familia');


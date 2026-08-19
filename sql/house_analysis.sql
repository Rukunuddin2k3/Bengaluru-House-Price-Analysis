-- ==========================================================
-- Bengaluru House Price Analysis using SQL
-- Author: Your Name
-- Description: SQL queries to analyze Bengaluru house prices
-- ==========================================================


-- ----------------------------------------------------------
-- Create Database (Run only once)
-- ----------------------------------------------------------
-- CREATE DATABASE bengaluru_house_prices;


-- ----------------------------------------------------------
-- Select Database
-- ----------------------------------------------------------
USE bengaluru_house_prices;


-- ----------------------------------------------------------
-- Create Table (Run only once)
-- ----------------------------------------------------------
CREATE TABLE house_prices (
   area_type VARCHAR(100),
    availability VARCHAR(100),
    location VARCHAR(255),
    bhk FLOAT,
    society VARCHAR(255),
    total_sqft FLOAT,
    bath FLOAT,
    balcony FLOAT,
    price FLOAT
);


-- ----------------------------------------------------------
-- Add Price Per Square Foot Column (Run only once if needed)
-- ----------------------------------------------------------
ALTER TABLE house_prices
ADD COLUMN price_per_sqft FLOAT;


-- ==========================================================
-- BASIC DATA EXPLORATION
-- ==========================================================

-- Find the total number of houses in the dataset
SELECT COUNT(*) AS total_houses
FROM house_prices;


-- Display the first 10 records
SELECT *
FROM house_prices
LIMIT 10;


-- Calculate the average house price
SELECT ROUND(AVG(price),2) AS average_price
FROM house_prices;


-- ==========================================================
-- PRICE ANALYSIS
-- ==========================================================

-- Find the most expensive house
SELECT *
FROM house_prices
ORDER BY price DESC
LIMIT 1;


-- Find the cheapest house
SELECT *
FROM house_prices
ORDER BY price ASC
LIMIT 1;


-- Find the top 10 locations with the highest average house price
SELECT location,
       ROUND(AVG(price),2) AS average_price
FROM house_prices
GROUP BY location
ORDER BY average_price DESC
LIMIT 10;


-- Find the average house price for each area type
SELECT area_type,
       ROUND(AVG(price),2) AS average_price
FROM house_prices
GROUP BY area_type
ORDER BY average_price DESC;


-- Find the average house price for each BHK category
SELECT bhk,
       ROUND(AVG(price),2) AS average_price
FROM house_prices
GROUP BY bhk
ORDER BY bhk;


-- Find houses priced above ₹1 Crore (100 Lakhs)
SELECT *
FROM house_prices
WHERE price > 100;


-- ==========================================================
-- AREA TYPE ANALYSIS
-- ==========================================================

-- Count the number of houses available in each area type
SELECT area_type,
       COUNT(*) AS total_houses
FROM house_prices
GROUP BY area_type;


-- ==========================================================
-- BATHROOM ANALYSIS
-- ==========================================================

-- Display houses having more than 3 bathrooms
SELECT *
FROM house_prices
WHERE bath > 3;


-- ==========================================================
-- LOCATION ANALYSIS
-- ==========================================================

-- Find the top 10 locations having the highest number of houses
SELECT location,
       COUNT(*) AS total_houses
FROM house_prices
GROUP BY location
ORDER BY total_houses DESC
LIMIT 10;


-- Find locations where the average house price is above ₹1 Crore
SELECT location,
       ROUND(AVG(price),2) AS avg_price
FROM house_prices
GROUP BY location
HAVING avg_price > 100
ORDER BY avg_price DESC;


-- ==========================================================
-- PRICE PER SQUARE FOOT ANALYSIS
-- ==========================================================

-- Calculate the average price per square foot
SELECT ROUND(AVG(price_per_sqft),2) AS avg_price_per_sqft
FROM house_prices;


-- ==========================================================
-- AVAILABILITY ANALYSIS
-- ==========================================================

-- Find the average house price based on availability status
SELECT availability,
       ROUND(AVG(price),2) AS average_price
FROM house_prices
GROUP BY availability;


-- ==========================================================
-- PROPERTY SIZE ANALYSIS
-- ==========================================================

-- Find the top 5 largest houses based on total square feet
SELECT location,
       total_sqft,
       price
FROM house_prices
ORDER BY total_sqft DESC
LIMIT 5;
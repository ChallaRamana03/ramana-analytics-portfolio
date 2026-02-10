CREATE DATABASE customer_db;
USE customer_db;
CREATE TABLE customer_data (
    id INT,
    age INT,
    gender VARCHAR(10),
    income INT,
    education VARCHAR(50),
    region VARCHAR(20),
    loyalty_status VARCHAR(20),
    purchase_frequency VARCHAR(20),
    purchase_amount FLOAT,
    product_category VARCHAR(30),
    promotion_usage INT,
    satisfaction_score INT
);
INSERT INTO customer_data
(id, age, gender, income, education, region, loyalty_status, purchase_frequency, purchase_amount, product_category, promotion_usage, satisfaction_score)
VALUES
(1, 25, 'Male', 40000, 'Graduate', 'East', 'Gold', 'High', 1200.50, 'Electronics', 1, 4),
(2, 30, 'Female', 50000, 'Postgraduate', 'West', 'Silver', 'Medium', 850.00, 'Clothing', 0, 3),
(3, 22, 'Male', 30000, 'Undergraduate', 'North', 'Regular', 'Low', 300.75, 'Books', 1, 5);
SELECT * FROM customer_data;
SELECT product_category,
       SUM(purchase_amount) AS total_sales
FROM customer_data
GROUP BY product_category
ORDER BY total_sales DESC;
SELECT region,
       SUM(purchase_amount) AS total_sales
FROM customer_data
GROUP BY region
ORDER BY total_sales DESC;
SELECT loyalty_status,
       SUM(purchase_amount) AS total_sales
FROM customer_data
GROUP BY loyalty_status
ORDER BY total_sales DESC;
SELECT promotion_usage,
       SUM(purchase_amount) AS total_sales
FROM customer_data
GROUP BY promotion_usage
ORDER BY total_sales DESC;
SELECT satisfaction_score,
       SUM(purchase_amount) AS total_sales
FROM customer_data
GROUP BY satisfaction_score
ORDER BY satisfaction_score;
SELECT id,
       SUM(purchase_amount) AS total_sales
FROM customer_data
GROUP BY id
ORDER BY total_sales DESC
LIMIT 10;

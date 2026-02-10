CREATE DATABASE sales_dashboard;
use sales_dashboard;
CREATE TABLE sales_data(
order_id INT PRIMARY KEY,
order_date DATE,
region VARCHAR(50),
product VARCHAR(50),
category VARCHAR (50),
sales_amount DECIMAL(10,2),
quantity INT,
profit DECIMAL(10,2)
);
SELECT*FROM Sales_data;
INSERT INTO sales_data VALUES
(101, '2024-01-05', 'South', 'Laptop', 'Electronics', 50000, 2, 8000),
(102, '2024-01-10', 'North', 'Mobile', 'Electronics', 30000, 3, 6000),
(103, '2024-01-15', 'East', 'Chair', 'Furniture', 15000, 5, 3000),
(104, '2024-02-01', 'West', 'Table', 'Furniture', 20000, 2, 4000),
(105, '2024-02-10', 'South', 'Headphones', 'Accessories', 8000, 4, 1500),
(106, '2024-02-15', 'North', 'Laptop', 'Electronics', 52000, 1, 7000),
(107, '2024-03-01', 'East', 'Mobile', 'Electronics', 28000, 2, 5000),
(108, '2024-03-05', 'West', 'Chair', 'Furniture', 14000, 4, 2500);
SELECT*FROM Sales_Data;
SELECT SUM(SALES_AMOUNT) AS total_sales
FROM Sales_data;
SELECT sum(profit) AS total_profit
FROM Sales_data;
SELECT region,
SUM(sales_amount) AS total_sales
FROM Sales_data
GROUP BY region;
SELECT Category,
SUM(Sales_amount) AS total_sales
FROM Sales_data
GROUP BY Category;
SELECT 
    MONTH(order_date) AS month,
    SUM(sales_amount) AS monthly_sales
FROM sales_data
GROUP BY MONTH(order_date)
ORDER BY month;
SELECT product,
       SUM(sales_amount) AS total_sales
FROM sales_data
GROUP BY product
ORDER BY total_sales DESC;
SELECT region,
       SUM(profit) AS total_profit
FROM sales_data
GROUP BY region;
SELECT AVG(sales_amount) AS avg_order_value
FROM sales_data;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(50)
);
INSERT INTO customers VALUES
(1, 'Ravi', 'South'),
(2, 'Amit', 'North'),
(3, 'Suresh', 'East'),
(4, 'Neha', 'West');
SELECT * FROM customers;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 50000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Chair', 'Furniture', 15000),
(104, 'Table', 'Furniture', 20000),
(105, 'Headphones', 'Accessories', 8000);
SELECT * FROM products;
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    product_id INT,
    quantity INT,
    profit DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO sales VALUES
(1, '2024-01-05', 1, 101, 2, 8000),
(2, '2024-01-10', 2, 102, 3, 6000),
(3, '2024-01-15', 3, 103, 5, 3000),
(4, '2024-02-01', 4, 104, 2, 4000),
(5, '2024-02-10', 1, 105, 4, 1500),
(6, '2024-02-15', 2, 101, 1, 7000),
(7, '2024-03-01', 3, 102, 2, 5000),
(8, '2024-03-05', 4, 103, 4, 2500);
SELECT 
    s.sale_id,
    s.order_date,
    c.customer_name,
    c.region,
    p.product_name,
    p.category,
    p.price,
    s.quantity,
    (p.price * s.quantity) AS sales_amount,
    s.profit
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;
SELECT SUM(p.price * s.quantity) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id;
SELECT c.region, 
       SUM(p.price * s.quantity) AS total_sales
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region;
SELECT p.category,
       SUM(p.price * s.quantity) AS total_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category;
SELECT MONTH(s.order_date) AS month,
       SUM(p.price * s.quantity) AS monthly_sales
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY MONTH(s.order_date)
ORDER BY month;

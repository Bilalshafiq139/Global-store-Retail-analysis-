-- Global Store Retail Analysis
-- Database schema for normalized retail analysis.

CREATE DATABASE IF NOT EXISTS global_store;
USE global_store;

DROP VIEW IF EXISTS vw_global_store_analysis;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(255),
    segment VARCHAR(100)
);

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(1000),
    category VARCHAR(100),
    sub_category VARCHAR(100)
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(100),
    customer_id VARCHAR(50),
    city VARCHAR(150),
    state VARCHAR(150),
    country VARCHAR(150),
    postal_code DECIMAL(20, 2),
    market VARCHAR(100),
    region VARCHAR(100),
    order_priority VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE sales (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    sales DECIMAL(14, 4),
    quantity INT,
    discount DECIMAL(5, 4),
    profit DECIMAL(14, 4),
    shipping_cost DECIMAL(14, 4),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

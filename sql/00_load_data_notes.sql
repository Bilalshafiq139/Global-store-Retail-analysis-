-- MySQL data loading script.
-- Run after sql/01_database_schema.sql.
--
-- Recommended command:
-- mysql --local-infile=1 -u root -p < sql/00_load_data_notes.sql

USE global_store;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE sales;
TRUNCATE TABLE orders;
TRUNCATE TABLE products;
TRUNCATE TABLE customers;
SET FOREIGN_KEY_CHECKS = 1;

LOAD DATA LOCAL INFILE 'C:/Users/AL FATEH/Desktop/New folder/Global-store-Retail-analysis-/data/processed/customers.csv'
INTO TABLE customers
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, customer_name, segment);

LOAD DATA LOCAL INFILE 'C:/Users/AL FATEH/Desktop/New folder/Global-store-Retail-analysis-/data/processed/products.csv'
INTO TABLE products
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(product_id, product_name, category, sub_category);

LOAD DATA LOCAL INFILE 'C:/Users/AL FATEH/Desktop/New folder/Global-store-Retail-analysis-/data/processed/orders.csv'
INTO TABLE orders
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, @order_date, @ship_date, ship_mode, customer_id, city, state, country, @postal_code, market, region, order_priority)
SET
    order_date = STR_TO_DATE(@order_date, '%Y-%m-%d'),
    ship_date = STR_TO_DATE(@ship_date, '%Y-%m-%d'),
    postal_code = NULLIF(@postal_code, '');

LOAD DATA LOCAL INFILE 'C:/Users/AL FATEH/Desktop/New folder/Global-store-Retail-analysis-/data/processed/sales.csv'
INTO TABLE sales
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(row_id, order_id, product_id, sales, quantity, discount, profit, shipping_cost);

SELECT 'customers' AS table_name, COUNT(*) AS row_count FROM customers
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'sales', COUNT(*) FROM sales;

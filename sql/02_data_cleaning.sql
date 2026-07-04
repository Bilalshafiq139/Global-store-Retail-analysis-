-- Data quality checks and cleaning validation queries.
-- Run these after loading data into staging or final tables.

-- Check missing customer fields.
SELECT
    SUM(CASE WHEN customer_id IS NULL OR customer_id = '' THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN customer_name IS NULL OR customer_name = '' THEN 1 ELSE 0 END) AS missing_customer_name,
    SUM(CASE WHEN segment IS NULL OR segment = '' THEN 1 ELSE 0 END) AS missing_segment
FROM customers;

-- Check duplicate row IDs.
SELECT row_id, COUNT(*) AS duplicate_count
FROM sales
GROUP BY row_id
HAVING COUNT(*) > 1;

-- Check duplicate order IDs in the orders table.
SELECT order_id, COUNT(*) AS duplicate_count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;

-- Validate date sequence.
SELECT order_id, order_date, ship_date
FROM orders
WHERE ship_date < order_date;

-- Check invalid numeric values.
SELECT *
FROM sales
WHERE sales < 0
   OR quantity <= 0
   OR shipping_cost < 0
   OR discount < 0
   OR discount > 1;

-- Check negative profit records for profitability investigation.
SELECT
    s.row_id,
    s.order_id,
    p.product_name,
    p.category,
    p.sub_category,
    s.sales,
    s.discount,
    s.profit
FROM sales s
JOIN products p ON s.product_id = p.product_id
WHERE s.profit < 0
ORDER BY s.profit ASC;

-- Create analysis-ready features.
CREATE OR REPLACE VIEW vw_global_store_analysis AS
SELECT
    s.row_id,
    o.order_id,
    o.order_date,
    o.ship_date,
    DATEDIFF(o.ship_date, o.order_date) AS shipping_days,
    YEAR(o.order_date) AS order_year,
    MONTH(o.order_date) AS order_month,
    QUARTER(o.order_date) AS order_quarter,
    o.ship_mode,
    o.city,
    o.state,
    o.country,
    o.region,
    o.market,
    o.order_priority,
    c.customer_id,
    c.customer_name,
    c.segment,
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    s.sales,
    s.quantity,
    s.discount,
    s.profit,
    s.shipping_cost,
    CASE WHEN s.sales = 0 THEN NULL ELSE s.profit / s.sales END AS profit_margin
FROM sales s
JOIN orders o ON s.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id;

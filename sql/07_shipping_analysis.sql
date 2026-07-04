-- Shipping and operations analysis.

-- Average shipping cost by ship mode.
SELECT
    ship_mode,
    ROUND(AVG(shipping_cost), 2) AS average_shipping_cost,
    ROUND(SUM(shipping_cost), 2) AS total_shipping_cost,
    COUNT(DISTINCT order_id) AS orders
FROM vw_global_store_analysis
GROUP BY ship_mode
ORDER BY average_shipping_cost DESC;

-- Shipping cost by region.
SELECT
    region,
    ROUND(SUM(shipping_cost), 2) AS total_shipping_cost,
    ROUND(AVG(shipping_cost), 2) AS average_shipping_cost,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_global_store_analysis
GROUP BY region
ORDER BY total_shipping_cost DESC;

-- Profit impact of shipping cost.
SELECT
    ship_mode,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(shipping_cost), 2) AS total_shipping_cost,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY ship_mode
ORDER BY profit_margin ASC;

-- Order priority distribution.
SELECT
    order_priority,
    COUNT(DISTINCT order_id) AS orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_global_store_analysis
GROUP BY order_priority
ORDER BY orders DESC;

-- Average delivery days by ship mode.
SELECT
    ship_mode,
    ROUND(AVG(shipping_days), 2) AS average_shipping_days
FROM vw_global_store_analysis
GROUP BY ship_mode
ORDER BY average_shipping_days ASC;

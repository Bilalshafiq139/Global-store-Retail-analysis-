-- Executive KPI queries.

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS total_customers,
    ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS average_order_value,
    ROUND(AVG(shipping_cost), 2) AS average_shipping_cost,
    ROUND(AVG(discount), 4) AS average_discount_rate
FROM vw_global_store_analysis;

-- Count loss-making products.
SELECT COUNT(*) AS loss_making_products
FROM (
    SELECT product_id
    FROM vw_global_store_analysis
    GROUP BY product_id
    HAVING SUM(profit) < 0
) product_profit;

-- Customer and segment analysis.

-- Sales and profit by customer segment.
SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin,
    COUNT(DISTINCT customer_id) AS customers
FROM vw_global_store_analysis
GROUP BY segment
ORDER BY total_sales DESC;

-- Top customers by sales.
SELECT
    customer_id,
    customer_name,
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_global_store_analysis
GROUP BY customer_id, customer_name, segment
ORDER BY total_sales DESC
LIMIT 10;

-- Region and segment performance.
SELECT
    region,
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY region, segment
ORDER BY region, total_sales DESC;

-- Country and market contribution.
SELECT
    market,
    country,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM vw_global_store_analysis
GROUP BY market, country
ORDER BY total_sales DESC;

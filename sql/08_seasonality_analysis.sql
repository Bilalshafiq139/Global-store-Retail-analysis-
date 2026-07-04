-- Seasonality and trend analysis.

-- Monthly sales trend.
SELECT
    order_year,
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM vw_global_store_analysis
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Monthly profit trend.
SELECT
    order_year,
    order_month,
    ROUND(SUM(profit), 2) AS monthly_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS monthly_profit_margin
FROM vw_global_store_analysis
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

-- Best quarter by sales.
SELECT
    order_year,
    order_quarter,
    ROUND(SUM(sales), 2) AS quarterly_sales,
    ROUND(SUM(profit), 2) AS quarterly_profit
FROM vw_global_store_analysis
GROUP BY order_year, order_quarter
ORDER BY quarterly_sales DESC;

-- Best month by category.
SELECT
    category,
    order_month,
    ROUND(SUM(sales), 2) AS total_sales
FROM vw_global_store_analysis
GROUP BY category, order_month
ORDER BY category, total_sales DESC;

-- Sales performance analysis.

-- Top 10 products by sales.
SELECT product_name, ROUND(SUM(sales), 2) AS total_sales
FROM vw_global_store_analysis
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- Sales by category.
SELECT category, ROUND(SUM(sales), 2) AS total_sales
FROM vw_global_store_analysis
GROUP BY category
ORDER BY total_sales DESC;

-- Sales by sub-category.
SELECT sub_category, ROUND(SUM(sales), 2) AS total_sales
FROM vw_global_store_analysis
GROUP BY sub_category
ORDER BY total_sales DESC;

-- Sales by region.
SELECT region, ROUND(SUM(sales), 2) AS total_sales
FROM vw_global_store_analysis
GROUP BY region
ORDER BY total_sales DESC;

-- Sales by market.
SELECT market, ROUND(SUM(sales), 2) AS total_sales
FROM vw_global_store_analysis
GROUP BY market
ORDER BY total_sales DESC;

-- Monthly sales trend.
SELECT
    order_year,
    order_month,
    ROUND(SUM(sales), 2) AS monthly_sales
FROM vw_global_store_analysis
GROUP BY order_year, order_month
ORDER BY order_year, order_month;

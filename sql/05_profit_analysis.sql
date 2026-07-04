-- Profitability and loss analysis.

-- Profit by category.
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY category
ORDER BY total_profit DESC;

-- Profit by sub-category.
SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY sub_category
ORDER BY total_profit ASC;

-- Products with negative total profit.
SELECT
    product_name,
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY product_name, category, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

-- Profit margin by product.
SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY product_name
HAVING SUM(sales) > 0
ORDER BY profit_margin ASC;

-- Discount impact on profit.
SELECT
    CASE
        WHEN discount = 0 THEN 'No discount'
        WHEN discount <= 0.10 THEN '0-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        ELSE 'Above 30%'
    END AS discount_band,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / NULLIF(SUM(sales), 0), 4) AS profit_margin
FROM vw_global_store_analysis
GROUP BY discount_band
ORDER BY MIN(discount);

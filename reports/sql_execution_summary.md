# SQL Execution Summary

The SQL layer builds the MySQL database, loads processed CSV exports, validates row counts, checks data quality, calculates KPIs, and produces the query outputs used in the final business recommendations.

## Loaded Tables

| Table | Rows |
| --- | ---: |
| `customers` | 1,590 |
| `products` | 10,292 |
| `orders` | 25,035 |
| `sales` | 51,290 |

## Analysis Coverage

| Area | SQL File | Output |
| --- | --- | --- |
| Data quality | `02_data_cleaning.sql` | Missing values, duplicate checks, invalid values, negative profit records |
| KPIs | `03_kpi_queries.sql` | Sales, profit, margin, orders, customers, quantity, shipping cost |
| Sales | `04_sales_analysis.sql` | Product, category, sub-category, region, market, and monthly revenue |
| Profit | `05_profit_analysis.sql` | Category margin, loss-making products, product margin, discount bands |
| Customers | `06_customer_segment_analysis.sql` | Segment performance, top customers, region-segment results |
| Shipping | `07_shipping_analysis.sql` | Ship mode cost, regional shipping cost, priority mix, delivery days |
| Seasonality | `08_seasonality_analysis.sql` | Monthly sales, monthly profit, quarterly performance |

## Screenshot Location

MySQL Workbench outputs are stored here:

```text
assets/screenshots/sql/
```

These files provide visible query-result support for the dashboard and business report.

# Power BI DAX Measures

This file documents the main Power BI measures used for the Global Store Retail Performance & Profitability Analysis dashboard. The purpose is to make the dashboard logic transparent, reviewable, and easier to reproduce.

## Core KPI Measures

| Measure | DAX Formula | Business Purpose |
| --- | --- | --- |
| Total Sales | `Total Sales = SUM(sales[sales])` | Measures total revenue generated from transaction lines. |
| Total Profit | `Total Profit = SUM(sales[profit])` | Measures total profit contribution after costs represented in the dataset. |
| Total Quantity | `Total Quantity = SUM(sales[quantity])` | Measures total units sold. |
| Total Orders | `Total Orders = DISTINCTCOUNT(orders[order_id])` | Measures order volume. |
| Total Customers | `Total Customers = DISTINCTCOUNT(customers[customer_id])` | Measures customer base size. |
| Total Products | `Total Products = DISTINCTCOUNT(products[product_id])` | Measures product breadth. |

## Profitability Measures

| Measure | DAX Formula | Business Purpose |
| --- | --- | --- |
| Profit Margin | `Profit Margin = DIVIDE([Total Profit], [Total Sales])` | Measures how much profit is generated per unit of sales. |
| Average Profit per Order | `Average Profit per Order = DIVIDE([Total Profit], [Total Orders])` | Shows average profit contribution at order level. |
| Average Order Value | `Average Order Value = DIVIDE([Total Sales], [Total Orders])` | Measures average revenue generated per order. |
| Average Discount Rate | `Average Discount Rate = AVERAGE(sales[discount])` | Tracks discount exposure. |
| Average Shipping Cost | `Average Shipping Cost = AVERAGE(sales[shipping_cost])` | Monitors operational cost pressure. |

## Loss and Risk Measures

| Measure | DAX Formula | Business Purpose |
| --- | --- | --- |
| Loss-Making Sales | `Loss-Making Sales = CALCULATE([Total Sales], FILTER(sales, sales[profit] < 0))` | Measures revenue generated from loss-making transaction lines. |
| Loss-Making Profit | `Loss-Making Profit = CALCULATE([Total Profit], FILTER(sales, sales[profit] < 0))` | Quantifies total negative profit exposure. |
| Loss-Making Transactions | `Loss-Making Transactions = CALCULATE(COUNTROWS(sales), FILTER(sales, sales[profit] < 0))` | Counts transaction lines where profit is negative. |
| Loss Transaction Rate | `Loss Transaction Rate = DIVIDE([Loss-Making Transactions], COUNTROWS(sales))` | Shows the share of transaction rows creating losses. |

## Time Intelligence Measures

| Measure | DAX Formula | Business Purpose |
| --- | --- | --- |
| Sales Previous Year | `Sales Previous Year = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))` | Compares current performance against the previous year. |
| Profit Previous Year | `Profit Previous Year = CALCULATE([Total Profit], SAMEPERIODLASTYEAR('Date'[Date]))` | Compares profit against the previous year. |
| Sales YoY Change | `Sales YoY Change = [Total Sales] - [Sales Previous Year]` | Measures sales growth or decline. |
| Profit YoY Change | `Profit YoY Change = [Total Profit] - [Profit Previous Year]` | Measures profit growth or decline. |
| Sales YoY % | `Sales YoY % = DIVIDE([Sales YoY Change], [Sales Previous Year])` | Expresses sales growth rate as a percentage. |
| Profit YoY % | `Profit YoY % = DIVIDE([Profit YoY Change], [Profit Previous Year])` | Expresses profit growth rate as a percentage. |

## Recommended Date Table

A dedicated date table should be used for time intelligence measures.

```DAX
Date = CALENDAR(MIN(orders[order_date]), MAX(orders[order_date]))
```

Recommended calculated columns:

```DAX
Year = YEAR('Date'[Date])
Month Number = MONTH('Date'[Date])
Month Name = FORMAT('Date'[Date], "MMM")
Quarter = "Q" & FORMAT('Date'[Date], "Q")
Year Month = FORMAT('Date'[Date], "YYYY-MM")
```

## Dashboard Design Notes

- Executive Overview should show Sales, Profit, Profit Margin, Orders, Customers, Quantity, and trend visuals.
- Sales Analysis should compare category, sub-category, region, market, and product performance.
- Profitability Analysis should focus on margin leakage, loss-making products, and discount impact.
- Customer Analysis should compare customer segments and identify high-value customers.
- Shipping & Operations should monitor shipping cost, shipping days, order priority, and operational risk.

## Interpretation Guidance

Sales should never be reviewed alone. A category, region, or product is only attractive when revenue is supported by healthy profit margin. Deep discounts, high shipping cost, and loss-making sub-categories should be treated as business risks even when sales volume appears strong.

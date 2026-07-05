# Power BI Dashboard Build Guide

This guide explains how to build the Global Store Retail Performance & Profitability dashboard in Power BI Desktop using the prepared CSV tables, DAX measures, dashboard pages, and recommended visuals.

## Important Note

Power BI Desktop does not normally allow users to paste one JSON file that automatically creates a complete report with all charts, slicers, pages, and relationships.

A JSON theme can control colors, fonts, and default visual formatting, but it does not create report pages or visuals by itself. The fastest practical workflow is:

1. Load the prepared CSV tables.
2. Create relationships.
3. Paste the DAX measures.
4. Import the theme JSON.
5. Build visuals page by page using the field mapping below.
6. Export screenshots and PDF for GitHub.

## Data Tables

Load these files into Power BI Desktop:

| Table | File |
| --- | --- |
| customers | `data/processed/customers.csv` |
| products | `data/processed/products.csv` |
| orders | `data/processed/orders.csv` |
| sales | `data/processed/sales.csv` |

## Relationships

Create these relationships in Model view:

| From Table | Column | To Table | Column | Cardinality |
| --- | --- | --- | --- | --- |
| customers | customer_id | orders | customer_id | One-to-many |
| orders | order_id | sales | order_id | One-to-many |
| products | product_id | sales | product_id | One-to-many |

Set cross-filter direction to Single unless there is a specific reporting need for Both.

## Date Table

Create a Date table using this DAX:

```DAX
Date = CALENDAR(MIN(orders[order_date]), MAX(orders[order_date]))
```

Add these calculated columns:

```DAX
Year = YEAR('Date'[Date])
Month Number = MONTH('Date'[Date])
Month Name = FORMAT('Date'[Date], "MMM")
Quarter = "Q" & FORMAT('Date'[Date], "Q")
Year Month = FORMAT('Date'[Date], "YYYY-MM")
```

Create this relationship:

| From Table | Column | To Table | Column |
| --- | --- | --- | --- |
| Date | Date | orders | order_date |

## Core DAX Measures

Create a dedicated measure table named `Measures`, then add the following measures.

```DAX
Total Sales = SUM(sales[sales])
```

```DAX
Total Profit = SUM(sales[profit])
```

```DAX
Total Quantity = SUM(sales[quantity])
```

```DAX
Total Orders = DISTINCTCOUNT(orders[order_id])
```

```DAX
Total Customers = DISTINCTCOUNT(customers[customer_id])
```

```DAX
Total Products = DISTINCTCOUNT(products[product_id])
```

```DAX
Profit Margin = DIVIDE([Total Profit], [Total Sales])
```

```DAX
Average Order Value = DIVIDE([Total Sales], [Total Orders])
```

```DAX
Average Profit per Order = DIVIDE([Total Profit], [Total Orders])
```

```DAX
Average Shipping Cost = AVERAGE(sales[shipping_cost])
```

```DAX
Average Discount Rate = AVERAGE(sales[discount])
```

```DAX
Loss-Making Transactions = CALCULATE(COUNTROWS(sales), FILTER(sales, sales[profit] < 0))
```

```DAX
Loss Transaction Rate = DIVIDE([Loss-Making Transactions], COUNTROWS(sales))
```

```DAX
Loss-Making Sales = CALCULATE([Total Sales], FILTER(sales, sales[profit] < 0))
```

```DAX
Loss-Making Profit = CALCULATE([Total Profit], FILTER(sales, sales[profit] < 0))
```

## Optional Time Intelligence Measures

These require the Date table relationship to be active.

```DAX
Sales Previous Year = CALCULATE([Total Sales], SAMEPERIODLASTYEAR('Date'[Date]))
```

```DAX
Profit Previous Year = CALCULATE([Total Profit], SAMEPERIODLASTYEAR('Date'[Date]))
```

```DAX
Sales YoY Change = [Total Sales] - [Sales Previous Year]
```

```DAX
Profit YoY Change = [Total Profit] - [Profit Previous Year]
```

```DAX
Sales YoY % = DIVIDE([Sales YoY Change], [Sales Previous Year])
```

```DAX
Profit YoY % = DIVIDE([Profit YoY Change], [Profit Previous Year])
```

## Dashboard Pages

Build five pages.

---

## Page 1: Executive Overview

Purpose: give management a quick view of performance.

### Visuals

| Visual | Fields |
| --- | --- |
| Card | Total Sales |
| Card | Total Profit |
| Card | Profit Margin |
| Card | Total Orders |
| Card | Total Customers |
| Card | Total Quantity |
| Line chart | Axis: Date[Year Month], Values: Total Sales and Total Profit |
| Bar chart | Axis: products[category], Values: Total Sales |
| Bar chart | Axis: orders[region], Values: Total Profit |
| Slicer | Date[Year] |
| Slicer | orders[market] |
| Slicer | products[category] |

### Key Message

Sales volume is strong, but profitability should be monitored together with sales to avoid rewarding unprofitable growth.

---

## Page 2: Sales Analysis

Purpose: identify where sales are coming from.

### Visuals

| Visual | Fields |
| --- | --- |
| Clustered bar chart | Axis: products[category], Values: Total Sales |
| Clustered bar chart | Axis: products[sub_category], Values: Total Sales |
| Map or filled map | Location: orders[country], Size: Total Sales |
| Bar chart | Axis: orders[region], Values: Total Sales |
| Table | products[product_name], Total Sales, Total Profit, Total Quantity |
| Line chart | Axis: Date[Year Month], Values: Total Sales |
| Slicer | orders[market] |
| Slicer | orders[region] |
| Slicer | products[category] |

### Key Message

Sales should be reviewed by product, geography, and time period to identify revenue concentration and growth patterns.

---

## Page 3: Profitability Analysis

Purpose: identify profit leakage and margin risk.

### Visuals

| Visual | Fields |
| --- | --- |
| Card | Total Profit |
| Card | Profit Margin |
| Card | Loss-Making Transactions |
| Card | Loss Transaction Rate |
| Bar chart | Axis: products[category], Values: Total Profit |
| Bar chart | Axis: products[sub_category], Values: Total Profit |
| Scatter chart | X: Total Sales, Y: Total Profit, Details: products[sub_category] |
| Table | products[product_name], Total Sales, Total Profit, Profit Margin |
| Bar chart | Axis: discount band, Values: Profit Margin |

### Discount Band Column

Create a calculated column in the sales table:

```DAX
Discount Band =
SWITCH(
    TRUE(),
    sales[discount] = 0, "No discount",
    sales[discount] <= 0.10, "0-10%",
    sales[discount] <= 0.20, "11-20%",
    sales[discount] <= 0.30, "21-30%",
    "Above 30%"
)
```

### Key Message

High revenue does not always mean strong performance. Tables and heavy discounting should be reviewed because they create margin leakage.

---

## Page 4: Customer Analysis

Purpose: understand segment and customer contribution.

### Visuals

| Visual | Fields |
| --- | --- |
| Donut chart | Legend: customers[segment], Values: Total Sales |
| Bar chart | Axis: customers[segment], Values: Total Profit |
| Matrix | Rows: orders[region], Columns: customers[segment], Values: Total Sales and Total Profit |
| Table | customers[customer_name], Total Sales, Total Profit, Total Orders |
| Bar chart | Axis: orders[market], Values: Total Sales |
| Slicer | customers[segment] |
| Slicer | orders[region] |

### Key Message

Consumer drives scale, while Home Office should be reviewed for margin-focused growth.

---

## Page 5: Shipping & Operations

Purpose: monitor operational cost and delivery patterns.

### Visuals

| Visual | Fields |
| --- | --- |
| Card | Average Shipping Cost |
| Bar chart | Axis: orders[ship_mode], Values: Average Shipping Cost |
| Bar chart | Axis: orders[order_priority], Values: Total Orders |
| Bar chart | Axis: orders[region], Values: Average Shipping Cost |
| Line chart | Axis: Date[Year Month], Values: Average Shipping Cost |
| Table | orders[ship_mode], Total Sales, Total Profit, Average Shipping Cost |
| Slicer | orders[ship_mode] |
| Slicer | orders[order_priority] |

### Key Message

Shipping cost and order priority should be monitored because operational cost can reduce profit quality.

## Export Checklist

After completing the dashboard:

1. Save the Power BI file as `dashboard/global_store_dashboard.pbix` if file size allows.
2. Export the report to PDF as `dashboard/power_bi_visuals.pdf`.
3. Export screenshots:
   - `assets/screenshots/dashboard_overview.png`
   - `assets/screenshots/sales_performance_page.png`
   - `assets/screenshots/profit_analysis_page.png`
   - `assets/screenshots/customer_segment_page.png`
   - `assets/screenshots/shipping_analysis_page.png`
4. Confirm screenshots render correctly in the GitHub README.

## Professional Design Rules

- Use 16:9 report canvas.
- Keep 4 to 6 KPI cards on the executive page.
- Use consistent slicers across pages.
- Use profit and margin visuals together with sales visuals.
- Avoid overcrowding pages.
- Use clear titles that explain the business purpose of each visual.
- Use the same theme across all pages.
- Use filters for Year, Market, Region, Category, and Segment.

# Project Delivery Approach

This document explains how the Global Store retail analytics solution was delivered from raw data to business-ready reporting.

## Delivery Objective

The objective was to build a practical business intelligence solution that helps a retail management team understand:

- where revenue is coming from
- which products and regions are profitable
- where margin leakage is happening
- how discounts affect profitability
- how customer segments contribute to sales and profit
- how shipping and order priority affect operational performance

The focus is commercial decision-making, not academic reporting.

## Core Business Question

Where is Global Store generating profitable growth, and where is revenue being created without enough profit?

## Business Questions Covered

| Area | Business Question |
| --- | --- |
| Executive KPIs | What are total sales, profit, orders, customers, quantity, and profit margin? |
| Product Performance | Which categories and sub-categories generate the strongest sales and profit? |
| Profit Leakage | Which products or sub-categories create revenue but reduce profit? |
| Discounting | How does discount level affect margin quality? |
| Regional Performance | Which regions or markets have high sales but weak profit? |
| Customer Segments | Which customer segments contribute most to revenue and profit? |
| Shipping Operations | Which shipping modes and priorities carry higher operational cost? |
| Seasonality | Which months and quarters show stronger sales and profit patterns? |

## Data Preparation Workflow

Python was used to prepare the raw retail dataset before loading it into the reporting workflow.

Main steps:

1. Load the raw Global Super Store dataset.
2. Standardize column names for clean analysis.
3. Convert order dates and shipping dates into date fields.
4. Convert sales, profit, quantity, discount, shipping cost, and postal code into numeric fields.
5. Create business-ready fields such as shipping days, year, month, quarter, and profit margin.
6. Export a cleaned transaction-level dataset.
7. Export SQL-ready tables for customers, orders, products, and sales.

## Data Model

The MySQL layer uses four core tables:

| Table | Role |
| --- | --- |
| customers | Customer identity and segment details. |
| products | Product hierarchy and product names. |
| orders | Order dates, shipping details, geography, market, region, and priority. |
| sales | Transaction-level sales, quantity, discount, profit, and shipping cost. |

This structure supports business reporting and keeps the analysis organized around customers, products, orders, and sales performance.

## Analysis Workflow

SQL was used to validate and analyze the data through separate business-focused scripts.

| Script Area | Business Purpose |
| --- | --- |
| Schema | Creates the database structure and relationships. |
| Loading Notes | Documents table loading and row-count validation. |
| Data Checks | Confirms data quality before reporting. |
| KPI Queries | Calculates executive metrics. |
| Sales Analysis | Identifies revenue drivers by product, category, region, market, and time. |
| Profit Analysis | Identifies margin leakage, loss-making products, and discount risk. |
| Customer Analysis | Reviews customer segment and top-customer performance. |
| Shipping Analysis | Reviews shipping cost, ship mode, priority, and delivery performance. |
| Seasonality Analysis | Reviews month and quarter performance patterns. |

## Dashboard Delivery

Power BI was used to turn the analysis into a management-facing dashboard.

| Dashboard Page | Business Use |
| --- | --- |
| Executive Overview | Track sales, profit, margin, orders, customers, and overall performance. |
| Sales Performance | Identify revenue drivers by product, category, region, and market. |
| Profitability Analysis | Detect loss-making areas, discount risk, and weak-margin products. |
| Customer Segment Analysis | Compare customer segment contribution and customer value. |
| Shipping & Operations | Monitor shipping cost, order priority, and operational performance. |

## Validation Approach

The solution includes practical validation checks:

- Python preparation checks.
- MySQL row-count validation.
- SQL quality checks before reporting.
- Consistency checks between SQL KPIs, Power BI visuals, README figures, and report findings.
- Dashboard screenshots and exported PDF for review.
- Editable PBIX file included for Power BI inspection.

## Interpretation Rules

The analysis does not treat revenue as the only success metric. Each major finding is reviewed through both sales and profit. A product, category, region, or segment is considered strong only when sales volume is supported by acceptable profitability.

## Limitations

- The dataset covers historical transactions from 2011 to 2014.
- Product cost breakdown, supplier contracts, inventory cost, marketing spend, and customer acquisition cost are not available.
- Profit is accepted as provided in the dataset and is not independently audited.
- Shipping cost impact is analyzed descriptively, not causally.
- The discount-profit relationship shows association, not guaranteed causation.
- Country and region performance may be affected by product mix, discounting, and operational conditions.

## Delivery Outcome

The final deliverables include cleaned data, SQL-ready tables, MySQL analysis scripts, Power BI dashboard pages, DAX documentation, dashboard screenshots, exported PDF, editable PBIX file, and business recommendations.

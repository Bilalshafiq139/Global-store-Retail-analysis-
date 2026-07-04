# Global Store Retail Performance & Profitability Analysis - Architecture

This document explains the end-to-end analytics architecture used in the project.

## Architecture Overview

```mermaid
flowchart LR
    A[Kaggle Source Dataset] --> B[Python Data Preparation]
    B --> C[Cleaned CSV Outputs]
    C --> D[MySQL Relational Database]
    D --> E[SQL Business Analysis]
    E --> F[Power BI Dashboard]
    F --> G[Business Recommendations]
```

## Layer-by-Layer Design

| Layer | Component | Purpose |
| --- | --- | --- |
| Source | Kaggle Global Super Store Dataset | Raw retail transaction data |
| Data preparation | Python scripts and notebooks | Clean data, convert fields, create derived columns, and export SQL-ready tables |
| Storage | CSV exports and MySQL tables | Store cleaned data in analysis-ready form |
| Modeling | Customers, Products, Orders, Sales | Separate business entities into SQL-ready tables |
| Analysis | MySQL SQL scripts | Generate KPIs, sales trends, profitability checks, discount analysis, customer analysis, shipping analysis, and seasonality outputs |
| Reporting | Power BI dashboard | Present business performance and margin leakage in a management-friendly format |
| Decision layer | Reports and recommendations | Convert findings into business actions |

## Data Model

The SQL model is built around four core tables:

| Table | Role |
| --- | --- |
| `customers` | Customer profile and segment information |
| `products` | Product hierarchy and product names |
| `orders` | Order dates, shipping, geography, market, region, and order priority |
| `sales` | Sales, quantity, discount, profit, and shipping cost |

## Reporting View

The SQL workflow creates a joined reporting view named:

```text
vw_global_store_analysis
```

This view brings together customer, product, order, and sales fields so analysis queries can focus on business questions rather than repetitive joins.

## Why This Architecture Works for Hiring

This architecture shows practical data analyst capability:

- converting raw business data into a clean structure,
- designing SQL-ready tables,
- using SQL to answer commercial questions,
- building a dashboard for decision makers,
- and communicating business actions clearly.

## Improvement Opportunities

Future improvements could include:

- adding an editable Power BI `.pbix` file,
- adding a formal database ERD image,
- automating SQL execution with a script,
- adding data validation tests,
- and publishing the dashboard summary through GitHub Pages.

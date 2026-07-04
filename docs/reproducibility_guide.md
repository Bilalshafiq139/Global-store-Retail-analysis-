# Global Store Retail Performance & Profitability Analysis - Reproducibility Guide

This guide explains how to rebuild the data assets, run the SQL analysis, and review the project outputs.

## Environment

Recommended tools:

| Tool | Purpose |
| --- | --- |
| Python 3.10+ | Data download, cleaning, and table exports |
| MySQL Workbench | Database creation, data loading, and SQL query execution |
| Power BI Desktop | Dashboard review and report development |
| Git | Repository version control |

## Repository Setup

Clone the repository:

```bash
git clone https://github.com/Bilalshafiq139/Global-store-Retail-analysis-.git
cd Global-store-Retail-analysis-
```

Install Python dependencies:

```bash
pip install -r requirements.txt
```

## Data Rebuild

Run the Python pipeline:

```bash
python scripts/download_dataset.py
python scripts/prepare_data.py
```

Expected generated files:

| Output | Purpose |
| --- | --- |
| `data/processed/global_superstore_cleaned.csv` | Cleaned transaction-level dataset |
| `data/processed/customers.csv` | Customer dimension table |
| `data/processed/products.csv` | Product dimension table |
| `data/processed/orders.csv` | Order dimension table |
| `data/processed/sales.csv` | Sales fact table |

Expected row counts after preparation:

| Table | Rows |
| --- | ---: |
| `customers` | 1,590 |
| `products` | 10,292 |
| `orders` | 25,035 |
| `sales` | 51,290 |

## SQL Execution Order

Run the SQL files in MySQL Workbench in this order:

| Step | SQL File | Purpose |
| ---: | --- | --- |
| 1 | `sql/01_database_schema.sql` | Create database, tables, keys, and relationships |
| 2 | `sql/00_load_data_notes.sql` | Load processed CSV files and validate row counts |
| 3 | `sql/02_data_cleaning.sql` | Run quality checks and create the joined analysis view |
| 4 | `sql/03_kpi_queries.sql` | Produce executive KPI outputs |
| 5 | `sql/04_sales_analysis.sql` | Analyze sales by product, category, region, market, and month |
| 6 | `sql/05_profit_analysis.sql` | Analyze margin leakage, loss-making products, and discount impact |
| 7 | `sql/06_customer_segment_analysis.sql` | Analyze customer segments, top customers, and market performance |
| 8 | `sql/07_shipping_analysis.sql` | Analyze shipping cost, priority, and delivery performance |
| 9 | `sql/08_seasonality_analysis.sql` | Analyze monthly and quarterly performance patterns |

## Dashboard Review

The exported Power BI report is stored at:

```text
dashboard/power_bi_visuals.pdf
```

Dashboard screenshots are stored in:

```text
assets/screenshots/
```

Main dashboard views:

| View | Screenshot |
| --- | --- |
| Executive Overview | `assets/screenshots/dashboard_overview.png` |
| Sales Performance | `assets/screenshots/sales_performance_page.png` |
| Profitability Analysis | `assets/screenshots/profit_analysis_page.png` |
| Customer Segment Analysis | `assets/screenshots/customer_segment_page.png` |
| Shipping & Operations | `assets/screenshots/shipping_analysis_page.png` |

## Reports

| Report | Location |
| --- | --- |
| Executive summary | `reports/executive_summary.md` |
| Full business report | `reports/project_report.md` |
| SQL execution summary | `reports/sql_execution_summary.md` |
| PDF report | `reports/Global_Store_Retail_Analysis_Report.pdf` |

## Validation Checklist

Before presenting the project, confirm:

- Python pipeline runs without errors.
- Processed CSV files are generated.
- MySQL row counts match the expected table counts.
- SQL queries return KPI and business analysis outputs.
- Dashboard screenshots render correctly in the README.
- Recommendations are linked to SQL evidence and dashboard pages.

## Important Notes

- The dataset covers historical transactions from 2011 to 2014.
- The editable Power BI `.pbix` file is not included in the repository.
- Scenario impact statements are estimates for business discussion and are not measured post-implementation outcomes.

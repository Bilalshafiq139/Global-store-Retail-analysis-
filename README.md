# Global Store Retail Performance Analysis

End-to-end retail analytics project using **SQL, Python, and Power BI** to analyze Global Store transactions, identify margin leakage, compare product and customer performance, and turn sales data into clear business actions.

## Business Context

Global Store operates across multiple markets, regions, product categories, and customer segments. Revenue growth alone does not show whether the business is healthy. Discounts, shipping cost, product mix, and regional operating patterns can reduce profit even when sales look strong.

This analysis focuses on the commercial questions that matter to management:

- Which products, categories, regions, and segments drive revenue?
- Where is profit being lost?
- Which discounts are hurting margin?
- Which markets deserve more attention?
- Which actions can improve profitable growth?

## Headline Metrics

| Metric | Value |
| --- | ---: |
| Total Sales | 12,642,501.91 |
| Total Profit | 1,467,457.29 |
| Profit Margin | 11.61% |
| Orders | 25,035 |
| Customers | 1,590 |
| Products | 10,292 |
| Transaction Rows | 51,290 |
| Date Range | 2011-01-01 to 2014-12-31 |

## Key Findings

- **Technology** is the strongest category by revenue and profit, with 4.74M in sales and 663.78K in profit.
- **Furniture** generates high revenue but has a weaker margin than Technology and Office Supplies.
- **Tables** is the main loss-making sub-category, with about 757K in sales but -64K in profit.
- Orders with **no discount** produce about 25.32% margin, while discounts above 30% produce about -51.27% margin.
- **Southeast Asia** generates about 884K in sales but only 17.9K in profit, making it a high-sales, low-margin region.
- **Consumer** is the largest revenue segment, while **Home Office** has the strongest segment margin.

## Business Actions

- Review pricing, discounting, and supplier cost for the Tables sub-category.
- Limit discounts above 30% unless there is a clear inventory or strategic reason.
- Investigate Southeast Asia margin performance before increasing sales investment there.
- Use Technology as a growth category because it combines scale and profitability.
- Track revenue and profit margin together in Power BI so growth decisions do not reward unprofitable sales.

## Tools Used

| Tool | Role |
| --- | --- |
| Python | Data download, cleaning, transformation, feature creation, and CSV exports |
| MySQL | Relational schema, data loading, quality checks, KPI queries, and business analysis |
| Power BI | Dashboard pages, KPI cards, trend visuals, product analysis, and executive reporting |
| Excel / CSV | Source data handling and processed exports |

## Data Source

Dataset: **Global Super Store Dataset**  
Kaggle: https://www.kaggle.com/datasets/apoorvaappz/global-super-store-dataset

| File | Description |
| --- | --- |
| `data/raw/global_superstore_raw.csv` | Raw Kaggle CSV |
| `data/processed/global_superstore_cleaned.csv` | Cleaned transaction-level file |
| `data/processed/customers.csv` | Customer table for MySQL |
| `data/processed/products.csv` | Product table for MySQL |
| `data/processed/orders.csv` | Order table for MySQL |
| `data/processed/sales.csv` | Sales fact table for MySQL |

## Repository Layout

```text
Global-store-Retail-analysis-/
+-- README.md
+-- requirements.txt
+-- data/
|   +-- README.md
|   +-- data_dictionary.md
|   +-- raw/
|   +-- processed/
+-- scripts/
|   +-- download_dataset.py
|   +-- prepare_data.py
+-- sql/
|   +-- README.md
|   +-- 00_load_data_notes.sql
|   +-- 01_database_schema.sql
|   +-- 02_data_cleaning.sql
|   +-- 03_kpi_queries.sql
|   +-- 04_sales_analysis.sql
|   +-- 05_profit_analysis.sql
|   +-- 06_customer_segment_analysis.sql
|   +-- 07_shipping_analysis.sql
|   +-- 08_seasonality_analysis.sql
+-- notebooks/
+-- dashboard/
+-- assets/
|   +-- screenshots/
|   |   +-- sql/
|   +-- schema/
+-- reports/
+-- presentation/
```

## SQL Workflow

SQL scripts are organized in the same order a business analyst would run the work:

| Step | Script | Output |
| ---: | --- | --- |
| 1 | `sql/01_database_schema.sql` | Database, tables, keys, and relationships |
| 2 | `sql/00_load_data_notes.sql` | CSV loading and row count validation |
| 3 | `sql/02_data_cleaning.sql` | Data checks and joined analysis view |
| 4 | `sql/03_kpi_queries.sql` | Executive KPIs |
| 5 | `sql/04_sales_analysis.sql` | Sales drivers by product, category, region, and month |
| 6 | `sql/05_profit_analysis.sql` | Margin leakage, loss-making products, and discount impact |
| 7 | `sql/06_customer_segment_analysis.sql` | Segment, customer, and market performance |
| 8 | `sql/07_shipping_analysis.sql` | Shipping cost, priority, and delivery performance |
| 9 | `sql/08_seasonality_analysis.sql` | Monthly and quarterly patterns |

SQL guide: `sql/README.md`

## Power BI Dashboard

The dashboard is exported as:

- `dashboard/power_bi_visuals.pdf`

Dashboard screenshots:

| View | Screenshot |
| --- | --- |
| Executive overview | `assets/screenshots/dashboard_overview.png` |
| Sales performance | `assets/screenshots/sales_performance_page.png` |
| Profit analysis | `assets/screenshots/profit_analysis_page.png` |
| Customer segment analysis | `assets/screenshots/customer_segment_page.png` |
| Shipping analysis | `assets/screenshots/shipping_analysis_page.png` |

## SQL Screenshot Evidence

MySQL Workbench screenshots are grouped by analysis area:

```text
assets/screenshots/sql/
```

| Folder | Contents |
| --- | --- |
| `02_data_cleaning/` | Data checks and validation outputs |
| `03_kpi_queries/` | Executive KPI outputs |
| `04_sales_analysis/` | Sales query outputs |
| `05_profit_analysis/` | Profit, loss, and discount outputs |
| `06_customer_segment_analysis/` | Segment and customer outputs |
| `07_shipping_analysis/` | Shipping and operations outputs |
| `08_seasonality_analysis/` | Monthly and quarterly outputs |

## Python Workflow

| File | Role |
| --- | --- |
| `scripts/download_dataset.py` | Downloads the Kaggle source file |
| `scripts/prepare_data.py` | Cleans data, creates derived fields, and exports SQL-ready tables |
| `notebooks/01_data_understanding.ipynb` | Dataset profiling |
| `notebooks/02_data_cleaning_and_preparation.ipynb` | Cleaning and feature creation |
| `notebooks/03_exploratory_data_analysis.ipynb` | KPI and business performance checks |
| `notebooks/04_customer_and_segment_analysis.ipynb` | Customer and segment performance |
| `notebooks/05_profitability_and_loss_analysis.ipynb` | Margin and loss analysis |
| `notebooks/06_business_recommendations.ipynb` | Business actions tied to results |

## Rebuild the Data

```powershell
pip install -r requirements.txt
python scripts/download_dataset.py
python scripts/prepare_data.py
```

## Run the SQL Files

Run these files in MySQL Workbench:

1. `sql/01_database_schema.sql`
2. `sql/00_load_data_notes.sql`
3. `sql/02_data_cleaning.sql`
4. `sql/03_kpi_queries.sql`
5. `sql/04_sales_analysis.sql`
6. `sql/05_profit_analysis.sql`
7. `sql/06_customer_segment_analysis.sql`
8. `sql/07_shipping_analysis.sql`
9. `sql/08_seasonality_analysis.sql`

Expected row counts after loading:

| Table | Rows |
| --- | ---: |
| `customers` | 1,590 |
| `products` | 10,292 |
| `orders` | 25,035 |
| `sales` | 51,290 |

## Reports

| Report | File |
| --- | --- |
| Full business report | `reports/project_report.md` |
| Executive summary | `reports/executive_summary.md` |
| SQL execution summary | `reports/sql_execution_summary.md` |
| Final formatted report | `reports/Global_Store_Retail_Analysis_Report.pdf` |
| Exported PDF report | `reports/global_store_analysis_report.pdf` |

## Owner

Bilal Shafiq

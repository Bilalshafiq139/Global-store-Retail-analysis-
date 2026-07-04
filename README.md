# Global Store Retail Performance & Profitability Analysis

Industry-style business analytics case study using **Python, MySQL, and Power BI** to analyze Global Store retail transactions, identify revenue drivers, detect profit leakage, measure discount risk, and recommend actions for profitable growth.

This project is positioned as a practical analyst handover: from raw transaction data to cleaned tables, SQL-based business analysis, executive KPIs, dashboard reporting, and decision-ready recommendations.

## Business Problem

Global Store has strong sales volume across multiple markets, regions, product categories, and customer segments. However, sales growth alone does not prove the business is healthy. Profit can be reduced by aggressive discounting, weak product margins, shipping cost, and underperforming regional mixes.

This project answers a commercial question a retail leadership team would care about:

> Where is the business generating profitable growth, and where is revenue being created without enough profit?

## Executive KPIs

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

## Key Business Insights

- **Technology** is the strongest category by both revenue and profit, generating about **4.74M in sales** and **663.78K in profit**.
- **Furniture** has high revenue but weaker profitability compared with Technology and Office Supplies.
- **Tables** is the clearest loss-making sub-category, generating about **757K in sales** but around **-64K in profit**.
- Orders with **no discount** produce about **25.32% margin**, while discounts above **30%** produce about **-51.27% margin**.
- **Southeast Asia** generates about **884K in sales** but only **17.9K in profit**, making it a high-sales, low-margin region.
- **Consumer** is the largest revenue segment, while **Home Office** has the strongest segment margin.

## Recommended Business Actions

| Priority | Action | Business Rationale |
| ---: | --- | --- |
| 1 | Review pricing, supplier cost, and discounting for Tables | Tables creates meaningful sales but negative profit |
| 2 | Add control rules for discounts above 30% | Deep discounts are strongly linked with margin destruction |
| 3 | Investigate Southeast Asia margin performance | The region has high sales but weak profit quality |
| 4 | Prioritize profitable Technology products | Technology combines scale with strong profit contribution |
| 5 | Track sales and margin together in Power BI | Prevents decisions based only on revenue volume |
| 6 | Build segment-specific campaigns | Consumer can drive scale; Home Office can support margin-focused growth |

## Tools Used

| Tool | Role |
| --- | --- |
| Python | Data download, cleaning, transformation, feature creation, and CSV exports |
| MySQL | Relational schema, data loading, quality checks, KPI queries, and business analysis |
| Power BI | Executive dashboard pages, KPI cards, trend visuals, and business reporting |
| CSV / Excel | Source data handling and structured exports |

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

## Analysis Workflow

1. Download the source dataset from Kaggle.
2. Use Python to clean columns, convert dates and numeric fields, and create derived fields.
3. Export cleaned transaction data and normalized CSV files for MySQL.
4. Create a MySQL relational database with customers, products, orders, and sales tables.
5. Run SQL queries for KPIs, sales performance, profit leakage, customer segments, shipping, and seasonality.
6. Build Power BI dashboard pages for management-level reporting.
7. Convert findings into business recommendations tied to evidence.

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
|   +-- README.md
+-- dashboard/
|   +-- README.md
|   +-- power_bi_visuals.pdf
+-- assets/
|   +-- screenshots/
|   |   +-- dashboard_overview.png
|   |   +-- sales_performance_page.png
|   |   +-- profit_analysis_page.png
|   |   +-- customer_segment_page.png
|   |   +-- shipping_analysis_page.png
|   |   +-- sql/
|   +-- schema/
+-- reports/
+-- presentation/
```

## Dashboard Preview

The dashboard is exported as:

```text
dashboard/power_bi_visuals.pdf
```

### Executive Overview

![Executive Overview](assets/screenshots/dashboard_overview.png)

### Sales Performance

![Sales Performance](assets/screenshots/sales_performance_page.png)

### Profitability Analysis

![Profitability Analysis](assets/screenshots/profit_analysis_page.png)

### Customer Segment Analysis

![Customer Segment Analysis](assets/screenshots/customer_segment_page.png)

### Shipping & Operations

![Shipping & Operations](assets/screenshots/shipping_analysis_page.png)

## SQL Analysis

SQL scripts are organized in the same order a business analyst would run the work.

| Step | Script | Output |
| ---: | --- | --- |
| 1 | `sql/01_database_schema.sql` | Database, tables, keys, and relationships |
| 2 | `sql/00_load_data_notes.sql` | CSV loading and row count validation |
| 3 | `sql/02_data_cleaning.sql` | Data checks and joined analysis view |
| 4 | `sql/03_kpi_queries.sql` | Executive KPIs and business health indicators |
| 5 | `sql/04_sales_analysis.sql` | Sales drivers by product, category, region, and month |
| 6 | `sql/05_profit_analysis.sql` | Margin leakage, loss-making products, and discount impact |
| 7 | `sql/06_customer_segment_analysis.sql` | Segment, customer, and market performance |
| 8 | `sql/07_shipping_analysis.sql` | Shipping cost, priority, and delivery performance |
| 9 | `sql/08_seasonality_analysis.sql` | Monthly and quarterly patterns |

SQL guide: `sql/README.md`

## Finding-to-Evidence Map

| Business Finding | Evidence File | Dashboard Page |
| --- | --- | --- |
| Technology is the strongest revenue and profit category | `sql/04_sales_analysis.sql`, `sql/05_profit_analysis.sql` | Sales Analysis, Profitability Analysis |
| Tables is the main loss-making sub-category | `sql/05_profit_analysis.sql` | Profitability Analysis |
| Discounts above 30% destroy margin | `sql/05_profit_analysis.sql` | Profitability Analysis |
| Southeast Asia has high sales but weak profit | `sql/06_customer_segment_analysis.sql` | Sales Analysis, Customer Analysis |
| Consumer drives scale while Home Office has stronger margin | `sql/06_customer_segment_analysis.sql` | Customer Analysis |
| Shipping and order priority require operational monitoring | `sql/07_shipping_analysis.sql` | Shipping & Operations |
| Monthly and quarterly patterns affect planning | `sql/08_seasonality_analysis.sql` | Executive Overview |

## Python Workflow

| File | Role |
| --- | --- |
| `scripts/download_dataset.py` | Downloads the Kaggle source file |
| `scripts/prepare_data.py` | Cleans data, creates derived fields, and exports SQL-ready tables |
| `notebooks/01_data_understanding.ipynb` | Dataset profiling and data understanding |
| `notebooks/02_data_cleaning_and_preparation.ipynb` | Cleaning and feature creation workflow |
| `notebooks/03_exploratory_data_analysis.ipynb` | KPI and business performance checks |
| `notebooks/04_customer_and_segment_analysis.ipynb` | Customer and segment performance |
| `notebooks/05_profitability_and_loss_analysis.ipynb` | Margin leakage and loss analysis |
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

## Limitations

- The dataset covers historical transactions from 2011 to 2014.
- The analysis is based on transaction-level retail data and does not include inventory cost, supplier contracts, marketing spend, or customer acquisition cost.
- Some recommendations require operational validation before implementation.
- The editable Power BI `.pbix` file is not currently included in this repository; the exported dashboard PDF is included instead.

## Portfolio Positioning

This project demonstrates practical data analyst skills:

- Cleaning and preparing messy business data with Python.
- Designing SQL-ready customer, product, order, and sales tables.
- Writing SQL queries for KPIs and business performance analysis.
- Building Power BI reporting views for decision makers.
- Translating data findings into commercial recommendations.

## Owner

Bilal Shafiq

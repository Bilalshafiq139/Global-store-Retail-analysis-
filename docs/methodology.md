# Methodology

## Research Design

This project follows an applied business analytics case study design. The objective is not only to describe sales performance, but to evaluate whether revenue growth is supported by healthy profitability across products, regions, customer segments, discounts, and shipping operations.

The analysis uses a descriptive and diagnostic analytics approach:

- Descriptive analytics explains what happened in sales, profit, customers, products, regions, and shipping.
- Diagnostic analytics investigates where profit leakage appears and which business factors may be associated with weak margins.

## Main Research Question

Where is Global Store generating profitable growth, and where is revenue being created without sufficient profit?

## Supporting Analytical Questions

| Area | Analytical Question |
| --- | --- |
| Executive KPIs | What are the overall sales, profit, quantity, orders, customers, and profit margin? |
| Product Performance | Which categories and sub-categories generate the strongest sales and profit? |
| Profit Leakage | Which products or sub-categories generate revenue but reduce profit? |
| Discounting | How does discount level relate to profit margin? |
| Regional Performance | Which regions or markets have high sales but weak profit quality? |
| Customer Segments | Which customer segments contribute most to revenue and profit? |
| Shipping Operations | Which shipping modes and priorities carry higher operational cost? |
| Seasonality | Which months and quarters show stronger sales and profit patterns? |

## Dataset Selection

The project uses the Global Super Store Dataset from Kaggle. The dataset contains historical retail transaction records with order details, customer information, product hierarchy, geographic fields, sales, quantity, discount, profit, shipping cost, and order priority.

The dataset is suitable for a data analytics portfolio project because it supports multiple business analysis dimensions:

- revenue analysis
- profitability analysis
- product analysis
- customer segment analysis
- geographic analysis
- discount and margin analysis
- shipping and operational analysis
- time-based performance analysis

## Data Preparation Method

The data preparation stage is handled in Python. The preparation script standardizes column names, converts date and numeric fields, creates analytical features, and exports SQL-ready tables.

Main preparation steps:

1. Load the raw CSV file.
2. Standardize column names for consistent analysis.
3. Convert order and shipping dates into date fields.
4. Convert sales, profit, quantity, discount, shipping cost, and postal code into numeric fields.
5. Create derived fields such as shipping days, year, month, quarter, and profit margin.
6. Export a cleaned transaction-level dataset.
7. Create normalized CSV tables for MySQL loading.
8. Generate a data quality report for validation.

## Database Design Method

The SQL layer uses a simplified star-style relational model with four core tables:

| Table | Role |
| --- | --- |
| customers | Stores customer identity and segment fields. |
| products | Stores product hierarchy and product names. |
| orders | Stores order-level dates, geography, shipping, market, region, and priority fields. |
| sales | Stores transaction-line facts: sales, quantity, discount, profit, and shipping cost. |

The database design separates descriptive dimensions from transaction facts, which makes the project closer to a real business intelligence workflow.

## SQL Analysis Strategy

SQL is used for structured business analysis and validation. The SQL workflow is divided into separate scripts so the logic is reviewable and repeatable.

| Script Area | Purpose |
| --- | --- |
| Schema | Creates database tables, keys, and relationships. |
| Data Loading Notes | Documents CSV loading and expected row counts. |
| Data Cleaning | Performs quality checks and creates the joined reporting view. |
| KPI Queries | Calculates executive-level metrics. |
| Sales Analysis | Identifies sales drivers by category, product, region, market, and month. |
| Profit Analysis | Identifies profit leakage, loss-making products, and discount impact. |
| Customer Segment Analysis | Reviews segment contribution and top customers. |
| Shipping Analysis | Reviews shipping mode, shipping cost, delivery time, and order priority. |
| Seasonality Analysis | Reviews monthly and quarterly sales and profit patterns. |

## Dashboard Design Strategy

Power BI is used to convert analysis outputs into management-facing reporting. The dashboard is designed around executive decision-making rather than decorative visualization.

Dashboard pages:

| Page | Purpose |
| --- | --- |
| Executive Overview | Provides high-level KPIs and trend monitoring. |
| Sales Analysis | Shows sales drivers across categories, products, regions, and markets. |
| Profitability Analysis | Highlights margin quality, loss-making products, and discount risk. |
| Customer Analysis | Compares customer segments and high-value customers. |
| Shipping & Operations | Reviews shipping cost, order priority, and delivery performance. |

## Validation Approach

The project includes multiple validation layers:

- Python row-count checks after data preparation.
- Data quality report generated during the Python pipeline.
- MySQL row-count validation after loading CSV tables.
- SQL quality checks before creating the main reporting view.
- Consistency checks between README KPIs, SQL outputs, and dashboard visuals.
- Screenshot evidence for SQL outputs and Power BI pages.

## Interpretation Method

The analysis avoids treating sales as the only success metric. Each major finding is interpreted using both revenue and profit. A product, category, or region is considered strong only if it contributes meaningful sales and acceptable margin quality.

The project also separates evidence from recommendation:

- Evidence comes from SQL outputs, Python analysis, and dashboard visuals.
- Recommendations are business actions based on observed patterns.
- Impact statements are scenario-based and should not be treated as measured post-implementation results.

## Limitations

- The dataset covers historical transactions from 2011 to 2014, so findings may not reflect current retail behavior.
- Product cost breakdown, supplier contracts, inventory cost, marketing spend, and customer acquisition cost are not available.
- Profit is accepted as provided in the dataset and is not independently audited.
- Shipping cost impact is analyzed descriptively, not causally.
- The discount-profit relationship shows association, not guaranteed causation.
- Country and region performance may be affected by different product mix, discounting, and operational conditions.
- The project uses an exported dashboard PDF and screenshots; the editable Power BI file is not currently included.

## Conclusion

The methodology is designed to demonstrate a complete analytics workflow: data preparation, relational modeling, SQL analysis, dashboard reporting, and evidence-based business recommendations. The central focus is profitable growth, not revenue growth alone.

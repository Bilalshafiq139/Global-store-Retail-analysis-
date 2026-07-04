# Power BI Dashboard

This folder stores the exported Power BI reporting package for the Global Store Retail Performance & Profitability Analysis project.

## Included Dashboard File

| File | Use |
| --- | --- |
| `power_bi_visuals.pdf` | Exported Power BI dashboard pages for portfolio review |

## Editable PBIX File

The editable `.pbix` file is not currently included in this repository. For portfolio review, the exported PDF and dashboard screenshots are used as the visible evidence of the Power BI work.

Recommended file name if the editable report is later added:

```text
global_store_retail_dashboard.pbix
```

## Dashboard Pages

| Page | Business Focus | Main Visuals |
| --- | --- | --- |
| Executive Overview | Overall business performance | KPI cards, sales trend, profit trend, margin summary |
| Sales Analysis | Revenue drivers | Sales by category, sub-category, region, market, and top products |
| Profitability Analysis | Margin leakage | Profit by category, loss-making products, discount impact, profit margin |
| Customer Analysis | Customer and segment performance | Sales by segment, profit by segment, top customers, region-segment matrix |
| Shipping & Operations | Operational cost monitoring | Ship mode cost, order priority, shipping cost by region, delivery days |

## Recommended Screenshots for README

Export these images from Power BI and place them in `assets/screenshots/`:

| Screenshot | Purpose |
| --- | --- |
| `dashboard_overview.png` | Shows executive KPIs and overall business health |
| `sales_performance_page.png` | Shows revenue drivers by category, product, and geography |
| `profit_analysis_page.png` | Shows margin leakage, discount risk, and loss-making areas |
| `customer_segment_page.png` | Shows segment and customer contribution |
| `shipping_analysis_page.png` | Shows shipping cost and operational performance |

## Dashboard Design Standard

The dashboard should be clear enough for a manager to understand without reading the SQL files. Every page should answer one business question and include only visuals that support a decision.

Recommended design rules:

1. Put KPI cards at the top of the executive page.
2. Use sales and profit together, not sales alone.
3. Highlight margin leakage clearly.
4. Keep page titles business-focused.
5. Avoid unnecessary decorative visuals.
6. Use filters for year, region, category, segment, and market.

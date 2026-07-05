# Power BI Dashboard

This folder stores the Power BI reporting documentation and exported dashboard assets for the Global Store Retail Performance & Profitability Analysis project. The dashboard is designed for business users who need to monitor sales, profit, margin leakage, discount risk, customer segments, and shipping performance.

## Dashboard Assets

| File | Purpose |
| --- | --- |
| `../Power_bi(dashboard).pbix` | Editable Power BI Desktop report file. |
| `power_bi_visuals.pdf` | Exported Power BI dashboard pages for quick portfolio review. |
| `dax_measures.md` | Documents the main DAX measures used in the report. |
| `powerbi_build_guide.md` | Explains how to rebuild the dashboard manually in Power BI Desktop. |
| `global_store_theme.json` | Optional Power BI theme for consistent professional formatting. |

## Dashboard Pages

| Page | Business Focus | Main Visuals |
| --- | --- | --- |
| Executive Overview | Overall business health | KPI cards, sales trend, profit trend, margin summary, category overview |
| Sales Analysis | Revenue drivers | Sales by category, sub-category, region, market, country, and top products |
| Profitability Analysis | Margin leakage | Profit by category, loss-making products, discount impact, profit margin, sales vs profit comparison |
| Customer Analysis | Segment and customer performance | Sales by segment, profit by segment, top customers, region-segment matrix |
| Shipping & Operations | Operational performance | Ship mode cost, order priority, shipping cost by region, delivery days |

## Dashboard Story

The dashboard tells this business story:

1. Global Store has strong sales and meaningful profit.
2. Sales should not be judged alone because some areas generate weak or negative margin.
3. Tables, deep discounts, and Southeast Asia are the main areas that need management review.
4. Technology is the strongest profitable growth category.
5. Consumer drives revenue scale, while Home Office has stronger margin quality.

## Screenshot Export Requirements

Export these screenshots from Power BI and place them in `assets/screenshots/` so they render properly in the main README.

| Screenshot | Source Page | Purpose |
| --- | --- | --- |
| `dashboard_overview.png` | Executive Overview | Shows executive KPIs and overall business health. |
| `sales_performance_page.png` | Sales Analysis | Shows revenue drivers by category, product, and geography. |
| `profit_analysis_page.png` | Profitability Analysis | Shows margin leakage, discount risk, and loss-making areas. |
| `customer_segment_page.png` | Customer Analysis | Shows segment and customer contribution. |
| `shipping_analysis_page.png` | Shipping & Operations | Shows shipping cost and operational performance. |

## Export Settings

| Setting | Recommendation |
| --- | --- |
| Canvas ratio | 16:9 |
| Screenshot format | PNG |
| Minimum width | 1600 px |
| File naming | Use exact filenames listed above |
| GitHub location | `assets/screenshots/` |

## Dashboard Design Standard

The dashboard should be clear enough for a manager to understand without reading the SQL files. Every page should answer one business question and include only visuals that support a decision.

Recommended design rules:

1. Put KPI cards at the top of the executive page.
2. Use sales and profit together, not sales alone.
3. Highlight margin leakage clearly.
4. Keep page titles business-focused.
5. Avoid unnecessary decorative visuals.
6. Use filters for year, region, category, segment, and market.
7. Use consistent colors and formatting across pages.
8. Export the PDF and screenshots after every major dashboard revision.

## Final Portfolio Checklist

Before pinning this project, confirm:

- The dashboard PDF opens correctly.
- The editable PBIX file opens correctly in Power BI Desktop.
- All screenshots render correctly in the main README.
- The dashboard uses the same KPI numbers as the SQL output and README.
- The DAX measures are documented in `dax_measures.md`.
- The dashboard supports the findings in `reports/business_impact.md`.

# Notebook Workflow

This folder is used for exploratory and business-facing analysis notebooks. The notebooks are designed to support the SQL and Power BI outputs, not replace them.

## Recommended Notebook Order

| Step | Notebook | Business Purpose |
| ---: | --- | --- |
| 1 | `01_data_understanding.ipynb` | Profile the dataset, inspect columns, review missing values, and understand the business grain of the data |
| 2 | `02_data_cleaning_and_preparation.ipynb` | Clean dates and numeric fields, create derived fields, and validate the prepared dataset |
| 3 | `03_exploratory_data_analysis.ipynb` | Review sales, profit, categories, regions, products, and monthly trends |
| 4 | `04_customer_and_segment_analysis.ipynb` | Analyze customer segments, top customers, region-segment performance, and customer contribution |
| 5 | `05_profitability_and_loss_analysis.ipynb` | Investigate loss-making products, weak margins, discount risk, and profit leakage |
| 6 | `06_business_recommendations.ipynb` | Convert analysis findings into practical business actions for management |

## Industry Use

The notebooks should answer practical business questions:

- Which products and categories are driving sales?
- Which areas are creating profit leakage?
- Which discounts are damaging margin?
- Which regions and customer segments should management prioritize?
- What actions can improve profitable growth?

## Notebook Standard

Each notebook should include:

1. Objective
2. Data used
3. Key checks or transformations
4. Visual or tabular output
5. Business interpretation
6. Link to the related SQL file or dashboard page

## Important Note

For hiring and portfolio review, the most important outputs are the README, SQL files, Power BI screenshots, and business recommendations. Notebooks should support the story with transparent analysis and validation.

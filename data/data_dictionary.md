# Data Dictionary

| Column | Type | Description |
| --- | --- | --- |
| `Row_ID` | Integer | Unique transaction row identifier |
| `Order_ID` | Text | Unique order identifier |
| `Order_Date` | Date | Date when the order was placed |
| `Ship_Date` | Date | Date when the order was shipped |
| `Ship_Mode` | Text | Shipping method used for the order |
| `Customer_ID` | Text | Unique customer identifier |
| `Customer_Name` | Text | Customer name |
| `Segment` | Text | Customer segment |
| `City` | Text | Customer/order city |
| `State` | Text | Customer/order state |
| `Country` | Text | Customer/order country |
| `Postal_Code` | Number | Postal code where available |
| `Market` | Text | Global market grouping |
| `Region` | Text | Regional grouping |
| `Product_ID` | Text | Unique product identifier |
| `Category` | Text | Product category |
| `Sub_Category` | Text | Product sub-category |
| `Product_Name` | Text | Product name |
| `Sales` | Decimal | Revenue for the transaction line |
| `Quantity` | Integer | Number of units sold |
| `Discount` | Decimal | Discount rate applied |
| `Profit` | Decimal | Profit for the transaction line |
| `Shipping_Cost` | Decimal | Shipping cost for the transaction line |
| `Order_Priority` | Text | Order priority level |
| `Shipping_Days` | Integer | Days between order date and ship date |
| `Year` | Integer | Order year |
| `Month` | Integer | Order month |
| `Quarter` | Integer | Order quarter |
| `Profit_Margin` | Decimal | Profit divided by sales |

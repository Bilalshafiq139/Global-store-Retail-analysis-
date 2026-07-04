from pathlib import Path

import pandas as pd


RAW_PATH = Path("data/raw/global_superstore_raw.csv")
PROCESSED_DIR = Path("data/processed")
CLEAN_PATH = PROCESSED_DIR / "global_superstore_cleaned.csv"


def standardize_columns(df: pd.DataFrame) -> pd.DataFrame:
    df = df.copy()
    df.columns = df.columns.str.strip().str.replace(" ", "_").str.replace("-", "_")
    return df


def prepare_dataset(df: pd.DataFrame) -> pd.DataFrame:
    df = standardize_columns(df)

    for col in ["Order_Date", "Ship_Date"]:
        df[col] = pd.to_datetime(df[col], format="%d-%m-%Y", errors="coerce")

    for col in ["Sales", "Quantity", "Discount", "Profit", "Shipping_Cost", "Postal_Code"]:
        df[col] = pd.to_numeric(df[col], errors="coerce")

    df["Shipping_Days"] = (df["Ship_Date"] - df["Order_Date"]).dt.days
    df["Year"] = df["Order_Date"].dt.year
    df["Month"] = df["Order_Date"].dt.month
    df["Quarter"] = df["Order_Date"].dt.quarter
    df["Profit_Margin"] = df["Profit"] / df["Sales"].replace(0, pd.NA)
    return df


def export_normalized_tables(df: pd.DataFrame) -> None:
    tables = {
        "customers.csv": df[["Customer_ID", "Customer_Name", "Segment"]]
        .drop_duplicates("Customer_ID")
        .rename(columns=str.lower),
        "products.csv": df[["Product_ID", "Product_Name", "Category", "Sub_Category"]]
        .drop_duplicates("Product_ID")
        .rename(columns=str.lower),
        "orders.csv": df[
            [
                "Order_ID",
                "Order_Date",
                "Ship_Date",
                "Ship_Mode",
                "Customer_ID",
                "City",
                "State",
                "Country",
                "Postal_Code",
                "Market",
                "Region",
                "Order_Priority",
            ]
        ]
        .drop_duplicates("Order_ID")
        .rename(columns=str.lower),
        "sales.csv": df[
            ["Row_ID", "Order_ID", "Product_ID", "Sales", "Quantity", "Discount", "Profit", "Shipping_Cost"]
        ].rename(columns=str.lower),
    }

    for file_name, table in tables.items():
        table.to_csv(PROCESSED_DIR / file_name, index=False)


def main() -> None:
    if not RAW_PATH.exists():
        raise FileNotFoundError(f"Missing raw dataset: {RAW_PATH}. Run scripts/download_dataset.py first.")

    PROCESSED_DIR.mkdir(parents=True, exist_ok=True)
    df = pd.read_csv(RAW_PATH, encoding="latin1")
    cleaned = prepare_dataset(df)
    cleaned.to_csv(CLEAN_PATH, index=False)
    export_normalized_tables(cleaned)

    print(f"Rows: {len(cleaned):,}")
    print(f"Orders: {cleaned['Order_ID'].nunique():,}")
    print(f"Customers: {cleaned['Customer_ID'].nunique():,}")
    print(f"Products: {cleaned['Product_ID'].nunique():,}")
    print(f"Cleaned data saved to {CLEAN_PATH}")


if __name__ == "__main__":
    main()

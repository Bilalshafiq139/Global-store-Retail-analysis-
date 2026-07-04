from pathlib import Path
import shutil

import kagglehub


DATASET_SLUG = "apoorvaappz/global-super-store-dataset"
SOURCE_FILE = "Global_Superstore2.csv"
RAW_OUTPUT = Path("data/raw/global_superstore_raw.csv")


def main() -> None:
    dataset_path = Path(kagglehub.dataset_download(DATASET_SLUG))
    source_path = dataset_path / SOURCE_FILE

    if not source_path.exists():
        available = ", ".join(path.name for path in dataset_path.iterdir())
        raise FileNotFoundError(f"Could not find {SOURCE_FILE}. Available files: {available}")

    RAW_OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(source_path, RAW_OUTPUT)
    print(f"Downloaded {DATASET_SLUG} to {RAW_OUTPUT}")


if __name__ == "__main__":
    main()

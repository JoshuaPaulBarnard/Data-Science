import os
import pandas as pd

# Define the input and output folders
csv_folder = 'C:/Professional/Presearch/Retention_Rates/Daily'
parquet_folder = 'C:/Professional/Presearch/Retention_Rates/Daily_Parquet'

# Create the Parquet output folder if it doesn't exist
os.makedirs(parquet_folder, exist_ok=True)

# Convert each CSV file to Parquet format if not already converted
csv_files = [f for f in os.listdir(csv_folder) if f.endswith('.csv')]

for file in csv_files:
    csv_path = os.path.join(csv_folder, file)
    parquet_path = os.path.join(parquet_folder, file.replace('.csv', '.parquet'))
    
    # Check if the Parquet file already exists
    if os.path.exists(parquet_path):
        print(f"{parquet_path} already exists. Skipping conversion.")
        continue
    
    # Read the CSV file
    try:
        df = pd.read_csv(csv_path)
        
        # Save as Parquet file
        df.to_parquet(parquet_path, index=False)
        print(f"Converted {file} to Parquet format.")
    except Exception as e:
        print(f"Error converting {file}: {e}")

print("Conversion process completed.")

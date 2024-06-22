"""
Author: Joshua Paul Barnard
Github: https://github.com/JoshuaPaulBarnard/Data-Science
Date:   June 22nd, 2024.

Description:
    This script performs the following tasks:
    1. Connects to a MySQL database using pymysql.
    2. Reads and executes a SQL query from a specified file.
    3. Fetches the results of the query in chunks and stores them in a pandas DataFrame.
    4. Splits the DataFrame into smaller CSV files if necessary.
    5. Saves the CSV files to a specified location.
    6. Prints timestamps before and after the SQL query execution, and after the data export.

Usage:
    - Ensure that pymysql and pandas libraries are installed.
    - Set the database connection parameters and the path to the SQL file.
    - Adjust the chunk size and rows per file as needed for your system's memory capacity.

Dependencies:
    - pandas
    - pymysql

Example:
    Modify the script to include your database connection details and the path to your SQL file.
    Run the script using a Python interpreter.

"""


import pandas as pd
from datetime import datetime
import pymysql
import pymysql.cursors
import os
from dotenv import load_dotenv

# Path to your SQL file
sql_file_path = 'C:/ .sql'

# Create the name for the output file by removing the characters before/after the name of the .sql file
sql_file_name = sql_file_path[:-4]
sql_file_name = sql_file_name[3:]

# Load environment variables from a .env file
env_path = 'C:/ .env'
load_dotenv(dotenv_path=env_path)

# Retrieve database connection parameters from environment variables
db_host = os.getenv('DB_HOST')
db_user = os.getenv('DB_USER')
db_password = os.getenv('DB_PASSWORD')
db_database = os.getenv('DB_DATABASE')

# Database connection parameters (consider using more secure handling)
connection = pymysql.connect(host = db_host,
                             user = db_user,
                             password = db_password,
                             database = 'db_database',
                             cursorclass = pymysql.cursors.SSCursor)

# Open the SQL file
with open(sql_file_path, 'r') as file:
    sql_query = file.read()

# Get the current datetime and print it
now = datetime.now()
print("Time Before running SQL Query:", now, "for", sql_file_name)

# Execute the SQL commands and fetch the data into a DataFrame
try:
    # Create a cursor
    with connection.cursor() as cursor:
        # Execute your query
        cursor.execute( sql_query )

        # Initialize an empty DataFrame
        full_df = pd.DataFrame()
        iterations_count = 0

        # Fetch chunks of data
        while True:
            rows = cursor.fetchmany( size = 10000 )  # Adjust size according to your memory capacity
            if not rows:
                break

            # Convert current chunk to DataFrame
            chunk_df = pd.DataFrame( rows, columns=[desc[0] for desc in cursor.description] )

            # Concatenate chunk to full DataFrame
            full_df = pd.concat( [full_df, chunk_df], ignore_index = True )

            # Count and Display Iterations
            iterations_count = iterations_count + 1
            now = datetime.now()
            print( "Iteration ", iterations_count, " at: ", now  )

finally:
    # Close the connection
    connection.close()

# Get the current datetime and print it
now = datetime.now()
print("Time After running SQL Query:", now)

# Define the number of rows per file
rows_per_file = 1000001
total_rows = len(full_df)

# Calculate the number of files needed
num_files = total_rows // rows_per_file + (1 if total_rows % rows_per_file > 0 else 0)

# Convert now to a string for output
now_date = now.strftime("%Y-%m-%d")

# Split the DataFrame and save each part as a CSV
for i in range(num_files):
    start_row = i * rows_per_file
    end_row = start_row + rows_per_file
    full_df[start_row:end_row].to_csv(f'C:/{sql_file_name}_{now_date}_{i + 1}.csv', index=False)

# Display the time when data extraction is complete
now = datetime.now()
print(f"Data exported for {sql_file_name} into {num_files} file(s) at {now}.")

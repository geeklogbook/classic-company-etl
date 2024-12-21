import pandas as pd
import os

def convert_csv_to_parquet(csv_file_path, parquet_file_path=None):
    df = pd.read_csv(csv_file_path)
    file_name = csv_file_path.split('/')[-1].split('.')[0]
    parquet_file_path_full = parquet_file_path + '/' + file_name +'.parquet'

    df.to_parquet(parquet_file_path_full, engine="pyarrow", index=False)  
             
    print(f"Successfully converted {csv_file_path} to {parquet_file_path}")
    return parquet_file_path


csv_path = "/home/ubuntu/data-engineer-playground/data/others/clean_data/Empleados.csv"  
convert_csv_to_parquet(csv_path, '/home/ubuntu/data-engineer-playground/data/others/parquets/')
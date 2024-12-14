import pandas as pd
import os

files = ['CanalDeVenta.xlsx', 'Empleados.xls', 'productos.xlsx', 'Proveedores.xlsx']

input_dir = os.path.join('.', 'data', 'sources', 'excels')
output_dir = os.path.join('.', 'data', 'outputs', 'converted', 'csv')

for file in files:
    input_path = os.path.join(input_dir, file)
    filename = os.path.splitext(file)[0]  
    output_csv_path = os.path.join(output_dir, filename + '.csv')
    
    os.makedirs(os.path.dirname(output_csv_path), exist_ok=True)
    
    file_extension = os.path.splitext(file)[1].lower()
    if file_extension == '.xlsx':
        df = pd.read_excel(input_path, engine='openpyxl')
    elif file_extension == '.xls':
        df = pd.read_excel(input_path, engine='xlrd')
    else:
        print(f"Unsupported file format: {file}")
        continue
    
    df.to_csv(output_csv_path, index=False)
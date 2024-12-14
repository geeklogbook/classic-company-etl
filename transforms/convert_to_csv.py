import pandas as pd
import os

files = ['CanalDeVenta.xlsx', 'Empleados.xls', 'productos.xlsx', 'Proveedores.xlsx']

# Convert the files to lab01
for file in files:
    input_path = '.\\data\\sources\\excels\\' + file
    filename = file.split('.')[0]
    output_csv_path = '.\\data\\outputs\\converted\\csv\\' + filename + '.csv'
    os.makedirs(os.path.dirname(output_csv_path), exist_ok=True)
    df = pd.read_excel(input_path)  
    df.to_csv(output_csv_path, index=False) 
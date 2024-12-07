import pandas as pd

files = ['CanalDeVenta.xlsx', 'Empleados.xls', 'PRODUCTOS.xlsx', 'Proveedores.xlsx']

# Convert the files to lab01
for file in files:
    input_path = '.\\data\\lab01\\begin\\' + file
    filename = file.split('.')[0]
    output_csv_path = '.\\data\\lab01\\begin\\converted\\' + filename + '.csv'
    df = pd.read_excel(input_path)  
    df.to_csv(output_csv_path, index=False) 
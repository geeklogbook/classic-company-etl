import csv
import re
from collections import Counter

file_path = r".\\data\\sources\\comentarios_20241207.csv"

#MAP
def map_func(comentario):
    palabras = re.findall(r'\b\w+\b', comentario.lower())
    return palabras

# REDUCE
def reduce_func(lista_palabras):
    return Counter(lista_palabras)

product_info = {}

# Abrir el archivo CSV
with open(file_path, mode='r', encoding='utf-8') as file:
    reader = csv.DictReader(file) 
    for row in reader:
        id_producto = row['ID_PRODUCTO'] 
        comentario = row['Comentario']  
        
        palabras = map_func(comentario)
        
        word_counts = reduce_func(palabras)
        
        if id_producto in product_info:
            product_info[id_producto]['cantidad_comentarios'] += 1
            product_info[id_producto]['palabras'] += word_counts
        else:
            product_info[id_producto] = {
                'cantidad_comentarios': 1,
                'palabras': word_counts
            }


for id_producto, info in product_info.items():
    print(f'ID_PRODUCTO: {id_producto}')
    print(f'    Cantidad de comentarios: {info["cantidad_comentarios"]}')
    print(f'    Lista de palabras y su cantidad:')
    for palabra, cantidad in info['palabras'].items():
        print(f'        {palabra}: {cantidad}')
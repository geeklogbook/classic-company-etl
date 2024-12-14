### TODOS:
1. Me gustaria que no falle el proceso si una fuente de datos esta ausente
1. Me gustaria paralelizar la carga de datos.
1. Agregar un control de la calidad de los datos (Data Quality)
1. Me gustaria persistir los logs de cada uno de las corridas (diarias)
1. Me gustaria una deteccion de archivos dinamica
1. Si existe un campo nuevo (columna) no tiene que romper el proceso.


### PUNTOS CRITICOS:
1. Si quiere ser ingestado un nuevo campo.
    1. Cambiar la definicion de la Tabla
    1. Cargar los datos (A partir de las nuevas ingestas)
    1. Hay peligro que las reingestas sean muy caras o tarden mas de lo necesario

### Preguntas:
1. ¿La tabla calendario es utilizada por clean data?
 
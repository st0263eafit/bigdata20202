# Universidad EAFIT
# Curso ST0263 Tópicos Especiales en Telemática, 2020-2
# Profesor: Edwin Montoya M. – emontoya@eafit.edu.co
# Profesor: Alvaro Ospina - aeospinas@eafit.edu.co

# LAB EVALUABLE de SPARK

1. Realizar al menos uno de los retos propuestos en [02-mapreduce/lab-mrjob.md](../02-mapreduce/lab-mrjob.md)

2. Basado en la experiencia de haber trabajado con los datos de: datasets/spark/sample_data.csv y el notebook: 'Data_processing_using_PySpark.ipynb', 
realizar un proceso de:

* carga de datos csv en spark desde un bucket S3.
* borrar y crear algunas columnas
* realizar filtrados de datos por alguna información que le parezca interesante
* realizar alguna agrupación y consulta de datos categorica, por ejemplo número de casos por región o por sexo/genero.
* finalmente grave los resultados en un bucket público en S3
* realice toda la documentación en el mismo notebook, y cuando ya lo tenga listo adjuntelo a su github para su entrega final.

Los datos los van a obtener de:

* https://www.datos.gov.co/Salud-y-Protecci-n-Social/Casos-positivos-de-COVID-19-en-Colombia/gt2j-8ykr/data

pero tambien hay una copia en datasets/spark/Casos_positivos_de_COVID-19_en_Colombia.csv.zip

en lab debe ser ejecutable en AWS EMR con los notebooks de EMR y datos en AWS S3. El desarrollo lo puede hacer local con Anaconda3 o python y la libreria pyspark instalada.


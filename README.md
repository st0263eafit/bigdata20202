# Universidad EAFIT
# Curso ST0263 Tópicos Especiales en Telemática, 2020-2
# Profesor: Edwin Montoya M. – emontoya@eafit.edu.co
# Profesor: Alvaro Ospina - aeospinas@eafit.edu.co

## CONEXIÓN AL CLUSTER

### Amazon EMR:

Creando tu propio cluster, videos guia de como crear y usar cluser Amazon EMR con la cuenta  AWS Educate.

### Hadoop/Spark en el DCA:

Con el usuario/password de la VPN:

* Ambari Web: http://192.168.10.116:8080

* Jupyter Notebooks: http://192.168.10.116:8889 (con username asi: <username> y password de la vpn)

* Zeppelin Notebooks: http://192.168.10.116:9995 (con username asi: <username@dis.eafit.edu.co> y password de la vpn)

## DATASETS

* [datasets](datasets)

# LABORATORIO EVALUATIVO:

## 1. Crear y gestionar Clusters Amazon EMR

Utilizando la cuenta de amazon educate, y los videos compartidos para la clase, aprender a crear:

* cluster Amazon EMR
* AWS CLI
* Archivos en S3
* Notebooks Jupyter
* Bases de datos Mysql con: Amazon RDS/MySql

## 2. Gestión de archivos en S3 y HDFS

Copiar todos los archivos del [datasets](datasets) tanto en S3 (permanente) y en HDFS del cluster del DCA. 

* ver: [HDFS](01-hdfs)

Se comprabará con los datos en S3 y en el HDFS del DCA

## 3. Aprende MapReduce con MRJOB.

* Realiza los ejemplos del contador de palabras en mrjob.

* Realiza al menos un problema solucionado en mrjob de [problemas-map-reduce](02-mapreduce/lab-mrjob.md)

## 4. Labs y ejercicios de PySpark

1. crear cluster EMR con Notebooks

2. Crear notebook en EMR para ejecutar el wordcound con datos de gutenberg

3. Entrar al cluster HDP del DCA, entrar en zeppelin, y ejecutar el wordcound con datos de gutenberg

4. Ejecutar el notebook del github Data_processing_using_PySpark.ipynb

ejecutarlo (tanto en EMR como en el DCA) y entenderlo 

5. Hacer análisis exploratorio con los datos del covid19 que hay en el github (actualice los datos con nuevos del ins.gov.co)

. cargar datos

. explorar metadatos

. borrar y adicionar columnas

. corrección de datos

. transformación de datos

. estadísticas descriptivas básicas: groupby, orderby,count, max, min, avg.

. opcionalmente: gráfique datos con librerias como matplotlib

## 5. Bases de datos Hive y motor de transferencia de datos Sqoop

Este laboratorio lo puede realizar en Amazon EMR o en el DCA

tiene 2 partes:

parte1: 
* crear base de datos, crear tablas 'hdi' y 'wordcount'
* realizar consultas  SQL
* transferir datos vía Sqoop de la base de datos:'cursodb' y tabla: 'employee'

parte2:
* realizar el caso de estudio retail_db
* implica crear base de datos Amazon RDS/Mysql, cargar los datos del dataset a la base de datos.
* seguir las instrucciones del [case_retail.sql](../03-hive-sqoop/case_retail.sql)
* Ver la presentación de clase donde esta la descripción del caso

ver: [HIVE-SQOOP](04-hive-sqoop)

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

* Jupyter Notebooks: http://192.168.10.116:8889

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

## 3. Bases de datos Hive y motor de transferencia de datos Sqoop

Este laboratorio lo debe realizar en Amazon EMR.

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

ver: [HIVE-SQOOP](03-hive-sqoop)

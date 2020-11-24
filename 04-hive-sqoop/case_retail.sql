# Universidad EAFIT
# Curso ST0263 Tópicos Especiales en Telemática, 2020-2
# Profesor: Edwin Montoya M. – emontoya@eafit.edu.co
# Profesor: Alvaro Ospina - aeospinas@eafit.edu.co
#
-- Scripts de HIVE
#

-- datos de conexión:

Mysql en Amazon
host: 34.236.231.151
Database: retail_db
Username: retail_dba
Password: retail_dba

Mysql en el DCA
host: 192.168.10.116
Database: retail_db
Username: retail_dba
Password: retail_dba

-- crear la base de datos retail_db

por beeline o por interfaz web (HUE:8888 o DSA:30800):

    DROP DATABASE IF EXISTS username_retail_db CASCADE;
    CREATE DATABASE IF NOT EXISTS username_retail_db;



# conectarse al nodo master:
## si es en AWS EMR, en la consola de administración aparece el archivo clave y el hostname
# si es en AWS EMR con el usuario 'hadoop', usuario por defecto
#
## si es en el DCA:
###     $ ssh username@192.168.10.116 -p 2222     (conectandose previamente a la VPN)
## si es en el DCA, utilice el usuario 'hive' password 'hive':
##                              $ su - hive
##                              password: hive


-- importar datos via sqoop por Terminal:

$ hdfs dfs -rm -R /tmp/username_retail_db/*

# una solo linea:
$ sqoop import-all-tables --connect jdbc:mysql://192.168.10.116:3306/retail_db --username=retail_dba --password retail_dba --hive-database username_retail_db --create-hive-table --hive-import  --hive-overwrite --warehouse-dir=/tmp/username_retail_db -m 1 --mysql-delimiters

$ sqoop import-all-tables --connect jdbc:mysql://192.168.10.116:3306/retail_db \
    --username=retail_dba \
    --password retail_dba \
    --hive-database username_retail_db \
    --create-hive-table \
    --hive-import \
    --hive-overwrite \
    --warehouse-dir=/tmp/username_retail_db \
    -m 1 --mysql-delimiters

-- importar datos via sqoop por HUE (NO COLOCA LA PALABRA 'sqoop') - via web no corre en el DCA.

import-all-tables --connect jdbc:mysql://192.168.10.116:3306/retail_db --username=retail_dba --password retail_dba --hive-database username_retail_db --create-hive-table --hive-import --hive-overwrite --warehouse-dir=/tmp/username_retail_db -m 1 --mysql-delimiters

-- CATEGORIAS MÁS POPULARES DE PRODUCTOS (via HUE o DSA)

USE username_retail_db;
SELECT c.category_name, count(order_item_quantity) as count
FROM order_items oi
inner join products p on oi.order_item_product_id = p.product_id
inner join categories c on c.category_id = p.product_category_id
group by c.category_name
order by count desc
limit 10;

-- top 10 de productos que generan ganancias

USE username_retail_db;
SELECT p.product_id, p.product_name, r.revenue
FROM products p inner join
(select oi.order_item_product_id, sum(cast(oi.order_item_subtotal as float)) as revenue
from order_items oi inner join orders o
on oi.order_item_order_id = o.order_id
where o.order_status <> 'CANCELED'
and o.order_status <> 'SUSPECTED_FRAUD'
group by order_item_product_id) r
on p.product_id = r.order_item_product_id
order by r.revenue desc
limit 10

-- SUBIR LOS LOGS AL HDFS:
$ hdfs dfs -put $HOME/datasets/retail_logs/access.log /user/username/datasets/retail_logs/

USE username_retail_db;
CREATE EXTERNAL TABLE tmp_access_logs (
        ip STRING,
        fecha STRING,
        method STRING,
        url STRING,
        http_version STRING,
        code1 STRING,
        code2 STRING,
        dash STRING,
        user_agent STRING)
    ROW FORMAT SERDE 'org.apache.hadoop.hive.contrib.serde2.RegexSerDe'
    WITH SERDEPROPERTIES (
        'input.regex' = '([^ ]*) - - \\[([^\\]]*)\\] "([^\ ]*) ([^\ ]*) ([^\ ]*)" (\\d*) (\\d*) "([^"]*)" "([^"]*)"',
        'output.format.string' = "%1$$s %2$$s %3$$s %4$$s %5$$s %6$$s %7$$s %8$$s %9$$s")
    LOCATION '/user/username/datasets/retail_logs/';

-- CREAR DIRECTORIO PARA TABLA EXTERNA CON ETL

$ hdfs dfs -mkdir /user/username/warehouse/access_logs_etl

USE username_retail_db;
CREATE EXTERNAL TABLE etl_access_logs (
        ip STRING,
        fecha STRING,
        method STRING,
        url STRING,
        http_version STRING,
        code1 STRING,
        code2 STRING,
        dash STRING,
        user_agent STRING)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
    LOCATION '/user/username/warehouse/access_logs_etl/';


ADD JAR /usr/lib/hive/lib/hive-contrib.jar;

INSERT OVERWRITE TABLE etl_access_logs SELECT * FROM tmp_access_logs;

--- MUESTRE LOS PRODUCTOS MÁS VISITADOS

SELECT count(*) as contador,url FROM etl_access_logs
WHERE url LIKE '%\/product\/%'
GROUP BY url ORDER BY contador DESC LIMIT 10;
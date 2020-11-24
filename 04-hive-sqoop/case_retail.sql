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

** por interfaz web (HUE:8888 o DSA:30800):

    DROP DATABASE IF EXISTS username_retail_db CASCADE;
    CREATE DATABASE IF NOT EXISTS username_retail_db;


# conectarse al nodo master:
## si es en AWS EMR, en la consola de administración aparece el archivo clave y el hostname
# si es en AWS EMR con el usuario 'hadoop', usuario por defecto

** importar datos via sqoop por Terminal:

-- la primera vez para crear las tablas e importar

$ sqoop import-all-tables --connect jdbc:mysql://34.236.231.151:3306/retail_db --username retail_dba --password retail_dba --hive-database username_retail_db --create-hive-table --hive-import

-- despues de la primera vez, para importar nuevos datos y sobre escribir:
$ sqoop import-all-tables --connect jdbc:mysql://34.236.231.151:3306/retail_db --username retail_dba --password retail_dba --hive-database username_retail_db --hive-import --hive-overwrite



#
## si es en el DCA:
###     $ ssh username@192.168.10.116 -p 2222     (conectandose previamente a la VPN)
## si es en el DCA, utilice el usuario 'hive' password 'hive':
##                              $ su - hive
##                              password: hive


** importar datos via sqoop por Terminal:

-- la primera vez para crear las tablas e importar

$ sqoop import-all-tables --connect jdbc:mysql://192.168.10.116:3306/retail_db --username retail_dba --password retail_dba --hive-database username_retail_db --create-hive-table --hive-import

-- despues de la primera vez, para importar nuevos datos y sobre escribir:
$ sqoop import-all-tables --connect jdbc:mysql://192.168.10.116:3306/retail_db --username retail_dba --password retail_dba --hive-database username_retail_db --hive-import --hive-overwrite

-- importar datos via sqoop por HUE (NO COLOCA LA PALABRA 'sqoop' y utilice los mismos comandos anteriores) - via web no corre en el DCA.

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
limit 10;
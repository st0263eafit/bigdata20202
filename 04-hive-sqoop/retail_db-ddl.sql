#  tablas Hive Externas en HDFS:
# reemplace '/username/' por su propio usuario en el caso de HDFS

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`categories`
( `category_id` INT, `category_department_id` INT, `category_name` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION '/user/username/retail_db/categories/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`customers`
( `customer_id` INT, `customer_fname` STRING, `customer_lname` STRING, `customer_email` STRING, `customer_password` STRING, `customer_street` STRING, `customer_city` STRING, `customer_state` STRING, `customer_zipcode` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE  LOCATION '/user/username/retail_db/customers/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`departments`
( `department_id` INT, `department_name` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION '/user/username/retail_db/departments/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`order_items`
( `order_item_id` INT, `order_item_order_id` INT, `order_item_product_id` INT, `order_item_quantity` TINYINT, `order_item_subtotal` DOUBLE, `order_item_product_price` DOUBLE) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION '/user/username/retail_db/order_items/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`orders`
( `order_id` INT, `order_date` STRING, `order_customer_id` INT, `order_status` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION '/user/username/retail_db/orders/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`products`
( `product_id` INT, `product_category_id` INT, `product_name` STRING, `product_description` STRING, `product_price` DOUBLE, `product_image` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION '/user/username/retail_db/products/';





#  tablas Hive Externas en s3:
# reemplace 'bucketname' por el nombre del bucket S3 donde se encuentran los datos 'retail_db/*'

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`categories`
( `category_id` INT, `category_department_id` INT, `category_name` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION 's3://bucketname/retail_db/categories/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`customers`
( `customer_id` INT, `customer_fname` STRING, `customer_lname` STRING, `customer_email` STRING, `customer_password` STRING, `customer_street` STRING, `customer_city` STRING, `customer_state` STRING, `customer_zipcode` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE  LOCATION 's3://bucketname/retail_db/customers/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`departments`
( `department_id` INT, `department_name` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION 's3://bucketname/retail_db/departments/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`order_items`
( `order_item_id` INT, `order_item_order_id` INT, `order_item_product_id` INT, `order_item_quantity` TINYINT, `order_item_subtotal` DOUBLE, `order_item_product_price` DOUBLE) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION 's3://bucketname/retail_db/order_items/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`orders`
( `order_id` INT, `order_date` STRING, `order_customer_id` INT, `order_status` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION 's3://bucketname/retail_db/orders/';

CREATE EXTERNAL TABLE
IF NOT EXISTS `username_retail_db`.`products`
( `product_id` INT, `product_category_id` INT, `product_name` STRING, `product_description` STRING, `product_price` DOUBLE, `product_image` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE LOCATION 's3://bucketname/retail_db/products/';




#  tablas Hive Manejadas:
# las tablas manejadas pueden ser creadas automáticamente por sqoop.

CREATE TABLE
IF NOT EXISTS `username_retail_db`.`categories`
( `category_id` INT, `category_department_id` INT, `category_name` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE;

CREATE TABLE
IF NOT EXISTS `username_retail_db`.`customers`
( `customer_id` INT, `customer_fname` STRING, `customer_lname` STRING, `customer_email` STRING, `customer_password` STRING, `customer_street` STRING, `customer_city` STRING, `customer_state` STRING, `customer_zipcode` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE;

CREATE TABLE
IF NOT EXISTS `username_retail_db`.`departments`
( `department_id` INT, `department_name` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE;

CREATE TABLE
IF NOT EXISTS `username_retail_db`.`order_items`
( `order_item_id` INT, `order_item_order_id` INT, `order_item_product_id` INT, `order_item_quantity` TINYINT, `order_item_subtotal` DOUBLE, `order_item_product_price` DOUBLE) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE;

CREATE TABLE
IF NOT EXISTS `username_retail_db`.`orders`
( `order_id` INT, `order_date` STRING, `order_customer_id` INT, `order_status` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE;

CREATE TABLE
IF NOT EXISTS `username_retail_db`.`products`
( `product_id` INT, `product_category_id` INT, `product_name` STRING, `product_description` STRING, `product_price` DOUBLE, `product_image` STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\054' LINES TERMINATED BY '\012' STORED AS TEXTFILE;
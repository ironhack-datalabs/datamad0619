USE lab_mysql;

CREATE TABLE customer (customer_ID INT(10), name VARCHAR(20), phone_number BIGINT(12), email VARCHAR(30), address VARCHAR(30), city VARCHAR(15), country VARCHAR(15), ZIP VARCHAR(10));

CREATE TABLE cars (VIN CHAR(17), manufacturer VARCHAR(10), model VARCHAR(20), year INT(4), color VARCHAR(10), customer_ID INT(10), staff_ID INT(10));

CREATE TABLE salespersons (staff_ID INT(10), name VARCHAR(20), store VARCHAR(20), year INT(4));

CREATE TABLE invoices (invoice_number INT(10), date DATE, car INT(10), customer INT(10), salesperson INT(10), customer_ID INT(10), staff_ID INT(10));

CREATE TABLE customer_salespersons (customer_ID INT(10), staff_ID INT(10));
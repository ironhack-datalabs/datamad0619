USE lab_mysql;

INSERT INTO customer (customer_ID, name, phone_number, email, address, city, country, ZIP) VALUES ('0000000001', 'Luis', '34661157275', 'lcobaleda1@gmail.com', 'Buenafuente', 'Madrid', 'España', '28023');

INSERT INTO cars (VIN, manufacturer, model, year, color, customer_ID, staff_ID) Values ('vk152030406070809', 'BMW' ,'X5', '2019', 'negro', '0000000001', '1000000000');
INSERT INTO cars (VIN, manufacturer, model, year, color, customer_ID, staff_ID) Values ('DAM41UDN3CHU2WVF6', 'BMW' ,'X6', '2018', 'blanco', '0000000002', '2000000000');

INSERT INTO salespersons VALUES ('1000000000', 'Pepe', 'Castellana', '2019');

INSERT INTO invoices VALUES ('1111100000', '2019-01-01', '0', '0', '0', '0000000001', '1000000000');

INSERT INTO customer_salespersons VALUES ('0000000001','1000000000');
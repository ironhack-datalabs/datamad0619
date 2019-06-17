SELECT * FROM lab_mysql.Cars;

INSERT INTO `lab_mysql`.`Cars` (`ID`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `lab_mysql`.`Cars` (`ID`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `lab_mysql`.`Cars` (`ID`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `lab_mysql`.`Cars` (`ID`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `lab_mysql`.`Cars` (`ID`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `lab_mysql`.`Cars` (`ID`, `VIN`, `manufacturer`, `model`, `year`, `color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');
SELECT * FROM lab_mysql.Cars;

SELECT * FROM lab_mysql.Customers;
INSERT INTO `lab_mysql`.`Customers` (`idCustomers`, `customer_name`, `phone number`, `address`, `city`, `state/province`, `country`, `zip/postal code`) VALUES ('10001', 'Pablo Picasso', '+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `lab_mysql`.`Customers` (`idCustomers`, `customer_name`, `phone number`, `address`, `city`, `state/province`, `country`, `zip/postal code`) VALUES ('20001', 'Abraham Lincoln',	'+1 305 907 7086', '120 SW 8th St', 'Miami','Florida', 'United States', '33130');
INSERT INTO `lab_mysql`.`Customers` (`idCustomers`, `customer_name`, `phone number`, `address`, `city`, `state/province`, `country`, `zip/postal code`) VALUES ('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

SELECT * FROM lab_mysql.Customers;

SELECT * FROM lab_mysql.Salespersons;

INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00007', 'Walter Melon' ,'Amsterdam');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');

SELECT * FROM lab_mysql.Salespersons;

SELECT * FROM lab_mysql.Invoice;


INSERT INTO `lab_mysql`.`Invoice` (`Invoice number`, `date`, `Salespersons_staff ID`, `Customers_idCustomers`, `Cars_ID`) VALUES ('852399038', '2018-08-22', '00003', '20001', '0');
INSERT INTO `lab_mysql`.`Invoice` (`Invoice number`, `date`, `Salespersons_staff ID`, `Customers_idCustomers`, `Cars_ID`) VALUES ('731166526', '2018-12-31', '00005', '10001', '3');
INSERT INTO `lab_mysql`.`Invoice` (`Invoice number`, `date`, `Salespersons_staff ID`, `Customers_idCustomers`, `Cars_ID`) VALUES ('271135104', '2019-01-22', '00007', '30001', '2');

SELECT * FROM lab_mysql.Invoice










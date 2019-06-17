UPDATE `lab_mysql`.`cars` SET `Color` = 'White' WHERE (`cars ID` = '2');
INSERT INTO `lab_mysql`.`cars` (`cars ID`, `VIN`, `manufacturer`, `model`, `year`, `Color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `lab_mysql`.`cars` (`cars ID`, `VIN`, `manufacturer`, `model`, `year`, `Color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `lab_mysql`.`cars` (`cars ID`, `VIN`, `manufacturer`, `model`, `year`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019');

UPDATE `lab_mysql`.`Customers` SET `zip of the customers` = '28045' WHERE (`customer ID` = '10001');
INSERT INTO `lab_mysql`.`Customers` (`customer ID`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`, `zip of the customers`) VALUES ('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `lab_mysql`.`Customers` (`customer ID`, `name`, `phone number`, `email`, `address`, `city`, `state/province`, `country`) VALUES ('30001', 'Napoléon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France');

INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00006', 'Bob Frapples', 'Mexico City');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`, `store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `lab_mysql`.`Salespersons` (`staff ID`, `name`) VALUES ('00008', 'Shonda Leer');

INSERT INTO `lab_mysql`.`Invoices` (`Invoices ID`, `date`, `Salespersons_staff ID`, `Customers_customer ID`) VALUES ('852399038', '22-08-2018', '00002', '20001');
INSERT INTO `lab_mysql`.`Invoices` (`Invoices ID`, `date`, `Salespersons_staff ID`, `Customers_customer ID`) VALUES ('731166526', '31-12-2018', '00001', '00006');
INSERT INTO `lab_mysql`.`Invoices` (`Invoices ID`, `date`, `Salespersons_staff ID`, `Customers_customer ID`) VALUES ('271135104', '22-01-2019', '00008', '30001');
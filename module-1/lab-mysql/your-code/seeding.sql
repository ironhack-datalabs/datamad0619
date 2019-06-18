INSERT INTO `mydb`.`Car` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('0', '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', '2019', 'Blue');
INSERT INTO `mydb`.`Car` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('1', 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', '2019', 'Red');
INSERT INTO `mydb`.`Car` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('2', 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', '2018', 'White');
INSERT INTO `mydb`.`Car` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('3', 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', '2018', 'Silver');
INSERT INTO `mydb`.`Car` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('4', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', '2019', 'Gray');
INSERT INTO `mydb`.`Car` (`ID`, `VIN`, `Manufacturer`, `Model`, `Year`, `Color`) VALUES ('5', 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', '2019', 'Gray');

INSERT INTO `mydb`.`Customer` (`Customer ID`, `Name`, `Phone`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('10001', 'Pablo Picasso', '+34636176382', '-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', '28045');
INSERT INTO `mydb`.`Customer` (`Customer ID`, `Name`, `Phone`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('20001', 'Abraham Lincoln', '+1305907086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `mydb`.`Customer` (`Customer ID`, `Name`, `Phone`, `Email`, `Address`, `City`, `State/Province`, `Country`, `Postal`) VALUES ('30001', 'Napoléon Bonaparte', '+33179754000', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');




INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00001', 'Petey Cruiser', 'Madrid');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00002', 'Anna Sthesia', 'Barcelona');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00003', 'Paul Molive', 'Berlin');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00004', 'Gail Forcewind', 'Paris');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00005', 'Paige Turner', 'Mimia');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00006', 'Bob Frapples', 'Bob Frapples');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00007', 'Walter Melon', 'Amsterdam');
INSERT INTO `mydb`.`Salesperson` (`StaffID`, `Name`, `Store`) VALUES ('00008', 'Shonda Leer', 'São Paulo');


INSERT INTO `mydb`.`Invoice` (`InvoiceNumber`, `Date`, `Car_ID`, `Customer_Customer ID`, `Salesperson_StaffID`) VALUES ('852399038', '2018-08-22', '0', '1', '3');
INSERT INTO `mydb`.`Invoice` (`InvoiceNumber`, `Date`, `Car_ID`, `Customer_Customer ID`, `Salesperson_StaffID`) VALUES ('731166526', '2018-12-31', '3', '0', '5');
INSERT INTO `mydb`.`Invoice` (`InvoiceNumber`, `Date`, `Car_ID`, `Customer_Customer ID`, `Salesperson_StaffID`) VALUES ('271135104', '2019-01-22', '2', '2', '7');




#Customers

INSERT INTO `mydb`.`Customers` (`ID`, `ID_customer`, `Name`, `Phone number`, `Address`, `City`, `State/Province`, `Country`, `Zip code`) VALUES ('1', '2001', 'Abraham Lincoln', '+1 305 907 7086', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130');
INSERT INTO `mydb`.`Customers` (`ID`, `ID_customer`, `Name`, `Phone number`, `Address`, `City`, `State/Province`, `Country`, `Zip code`) VALUES ('2', '3001', 'Napoléon Bonaparte', '+33 1 79 75 40 00	', '40 Rue du Colisée	', 'Paris', '', 'France', '75008');

#Invoices

INSERT INTO `mydb`.`Invoices` (`ID`, `Invoice number`, `Date`, `Customers_ID`, `Salespersons_ID`, `Cars_ID`) VALUES ('0', '852399038', '2018-08-22', '1', '3', '0');
INSERT INTO `mydb`.`Invoices` (`ID`, `Invoice number`, `Date`, `Customers_ID`, `Salespersons_ID`, `Cars_ID`) VALUES ('1', '731166526', '2018-12-31', '0', '5', '3');
INSERT INTO `mydb`.`Invoices` (`ID`, `Invoice number`, `Date`, `Customers_ID`, `Salespersons_ID`, `Cars_ID`) VALUES ('2', '271135104', '2019-01-22', '2', '7', '2');

#Salespersons

INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('0', '00001', 'Petey Cruiser	', 'Madrid');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('1', '00002', 'Anna Sthesia	', 'Barcelona');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('2', '00003', 'Paul Molive	', 'Berlin');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('3', '00004', 'Gail Forcewind	', 'Paris');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('4', '00005', 'Paige Turner	', 'Mimia');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('5', '00006', 'Bob Frapples	', 'Mexico City\nMexico City\n');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('6', '00007', 'Walter Melon	', 'Amsterdam');
INSERT INTO `mydb`.`Salespersons` (`ID`, `Staff ID`, `Name`, `Country`) VALUES ('7', '00008', 'Shonda Leer	', 'São Paulo ');

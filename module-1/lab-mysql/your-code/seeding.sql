USE lab_mysql;
INSERT INTO Salesperson VALUES ('0','00001','Petey Cruiser','Madrid'),('1','00002','Anna Sthesia','Barcelona'),('2','00003','Paul Molive','Berlin'),('3','00004','Gail Forcewind','Paris'),
('4','00005','Paige Turner','Mimia'),('5','00006','Bob Frapples','Mexico City'),('6','00007','Walter Melon','Amsterdam'),
('7','00008','Shonda Leer','São Paulo');

INSERT INTO Car VALUES ('0','3K096I98581DHSNUP','Volkswagen','Tiguan','2019','Blue');
INSERT INTO Car VALUES ('1','ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red');
INSERT INTO Car VALUES ('2','RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White');
INSERT INTO Car VALUES ('3','HKNDGS7CU31E9Z7JW','Toyota','RAV4','2019','Silver');
INSERT INTO Car VALUES ('4','DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray');
INSERT INTO Car VALUES ('5','JKNHGS9CN31A8Z7KZ','Lamborghini','Aventador','2019','Yellow');

INSERT INTO Invoice VALUES ('0','852399038','2018-08-22','0','1','3');

INSERT INTO Invoice VALUES ('1','731166526','2018-12-31','3','0','5');
INSERT INTO Invoice VALUES ('2','271135104','2019-01-22','2','2','7');

INSERT INTO Customer (ID, `Customer ID`, Cust_Name, `Phone Number`, Address, City, State, Country, `Zip Code`) VALUES ('0','10001','Pablo Picasso','+34 636 17 63 82','Paseo de la Chopera, 14','Madrid','Madrid','Spain','28045');
INSERT INTO Customer (ID, `Customer ID`, Cust_Name, `Phone Number`, Address, City, State, Country, `Zip Code`) VALUES ('1','20001','Abraham Lincoln','+1 305 907 7086','120 SW 8th St','Miami','Florida','United States','33130');
INSERT INTO Customer (ID, `Customer ID`, Cust_Name, `Phone Number`, Address, City, State, Country, `Zip Code`) VALUES ('2','30001','Napoleon Bonaparte','+33 1 79 75 40 00','40 Rue du Colisée','Paris','Île-de-France','France','75008');
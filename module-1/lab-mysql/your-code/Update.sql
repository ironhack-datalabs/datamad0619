SELECT * FROM lab_mysql.Customers;

UPDATE `lab_mysql`.`Customers` SET `email` = 'ppicasso@gmail.com' WHERE (`idCustomers` = '10001');
UPDATE `lab_mysql`.`Customers` SET `email` = 'lincoln@us.gov' WHERE (`idCustomers`= '20001');
UPDATE `lab_mysql`.`Customers` SET `email` = 'hello@napoleon.me' WHERE (`idCustomers`= '30001');

SELECT * FROM lab_mysql.Customers;

SELECT * FROM lab_mysql.Salespersons;

UPDATE `lab_mysql`.`Salespersons` SET `store` = 'Miami' WHERE (`staff ID` = '5');



'''
UPDATE `lab_mysql`.`Salespersons` SET `store` = 'Miami' WHERE (`name` = 'Paige Turner');
No entiendo por qué no funciona
'''


UPDATE `lab_mysql`.`Salespersons` SET `store` = 'Miami' WHERE (`staff ID` = '5');

UPDATE `lab_mysql`.`Customers` SET `email` = 'ppicasso@gmail.com' WHERE (`idCustomers` = '10001');
UPDATE `lab_mysql`.`Customers` SET `email` = 'lincoln@us.gov' WHERE (`idCustomers` = '20001');
UPDATE `lab_mysql`.`Customers` SET `email` = 'hello@napoleon.me' WHERE (`idCustomers` = '30001');
SELECT * FROM `lab_mysql`.`Customers`
'''
Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'UPDATE `lab_mysql`.`Customers` SET `email` = 'ppicasso@gmail.com' WHERE (`custom' at line 3
'''

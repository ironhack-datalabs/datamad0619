#Modificar una columna mal escrita

UPDATE Salespersons SET Country = 'Miami'
WHERE ID = 4;

#Crear tres emails en función del ID numero

UPDATE mydb.Customers SET Email= 'ppicasso@gmail.com' WHERE ('ID'='0');
UPDATE mydb.Customers SET Email= 'lincoln@us.gov' WHERE ('ID'='1');
UPDATE mydb.Customers SET Email = 'hello@napoleon.me' WHERE ('ID'='2');

#Eliminar una fila de una tabla

DELETE FROM Cars WHERE ID = 4;
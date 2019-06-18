#Creamos una tabla intermedia para juntar títulos de libros y nombre de las editoriales. El objetivo es facilitar la resolución de los ejercicios.

CREATE TABLE title_publisher
SELECT titles.title as Title, titles.title_id as ID, titles.pub_id, publishers.pub_name, publishers.pub_id as p
FROM titles 
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

#Dos inner joins para, apoyándonos en la tabla intermedia, hacer la query de las cinco columnas deseadas.

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIST_NAME, 
title_publisher.Title AS TITLE, title_publisher.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
INNER JOIN title_publisher 
ON title_publisher.ID = titleauthor.title_id;

#Función count y group by + order by sobre la consulta anterior para recibir los datos de la forma deseada

SELECT authors.au_id, authors.au_lname, authors.au_fname, title_publisher.pub_name,
COUNT(title_publisher.Title) AS Title_Count
FROM authors 
INNER JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
INNER JOIN title_publisher 
ON title_publisher.ID = titleauthor.title_id
GROUP BY authors.au_id, title_publisher.pub_name
ORDER BY authors.au_id DESC;

#Más de lo mismo, esta vez con un LIMIT para no saturar demasiado los servidores.

SELECT authors.au_id, authors.au_lname, authors.au_fname, 
SUM(sales.qty) AS Total
FROM authors
INNER JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3;

#Usamos la función IFNULL para devolver un valor 0 en el caso de que la expresión "SUM(sales.qty)" sea nula. Con LEFT JOIN recogemos TODOS los valores de la tabla que esta a la izquierda, es decir, arrastramos los valores de las tablas previas. (PD: Ahora entiendo cualndo Alberto me ha dicho hace un par de horas que "no todo en la vida es INNER JOIN")

SELECT authors.au_id, authors.au_lname, authors.au_fname, 
IFNULL(SUM(sales.qty), 0)
FROM authors
LEFT JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
LEFT JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;







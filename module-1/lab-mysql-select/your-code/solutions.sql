# Creamos una tabla intermedia para que nos ayude a juntar titulos de libros con editoriales y así facilitar la resolucion de los ejercicios
CREATE TABLE title_publisher
SELECT titles.title as Title, titles.title_id as ID, titles.pub_id, publishers.pub_name, publishers.pub_id as p
FROM titles 
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;


# Aqui, apoyandonos en la tabla intermedia creada, obtenemos el output solicitado para el Challenge 1
SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIST_NAME, 
title_publisher.Title AS TITLE, title_publisher.pub_name AS PUBLISHER
FROM authors
INNER JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
INNER JOIN title_publisher 
ON title_publisher.ID = titleauthor.title_id;

#Aqui, volviendo a apoyarnos en la tabla intermedia creada anteriormente, obtenemos el output para el Challenge 2
SELECT authors.au_id, authors.au_lname, authors.au_fname, title_publisher.pub_name,
COUNT(title_publisher.Title) AS Title_Count
FROM authors 
INNER JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
INNER JOIN title_publisher 
ON title_publisher.ID = titleauthor.title_id
GROUP BY authors.au_id, title_publisher.pub_name
ORDER BY authors.au_id DESC;

#Solucion challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS TOTAL
FROM authors
INNER JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
INNER JOIN sales 
ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3;

#Solucion challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(sales.qty), 0) AS TOTAL
FROM authors
LEFT JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
LEFT JOIN sales 
ON sales.title_id = titleauthor.title_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC;



#Desafío 

USE publications;



SELECT authors.au_id AS 'AUTHORS ID',
	authors.au_lname AS 'LAST NAME',
	authors.au_fname AS 'FIRST NAME', 
	titles.title AS 'TITLE'
    
FROM authors 
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id

#Desafío 2


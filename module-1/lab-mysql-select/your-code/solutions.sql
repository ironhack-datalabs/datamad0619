#CHALLENGE 1

USE Mysql_select;
SELECT 
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
	titles.title as "TITLE",
    publishers.pub_id as "PUBLISHER"
    
    
FROM authors
INNER JOIN titleauthor ON authors.au_id  = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id;

 #CHALLENGE 2
 
 SELECT 
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
	titles.title as 'TITLE',
    publishers.pub_name as "PUBLISHER",
    COUNT(*) as 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
INNER JOIN titles ON  titles.title_id = titleauthor.title_id
INNER JOIN publishers ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, titles.title
ORDER BY authors.au_id DESC;

 #CHALLENGE 3
 SELECT 
	authors.au_id as 'AUTHOR ID',
	authors.au_lname as 'LAST NAME',
	authors.au_fname as 'FIRST NAME',
	SUM(sales.qty) as 'TOTAL' 
FROM authors
INNER JOIN titleauthor ON authors.au_id  = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON sales.title_id = titles.title_id 
GROUP BY  authors.au_id, authors.au_lname, authors.au_fname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;
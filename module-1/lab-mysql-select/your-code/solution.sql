USE Publications;

#CHALLENGE 1 
SELECT 
titleauthor.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE' ,
publishers.pub_name as 'PUBLISHER'
FROM  authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id  
INNER JOIN titles
ON  titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;

#CHALLENGE 2	
SELECT 
titleauthor.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE' ,
publishers.pub_name as 'PUBLISHER',
COUNT(*) as 'TITLE COUNT'
FROM  authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id  
INNER JOIN titles
ON  titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY titles.title, authors.au_lname
ORDER BY titleauthor.au_id DESC;

# Challenge 3


SELECT  	
titleauthor.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME', 
SUM(sales.qty) as TOTAL
FROM  authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id  
INNER JOIN titles
ON  titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY TOTAL DESC
LIMIT 3;

# Chalenge 4
SELECT  	
titleauthor.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME', 
SUM(sales.qty) as TOTAL
FROM  authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id  
INNER JOIN titles
ON  titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY titleauthor.au_id
ORDER BY TOTAL DESC
LIMIT 23;

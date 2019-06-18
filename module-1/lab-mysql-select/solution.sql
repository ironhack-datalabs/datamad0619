
#challenge1
SELECT authors.au_id AS 'AUTHOR ID', 
	authors.au_fname AS 'AUTHOR NAME', 
	authors.au_lname AS 'AUTHOR LASTNAME', 
	titles.title AS 'TITLE', 
	publishers.pub_name AS 'PUBLISHER',
	COUNT(titles.title_id) AS 'TITLE COUNT'
#how many titles each author has published at each publisher

	FROM authors
	INNER JOIN titleauthor
		ON authors.au_id = titleauthor.au_id
	INNER JOIN titles
		ON  titleauthor.title_id= titles.title_id
	INNER JOIN publishers
		ON titles.pub_name = publishers.pub_id
		GROUP BY authors.au_id, publishers.pub_name;

#challenge2   
SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SELECT authors.au_id AS 'AUTHOR ID', 
	authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sales.sum(qty) AS 'TOTAL SALES'
    
    FROM authors
    INNER JOIN titleauthor
		ON 	authors.au_id = titleauthor.au_id
	INNER JOIN sales
		ON titleauthor.title_id = sales.title_id
        GROUP BY authors.au_id
		;
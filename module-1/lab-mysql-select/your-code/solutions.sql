USE publications;

 #Challenge 1

SELECT authors.au_id AS `AUTHOR_ID`, 
		authors.au_lname AS `LAST_NAME`,
    	authors.au_fname AS `FIRST_NAME`, 
		titles.title AS `TITLE`,
        publishers.pub_name AS `PUBLISHER`
        
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;

#Challenge 2

SELECT authors.au_id AS `AUTHOR_ID`, 
		authors.au_lname AS `LAST_NAME`,
    	authors.au_fname AS `FIRST_NAME`, 
		titles.title AS `TITLE`, 
        publishers.pub_name AS `PUBLISHER`,
        COUNT(titles.title_id) AS `TITLE COUNT`
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id;

#Challenge 3

SELECT 	authors.au_id AS `AUTHOR_ID`, 
		authors.au_lname AS `LAST_NAME`,
    	authors.au_fname AS `FIRST_NAME`, 
		titles.title AS `TITLE`,
        SUM(sales.qty) AS `TOTAL`
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY TOTAL DESC
LIMIT 3;


#Challenge 4

SELECT 	authors.au_id AS `AUTHOR_ID`, 
		authors.au_lname AS `LAST_NAME`,
    	authors.au_fname AS `FIRST_NAME`, 
		titles.title AS `TITLE`,
        SUM(sales.qty) AS `TOTAL`
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY TOTAL ASC;


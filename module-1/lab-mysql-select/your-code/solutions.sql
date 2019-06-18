CREATE TEMPORARY TABLE auth_titles
	SELECT authors.au_id,authors.au_lname,authors.au_fname, titleauthor.title_id
	FROM authors INNER JOIN titleauthor 
	ON authors.au_id=titleauthor.au_id;


CREATE TEMPORARY TABLE union2
	SELECT titles.title, titles.pub_id, auth_titles.*
	FROM titles INNER JOIN auth_titles
	ON titles.title_id=auth_titles.title_id;

SELECT union2.au_id AS AUTHOR_ID , union2.au_lname AS LAST_NAME,
	union2.au_fname AS FIRST_NAME, union2.title AS TITLE,
	publishers.pub_name AS PUBLISHER
	FROM publishers INNER JOIN union2
	ON union2.pub_id=publishers.pub_id;

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME,PUBLISHER,COUNT(TITLE)
	FROM Challenge1 GROUP BY TITLE;

CREATE TEMPORARY TABLE Challeng3 
	SELECT union2.au_id as AUTHOR_ID,
	union2.au_lname as LAST_NAME,
	union2.au_fname as FIRST_NAME,
	COUNT(sales.title_id) AS TOTAL
	FROM union2 INNER JOIN sales ON sales.title_id=union2.title_id
	GROUP BY sales.title_id;
SELECT * FROM Challeng3 ORDER BY TOTAL DESC LIMIT 3;

CREATE TEMPORARY TABLE auth_titles2
	SELECT authors.au_id,authors.au_lname,authors.au_fname, titleauthor.title_id
	FROM authors 
	RIGHT JOIN titleauthor ON authors.au_id=titleauthor.au_id
	LEFT JOIN titleauthor AS t2 ON authors.au_id=t2.au_id;



CREATE TEMPORARY TABLE union3
	SELECT titles.title, titles.pub_id, auth_titles2.* FROM titles 
	RIGHT JOIN auth_titles2 ON titles.title_id=auth_titles2.title_id 
	LEFT JOIN (
	SELECT authors.au_id,authors.au_lname,authors.au_fname, titleauthor.title_id
	FROM authors 
	RIGHT JOIN titleauthor ON authors.au_id=titleauthor.au_id
	LEFT JOIN titleauthor AS t2 ON authors.au_id=t2.au_id
	)auth_t ON titles.title_id=auth_t.title_id;

SELECT @@sql_mode;
SET sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TEMPORARY TABLE Challenge4 
	SELECT union3.au_id AS AUTHOR_ID,
	union3.au_lname AS LAST_NAME,
	union3.au_fname AS FIRST_NAME,
	COUNT(sales.title_id) AS TOTAL
	FROM union3
	LEFT JOIN sales ON sales.title_id=union3.title_id
	RIGHT JOIN sales AS s ON s.title_id=union3.title_id
	GROUP BY sales.title_id;

UPDATE Challenge4 SET TOTAL=0 WHERE TOTAL IS NULL;
SELECT * FROM Challenge4 ORDER BY TOTAL DESC;
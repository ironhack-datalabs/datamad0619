#CHALLENGE 1
SELECT authors.au_id as AUTHOR_ID ,authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME,
	titles.title AS TITLE, publishers.pub_name AS PUBLISHER
	FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id=publishers.pub_id
	ORDER BY authors.au_id;
	
#CHALLENGE 2
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME,PUBLISHER,COUNT(*) AS TITLE_COUNT
	FROM (
	SELECT authors.au_id as AUTHOR_ID ,authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME,
	titles.title AS TITLE, publishers.pub_name AS PUBLISHER
	FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN publishers ON titles.pub_id=publishers.pub_id
	ORDER BY authors.au_id
	)Challenge1 GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME,PUBLISHER ORDER BY AUTHOR_ID DESC;

#CHALLENGE 3
SELECT authors.au_id as AUTHOR_ID , authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
	FROM authors
	INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
	INNER JOIN titles ON titles.title_id=titleauthor.title_id
	INNER JOIN sales ON sales.title_id=titles.title_id
	GROUP BY AUTHOR_ID , LAST_NAME,FIRST_NAME ORDER BY TOTAL  DESC LIMIT 3;


#CHALLENGE 4


SELECT authors.au_id as AUTHOR_ID , authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME, SUM(IFNULL(sales.qty,0)) AS TOTAL
	FROM authors
	LEFT JOIN titleauthor ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
	LEFT JOIN sales ON sales.title_id=titles.title_id
	GROUP BY AUTHOR_ID , LAST_NAME,FIRST_NAME ORDER BY SUM(sales.qty) DESC;


#BONUS
SELECT authors.au_id as AUTHOR_ID , authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME, 
IFNULL((SUM(IFNULL(sales.qty,0))*titles.royalty*(titleauthor.royaltyper/100)+titles.advance),0) AS PROFIT
	FROM authors
	LEFT JOIN titleauthor ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
	LEFT JOIN sales ON sales.title_id=titles.title_id
	GROUP BY AUTHOR_ID , LAST_NAME,FIRST_NAME ORDER BY PROFIT DESC;
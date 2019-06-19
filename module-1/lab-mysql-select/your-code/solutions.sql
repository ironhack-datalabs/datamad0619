#NUMERO 1 BUENO:
SELECT authors.au_id AS 'AUTHOR ID',authors.au_lname AS 'LAST NAME', authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER' FROM authors
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id
INNER JOIN publishers ON titles.pub_id=publishers.pub_id
ORDER BY authors.au_id;


#NUMERO 2 BUENO:
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


#NUMERO 3 BUENO:
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME,SUM(SALES) AS TOTAL
        FROM (
        SELECT authors.au_id as AUTHOR_ID ,authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME,
        titles.title AS TITLE, sales.qty AS SALES
        FROM authors
        INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
        INNER JOIN titles ON titles.title_id=titleauthor.title_id
        INNER JOIN sales ON titles.title_id=sales.title_id
        ORDER BY authors.au_id
        )Challenge1 GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME ORDER BY TOTAL DESC LIMIT 3;

#NUMERO 4 BUENO
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME,IFNULL(SUM(SALES),0) AS TOTAL
        FROM (
        SELECT authors.au_id as AUTHOR_ID ,authors.au_lname AS LAST_NAME , authors.au_fname AS FIRST_NAME,
        titles.title AS TITLE, sales.qty AS SALES
        FROM authors
        LEFT JOIN titleauthor ON authors.au_id=titleauthor.au_id
        LEFT JOIN titles ON titles.title_id=titleauthor.title_id
        LEFT JOIN sales ON titles.title_id=sales.title_id
        ORDER BY authors.au_id
        )Challenge1 GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME ORDER BY TOTAL DESC;


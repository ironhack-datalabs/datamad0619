'''
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", summary.title, summary.publisher 
    FROM titleauthor
	LEFT JOIN authors ON authors.au_id=titleauthor.au_id
	LEFT JOIN (
		SELECT title_id, title as TITLE, pub_name as PUBLISHER FROM titles 
	LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
    )summary
    ON titleauthor.title_id = summary.title_id
    ORDER BY authors.au_id;
'''

#CHALLENGE 1
CREATE TEMPORARY TABLE Authors_Titles_Publishers
SELECT authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME, authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
    FROM titleauthor
	LEFT JOIN authors ON authors.au_id=titleauthor.au_id
	LEFT JOIN titles ON titles.title_id=titleauthor.title_id
    LEFT JOIN publishers ON publishers.pub_id=titles.pub_id
    ORDER BY authors.au_id;


#CHALLENGE 2
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(TITLE) as TITLE_COUNT 
FROM Authors_Titles_Publishers 
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER;

#CHALLENGE 3
SELECT titleauthor.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(sales.qty) as TOTAL 
FROM titleauthor
	JOIN authors ON authors.au_id=titleauthor.au_id
    JOIN sales ON sales.title_id=titleauthor.title_id
    GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
    ORDER BY SUM(sales.qty) DESC
    LIMIT 3

#CHALLENGE 4

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, IFNULL(SUM(sales.qty),0) as TOTAL 
FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id=authors.au_id
    LEFT JOIN sales ON sales.title_id=titleauthor.title_id
    GROUP BY authors.au_id
    ORDER BY SUM(sales.qty) DESC;

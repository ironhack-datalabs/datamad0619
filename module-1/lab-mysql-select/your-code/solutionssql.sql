CREATE TEMPORARY TABLE authors_titles_publishers

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM titleauthor
JOIN authors ON authors.au_id = titleauthor.au_id
JOIN titles ON titles.title_id = titleauthor.title_id 
JOIN publishers ON publishers.pub_id = titles.pub_id;

SELECT * FROM authors_titles_publishers;

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, PUBLISHER, COUNT(`TITLE`) AS 'TITLE COUNT' FROM authors_titles_publishers
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, PUBLISHER
ORDER BY `TITLE COUNT` DESC;

SELECT titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
FROM titleauthor
	JOIN authors ON authors.au_id = titleauthor.au_id
	JOIN sales ON sales.title_id = titleauthor.title_id
	GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
	ORDER BY SUM(sales.qty) DESC
    LIMIT 3;
    
SELECT titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
FROM titleauthor
	JOIN authors ON authors.au_id = titleauthor.au_id
	JOIN sales ON sales.title_id = titleauthor.title_id
	GROUP BY titleauthor.au_id, authors.au_lname, authors.au_fname
	ORDER BY SUM(sales.qty) DESC;

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', IFNULL(SUM(sales.qty), 0) as TOTAL
FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
	LEFT JOIN sales ON sales.title_id = titleauthor.title_id
	GROUP BY authors.au_id
	ORDER BY SUM(sales.qty) DESC;
    
CREATE TEMPORARY TABLE tabla_datos
SELECT ta.title_id as TITLE_ID, ta.au_id as AUT_ID, ta.royaltyper/100 as ROY_AUT, t.royalty/100 AS ROY_TITLE, 
t.price AS PRICE_TITLE, t.advance AS ADV_TITLE, SUM(s.qty) AS QTY_TITLE,
((t.royalty*t.price*SUM(s.qty)/100)+t.advance)*(ta.royaltyper/100) as PROFIT 
FROM titleauthor as ta 
LEFT JOIN titles as t ON ta.title_id=t.title_id
LEFT JOIN sales as s ON ta.title_id=s.title_id
GROUP BY TITLE_ID, AUT_ID
ORDER BY ta.title_id;

SELECT a.au_id as AUTHOR_ID, a.au_lname as "NAME", a.au_fname as LAST_NAME, SUM(td.PROFIT) AS PROFIT
FROM tabla_datos as td
LEFT JOIN authors as a ON td.AUT_ID=a.au_id
GROUP BY AUTHOR_ID
ORDER BY PROFIT DESC
LIMIT 3;













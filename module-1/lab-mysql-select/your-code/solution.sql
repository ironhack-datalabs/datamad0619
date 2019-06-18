# CHALLENGE 1

SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
 title AS `TITLE`, pub_name  AS `PUBLISHER`
	FROM authors AS a 
	INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
	INNER JOIN titles AS t ON ta.title_id = t.title_id
    INNER JOIN publishers AS p ON t.pub_id = p.pub_id
    ORDER BY a.au_id;
    
# CHALLENGE 2

SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
pub_name  AS `PUBLISHER`, COUNT(title) AS `TITLE COUNT`
	FROM authors AS a 
	INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
	INNER JOIN titles AS t ON ta.title_id = t.title_id
    INNER JOIN publishers AS p ON t.pub_id = p.pub_id
    GROUP BY a.au_id, p.pub_id
    ORDER BY a.au_id DESC;
    
# CHALLENGE 3

SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
SUM(qty) AS `TOTAL`
	FROM authors AS a 
	INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
	INNER JOIN titles AS t ON ta.title_id = t.title_id
    INNER JOIN sales AS s ON t.title_id = s.title_id
    GROUP BY a.au_id
    ORDER BY TOTAL DESC
    LIMIT 3;
    
# CHALLENGE 4

SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
IFNULL(SUM(qty), 0) AS `TOTAL`
	FROM authors AS a 
	LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
	LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON t.title_id = s.title_id
    GROUP BY a.au_id
    ORDER BY TOTAL DESC;
    
# BONUS CHALLENGE

SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
IFNULL(ROUND(SUM(qty)*price*(100-royalty)/100+advance, 2),0) AS `PROFIT`
	FROM authors AS a 
	LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
	LEFT JOIN titles AS t ON ta.title_id = t.title_id
    LEFT JOIN sales AS s ON t.title_id = s.title_id
    GROUP BY a.au_id
    ORDER BY PROFIT DESC;

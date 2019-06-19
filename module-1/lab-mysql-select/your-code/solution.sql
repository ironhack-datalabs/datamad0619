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

SELECT  `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, ROUND(SUM(ROYALTIES) + SUM(ADVANCE), 2) AS PROFIT
	FROM (
SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
IFNULL(ROUND(SUM(qty*price*royalty/100*royaltyper/100), 2), 0) AS ROYALTIES,
advance*royaltyper/100 AS ADVANCE
	FROM authors AS a 
	INNER JOIN titleauthor AS ta ON a.au_id = ta.au_id
	INNER JOIN titles AS t ON ta.title_id = t.title_id
    INNER JOIN sales AS s ON t.title_id = s.title_id
    GROUP BY a.au_id, t.title_id
) summary 
GROUP BY `AUTHOR ID`
ORDER BY PROFIT DESC
LIMIT 3;

# BONUS CHALLENGE 2
# ¿CUÁNTO GANAN LOS EDITORES CON CADA AUTOR?

SELECT a.au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`,
IFNULL(ROUND((SUM(qty)*price*(100-royalty)/100-advance), 2),0) AS `PROFIT`
	FROM authors AS a 
	LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
	INNER JOIN titles AS t ON ta.title_id = t.title_id
    INNER JOIN sales AS s ON t.title_id = s.title_id
    GROUP BY a.au_id, t.title_id
    ORDER BY PROFIT DESC;
    
# BONUS CHALLENGE 3
# ¿CUÁNTOS LIBROS TIENEN QUE VENDERSE PARA EMPEZAR A SER RENTABLES?

SELECT  `TITLE ID`, `TITLE`, NECESARIOS, VENDIDOS, NECESARIOS - VENDIDOS AS FALTAN
	FROM (
	SELECT t.title_id AS `TITLE ID`, title AS `TITLE`,
	ROUND(advance/(price*(100-royalty))*100, 0) AS NECESARIOS,
	SUM(qty) AS VENDIDOS
		FROM titles AS t
		INNER JOIN sales AS s ON t.title_id = s.title_id
		GROUP BY s.title_id
	) summary
	ORDER BY FALTAN ASC;

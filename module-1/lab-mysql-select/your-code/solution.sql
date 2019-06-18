#challenge1
USE publications;

SELECT authors.au_id AS 'Author ID', authors.au_fname AS 'FIRST NAME', authors.au_lname AS 'LAST NAME', titles.title AS 'TITLE', publishers.pub_name AS 'PUBLISHER'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id

ORDER BY authors.au_id;

#Challenge 2

SELECT authors.au_id AS 'Author ID', authors.au_fname AS 'FIRST NAME', authors.au_lname AS 'LAST NAME', publishers.pub_name AS 'PUBLISHER', COUNT(*) AS 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname, publishers.pub_name
ORDER BY authors.au_id DESC;


#Challenge 3

SELECT authors.au_id AS 'Author ID', authors.au_fname AS 'FIRST NAME', authors.au_lname AS 'LAST NAME', SUM(sales.qty) AS 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id

GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY SUM(sales.qty) DESC
LIMIT 3;



#Challenge 4

SELECT authors.au_id AS 'Author ID', authors.au_fname AS 'FIRST NAME', authors.au_lname AS 'LAST NAME', SUM(IFNULL(sales.qty,0)) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY SUM(sales.qty) DESC;

#BONUS

SELECT authors.au_id AS 'Author ID', authors.au_fname AS 'FIRST NAME', authors.au_lname AS 'LAST NAME', IFNULL((SUM(IFNULL(sales.qty,0))*titles.royalty*(titleauthor.royaltyper/100)+titles.advance),0) AS PROFIT
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_fname, authors.au_lname
ORDER BY PROFIT DESC
LIMIT 3;



    
    
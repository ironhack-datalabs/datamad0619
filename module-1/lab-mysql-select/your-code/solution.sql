USE ´publications´;

#CHALLENGE 1

SELECT authors.au_id AS `AUTHOR ID`,
authors.au_lname AS `LAST NAME`,
authors.au_fname AS `FIRST NAME`,
titles.title
FROM authors
INNER JOIN
titleauthor
ON
authors.au_id = titleauthor.au_id
INNER JOIN
titles
ON
titleauthor.title_id=titles.title_id
INNER JOIN
publishers
ON
titles.pub_id=publishers.pub_id
;
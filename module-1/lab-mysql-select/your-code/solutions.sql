#TEMPORARY TABLE
CREATE TEMPORARY TABLE au_title_pub
SELECT ta.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, 
a.au_fname AS FIRST_NAME, t.title AS TITLE, ta.title_id as TITLE_ID, p.pub_name AS PUBLISHER
FROM titleauthor as ta
LEFT JOIN authors as a ON ta.au_id=a.au_id
LEFT JOIN titles as t ON ta.title_id=t.title_id
LEFT JOIN publishers as p ON t.pub_id=p.pub_id
ORDER BY a.au_id;

#CHALLENGE 1
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, TITLE, PUBLISHER FROM au_title_pub;

#CHALLENGE 2
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(TITLE) AS TITLE_COUNT
FROM au_title_pub
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY TITLE_COUNT DESC;

#CHALLENGE 3
SELECT atp.AUTHOR_ID, atp.LAST_NAME, atp.FIRST_NAME, SUM(s.qty) AS TOTAL
FROM au_title_pub as atp
LEFT JOIN sales as s ON atp.TITLE_ID=s.title_id
GROUP BY atp.AUTHOR_ID, atp.LAST_NAME, atp.FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4
SELECT a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, IFNULL(SUM(s.qty),0) AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta ON a.au_id=ta.au_id
LEFT JOIN sales as s ON ta.title_id = s.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC;
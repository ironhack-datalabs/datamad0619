#CHALLENGE 1
SELECT ta.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, 
a.au_fname AS FIRST_NAME, t.title AS TITLE, p.pub_name AS PUBLISHER
FROM titleauthor as ta
LEFT JOIN authors as a ON ta.au_id=a.au_id
LEFT JOIN titles as t ON ta.title_id=t.title_id
LEFT JOIN publishers as p ON t.pub_id=p.pub_id
ORDER BY a.au_id;

#CHALLENGE 2
SELECT ta.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, 
a.au_fname AS FIRST_NAME, p.pub_name AS PUBLISHER, COUNT(t.title) as TITLE_COUNT
FROM titleauthor as ta
LEFT JOIN authors as a ON ta.au_id=a.au_id
LEFT JOIN titles as t ON ta.title_id=t.title_id
LEFT JOIN publishers as p ON t.pub_id=p.pub_id
GROUP BY AUTHOR_ID, PUBLISHER
ORDER BY TITLE_COUNT DESC;

#CHALLENGE 3
SELECT ta.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, 
a.au_fname AS FIRST_NAME, SUM(s.qty) AS TOTAL
FROM titleauthor as ta
LEFT JOIN authors as a ON ta.au_id=a.au_id
LEFT JOIN sales as s ON ta.title_id=s.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

#CHALLENGE 4
SELECT a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, IFNULL(SUM(s.qty),0) AS TOTAL
FROM authors as a
LEFT JOIN titleauthor as ta ON a.au_id=ta.au_id
LEFT JOIN sales as s ON ta.title_id = s.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;

#BONUS: MOST PROFITING AUTHORS

SELECT AUT_ID, LAST_NAME, FIRST_NAME, SUM(PROFIT) AS PROFIT
FROM(
	SELECT ta.title_id as TITLE_ID, ta.au_id as AUT_ID, a.au_lname as LAST_NAME, a.au_fname AS FIRST_NAME,
	((t.royalty*t.price*SUM(s.qty)/100)+t.advance)*(ta.royaltyper/100) as PROFIT 
	FROM titleauthor as ta 
	LEFT JOIN titles as t ON ta.title_id=t.title_id
	LEFT JOIN sales as s ON ta.title_id=s.title_id
	LEFT JOIN authors as a on ta.au_id=a.au_id
	GROUP BY TITLE_ID, AUT_ID
	)summary
GROUP BY AUT_ID
ORDER BY PROFIT DESC
LIMIT 3;

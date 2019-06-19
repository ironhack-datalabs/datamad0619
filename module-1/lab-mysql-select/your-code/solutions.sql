-- Who Have Published How Many At Where? query how many titles each author has published at each publisher
SELECT summary.AUTHOR_ID, summary.LAST_NAME, summary.NAME, count(summary.TITLE) as SUMA, summary.PUBLISHERS
FROM (
    SELECT 
	authors.au_id as AUTHOR_ID,
	-- titles.title_id, 
    authors.au_fname as LAST_NAME,
	authors.au_lname as NAME,
	titles.title as TITLE, 
	publishers.pub_name as PUBLISHERS
	FROM mysql_select.authors
	INNER JOIN mysql_select.titleauthor ON mysql_select.authors.au_id = mysql_select.titleauthor.au_id
    INNER JOIN mysql_select.titles ON mysql_select.titleauthor.title_id = mysql_select.titles.title_id
	INNER JOIN mysql_select.publishers ON mysql_select.titles.pub_id = mysql_select.publishers.pub_id
    ) summary
GROUP BY summary.AUTHOR_ID, summary.PUBLISHERS;
-- Who are the top 3 authors who have sold the highest number of titles?
-- 


	

	


    

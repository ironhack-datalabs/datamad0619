 SELECT authors.au_id AS "AUTHOR", 
		authors.au_lname AS "LAST NAME", 
		authors.au_fname AS "FIRST NAME", 
		publishers.pub_name AS "PUBLISHERS",
		SUM(sales.qty) AS "TOTAL"
		 FROM authors 
		   INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
		   INNER JOIN titles ON titles.title_id = titleauthor.title_id
		   INNER JOIN publishers ON publishers.pub_id = titles.pub_id
           LEFT JOIN sales ON titles.title_id = sales.title_id
		   GROUP BY authors.au_id, titles.pub_id
           ORDER BY SUM(sales.qty) DESC
           LIMIT 3;
           
    
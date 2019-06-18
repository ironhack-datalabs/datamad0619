 SELECT authors.au_id AS "AUTHOR", 
		authors.au_lname AS "LAST NAME", 
		authors.au_fname AS "FIRST NAME", 
		publishers.pub_id AS "PUBLISHERS",
		COUNT(titles.title) AS "TITLE COUNT"
		 FROM authors
		   INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
		   INNER JOIN titles ON titles.title_id = titleauthor.title_id
		   INNER JOIN publishers ON publishers.pub_id = titles.pub_id
		   GROUP BY authors.au_id, publishers.pub_id;
    
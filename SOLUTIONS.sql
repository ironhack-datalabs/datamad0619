SELECT authors.au_id, authors.au_lname, authors.au_fname, title_publisher.pub_name,
COUNT(title_publisher.Title) AS Title_Count
FROM authors 
INNER JOIN titleauthor 
ON titleauthor.au_id = authors.au_id
INNER JOIN title_publisher 
ON title_publisher.ID = titleauthor.title_id
GROUP BY authors.au_id, title_publisher.pub_name
ORDER BY authors.au_id DESC;

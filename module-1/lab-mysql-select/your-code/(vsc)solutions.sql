SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', summary.title, summary.publisher
FROM titleauthor
LEFT JOIN authors ON authors.au_id=titleauthor.au_id
LEFT JOIN (
	SELECT title_id, title as TITLE, pub_name AS PUBLISHER FROM titles
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
)summary
ON titleauthor.title_id = summary.title_id
ORDER BY authors.au_id;
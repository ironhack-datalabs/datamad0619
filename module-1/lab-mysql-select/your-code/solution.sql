USE Publications;
#CHALLENGE 1 
SELECT 
titleauthor.au_id as 'AUTHOR ID',
authors.au_lname as 'LAST NAME',
authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE' ,
publishers.pub_name as 'PUBLISHER'
FROM  authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id  
INNER JOIN titles
ON  titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id;
#CHALLENGE 2	

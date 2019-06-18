'''CHallenge 1'''
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE',  publishers.pub_name as 'PUBLISHER'  FROM authors 
	INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
	INNER JOIN titles ON titleauthor.title_id = titles.title_id
    INNER JOIN publishers ON titles.pub_id = publishers.pub_id


'''CHallenge 2'''
 SELECT authors.au_id as 'AUTHOR ID', 
	authors.au_lname as 'LAST NAME', 
	authors.au_fname as 'FIRST NAME',  
	publishers.pub_name as 'PUBLISHER' ,
	COUNT(titles.title) as 'TITLE COUNT'
	FROM authors 
		INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN titles ON titleauthor.title_id = titles.title_id
		INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id;


'''CHallenge 3'''

 SELECT authors.au_id as 'AUTHOR ID', 
	authors.au_lname as 'LAST NAME', 
	authors.au_fname as 'FIRST NAME',  
	publishers.pub_name as 'PUBLISHER' ,
	COUNT(titles.title) as 'TITLE COUNT',
    SUM(sales.qty) as 'TOTAL' 
	FROM authors 
		INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
		INNER JOIN titles ON titleauthor.title_id = titles.title_id
        INNER JOIN sales  ON titles.title_id = sales.title_id 
		INNER JOIN publishers ON titles.pub_id = publishers.pub_id

GROUP BY authors.au_id, publishers.pub_id
ORDER BY TOTAL DESC
LIMIT 3;


'''CHallenge 4'''


 SELECT authors.au_id as 'AUTHOR ID', 
	authors.au_lname as 'LAST NAME', 
	authors.au_fname as 'FIRST NAME',  
	IFNULL(publishers.pub_name, 0) as 'PUBLISHER' ,
	COUNT(titles.title) as 'TITLE COUNT',
    IFNULL(SUM(sales.qty), 0) as 'TOTAL'
	FROM authors 
		LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
		LEFT JOIN titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN sales  ON titles.title_id = sales.title_id 
		LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_id
ORDER BY TOTAL DESC
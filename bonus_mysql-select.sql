SELECT authors.au_id, authors.au_lname, authors.au_fname, 
SUM (titles.advance, sales.qty*(titles.royalty/100)) AS PROFIT
FROM authors INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id;




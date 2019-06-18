# CHALLENGE 1
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
	FROM authors
	INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
	INNER JOIN titles ON titles.title_id = titleauthor.title_id
    INNER JOIN publishers ON publishers.pub_id = titles.pub_id
    ORDER BY authors.au_id;

# CHALLENGE 2
SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER', COUNT(*) AS 'TITLE COUNT'
	FROM authors
	INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
	INNER JOIN titles ON titles.title_id = titleauthor.title_id
    INNER JOIN publishers ON publishers.pub_id = titles.pub_id
    GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
    ORDER BY authors.au_id DESC;
    
# CHALLENGE 3

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', SUM(sales.qty) as 'TOTAL'
	FROM authors
	INNER JOIN titleauthor ON titleauthor.au_id = authors.au_id
	INNER JOIN titles ON titles.title_id = titleauthor.title_id
    INNER JOIN sales ON sales.title_id = titles.title_id
	GROUP BY authors.au_id, authors.au_lname, authors.au_fname
	ORDER BY SUM(sales.qty) DESC
	LIMIT 3;

    
# CHALLENGE 4

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', SUM(IFNULL(sales.qty,0)*titles.royalty) as 'TOTAL'
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
	LEFT JOIN titles ON titles.title_id = titleauthor.title_id
    LEFT JOIN sales ON sales.title_id = titles.title_id
	GROUP BY authors.au_id, authors.au_lname, authors.au_fname
	ORDER BY SUM(sales.qty) DESC;
    
# BONUS

	SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', IFNULL((SUM(IFNULL(sales.qty,0))*titles.royalty*(titleauthor.royaltyper/100)+titles.advance), 0) As PROFIT
	FROM authors
	LEFT JOIN titleauthor ON titleauthor.au_id = authors.au_id
	LEFT JOIN titles ON titles.title_id = titleauthor.title_id
    LEFT JOIN sales ON sales.title_id = titles.title_id
	GROUP BY authors.au_id, authors.au_lname, authors.au_fname
	ORDER BY PROFIT DESC
    LIMIT 3;
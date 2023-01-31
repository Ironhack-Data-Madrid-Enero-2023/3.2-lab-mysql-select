SELECT * from sales;

#challengue 1
select authors.au_id as 'AUTHOR_ID', authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
	from authors 
    
	left join titleauthor
    on authors.au_id=titleauthor.au_id
    
    left join titles
    on titles.title_id=titleauthor.title_id
    
    left join publishers
    on publishers.pub_id=titles.pub_id
    ;

#challenge 2
    

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
 publishers.pub_name AS "PUBLISHER", count(titles.title_id) AS "TITLE COUNT"
 
 FROM authors
 
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id

    GROUP BY authors.au_id, publishers.pub_name
    ;
	
    
#Challenge 3

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
 sum(sales.qty) AS "TOTAL"
 
FROM authors

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id

GROUP BY authors.au_id
ORDER BY `TOTAL` DESC
LIMIT 3;
    
    
#Challenge 4

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",
 sum(sales.qty) AS "TOTAL"
 
FROM authors

LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN sales ON sales.title_id = titleauthor.title_id

GROUP BY authors.au_id
ORDER BY `TOTAL` DESC
;
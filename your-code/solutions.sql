--Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', titles.title AS 'TITLE',publishers.pub_name AS 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id

--Challenge 2 - Who Have Published How Many At Where?

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME',publishers.pub_name AS 'PUBLISHER', count(titles.title) 
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
GROUP BY authors.au_id , publishers.pub_name

--Challenge 3 - Best Selling Authors

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME',sum(qty) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY sum(qty) DESC
LIMIT 3 

--Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME',COALESCE(sum(qty),0) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON sales.title_id=titles.title_id
GROUP BY authors.au_id
ORDER BY 
COALESCE(sum(qty), 0) DESC

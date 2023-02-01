-- Challenge 1 ------------------------------------------------------------------
SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME',
 au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
WHERE title is not null
ORDER BY authors.au_id;


-- Challenge 2 ---------------------------------------------------------------------------
SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`, COUNT(`TITLE`) AS 'TITLE COUNT'
FROM
(SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME',
 au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
WHERE title IS NOT NULL) AS tabla
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, `PUBLISHER`
ORDER BY `AUTHOR ID` DESC;


-- Challenge 3 -------------------------------------------------
SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', 
au_fname AS 'FIRST NAME', coalesce(SUM(qty),0) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY `TOTAL` DESC
LIMIT 3;


-- Challenge 4 -----------------------------------------------------------
SELECT authors.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', 
au_fname AS 'FIRST NAME', coalesce(SUM(qty),0) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON sales.title_id = titles.title_id
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY `TOTAL` DESC
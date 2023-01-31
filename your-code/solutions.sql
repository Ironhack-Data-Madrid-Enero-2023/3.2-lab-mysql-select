
-- Challenge 1

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_id
FROM authors
JOIN titleauthor ON authors.au_id = titleauthor.au_id
JOIN titles ON titleauthor.title_id = titles.title_id
JOIN publishers ON titles.pub_id = publishers.pub_id
order by au_id ;

-- 25 filas



-- Challenge 2

SELECT authors.au_id, au_lname, au_fname, publishers.pub_id, COUNT(titles.title_id)
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, au_lname, au_fname, publishers.pub_id
order by COUNT(titles.title_id) desc;


-- Challenge 3

SELECT authors.au_id, au_lname, au_fname, SUM(sales.qty) as total_sales
FROM sales
JOIN titles
ON sales.title_id = titles.title_id
JOIN titleauthor
ON titles.title_id = titleauthor.title_id
JOIN authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY total_sales DESC
LIMIT 3;


-- Challenge 4


SELECT authors.au_id, au_lname, au_fname, COALESCE(SUM(sales.qty),0) as total_sales
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY total_sales DESC
LIMIT 23;

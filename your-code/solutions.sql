-- Challenge 1

SELECT authors.au_id as `author id`, au_lname as `Last Name`, au_fname as `First Name`, title, pub_name as `publisher`
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
WHERE authors.au_id IS NOT NULL AND au_lname IS NOT NULL AND au_fname IS NOT NULL AND title IS NOT NULL AND pub_name IS NOT NULL;

-- Challenge 2

SELECT authors.au_id as `author id`, au_lname as `Last Name`, au_fname as `First Name`, pub_name as `publisher`, COUNT(titles.title_id) as `Title Count`
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN publishers
ON publishers.pub_id = titles.pub_id
WHERE authors.au_id IS NOT NULL AND au_lname IS NOT NULL AND au_fname IS NOT NULL AND pub_name IS NOT NULL
GROUP BY authors.au_id, au_lname, au_fname, pub_name ;

-- Challenge 3
SELECT authors.au_id as `author id`, au_lname as `Last Name`, au_fname as `First Name`, SUM(qty) as `TOTAL`
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
WHERE authors.au_id IS NOT NULL AND au_lname IS NOT NULL AND au_fname IS NOT NULL 
GROUP BY authors.au_id, au_lname, au_fname, qty
ORDER BY  `TOTAL` DESC
LIMIT 3;




-- Challenge 4

SELECT authors.au_id as `author id`, au_lname as `Last Name`, au_fname as `First Name`, coalesce(SUM(qty),0) as `TOTAL`
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id
LEFT JOIN sales
ON titles.title_id = sales.title_id
WHERE authors.au_id IS NOT NULL AND au_lname IS NOT NULL AND au_fname IS NOT NULL 
GROUP BY authors.au_id, au_lname, au_fname
ORDER BY  `TOTAL` DESC;

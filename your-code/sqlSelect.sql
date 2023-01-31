
SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', count(title) AS "Title Count", pu.pub_name AS  "Publisher"
FROM authors AS a  
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles as ti ON ta.title_id = ti.title_id
LEFT JOIN publishers AS pu ON ti.pub_id = pu.pub_id

GROUP BY a.au_id, pu.pub_name;



SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', sum(qty) AS "Total"
FROM authors AS a  
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles as ti ON ta.title_id = ti.title_id
LEFT JOIN sales AS s ON s.title_id = ti.title_id

GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY sum(qty) DESC
LIMIT 3;
;



SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COALESCE(sum(qty), 0) AS "Total"
FROM authors AS a  
LEFT JOIN titleauthor AS ta ON a.au_id = ta.au_id
LEFT JOIN titles as ti ON ta.title_id = ti.title_id
LEFT JOIN sales AS s ON s.title_id = ti.title_id

GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY COALESCE(sum(qty), 0) DESC
;
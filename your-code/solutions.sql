SELECT au.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM authors AS au
LEFT JOIN titleauthor AS tiau
ON au.au_id = tiau.au_id
LEFT JOIN titles AS ti
ON tiau.title_id = ti.title_id
LEFT JOIN publishers AS pu
ON pu.pub_id = ti.pub_id
WHERE au.au_id IS NOT NULL and au_lname IS NOT NULL and au_fname IS NOT NULL and pub_name IS NOT NULL;

SELECT au.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', pub_name AS 'PUBLISHER', COUNT(ti.title_id) AS 'TITLE COUNT'
FROM authors AS au
LEFT JOIN titleauthor AS tiau
ON au.au_id = tiau.au_id
LEFT JOIN titles AS ti
ON tiau.title_id = ti.title_id
LEFT JOIN publishers AS pu
ON pu.pub_id = ti.pub_id
GROUP BY au.au_id, au_lname, au_fname, pub_name
HAVING au.au_id IS NOT NULL and au_lname IS NOT NULL and au_fname IS NOT NULL and pub_name IS NOT NULL;

SELECT au.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', COUNT(ti.title_id) AS 'TOTAL'
FROM authors AS au
LEFT JOIN titleauthor AS tiau
ON au.au_id = tiau.au_id
LEFT JOIN titles AS ti
ON tiau.title_id = ti.title_id
LEFT JOIN publishers AS pu
ON pu.pub_id = ti.pub_id
GROUP BY au.au_id, au_lname, au_fname
HAVING au.au_id IS NOT NULL and au_lname IS NOT NULL and au_fname IS NOT NULL
ORDER BY COUNT(ti.title_id) DESC
LIMIT 3;

SELECT au.au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', COUNT(ti.title_id) AS 'TOTAL'
FROM authors AS au
LEFT JOIN titleauthor AS tiau
ON au.au_id = tiau.au_id
LEFT JOIN titles AS ti
ON tiau.title_id = ti.title_id
LEFT JOIN publishers AS pu
ON pu.pub_id = ti.pub_id
GROUP BY au.au_id, au_lname, au_fname
HAVING au.au_id IS NOT NULL and au_lname IS NOT NULL and au_fname IS NOT NULL
ORDER BY COUNT(ti.title_id) DESC
LIMIT 23;
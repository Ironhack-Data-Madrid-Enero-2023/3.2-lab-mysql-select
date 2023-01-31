CHALLENGE 1


USE publications;

SELECT aut.au_id as 'AUTHOR_ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME', title AS 'TITLE', pub_name AS 'PUBLISHER'
FROM titleauthor as ta

LEFT JOIN authors as aut
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id;



CHALLENGE 2


USE publications;

SELECT  aut.AU_ID as 'AUTHOR ID',
		AU_FNAME AS 'FIRST NAME',
		AU_LNAME AS 'LAST NAME',
        pub_name AS 'PUBLISHER', 
		COUNT(ta.title_id) as 'TITLE COUNT'
FROM titleauthor as ta

LEFT JOIN authors as aut
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id

GROUP BY aut.au_id, AU_LNAME, AU_FNAME, pub_name
order by 'TITLE COUNT' desc;


CHALLENGE 3

USE publications;

SELECT  aut.AU_ID as 'AUTHOR ID',
		AU_FNAME AS 'FIRST NAME',
		AU_LNAME AS 'LAST NAME',
		sum(qty) as 'TOTAL'
FROM titleauthor as ta

LEFT JOIN authors as aut
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id
LEFT JOIN sales as s
on s.title_id = t.title_id

GROUP BY aut.au_id 
order by sum(qty) desc
limit 3
;



CHALLENGE 4


USE publications;

SELECT  aut.AU_ID as 'AUTHOR ID',
		AU_FNAME AS 'FIRST NAME',
		AU_LNAME AS 'LAST NAME',
		sum(qty) as 'TOTAL'
FROM titleauthor as ta

LEFT JOIN authors as aut
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id
LEFT JOIN sales as s
on s.title_id = t.title_id

GROUP BY aut.au_id 
order by sum(qty) desc
;



---------------------------- VERSION 2 ---------------------------------------------


CHALLENGE 2

USE publications;

SELECT  aut.AU_ID as 'AUTHOR ID',
		AU_FNAME AS 'FIRST NAME',
		AU_LNAME AS 'LAST NAME',
		PUB_NAME AS 'PUBLISHER',
        COUNT(T.TITLE) as 'TOTAL'
FROM AUTHORS as AUT

LEFT JOIN titleauthor as ta
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id


GROUP BY aut.au_id, AU_LNAME, AU_FNAME, pub_name 
order by COUNT(T.TITLE) desc
;



CHALLENGE 3

USE publications;

SELECT  aut.AU_ID as 'AUTHOR ID',
		AU_FNAME AS 'FIRST NAME',
		AU_LNAME AS 'LAST NAME',
		sum(qty) AS 'TOTAL'
        
FROM AUTHORS as AUT

LEFT JOIN titleauthor as ta
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id
LEFT JOIN sales as s
on s.title_id = t.title_id

GROUP BY aut.au_id 
order by sum(qty) desc
limit 3
;




CHALLENGE 4

USE publications;

SELECT  aut.AU_ID as 'AUTHOR ID',
		AU_FNAME AS 'FIRST NAME',
		AU_LNAME AS 'LAST NAME',
		sum(qty) AS 'TOTAL'
        
FROM AUTHORS as AUT

LEFT JOIN titleauthor as ta
on ta.au_id = aut.au_id 
LEFT JOIN titles as t
on ta.title_id = t.title_id
LEFT JOIN publishers as pu
on pu.pub_id = t.pub_id
LEFT JOIN sales as s
on s.title_id = t.title_id

WHERE qty IS NOT NULL
 
GROUP BY aut.au_id 
order by sum(qty) desc
;
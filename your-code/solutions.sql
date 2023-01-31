create temporary table  Challenge1
(SELECT authors.au_id, au_lname, au_fname, title, pub_name
FROM authors

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titleauthor.title_id = titles.title_id

left join publishers 
on titles.pub_id = publishers.pub_id)
;


-- Challenge 2 : 

SELECT au_id, au_lname, au_fname, pub_name, count(title) 

from challenge1
group by au_id, pub_name

;

-- Challenge 3 : 
SELECT authors.au_id, au_lname, au_fname, sum(qty)
FROM authors

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titleauthor.title_id = titles.title_id

left join publishers 
on titles.pub_id = publishers.pub_id

left join  sales
on titles.title_id = sales.title_id

group by au_id
order by sum(qty) desc

limit 3 
;

-- Challenge 4 
   
SELECT authors.au_id, au_lname, au_fname, COALESCE (sum(qty),0) as sum

FROM authors

left join titleauthor 
on authors.au_id = titleauthor.au_id

left join titles 
on titleauthor.title_id = titles.title_id

left join publishers 
on titles.pub_id = publishers.pub_id

left join  sales
on titles.title_id = sales.title_id


group by au_id
order by sum(qty) desc



limit 23
;    
       
select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME" , titles.title as "TITLE", publishers.pub_name as "PUBLISHER"
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id
;

select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME" , publishers.pub_name as "PUBLISHER", count(titleauthor.title_id) as "TITLE COUNT"
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
;

select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME", sales.qty as "TOTAL"
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
order by sales.qty desc
limit 3
;


select authors.au_id as "AUTHOR ID", au_lname as "LAST NAME",au_fname as "FIRST NAME", coalesce(sum(sales.qty), 0) as "TOTAL"
from authors
left join titleauthor
on authors.au_id = titleauthor.au_id
left join titles
on titleauthor.title_id = titles.title_id
left join sales
on titles.title_id = sales.title_id
group by authors.au_id, au_lname, au_fname
order by `TOTAL` desc
;
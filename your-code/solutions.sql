select authors.au_id, authors.au_lname, authors.au_fname ,titles.title, publishers.pub_name
from authors 
left join titleauthor 
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id =  titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id ;


select authors.au_id, authors.au_lname, authors.au_fname , publishers.pub_name, count(titleauthor.title_id)
from authors 
left join titleauthor 
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id =  titles.title_id
left join publishers
on titles.pub_id = publishers.pub_id 
group by authors.au_id, authors.au_lname, authors.au_fname , publishers.pub_name
having authors.au_id is not null and authors.au_lname is not null and authors.au_lname is not null and  publishers.pub_name is not null;

select authors.au_id, authors.au_lname, authors.au_fname , sum(sales.qty), count(titleauthor.title_id)
from authors 
left join titleauthor 
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id =  titles.title_id
left join sales
on titles.title_id = sales.title_id 
group by authors.au_id, authors.au_lname, authors.au_fname 
having authors.au_id is not null and authors.au_lname is not null and authors.au_lname is not null
order by count(titleauthor.title_id) desc
limit 3;

select authors.au_id, authors.au_lname, authors.au_fname , coalesce(sum(sales.qty),0), count(titleauthor.title_id)
from authors 
left join titleauthor 
on authors.au_id=titleauthor.au_id
left join titles
on titleauthor.title_id =  titles.title_id
left join sales
on titles.title_id = sales.title_id 
group by authors.au_id, authors.au_lname, authors.au_fname 
having authors.au_id is not null and authors.au_lname is not null and authors.au_lname is not null
order by count(titleauthor.title_id) desc
limit 23;



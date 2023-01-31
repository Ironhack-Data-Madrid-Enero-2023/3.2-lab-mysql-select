-- w Challenge 1 & 2
select AuthorID, `Last Name`, `First Name`, Publisher, count(title) as `Title count` from

(select authors.au_id as AuthorID, au_lname as `Last Name`, au_fname as `First Name`, title as `Title`, pub_name as `Publisher` from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join publishers on titles.pub_id = publishers.pub_id) as tabla

group by AuthorID
order by `title count` desc;

-- w Challenge 3

select authors.au_id as AuthorID, au_lname as `Last Name`, au_fname as `First Name`, sum(qty) as Total from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join sales on sales.title_id = titles.title_id

group by AuthorID
order by Total desc
limit 3;

-- w Challenge 4

select authors.au_id as AuthorID, au_lname as `Last Name`, au_fname as `First Name`, ifnull(sum(sales.qty), 0) as Total from authors
left join titleauthor on authors.au_id = titleauthor.au_id
left join titles on titles.title_id = titleauthor.title_id
left join sales on sales.title_id = titles.title_id

group by AuthorID
order by Total desc
;
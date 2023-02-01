select ta.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", t.title "TITLE", p.pub_name "PUBLISHER"
from titleauthor ta
left join authors a on ta.au_id = a.au_id
left join titles t on ta.title_id = t.title_id
left join publishers p on t.pub_id = p.pub_id

;


select ta.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", p.pub_name "PUBLISHER", count(t.title) "TITLE COUNT"
from titleauthor ta
left join authors a on ta.au_id = a.au_id
left join titles t on ta.title_id = t.title_id
left join publishers p on t.pub_id = p.pub_id
group by ta.au_id, p.pub_id
order by count(t.title) desc


;


select a.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", sum(s.qty) "TOTAL"
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join sales s on ta.title_id = s.title_id
group by a.au_id
order by sum(s.qty) desc
limit 3

;

select a.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", coalesce(sum(s.qty), 0) "TOTAL"
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join sales s on ta.title_id = s.title_id
group by a.au_id
order by sum(s.qty) desc;



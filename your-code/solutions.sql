select a.au_id as Authors_id, a.au_lname as Last_name, a.au_fname as First_name, count(t.title) as Title_count, pub_name as Publisher

from authors as a
left join titleauthor as ta
on a.au_id=ta.au_id
left join titles as t
on t.title_id=ta.title_id
left join publishers as pub
on t.pub_id=pub.pub_id

group by Authors_id, Publisher
order by au_lname desc
;

select a.au_id as Author_id, au_fname as First_Name, au_lname as Last_name , qty as Total

from authors as a
left join titleauthor as tit
on a.au_id=tit.au_id
left join titles as t
on tit.title_id=t.title_id
left join sales as s
on t.title_id=s.title_id
order by Total desc
limit 3

;
select a.au_id as Author_id, au_fname as First_Name, au_lname as Last_name , coalesce(sum(qty), 0) as Total

from authors as a
left join titleauthor as tit
on a.au_id=tit.au_id
left join titles as t
on tit.title_id=t.title_id
left join sales as s
on t.title_id=s.title_id
group by Author_id, First_name, Last_name
order by Total desc
;





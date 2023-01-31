-- SOLUTION 1
select a.au_id as AUTHOR_ID , a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, pub.pub_name as PUBLISHERS
from authors a
left join titleauthor as ta
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as pub
on pub.pub_id = t.pub_id
where pub.pub_name is not null

-- SOLUTION 2

select AUTHOR_ID, LAST_NAME,FIRST_NAME,publishers,count(PUBLISHERS) as TITLE_COUNT
from
(select a.au_id as AUTHOR_ID , a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, pub.pub_name as PUBLISHERS
from authors a
left join titleauthor as ta
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as pub
on pub.pub_id = t.pub_id
where pub.pub_name is not null) as SOL1

group by author_Id, PUBLISHERs;

-- SOLUTION 3

select AUTHOR_ID,LAST_NAME,FIRST_NAME, sum(sales) as TOTAL_SALES
from
(select a.au_id as AUTHOR_ID , a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, pub.pub_name as PUBLISHERS, s.qty as SALES
from authors a
left join titleauthor as ta
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as pub
on pub.pub_id = t.pub_id
left join sales as s
on s.title_id = t.title_id

where pub.pub_name is not null and s.qty is not null) as SOL2 

group by author_ID
order by TOTAL_SALES DESC

limit 5 -- 3rd has repeated values

-- SOLUTION 4

select AUTHOR_ID,LAST_NAME,FIRST_NAME, sum(sales) as TOTAL_SALES
from
(select a.au_id as AUTHOR_ID , a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, t.title as TITLE, pub.pub_name as PUBLISHERS, coalesce(s.qty,0) as SALES
from authors a
left join titleauthor as ta
on ta.au_id = a.au_id
left join titles as t
on ta.title_id = t.title_id
left join publishers as pub
on pub.pub_id = t.pub_id
left join sales as s
on s.title_id = t.title_id) as SOL2 

group by author_ID
order by TOTAL_SALES DESC




select a.au_id as 'Author ID', 
au_lname as 'Last Name', 
au_fname as 'First Name',
coalesce(sum(qty),0) as quantity


from authors as a
left join titleauthor as ta
on a.au_id = ta.au_id
left join titles as t
on ta.title_id = t.title_id
left join sales as s
on t.title_id = s.title_id

group by a.au_id
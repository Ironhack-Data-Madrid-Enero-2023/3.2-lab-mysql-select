SELECT * from sales;

select authors.au_id as 'AUTHOR_ID', authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
	from authors 
    
	left join titleauthor
    on authors.au_id=titleauthor.au_id
    
    left join titles
    on titles.title_id=titleauthor.title_id
    
    left join publishers
    on publishers.pub_id=titles.pub_id
    ;
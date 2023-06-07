--Q1 Who is the senior most employee based on job title..??

select * from employee
order by levels desc
limit 1 

--Q2 Which Countries have the most Invoices..??

select count(*)as c, billing_country
from invoice
group by billing_country
order by c desc
--Q3 What are top 3 values of total invoice

select total from invoice
order by total Desc 
limit 3

/* Q4 Which city has the best customers..?? We Would like to throw a promotional Music Festival in the
city we made the most money. write a query that returns one city that has highest sum of invoice totals.
Return both the city name and sum of all invoice table*/

Select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total Desc
limit 1 

/* Q5 Who is the best Customer..? The customer who has spent most money will be declared the best customer*/

lect customer.customer_id, customer.first_name,customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id = invoice.customer_id
Group by customer.customer_id
order by total desc 
limit 1


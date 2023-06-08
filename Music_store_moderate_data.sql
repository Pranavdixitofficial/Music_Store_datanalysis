/* Q1) Write a querry to return the email, first_name,
last_name and genre of all rock music listeners, return
list ordered alphabetically by email starting with A.?*/

select email, first_name, last_name
from customer
join invoice on  customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
where track_id in (
	select track_id from track
	join genre on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email asc 

/* Q2) Lets invite the artist who have written the most 
rock music in our data set. Write a querry that returns Artist name and
total track count of top 10 rock bands */

select artist.artist_id,artist.name, count(artist.artist_id) as number_of_songs
from track
join album on album.album_id = track.album_id
join artist on artist.artist_id = album.artist_id
join genre on genre.genre_id = track.genre_id
where genre.name like 'rock'
group by artist.artist_id
order by number_of_songs desc
limit 10

/* Ruturn all the track names thgat have a song lenth longer than
average song length. return the name and milliseconds or each track. order by
the song length with longest songs listed first. */

Select track.name , track.milliseconds from track 
where milliseconds > (
	select avg(milliseconds) as avg_track_length
	from track
)
order by milliseconds
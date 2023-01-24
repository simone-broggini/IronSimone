USE sakila;

#1 Which actor has appeared in the most films?

select first_name, last_name, count(film_id) from actor
inner join film_actor
using(actor_id)
group by actor_id
order by count(film_id) desc
limit 1;

#2 Most active customer (the customer that has rented the most number of films)

select first_name, last_name, count(rental_id) from customer
inner join rental
using (customer_id)
group by customer_id
order by count(rental_id) desc
limit 1;

#3 List number of films per category

select `name`, count(film_id) from category
inner join film_category
using(category_id)
group by category_id;

#4 Display the first and last names, as well as the address, of each staff member

select first_name, last_name, address from staff
inner join address
using(address_id);

#5 get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.

select title, `name` from film
inner join language
using(language_id)
where `name` = 'English' and title LIKE 'M%' or `name`='italian' and title LIKE 'M%'
order by title desc;

#6 Display the total amount rung up by each staff member in August of 2005.

select first_name, last_name, sum(amount) from staff
inner join payment
using(staff_id)
where payment_date LIKE '2005-08%'
group by staff_id;

#7 List each film and the number of actors who are listed for that film.

select title, count(actor_id) from film
inner join film_actor
using (film_id)
group by film_id
order by count(actor_id) desc
limit 10;

#8 Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select first_name, last_name, sum(amount) from customer
inner join payment
using (customer_id)
group by customer_id
order by last_name;

#9 Write sql statement to check if you can find any actor who never particiapted in any film.

select first_name, last_name, count(film_id) from actor
inner join film_actor
using (actor_id)
group by actor_id
having count(film_id)=0;

#10 get the addresses that have NO customers, and ends with the letter "e"

select address from address
left join customer
using (address_id)
where customer_id is null and address like '%e';

#Optional: what is the most rented film?

select title from film
inner join inventory
using(film_id)
inner join rental
using(inventory_id)
group by film_id
order by count(rental_id) desc
limit 1;




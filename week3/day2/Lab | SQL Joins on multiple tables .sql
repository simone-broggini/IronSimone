use sakila;

#1 Write a query to display for each store its store ID, city, and country.

select store_id, city, country from store
inner join address
using (address_id) 
inner join city
using(city_id)
inner join country
using (country_id);

#2 Write a query to display how much business, in dollars, each store brought in.

select store_id, sum(amount) from payment
left join customer
using(customer_id)
left join store
using (store_id)
group by store_id;

select store_id, sum(amount) from payment
inner join staff
using(staff_id)
inner join store
using (store_id)
group by store_id;

#3 What is the average running time(length) of films by category?

select round(avg(length),2), name from category
inner join film_category
using(category_id)
inner join film
using (film_id)
group by category_id;

#4 Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)

select round(avg(length),2), name from category
inner join film_category
using(category_id)
inner join film
using (film_id)
group by category_id
order by round(avg(length),2) desc
limit 5;

#5 Display the top 5 most frequently(number of times) rented movies in descending order.

select title from film
inner join inventory
using(film_id)
inner join rental
using(inventory_id)
group by film_id
order by count(rental_id) desc
limit 5;

#6 List the top five genres in gross revenue in descending order.

select name, sum(amount) from category
inner join film_category
using(category_id)
inner join inventory
using (film_id)
inner join rental
using(inventory_id)
inner join payment
using (rental_id)
group by category_id
order by sum(amount) desc
limit 5;

#7 Is "Academy Dinosaur" available for rent from Store 1?

select title, count(film_id) from inventory
inner join film
using (film_id)
where title='Academy Dinosaur' and store_id=1;



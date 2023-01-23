USE sakila;

#Select one column from a table and alias it. Get unique list of film languages under the alias language
select distinct name as unique_name FROM film, language;

# Find out how many stores does the company have?
SELECT * FROM sakila.store;

# Find out how many employees staff does the company have?
SELECT * FROM sakila.staff;

# Return a list of employee first names only
SELECT first_name FROM sakila.staff;
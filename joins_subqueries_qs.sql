--1. List all customers who live in Texas.

SELECT customer.first_name,customer.last_name,address.district
FROM customer
JOIN address 
ON customer.address_id = address.address_id
WHERE address.district = 'Texas';

--2. Get all payments above $6.99 with the customer's first name.

SELECT customer.first_name
FROM customer
JOIN payment
ON customer.customer_id = payment.customer_id
WHERE payment.amount > 6.99;

--3. Show all customers' names who have made payments over $175 (use subqueries).

SELECT customer.first_name,customer.last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount)
);

--4. List all customers that live in Nepal (use the city table).

SELECT customer.first_name,customer.last_name,country.country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city 
ON address.city_id = city.city_id
JOIN country
ON country.country_id = city.country_id
WHERE country.country = 'Nepal';

--5. Which staff member had the most transactions?
--Jon Stephens, #2

SELECT payment.staff_id,COUNT(payment.staff_id)
FROM payment
JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY payment.staff_id
ORDER BY payment.staff_id DESC;

--6. How many movies of each rating are there?

SELECT rating,COUNT(rating)
FROM film
GROUP BY rating
ORDER BY count DESC;

--7. Show all customers who have made a single payment over 6.99 (use subqueries)

SELECT first_name,last_name
FROM customer
WHERE customer_id IN (
 	SELECT customer_id
 	FROM payment
	GROUP BY customer_id, amount
 	HAVING amount > 6.99 AND COUNT(amount) = 1
);

--8. How many free rentals did our stores give away?

SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00





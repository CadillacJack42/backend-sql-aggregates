-- CUBE of amount made per year, month, day, and film rating
-- similar to exercise 9 but include the rating with joins
-- replace ROLLUP with CUBE
SELECT
    film.rating,
    SUM(amount),
    EXTRACT (YEAR FROM payment_date) AS y,
    EXTRACT (MONTH FROM payment_date) AS m,
    EXTRACT (DAY FROM payment_date) AS d
FROM
    payment
INNER JOIN
    rental
ON
    payment.rental_id = rental.rental_id
INNER JOIN
    inventory
ON
    inventory.inventory_id = rental.inventory_id
INNER JOIN
    film
ON
    film.film_id = inventory.film_id
GROUP BY
    CUBE(film.rating, y, m, d)
ORDER BY
    film.rating,
    y,
    m,
    d;
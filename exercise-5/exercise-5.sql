-- the total run time of all inventory items if they were all played back to back
SELECT
    SUM(film.length)
FROM
    inventory
INNER JOIN
    film
ON
    inventory.film_id = film.film_id;

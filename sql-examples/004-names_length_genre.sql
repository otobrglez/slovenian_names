SELECT
    genre as n_genre,
	LENGTH(name) as name_length,
    (SELECT COUNT(*) from names WHERE LENGTH(name) = name_length AND genre = n_genre) as number_of_names
FROM names
GROUP BY genre, name_length
ORDER BY number_of_names DESC, name_length ASC
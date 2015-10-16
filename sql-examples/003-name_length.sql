SELECT
	LENGTH(name) as name_length,
    (SELECT COUNT(*) from names WHERE LENGTH(name) = name_length) as number_of_names
FROM names
GROUP BY name_length
ORDER BY name_length
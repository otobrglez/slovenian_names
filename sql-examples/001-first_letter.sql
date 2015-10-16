SELECT
	LEFT(name,1) as first_letter,
    (SELECT COUNT(*) from names WHERE LEFT(name,1) = first_letter) as number_of_names
FROM names GROUP BY first_letter
ORDER BY first_letter
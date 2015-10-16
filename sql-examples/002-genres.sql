SELECT 
	genre as g,
	(SELECT COUNT(*) from names WHERE genre = g) as number_of_genres
FROM names
GROUP BY names.genre
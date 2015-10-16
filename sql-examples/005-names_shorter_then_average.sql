SELECT
	name,
	CHAR_LENGTH(name) as name_length
FROM names
WHERE genre = 'm'
HAVING name_length < (SELECT AVG(CHAR_LENGTH(name)) FROM names)
ORDER BY name_length ASC, name ASC
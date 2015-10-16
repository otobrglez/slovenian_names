SELECT
	name, CHAR_LENGTH(name) as name_length, genre
FROM names
WHERE genre = 'f'
HAVING
		(name_length != (SELECT MAX(CHAR_LENGTH(name)) FROM names) AND
        name_length != (SELECT MIN(CHAR_LENGTH(name)) FROM names) AND
        name_length != (SELECT CEIL(AVG(CHAR_LENGTH(name))) FROM names) AND
        name_length != (SELECT FLOOR(AVG(CHAR_LENGTH(name))) FROM names)) AND
        NOT IF(LOCATE('Š',UPPER(name)) +
		LOCATE('Č',UPPER(name)) +
		LOCATE('Ž',UPPER(name)) +
		LOCATE('Ć',UPPER(name)) > 0, true, false) AND
        (left(name,1) = right(name,1)) AND
        (name_length % 2 = 1)
ORDER BY
	genre, name_length ASC, name ASC
        

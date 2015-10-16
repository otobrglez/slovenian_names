SELECT
	name,
	IF(LOCATE('Š',UPPER(name)) +
    LOCATE('Č',UPPER(name)) +
    LOCATE('Ž',UPPER(name)) +
    LOCATE('Ć',UPPER(name)) > 0, true, false) as sumnik,
    CHAR_LENGTH(name) as name_length
FROM names
HAVING sumnik = 1 AND name_length < (SELECT AVG(CHAR_LENGTH(name)) FROM names)
ORDER BY name_length ASC
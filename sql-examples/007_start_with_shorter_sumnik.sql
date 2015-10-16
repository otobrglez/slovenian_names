SELECT
	LEFT(name,1) as first_letter,
    (SELECT COUNT(*) from names WHERE LEFT(name,1) = first_letter AND IF(LOCATE('Š',UPPER(name)) +
		LOCATE('Č',UPPER(name)) +
		LOCATE('Ž',UPPER(name)) +
		LOCATE('Ć',UPPER(name)) > 0, true, false) = 1) as number_of_names,
    IF(LOCATE('Š',UPPER(name)) +
		LOCATE('Č',UPPER(name)) +
		LOCATE('Ž',UPPER(name)) +
		LOCATE('Ć',UPPER(name)) > 0, true, false) as sumnik
FROM names
WHERE CHAR_LENGTH(name) < 5
GROUP BY sumnik, first_letter
HAVING sumnik = 0
ORDER BY first_letter
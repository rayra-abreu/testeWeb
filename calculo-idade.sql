DELIMITER $
CREATE FUNCTION fn_age (currentDate DATE, birthday DATE, op CHAR(1))
RETURNS INT
BEGIN
	DECLARE calculateAge INT;
    
	CASE 
		WHEN  op = 'D' THEN
			SET calculateAge = (SELECT DATEDIFF(currentDate, birthday));
		WHEN op = 'M' THEN
			SET calculateAge = (TIMESTAMPDIFF (MONTH, birthday, currentDate));
		WHEN op = 'A' THEN
			SET calculateAge = (SELECT YEAR(currentDate) - YEAR(birthday));
		ELSE 
			SET calculateAge = (SELECT TIMESTAMPDIFF (YEAR, birthday, currentDate));
    END CASE;

    RETURN calculateAge;
END
$

DELIMITER ;

SELECT fn_age(CURDATE(), '2000-12-01', 'D') AS 'Idade em dias';
SELECT fn_age(CURDATE(), '2000-12-01', 'M') AS 'Idade em meses';
SELECT fn_age(CURDATE(), '2000-12-01', 'A') AS 'Idade em anos';
SELECT fn_age(CURDATE(), '2000-12-01', 'I') AS 'Idade Completa';

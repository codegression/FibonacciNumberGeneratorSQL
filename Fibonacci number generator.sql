/*Retrieves the first 45 fibonacci numbers*/

DROP FUNCTION IF EXISTS Fib;
DELIMITER $$
CREATE FUNCTION Fib(value INT)	
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE Ret BIGINT;
	
    IF value <= 2 THEN
		SET Ret := 1;
	ELSE
		SET @Temp := @A + @B;
		SET @B := @A;
		SET @A := @Temp;    
		SET Ret := @Temp;
	END IF;
	RETURN Ret;
END
$$
DELIMITER ;
SET @A = 1;
SET @B = 1;
SET @Temp = 0;
SELECT Fib(x*10+w) as Fib 
FROM
(
	(
		SELECT 0 w UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
	) A,
	(
		SELECT 0 x UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
	) B	
) LIMIT 45;
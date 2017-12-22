DROP function cabinet.validerSecu;
delimiter //
CREATE FUNCTION cabinet.validerSecu(numeroSecu VARCHAR(12)) RETURNS INT 
BEGIN
	DECLARE resultat INT DEFAULT 1;
	IF numeroSecu IS NULL THEN SET resultat = 1;
	ELSEIF CHAR_LENGTH(TRIM(numeroSecu)) = 0 THEN SET resultat = 1;
	ELSE
		IF SUBSTRING(numeroSecu,1,1) = '1' OR SUBSTRING(numeroSecu,1,1) = '2' OR SUBSTRING(numeroSecu,1,1) = '8' THEN 
			IF CAST(SUBSTRING(numeroSecu,4,2) AS SIGNED) > 0 AND CAST(SUBSTRING(numeroSecu,4,2) AS SIGNED) <= 12 THEN 
				SET resultat = 0;
			ELSEIF CAST(SUBSTRING(numeroSecu,4,2) AS SIGNED) >= 20 THEN 
				SET resultat = 2;
			END IF;
		END IF;
	END IF;
	RETURN resultat;
END//
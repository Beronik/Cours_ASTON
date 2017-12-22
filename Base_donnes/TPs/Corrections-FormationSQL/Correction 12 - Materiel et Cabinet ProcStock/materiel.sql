delimiter //
CREATE FUNCTION materiel.coutTotal(idFiche INT) RETURNS DECIMAL(10,2) 
BEGIN
	DECLARE resultat DECIMAL(10,2)  DEFAULT 0.0;
	select SUM(materiel.prixJour)*FICHE_LOCATION.dureeEnJour INTO resultat FROM materiel.materiel, materiel.FICHE_LOCATION_CONCERNE_MATERIEL, materiel.FICHE_LOCATION where FICHE_LOCATION.id = idFiche and materiel.id = MATERIEL_id and FICHE_LOCATION.id = FICHE_LOCATION_id;
	RETURN resultat;
END//

delimiter //
CREATE PROCEDURE materiel.cleanOld(OUT nbSupprime INT) 
BEGIN
	DECLARE vEnd INTEGER DEFAULT 0;
	DECLARE vId INT DEFAULT 0;
	DECLARE vResultat INT DEFAULT 0;
	
	DEClARE curseur CURSOR FOR SELECT id FROM materiel.materielASupprimer;

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET vEnd = 1;

	CREATE TEMPORARY TABLE IF NOT EXISTS materiel.materielASupprimer AS (select id FROM materiel.materiel where materiel.dateAchat <= DATE_ADD(NOW(), INTERVAL -5 YEAR));

	OPEN curseur;
	lpId: LOOP
		FETCH curseur INTO vId;
		IF vEnd = 1 THEN 
			LEAVE lpId;
		END IF;		
		UPDATE materiel.materiel SET materiel.etat=1 WHERE materiel.id=vId;
		SET vResultat = vResultat+1;
	END LOOP lpId;

	CLOSE curseur;
	DROP TABLE IF EXISTS materiel.materielASupprimer;
	SET nbSupprime=vResultat;
END//

SET @monResultat= 0;
CALL materiel.cleanOld(@monResultat);
SELECT @monResultat;

-- On ne peut pas supprimer les éléments de materiels sans supprimer les élements de la table de jointure. <= contrainte d'intégrité
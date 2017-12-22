-- ------------
-- Question 2
-- ------------
-- pour la date donnee 2001-01-03 par exemple
select designation 
from materiel.materiel, materiel.FICHE_LOCATION_CONCERNE_MATERIEL, materiel.FICHE_LOCATION 
where materiel.id = MATERIEL_id 
and FICHE_LOCATION.id = FICHE_LOCATION_id 
and (STR_TO_DATE('2001-01-03', '%Y-%m-%d') 
between FICHE_LOCATION.dateDebut and DATE_ADD(FICHE_LOCATION.dateDebut, INTERVAL FICHE_LOCATION.dureeEnJour DAY));

-- ------------
-- Question 3
-- ------------
select materiel.categorie, count(1) 
from materiel.materiel, materiel.FICHE_LOCATION_CONCERNE_MATERIEL, materiel.FICHE_LOCATION 
where materiel.id = MATERIEL_id 
and FICHE_LOCATION.id = FICHE_LOCATION_id 
and (STR_TO_DATE('2001-01-03', '%Y-%m-%d') 
between FICHE_LOCATION.dateDebut 
and DATE_ADD(FICHE_LOCATION.dateDebut, INTERVAL FICHE_LOCATION.dureeEnJour DAY)) 
group by materiel.categorie;

-- ------------
-- Question 4
-- ------------
-- preliminaire
select client.id, client.nom, CONCAT(adresse.numero, ' ', adresse.nomRue,' ', adresse.nomVille), adresse.codePostal 
from materiel.client, materiel.adresse 
where client.adresse_id=adresse.id 
order by adresse.codePostal ASC;

-- la vue
create view materiel.clientAdresse (clientId, clientNom, adresse, adresseCodePostal) AS 
    (select client.id, client.nom, CONCAT(adresse.numero, ' ', adresse.nomRue,' ', adresse.nomVille), adresse.codePostal 
     from materiel.client, materiel.adresse 
     where client.adresse_id=adresse.id 
     order by adresse.codePostal ASC);
     
-- ------------
-- Question 5
-- ------------     
select SUM(materiel.prixJour)*FICHE_LOCATION.dureeEnJour 
from materiel.materiel, materiel.FICHE_LOCATION_CONCERNE_MATERIEL, materiel.FICHE_LOCATION 
where FICHE_LOCATION.id = 1 
and materiel.id = MATERIEL_id 
and FICHE_LOCATION.id = FICHE_LOCATION_id;	
	
-- ------------   
-- Question 6
-- ------------     
delimiter //
CREATE TRIGGER materiel.majDateFinBi BEFORE INSERT ON materiel.FICHE_LOCATION FOR EACH ROW 
BEGIN
	SET NEW.dateFinCalculee = DATE_ADD(NEW.dateDebut, INTERVAL NEW.dureeEnJour DAY);
END//
CREATE TRIGGER materiel.majDateFinBu BEFORE UPDATE ON materiel.FICHE_LOCATION FOR EACH ROW 
BEGIN
	SET NEW.dateFinCalculee = DATE_ADD(NEW.dateDebut, INTERVAL NEW.dureeEnJour DAY);
END//

delimiter ;

-- Date de debut 2001-02-01 => date de fin calculee passera a 2001-02-06
update materiel.FICHE_LOCATION set dureeEnJour = 5 where id = 2;
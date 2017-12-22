-- ------------
-- Question 1
-- ------------
-- on fait passer le script revuesInserts.sql

-- ------------
-- Question 2
-- ------------
-- Preliminaire
select etudiant.Nom, entreprise.Nom, enseignant.Nom 
from convention, etudiant, entreprise, enseignant, propositionstage 
where convention.PropositionStage_numero=propositionstage.numero 
and propositionstage.Entreprise_numero=entreprise.numero 
and convention.Enseignant_numero=enseignant.numero 
and convention.Etudiant_numero=etudiant.numero;

-- La vue demandée 
drop view if exists v_et_en_ens;
create view V_ET_EN_ENS (nomEtudiant, nomEntreprise, nomEnseignant) 
as (select etudiant.Nom, entreprise.Nom, enseignant.Nom 
    from convention, etudiant, entreprise, enseignant, propositionstage 
    where convention.PropositionStage_numero=propositionstage.numero 
    and propositionstage.Entreprise_numero=entreprise.numero 
    and convention.Enseignant_numero=enseignant.numero 
    and convention.Etudiant_numero=etudiant.numero);

-- ------------
-- Question 3
-- ------------
-- Ajout
ALTER TABLE convention DROP column dateFin;
ALTER TABLE convention ADD COLUMN dateFin DATE NULL;

-- calcul de la date de fin pour toutes les conventions
select date_add(DateDebut, interval Duree day) 
from propositionstage, convention 
where propositionstage.numero=convention.PropositionStage_numero;

-- le trigger pour remplir la columne
drop trigger if exists majDateFinConv;
delimiter //
CREATE TRIGGER majDateFinConv BEFORE UPDATE ON propositionstage FOR EACH ROW 
BEGIN
	DECLARE df DATE;
	select date_add(convention.DateDebut, interval NEW.Duree day) into df 
    from convention 
    where NEW.numero=convention.PropositionStage_numero;
	update convention SET dateFin=df 
    where NEW.numero=PropositionStage_numero;
END//

delimiter ;

-- ------------
-- Question 4
-- ------------
SELECT distinct(entreprise.Nom) 
FROM entreprise, propositionstage 
where propositionstage.remuneration is not null 
and propositionstage.remuneration > 0 
and propositionstage.Entreprise_numero=entreprise.numero;

-- ------------
-- Question 5
-- ------------
select entreprise.Nom, propositionstage.numero 
FROM entreprise, propositionstage, convention 
where propositionstage.numero not in (select convention.PropositionStage_numero 
                                      from convention)  
and propositionstage.Entreprise_numero=entreprise.numero 
group by propositionstage.numero;

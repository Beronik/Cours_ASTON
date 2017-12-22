-- -------------
-- Question 1
-- -------------
-- lancement du script fouillInserts.sql

-- -------------
-- Question 2
-- -------------
select count(objet.numero), categorie 
from objet 
where Equipe_numero=1 
group by categorie 
order by dateDecouverte asc;

-- -------------
-- Question 3
-- -------------
select nom 
from chercheurs 
where Equipe_numero=1 
and directeur=1;

-- -------------
-- Question 4
-- -------------
-- preliminaire pour trouver les equipes qui ont trouve des objets
select sitesfouille.ville, objet.designation, equipe.nom 
from equipe, sitesfouille, objet, parcelle 
where objet.Parcelle_numero=parcelle.numero 
and parcelle.SitesFouille_numero=sitesfouille.numero 
and objet.Equipe_numero=equipe.numero;

-- La vue
create view V_OBJ_E_V (ville, designationObj, nomEquipe) 
as (select sitesfouille.ville, objet.designation, equipe.nom 
    from equipe, sitesfouille, objet, parcelle 
    where objet.Parcelle_numero=parcelle.numero 
    and parcelle.SitesFouille_numero=sitesfouille.numero 
    and objet.Equipe_numero=equipe.numero);

-- -------------
-- Question 5
-- -------------
select count(designationObj), nomEquipe 
from V_OBJ_E_V 
group by nomEquipe;
    
	

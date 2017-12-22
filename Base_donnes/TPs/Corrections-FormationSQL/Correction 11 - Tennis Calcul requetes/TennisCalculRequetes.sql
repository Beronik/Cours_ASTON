use tennis;

-- ------------
-- Question 1
-- ------------
select distinct nomJoueur, Prime
from GAIN
where NomSponsor ='Peugeot'
and Annee between 1985 and 1990;

-- ------------
-- Question 2
-- ------------
-- avec des alias pour mieux visualiser
select j.Nom, j.Age
from joueur j , gain g
where g.LieuTournoi = 'Roland Garros' 
and g.Annee = 1989
and j.Nom = g.nomJoueur;

-- ------------
-- Question 3
-- ------------
-- 1ere solution le sponsor Peugeot et le gain d'un rencontre
-- ne sont pas forcement la meme annee
select Nom, Nationalite
from joueur, rencontre, gain
where LieuTournoi = 'Roland Garros'
and sponsor = 'Peugeot'
and nom = NomGagnant 
and nom = nomJoueur;

-- 2ieme solution : le sponspor et le gain sont la meme annee.
select Nom, Nationalite
from joueur j, rencontre r, gain g
where LieuTournoi = 'Roland Garros'
and sponsor = 'Peugeot'
and nom = NomGagnant 
and nom = nomJoueur
and g.annee = r.annee;

-- ------------
-- Question 4 : intersept alternative
-- ------------
-- 1ere possibilite
select nom, Nationalite
from joueur
where nom in (select distinct nomJoueur
			  from gain
			  where LieuTournoi = 'Roland Garros'
			  and annee = 1985) 
and nom in (select distinct nomJoueur 
			from gain
			where LieuTournoi = 'Wimbledon' 
            and annee = 1985);

-- 2ieme possibilite
select j.nom, j.nationalite
from joueur j, gain g1, gain g2
where j.nom = g1.nomjoueur
and g1.LieuTournoi = 'Roland Garros'
and g1.annee = 1985
and j.nom = g2.nomJoueur
and g2.LieuTournoi = 'Wimbledon'
and g2.annee= 1985;

-- ------------
-- Question 5 : except alternative
-- ------------
-- 1ere possibilite les joueurs n'ont pas participe à tous les 
-- tournois de Roland Garros
select distinct nomjoueur
from gain 
where LieuTournoi = 'Roland Garros'
and nomJoueur not in (select distinct nomjoueur
					  from gain
					  where LieuTournoi = 'Roland Garros'
                      and Prime <=100000);
                      
-- 2ieme possibilite : on peut imposer que la prime soit superieure à 100000€
select nomjoueur
from gain
where LieuTournoi = 'Roland Garros'
group by Nomjoueur
having Min(Prime) > 100000;

-- ------------
-- Question 6
-- ------------
-- 1ere possibilite
select distinct nomPerdant
from rencontre
where not exists (select *
				  from rencontre
                  where NomGagnant = NomPerdant);
                  
-- 2ieme possibilite
select distinct NomPerdant
from rencontre
where NomPerdant not in (select NomGagnant 
                         from rencontre);
                         
-- -----------
-- Question 7
-- -----------
select nom 
from joueur
where nom in (select distinct NomPerdant
			  from rencontre
              where LieuTournoi='Wimbledon'
              and not exists (select *
							  from rencontre 
                              where LieuTournoi = 'Wimbledon'
                              and nomPerdant = NomGagnant)
			)
and nom in (select distinct NomGagnant
			from rencontre
            where LieuTournoi = 'Roland Garros'
            and not exists (select * 
							from rencontre
                            where LieuTournoi = 'Roland Garros'
                            and NomGagnant = NomPerdant)
			);

-- ------------
-- Question 8
-- ------------
-- <> ou != equivalent
select j1.Nom, j1.prenom, j2.Nom, j2.prenom            
from joueur j1, joueur j2, rencontre r1
where j1.nom != j2.nom
and j1.nom = r1.nomGagnant
and j2.nom = r2.NomPerdant
and not exists (select nomGagnant, NomPerdant
				from rencontre r2
                where j1.nom = r2.NomPerdant
                and j2.nom = r2.NomGagnant);
                
-- ------------
-- Question 9
-- ------------
select nom, prenom, age, nationalite
from joueur, gain
where nom = nomJoueur;


-- ------------
-- Question 10
-- ------------           
select nom, prenom, prime
from joueur RIGHT JOIN gain
ON nom = nomjoueur;

-- ------------
-- Question 11
-- ------------
select annee, count(distinct Nom)
from Gain
where LieuTournoi = 'Wimbledon' 
and annee = 1989;                

-- ------------
-- Question 12
-- ------------
select annee, avg(all prime)
from gain
group by annee;

-- ------------
-- Question 13
-- ------------
insert into joueur values ('Noah', 'Yannick',26, 'FR');

-- ------------
-- Question 14
-- ------------
update joueur
set age = 50
where nom = 'Noah';

-- ------------
-- Question 15
-- ------------
update joueur
set age = age +1;
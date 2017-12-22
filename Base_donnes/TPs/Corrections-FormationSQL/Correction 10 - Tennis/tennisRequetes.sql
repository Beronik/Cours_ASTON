use tennis;
   
-- Question 2   
alter table joueur add (NumeroSecu char(13) not null unique);

-- Question 3
alter table gain add (NumeroSecu char(13) references joueur(NumeroSecu));
alter table gain drop Nomjoueur;
alter table gain add constraint c4 primary key (NumeroSecu,Annee, LieuTournoi); 

-- Question 4
alter table gain modify (Prime real check (Prime >= 1000 and Prime <= 100000);

-- Question 5
alter table gain modify NomSponsor varchar (20);

-- Question 6
drop table sponsor;

-- Question 7
alter table gain modify (NomSponsor varchar(20));

-- Question 8 : en SQL normalise
-- exemple on peut supprimer l'attribut prime si la somme des primes est nulle
alter table gain drop prime if sum(prime)=0;

-- Question 9 : en SQL normalise
-- exemple on peut supprimer la table sponsor si elle est vide
drop table sponsor if count(select * from sponsor)=0;

-- Question 10 : en SQL normalise
-- exemple suppresoin d'une table si la somme des primes est inferieure à 1000
drop table sponsor if sum(prime < 1000);
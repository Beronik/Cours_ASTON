-- Base de donnee 
CREATE SCHEMA IF NOT EXISTS tennis;

USE tennis;

-- table JOUEUR
CREATE TABLE IF NOT EXISTS JOUEUR (
	Nom varchar (20) primary key not null,
    Prenom varchar(20),
    Age integer check (Age >= 16 and Age <=45),
    Nationalite char(2));
    
-- table RENCONTRE	
CREATE TABLE IF NOT EXISTS RENCONTRE (
	NomGagnant varchar (20) not null references JOUEUR(Nom),
    NomPerdant varchar (20) not null references JOUEUR(Nom),
    LieuTournoi char(15) not null,
    Annee integer not null,
    Score char (15),
    constraint C1 unique (NomGagnant, NomPerdant, LieuTournoi, Annee));
    
-- table GAIN 
-- real => double   
CREATE TABLE IF NOT EXISTS GAIN (
	NomJoueur varchar (20) not null references JOUEUR(Nom),
    LieuTournoi char(15) not null,
    Annee integer not null,
    Rang integer,
    Prime real default 0,
    NomSponsor varchar(20) references SPONSOR(Nom),
    constraint c2 unique (NomJoueur, LieuTournoi, Annee));

-- table SPONSOR
CREATE TABLE IF NOT EXISTS SPONSOR (
	Nom varchar(20) not null primary key,
    LieuTournoi char (25),
    Annee integer,
    Adresse varchar (100),
    MtContribution real);
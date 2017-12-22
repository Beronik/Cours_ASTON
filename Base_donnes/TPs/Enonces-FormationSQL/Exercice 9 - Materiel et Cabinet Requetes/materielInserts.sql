insert into materiel.adresse set numero='12', nomRue='rue de la pleine', nomVille='Paris', codePostal=75001;
insert into materiel.adresse set numero='3 bis', nomRue='rue de la fontaine', nomVille='Paris', codePostal=75002;
insert into materiel.adresse set numero='4', nomRue='rue d\'Italie', nomVille='Paris', codePostal=75003;
insert into materiel.adresse set numero='104', nomRue='rue du Louvre', nomVille='Paris', codePostal=75004;
insert into materiel.adresse set numero='2 ter', nomRue='avenue de la mer', nomVille='Paris', codePostal=75005;

insert into materiel.client set nom='Dupont', type=1, telephone='0148624578', ADRESSE_id=1;
insert into materiel.client set nom='Durand', type=1, telephone='0642624528', ADRESSE_id=2;
insert into materiel.client set nom='Smith', type=1, telephone='0948623538', ADRESSE_id=3;
insert into materiel.client set nom='Skywalker', type=1, telephone='0748654518', ADRESSE_id=4;
insert into materiel.client set nom='Yitachi', type=1, telephone='0848124378', ADRESSE_id=5;

insert into materiel.fiche_location set dureeEnJour=5, dateDebut='2001-01-01', CLIENT_id=1;
insert into materiel.fiche_location set dureeEnJour=2, dateDebut='2001-02-01', CLIENT_id=2;
insert into materiel.fiche_location set dureeEnJour=15, dateDebut='2001-01-02', CLIENT_id=3;
insert into materiel.fiche_location set dureeEnJour=1, dateDebut='2001-04-01', CLIENT_id=4;
insert into materiel.fiche_location set dureeEnJour=6, dateDebut='2001-05-01', CLIENT_id=5;

insert into materiel.materiel set designation='Tracteur', dateAchat='1999-01-01', prixJour=150, categorie='MI';
insert into materiel.materiel set designation='Chaise', dateAchat='1999-01-02', prixJour=9.3, categorie='OB';
insert into materiel.materiel set designation='Perceuse', dateAchat='1999-01-03', prixJour=25.5, categorie='OI';
insert into materiel.materiel set designation='Marteau', dateAchat='1999-01-03', prixJour=5, categorie='OI';
insert into materiel.materiel set designation='Bureau', dateAchat='1999-01-03', prixJour=5, categorie='OB';
insert into materiel.materiel set designation='Lampe', dateAchat='1999-01-03', prixJour=3.3, categorie='OB';

insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=1, MATERIEL_id=1;
insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=1, MATERIEL_id=2;
insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=1, MATERIEL_id=3;
insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=2, MATERIEL_id=4;
insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=3, MATERIEL_id=5;
insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=4, MATERIEL_id=6;
insert into materiel.FICHE_LOCATION_CONCERNE_MATERIEL set FICHE_LOCATION_id=5, MATERIEL_id=1;

-- Equipes 
INSERT INTO `fouille`.`equipe` (`nom`, `sigle`) VALUES ('Equipe 1', 'Ours');
INSERT INTO `fouille`.`equipe` (`nom`, `sigle`) VALUES ('Equipe 2', 'Aigle');
INSERT INTO `fouille`.`equipe` (`nom`, `sigle`) VALUES ('Equipe 3', 'Chien');
INSERT INTO `fouille`.`equipe` (`nom`, `sigle`) VALUES ('Equipe 4', 'Chat');

-- sitesfouille
INSERT INTO `fouille`.`sitesfouille` (`Ville`) VALUES ('Paris');
INSERT INTO `fouille`.`sitesfouille` (`Ville`) VALUES ('Dublin');
INSERT INTO `fouille`.`sitesfouille` (`Ville`) VALUES ('Chaville');
INSERT INTO `fouille`.`sitesfouille` (`Ville`) VALUES ('Versailles');

-- Checrheurs
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Smith', 'Jhon', 'Historien', 1, 0);
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Dupont', 'Serge', 'Botaniste', 1, 0);
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Dupond', 'Arlette', 'Chef', 1, 1);
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Arzon', 'Jean', 'Mathematicien', 2, 0);
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Thyen', 'Pierre', 'Informaticien', 2, 0);
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Roland', 'Sara', 'Chef', 2, 1);
INSERT INTO `fouille`.`chercheurs` (`nom`, `prenom`, `fonction`, `Equipe_numero`, `directeur`) VALUES ('Grund', 'Franck', 'Chef', 3, 1);

-- equipe_fouille_sitesfouille
INSERT INTO `fouille`.`equipe_fouille_sitesfouille` (`Equipe_numero`, `SitesFouille_numero`, `Date`) VALUES ('1', '1', '2012-03-01');
INSERT INTO `fouille`.`equipe_fouille_sitesfouille` (`Equipe_numero`, `SitesFouille_numero`, `Date`) VALUES ('1', '2', '2013-03-01');
INSERT INTO `fouille`.`equipe_fouille_sitesfouille` (`Equipe_numero`, `SitesFouille_numero`, `Date`) VALUES ('1', '3', '2014-03-01');
INSERT INTO `fouille`.`equipe_fouille_sitesfouille` (`Equipe_numero`, `SitesFouille_numero`, `Date`) VALUES ('2', '2', '2010-03-01');
INSERT INTO `fouille`.`equipe_fouille_sitesfouille` (`Equipe_numero`, `SitesFouille_numero`, `Date`) VALUES ('3', '4', '2015-03-01');

-- parcelle
INSERT INTO `fouille`.`parcelle` (`longueur`, `largeur`, `SitesFouille_numero`) VALUES ('5', '5', '1');
INSERT INTO `fouille`.`parcelle` (`longueur`, `largeur`, `SitesFouille_numero`) VALUES ('10', '10', '2');
INSERT INTO `fouille`.`parcelle` (`longueur`, `largeur`, `SitesFouille_numero`) VALUES ('20', '20', '3');
INSERT INTO `fouille`.`parcelle` (`longueur`, `largeur`, `SitesFouille_numero`) VALUES ('50', '50', '4');

INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a1', 'c1', 'cp1', 'Bonne', '2012-03-02', 1, 1);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a2', 'c2', 'cp2', 'Mauvaise', '2012-03-02', 1, 1);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a3', 'c2', 'cp3', 'Très bonne', '2013-02-03', 1, 1);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a4', 'c4', 'cp4', 'Bonne', '2013-03-02', 1, 2);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a5', 'c5', 'cp5', 'Mauvaise', '2013-03-02', 1, 2);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a6', 'c6', 'cp6', 'Très bonne', '2013-02-03', 1, 2);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a7', 'c7', 'cp7', 'Bonne', '2014-03-02', 3, 1);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a8', 'c8', 'cp8', 'Mauvaise', '2014-03-02', 3,1);
INSERT INTO `fouille`.`objet` (`designation`, `categorie`, `completude`, `conservation`, `dateDecouverte`, `Equipe_numero`, `Parcelle_numero`) VALUES ('a9', 'c9', 'cp9', 'Très bonne', '2014-02-03', 3, 1);


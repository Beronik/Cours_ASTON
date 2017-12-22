INSERT INTO `stages`.`entreprise` (`Nom`, `Adresse`) VALUES ('SQLI', 'Somewhere');
INSERT INTO `stages`.`entreprise` (`Nom`, `Adresse`) VALUES ('GFI', 'Elsewhere');
INSERT INTO `stages`.`entreprise` (`Nom`, `Adresse`) VALUES ('Apple', 'Somewhere else');

INSERT INTO `stages`.`etudiant` (`Nom`, `Prenom`) VALUES ('Smith', 'Jhon');
INSERT INTO `stages`.`etudiant` (`Nom`, `Prenom`) VALUES ('Dupond', 'Jacques');
INSERT INTO `stages`.`etudiant` (`Nom`, `Prenom`) VALUES ('Durand', 'Sahra');
INSERT INTO `stages`.`etudiant` (`Nom`, `Prenom`) VALUES ('Thien', 'Alexandra');

INSERT INTO `stages`.`enseignant` (`Nom`) VALUES ('Pauzer');
INSERT INTO `stages`.`enseignant` (`Nom`) VALUES ('Almat');
INSERT INTO `stages`.`enseignant` (`Nom`) VALUES ('Gardarin');
INSERT INTO `stages`.`enseignant` (`Nom`) VALUES ('Dubosck');

INSERT INTO `stages`.`propositionstage` (`sujet_propose`, `DateProposition`, `Duree`, `Remuneration`, `Entreprise_numero`) VALUES ('Faire le cafe', '2013-01-01', 25, 500, 1);
INSERT INTO `stages`.`propositionstage` (`sujet_propose`, `DateProposition`, `Duree`, `Remuneration`, `Entreprise_numero`) VALUES ('Faire la cuisine', '2014-01-01', 40, 300, 1);
INSERT INTO `stages`.`propositionstage` (`sujet_propose`, `DateProposition`, `Duree`, `Remuneration`, `Entreprise_numero`) VALUES ('Faire le menage', '2013-02-01', 50, 2500, 2);
INSERT INTO `stages`.`propositionstage` (`sujet_propose`, `DateProposition`, `Duree`, `Remuneration`, `Entreprise_numero`) VALUES ('Faire les copies', '2013-03-01', 5, 1500, 2);
INSERT INTO `stages`.`propositionstage` (`sujet_propose`, `DateProposition`, `Duree`, `Remuneration`, `Entreprise_numero`) VALUES ('Faire la plonge', '2015-01-01', 5, 505, 3);
INSERT INTO `stages`.`propositionstage` (`sujet_propose`, `DateProposition`, `Duree`, `Remuneration`, `Entreprise_numero`) VALUES ('Repondre au telephone', '2014-01-01', 35, 500, 3);

INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (1, 1, '2013-01-01');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (2, 2, '2013-01-02');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (3, 3, '2013-01-03');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (4, 1, '2013-01-04');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (1, 2, '2014-01-01');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (2, 3, '2014-01-02');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (3, 1, '2014-01-03');
INSERT INTO `stages`.`etudiant_contact_entreprise` (`Etudiant_numero`, `Entreprise_numero`, `DatePriseContact`) VALUES (4, 2, '2014-01-04');


INSERT INTO `stages`.`convention` (`RemunerationFinale`, `SujetMemoire`, `DateDebut`, `DateSignature`, `DerniereDateVisiteEnseignant`, `Etudiant_numero`, `PropositionStage_numero`, `Enseignant_numero`) VALUES (2500, 'Mon sujet 1', '2013-01-01', '2013-01-01', '2013-02-01', 1, 1, 1);
INSERT INTO `stages`.`convention` (`RemunerationFinale`, `SujetMemoire`, `DateDebut`, `DateSignature`, `DerniereDateVisiteEnseignant`, `Etudiant_numero`, `PropositionStage_numero`, `Enseignant_numero`) VALUES (2500, 'Mon sujet 2', '2014-01-01', '2014-01-01', '2014-02-01', 2, 2, 2);
INSERT INTO `stages`.`convention` (`RemunerationFinale`, `SujetMemoire`, `DateDebut`, `DateSignature`, `DerniereDateVisiteEnseignant`, `Etudiant_numero`, `PropositionStage_numero`, `Enseignant_numero`) VALUES (2500, 'Mon sujet 3', '2013-02-01', '2013-02-04', '2013-04-01', 1, 3, 3);
INSERT INTO `stages`.`convention` (`RemunerationFinale`, `SujetMemoire`, `DateDebut`, `DateSignature`, `DerniereDateVisiteEnseignant`, `Etudiant_numero`, `PropositionStage_numero`, `Enseignant_numero`) VALUES (2500, 'Mon sujet 4', '2013-03-01', '2013-03-10', '2013-06-01', 3, 4, 4);
INSERT INTO `stages`.`convention` (`RemunerationFinale`, `SujetMemoire`, `DateDebut`, `DateSignature`, `DerniereDateVisiteEnseignant`, `Etudiant_numero`, `PropositionStage_numero`, `Enseignant_numero`) VALUES (2500, 'Mon sujet 5', '2015-01-01', '2015-01-01', '2015-08-01', 4, 5, 1);

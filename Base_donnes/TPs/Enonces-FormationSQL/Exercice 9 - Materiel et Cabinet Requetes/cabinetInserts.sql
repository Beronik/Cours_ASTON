insert into cabinet.adresse set numero=12, rue='rue de la pleine', ville='Paris', codePostal=75001;
insert into cabinet.adresse set numero=3, rue='rue de la fontaine', ville='Paris', codePostal=75002;
insert into cabinet.adresse set numero=4, rue='rue d\'Italie', ville='Paris', codePostal=75003;
insert into cabinet.adresse set numero=104, rue='rue du Louvre', ville='Paris', codePostal=75004;
insert into cabinet.adresse set numero=2, rue='avenue de la mer', ville='Paris', codePostal=75005;
insert into cabinet.adresse set numero=58, rue='rue du pont', ville='Paris', codePostal=75006;

insert into cabinet.infirmiere set numeroProf=100, nom='Sulfen', sex=1, prenom='Mathieu', telephoneDom='0138077798', telVoiture='0732017798', adresse_id=4;
insert into cabinet.infirmiere set numeroProf=200, nom='Pyrol', sex=2, prenom='Alice', telephoneDom='0934011980', telVoiture='06124565', adresse_id=5;
insert into cabinet.infirmiere set numeroProf=202, nom='Ruteis', sex=2, prenom='Stéphanie', telephoneDom='0715789360', telVoiture='06465646', adresse_id=6;

insert into cabinet.patient set nom='Dupont', prenom='Jean', sex=1, dateNaissance='1964-01-11', numerosecu='111122222222', telephone='0138057198', adresse_id=1, infirmiere_id=1;
insert into cabinet.patient set nom='Durant', prenom='Alphonse', sex=1, dateNaissance='1973-07-01', numerosecu='111122222222', telephone='0145651898', adresse_id=2, infirmiere_id=2;
insert into cabinet.patient set nom='Smith', prenom='Miranda', sex=2, dateNaissance='1990-01-05', numerosecu='211122222222', telephone='0148622798', adresse_id=3, infirmiere_id=3;

insert into cabinet.deplacement set date='2001-01-01', cout=10, patient_id=1;
insert into cabinet.deplacement set date='2001-01-02', cout=20, patient_id=1;
insert into cabinet.deplacement set date='2001-01-03', cout=22, patient_id=1;
insert into cabinet.deplacement set date='2001-01-01', cout=100, patient_id=2;
insert into cabinet.deplacement set date='2001-01-02', cout=200, patient_id=2;
insert into cabinet.deplacement set date='2001-01-03', cout=100, patient_id=3;
insert into cabinet.deplacement set date='2001-01-04', cout=200, patient_id=3;

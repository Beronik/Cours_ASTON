insert into revue.revue set nom='Linux Magazine', periodicite=1;
insert into revue.revue set nom='Windows', periodicite=1;
insert into revue.revue set nom='Informatique', periodicite=1;
insert into revue.revue set nom='l\'histoire', periodicite=2;

insert into revue.auteur set nom='Dupont', prenom='Jean', email='secret@aol.com';
insert into revue.auteur set nom='Durant', prenom='Henry', email='secret@aol.com';
insert into revue.auteur set nom='Jhons', prenom='Indiana', email='secret@aol.com';

insert into revue.article set titre='Titre article 1', contenu='bla bla bla';
insert into revue.article set titre='Titre article 2', contenu='bla bla bla';
insert into revue.article set titre='Titre article 3', contenu='bla bla bla';
insert into revue.article set titre='Titre article 4', contenu='bla bla bla';
insert into revue.article set titre='Titre article 5', contenu='bla bla bla';
insert into revue.article set titre='Titre article 6', contenu='bla bla bla';

insert into revue.auteur_ecrit set auteur_id=1, article_id=1;
insert into revue.auteur_ecrit set auteur_id=1, article_id=2;
insert into revue.auteur_ecrit set auteur_id=2, article_id=3;
insert into revue.auteur_ecrit set auteur_id=2, article_id=4;
insert into revue.auteur_ecrit set auteur_id=3, article_id=5;
insert into revue.auteur_ecrit set auteur_id=3, article_id=6;

insert into revue.publication set annee='2013', nbpages='5', revue_id=1;
insert into revue.publication set annee='2012', nbpages='7', revue_id=1;
insert into revue.publication set annee='2014', nbpages='5', revue_id=2;
insert into revue.publication set annee='2016', nbpages='5', revue_id=3;
insert into revue.publication set annee='2004', nbpages='5', revue_id=1;
insert into revue.publication set annee='2004', nbpages='15', revue_id=1;
insert into revue.publication set annee='2004', nbpages='15', revue_id=4;

insert into revue.ARTICLE_EST_PUBLIE set article_id=1, NUMERO_id=1, pagedebut=3, pagefin=6;
insert into revue.ARTICLE_EST_PUBLIE set article_id=1, NUMERO_id=2, pagedebut=7, pagefin=10;
insert into revue.ARTICLE_EST_PUBLIE set article_id=3, NUMERO_id=3, pagedebut=5, pagefin=16;
insert into revue.ARTICLE_EST_PUBLIE set article_id=3, NUMERO_id=1, pagedebut=5, pagefin=16;
insert into revue.ARTICLE_EST_PUBLIE set article_id=4, NUMERO_id=4, pagedebut=5, pagefin=16;
insert into revue.ARTICLE_EST_PUBLIE set article_id=6, NUMERO_id=7, pagedebut=5, pagefin=16;


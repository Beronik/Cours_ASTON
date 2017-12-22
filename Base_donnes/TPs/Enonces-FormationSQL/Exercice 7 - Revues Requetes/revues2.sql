select *from article;

select *from article_est_publie;

select *from article_fait_reference;

select *from article;

select *from revue;

select count(idNumero)
from revue, publication 
where nom ='Linux Magazine'
and annee = '2004'
and idRevue = REVUE_id;

select REVUE_id from publication, article_est_publie
where publication.idNumero = NUMERO_id
and NUMERO_id = 1;

select distinct(REVUE_id) from publication, article_est_publie
where publication.idNumero = NUMERO_id
and NUMERO_id = 1;


select titre from article, article_est_publie ;

select distinct(titre), idArticle
from article, article_est_publie, publication 
where ARTICLE_id = idArticle
and NUMERO_id = idNumero; 



select distinct(idArticle)
from article
where idArticle not in 
(select distinct(idArticle)
from article, article_est_publie, publication 
where ARTICLE_id = idArticle
and NUMERO_id = idNumero); 


select idArticle
from article left join article_est_publie
on idArticle = ARTICLE_id
where NUMERO_id is null;

select idArticle
from article left join article_est_publie
on idArticle = ARTICLE_id;

select *from article_est_publie; 


select*from revue;

select distinct(ARTICLE_id) 
from article_est_publie, revue, publication
where revue.nom = 'l\'histoire'
and NUMERO_id = idNumero
and REVUE_id = idRevue;



select auteur.nom 
from auteur_ecrit, publication, revue, article, auteur, article_est_publie
where idRevue = REVUE_id
and idNumero = NUMERO_id
and article_est_publie.ARTICLE_id = idArticle
and idArticle = auteur_ecrit.ARTICLE_id
and AUTEUR_id = idAuteur
and revue.nom = 'l\'histoire'
and annee = '2004'; 







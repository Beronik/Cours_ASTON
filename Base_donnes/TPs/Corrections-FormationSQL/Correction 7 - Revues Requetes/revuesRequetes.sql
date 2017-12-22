use revue;
-- ------------
-- question 1
-- ------------
select count(idNumero) 
from revue, publication 
where nom='Linux Magazine' 
and annee='2004'
and idrevue=revue_id ;

-- ------------
-- question 2
-- ------------
select distinct(idRevue)
from revue, publication, article_est_publie 
where ARTICLE_id = 1
and NUMERO_id = idNumero 
and idRevue = revue_id;

-- ------------
-- question 3
-- ------------
select distinct(titre) 
from article, article_est_publie
where article_id = idArticle;

-- ------------
-- question 4
-- ------------
select distinct(idArticle)
from article, article_est_publie
where idArticle not in ( 
select distinct(idArticle)
from article, article_est_publie
where article_id = idArticle);

-- autre possibilite
select idArticle
from article LEFT JOIN article_est_publie
ON idArticle = ARTICLE_id
where NUMERO_id is NULL;

-- ------------
-- question 5
-- ------------
select idarticle, titre 
from article, revue, publication, article_est_publie 
where nom='l\'histoire' 
and article_id = idArticle 
and NUMERO_id = idNumero 
and idRevue = revue_id;

-- ------------
-- question 6
-- ------------
select auteur.nom  
from auteur, auteur_ecrit, article, revue, publication, article_est_publie 
where revue.nom='l\'histoire' 
and annee='2004'
and article_est_publie.article_id=ARTICLE.idArticle
and NUMERO_id = idNumero 
and idRevue = revue_id 
and auteur_id = idauteur 
and auteur_ecrit.article_id=ARTICLE.idArticle;


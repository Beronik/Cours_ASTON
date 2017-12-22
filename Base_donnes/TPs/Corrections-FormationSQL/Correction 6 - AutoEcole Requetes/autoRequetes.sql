-- ------------
-- question 1
-- ------------
select * from client 
where dateNaissance  < '1980-01-01';

-- ------------
-- question 2
-- ------------
select * from seance_code, client_has_seance_code 
where CLIENT_clientId = 1 
and estExamen = TRUE
and seanceId = SEANCE_CODE_seanceId ;

-- autre possibilite
select * from seance_code JOIN client_has_seance_code
ON estExamen = 1
AND CLIENT_clientId = 1
AND seanceId = SEANCE_CODE_seanceId;

-- ------------
-- question 3 
-- ------------
-- 1 requete => rapide
select nom from client, client_has_seance_code 
where clientid=client_clientid 
order by nbFautes desc limit 1;

-- autre solution, par exemple : 2 requetes
select nom from client, client_has_seance_code
where clientId = CLIENT_clientId 
and nbFautes = (select max(nbFautes) from client_has_seance_code);

-- ------------
-- question 4
-- ------------
select nom, nbFautes, SEANCE_CODE_seanceId
from client, client_has_seance_code
where clientId = CLIENT_clientId
AND nbFautes = (select min(nbFautes) from client_has_seance_code);

-- autres solutions
select nom, nbFautes, SEANCE_CODE_seanceId from client
inner join client_has_seance_code 
on clientId = CLIENT_clientId 
where nbFautes = (select min(nbFautes) from client_has_seance_code);                  
   
-- ------------
-- question 5 
-- ------------
select intitule 
from question, serie_has_question
where serie_has_question.SERIE_serieId = 1
and QUESTION_questionId = questionId;

-- ------------
-- question 6 
-- ------------
select nom, prenom
from client, CLIENT_has_SEANCE_CODE, SEANCE_CODE 
where estExamen=1 
and nbFautes > 5 
and clientid=client_clientid group by clientId; 


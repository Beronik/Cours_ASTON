select * from auto.client ;

select * from auto.client where dateNaissance < '1980-01-01';

select * from seance_code, client_has_seance_code 
where CLIENT_clientId = 1
and seanceId = SEANCE_CODE_seanceId;

select * from seance_code join client_has_seance_code
on estExamen = 1
and CLIENT_clientId = 1
and seanceId = SEANCE_CODE_seanceId; 

select CLIENT_clientId, max(nbfautes) from client_has_seance_code group by CLIENT_clientId;

select nom from client, client_has_seance_code
where clientId = CLIENT_clientId
and nbFautes = (select max(nbFautes) from client_has_seance_code) ; 

select nom, nbFautes from client, client_has_seance_code
where clientId = CLIENT_clientId
order by nbFautes desc; 

select intitule from question, serie_has_question
where serie_has_question.SERIE_serieId = 1
and QUESTION_questionId = questionId;

select nom, prenom, clientId
from seance_code client, client_has_seance_code
where estExamen = 1
and nbFautes > 5
and CLIENT_clientId = clientId
and SEANCE_seanceId = seanceId
group by clientId; 






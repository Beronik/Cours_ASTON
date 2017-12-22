
create view cabinet.patientInfirmiere (nomPatient, telephonePatient, nomInfirmiere, telephoneInfirmiere) AS 
	select CONCAT(UPPER(patient.nom), ' ', patient.prenom), patient.telephone, CONCAT(UPPER(infirmiere.nom), ' ', infirmiere.prenom), infirmiere.telephoneDom from cabinet.patient, cabinet.infirmiere where infirmiere.id=patient.INFIRMIERE_id order by patient.nom ASC, patient.prenom ASC;;

select count(distinct(infirmiere_id)) from cabinet.deplacement, cabinet.patient where date='2001-01-01' and patient.id=deplacement.patient_id;
select sum(deplacement.cout) from cabinet.deplacement, cabinet.patient where patient.infirmiere_id=1 and patient.id=deplacement.patient_id;
select sum(deplacement.cout) from cabinet.deplacement where patient_id=1;

drop trigger cabinet.majPatientBi;
delimiter //
CREATE TRIGGER cabinet.majPatientBi BEFORE INSERT ON cabinet.patient FOR EACH ROW 
BEGIN
	SET NEW.sex = CONVERT(SUBSTRING(NEW.numerosecu, 1, 1), SIGNED);
END//

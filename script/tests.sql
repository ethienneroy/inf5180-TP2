-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin MATM05059000
--  Olivier Pinneau PINO09089300
--  Ethienne Roy
--  Emanuel Gonthier GONE27069202
-- ==========================================

-- *********************************************
-- Script de test des triggers
-- *********************************************


SET LINESIZE 160
SET ECHO ON

-- ****************************************************************************
-- Les données nomP, prenomP, nomM, prenomM, nomMed, nom, titre, et diagnostic doivent toujours être connues.
INSERT INTO DossierPatient VALUES(6, NULL,'prenom' , 'M', 'GONE92062712', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK;
INSERT INTO DossierPatient VALUES(6,'nom' , NULL, 'M', 'GONE92062712', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK;
INSERT INTO Docteur VALUES(3, NULL,'prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
ROLLBACK;
INSERT INTO Docteur VALUES(3, 'nom', NULL, 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
ROLLBACK;
INSERT INTO Medicament VALUES(5, NULL, 2.99, 1);
ROLLBACK;
INSERT INTO Salle VALUES(4, NULL);
ROLLBACK;
INSERT INTO TypeChirurgie VALUES(4, NULL, 'description');
ROLLBACK;
INSERT INTO Categorie VALUES(3, NULL, 'description');
ROLLBACK;
INSERT INTO Specialite VALUES(4, NULL, 'description');
ROLLBACK;
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), NULL, 13);
ROLLBACK;

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101012', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
UPDATE DossierPatient SET NomP = NULL
WHERE NumDos = 6;
ROLLBACK;

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101012', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
UPDATE DossierPatient SET PrenomP = NULL
WHERE NumDos = 6;
ROLLBACK;

INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
UPDATE Docteur SET NomM = NULL
WHERE Matricule = 3;
ROLLBACK;

INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
UPDATE Docteur SET PrenomP = NULL
WHERE Matricule = 3;
ROLLBACK;

INSERT INTO Medicament VALUES(5, 'NomM' , 2.99, 1);
UPDATE Medicament SET NomM = NULL
WHERE IdMed = 5;
ROLLBACK;

INSERT INTO Salle VALUES(4, 'Nom' );
UPDATE Salle SET Nom = NULL
WHERE IdSalle = 4;
ROLLBACK;

INSERT INTO TypeChirurgie VALUES(4, 'Nom' , 'description');
UPDATE TypeChirurgie SET Nom = NULL
WHERE IdType = 4;
ROLLBACK;

INSERT INTO Categorie VALUES(3, 'Nom', 'description');
UPDATE Categorie SET Nom = NULL
WHERE IdCategorie = 3;
ROLLBACK;

INSERT INTO Specialite VALUES(4, 'Titre', 'description');
UPDATE Specialite SET Titre = NULL
WHERE Code = 4;
ROLLBACK;


-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même salle qui se chevauche dans la plage horaire.
--Permis
INSERT INTO Chirurgie VALUES(7, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 18:10:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 18:20:00', 'yyyy-mm-dd hh24:mi:ss'));
--Non Permis
INSERT INTO Chirurgie VALUES(8, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 18:05:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 18:20:00', 'yyyy-mm-dd hh24:mi:ss'));

-- ****************************************************************************
-- Toutes les valeurs (nbBoites, prix, etc.) ont une valeur par défaut à 0 et prennent des valeurs positives.
--Non Permis
INSERT INTO OrdonnanceMedicaments VALUES(11, 3, -10);
ROLLBACK;
--Permis
INSERT INTO OrdonnanceMedicaments VALUES(11, 3, 2);
--Non Permis
UPDATE OrdonnanceMedicaments SET NbBoites = -10
WHERE NumOrd = 11 AND IdMed = 2;
ROLLBACK;
--Non Permis
INSERT INTO OrdonnanceMedicaments VALUES(12, 3, NULL);
SELECT NumOrd FROM OrdonnanceMedicaments
WHERE NumOrd = 12 AND NbBoites != 0;
ROLLBACK;

--Non Permis
INSERT INTO Medicament VALUES(5, 'NomM' , -10, 1);
ROLLBACK;

INSERT INTO Medicament VALUES(5, 'NomM' , 2, 1);
--Non Permis
UPDATE Medicament SET Prix = -5
WHERE IdMed = 5;
ROLLBACK;

--Permis
INSERT INTO Medicament VALUES(5, 'NomM' , NULL, 1);
SELECT IdMed FROM Medicament
WHERE IdMed = 5 AND Prix != 0;
ROLLBACK;

-- ****************************************************************************
-- Le champ sexe peut avoir uniquement les valeurs ‘F’ et ‘M’.
--Permis
INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101013', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK;
--Non Permis
INSERT INTO DossierPatient VALUES(7,'nom', 'prenom', 'Z', 'GONE90101014', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK;

-- ****************************************************************************
-- Il ne peut pas y avoir deux médicaments avec le même nom et la même catégorie.
--Non Permis
INSERT INTO Medicament VALUES(5, 'nom', 2.99, 1);
INSERT INTO Medicament VALUES(6, 'nom', 2.99, 1);
ROLLBACK;

-- ****************************************************************************
-- Les niveaux autorisés sont : Étudiant, Interne, ou Docteur et
--Non Permis
INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Stagiaire', 0, 0);
ROLLBACK;
--Permis
INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
ROLLBACK;

-- ****************************************************************************
-- les types autorisés sont : Chirurgie ou Médicaments.
--Non Permis
INSERT INTO Ordonnance VALUES(14, 'repos', 'Experimentation', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 2);
ROLLBACK;
--Permis
INSERT INTO Ordonnance VALUES(14, 'repos', 'Chirurgie', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 2);
ROLLBACK;

-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même ordonnance avec le même rang.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Chirurgie', TO_DATE('1996-12-02', 'yyyy-mm-dd'), 0);
INSERT INTO OrdonnanceChirurgie VALUES(14, 1, 1);
--Non Permis
INSERT INTO OrdonnanceChirurgie VALUES(14, 2, 1);
--Permis
INSERT INTO OrdonnanceChirurgie VALUES(14, 3, 2);
ROLLBACK;

-- ****************************************************************************
-- Le type de la salle opératoire doit correspondre au type de la chirurgie.
INSERT INTO Salle VALUES(4, 'salle');
INSERT INTO SpecialisationsSalle VALUES(2, 4, TO_DATE('2002-02-06', 'yyyy-mm-dd'));
--Permis
INSERT INTO Chirurgie VALUES(15, 2, 4, TO_DATE('2002-02-06', 'yyyy-mm-dd'), TO_DATE('2016-12-18 17:01:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-11 18:01:00', 'yyyy-mm-dd hh24:mi:ss'));
--Non Permis
INSERT INTO Chirurgie VALUES(16, 1, 4, TO_DATE('2002-02-07', 'yyyy-mm-dd'), TO_DATE('2016-12-19 17:01:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-11 18:01:00', 'yyyy-mm-dd hh24:mi:ss'));
ROLLBACK;

-- ****************************************************************************
-- Le détail de l’ordonnance (ORDONNANCECHIRURGIE ou ORDONNANCEMEDICAMENTS) doit correspondre au type d’ordonnance.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Medicaments', TO_DATE('1970-06-07', 'yyyy-mm-dd'), 0);
--Non Permis
INSERT INTO OrdonnanceChirurgie VALUES(14, 6, 1);
ROLLBACK;

INSERT INTO Ordonnance VALUES(14, 'repos', 'Medicaments', TO_DATE('1970-06-07', 'yyyy-mm-dd'), 0);
--Permis
INSERT INTO OrdonnanceMedicaments VALUES(14, 2, 1);
ROLLBACK;

--You are here
-- ****************************************************************************
-- nbrMoyenMedicaments (nombre moyen de médicaments prescrits par un docteur),
SELECT Matricule, NbrMoyenMedicaments FROM Docteur;

INSERT INTO Ordonnance VALUES(14, 'Prendre le soir', 'Medicaments', TO_DATE('2016-12-30', 'yyyy-mm-dd'), 5);
INSERT INTO OrdonnanceMedicaments VALUES(14, 4, 5);
INSERT INTO Consultation VALUES(5, 1, TO_DATE('2017-12-02', 'yyyy-mm-dd'), 'malade', 14);

SELECT Matricule, NbrMoyenMedicaments FROM Docteur;

SELECT CodeDocteur, NumDos, NumOrd FROM Consultation WHERE CodeDocteur = 5;

ROLLBACK;

-- ****************************************************************************
-- Les nbrPatients (nombre de patients d’un docteur à titre de médecin traitant),
SELECT Matricule, NbrPatients FROM Docteur;

INSERT INTO DossierPatient VALUES(99, 'Gonth', 'Ema', 'M', 'GONE92062799', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 6);
--Should have + 1 from previous select
SELECT Matricule, NbrPatients FROM Docteur;

DELETE FROM DossierPatient WHERE NumDos = 99;
--Should have - 1 from previous select
SELECT Matricule, NbrPatients FROM Docteur;

ROLLBACK;

-- ****************************************************************************
-- La suppression ou la modification d'une ordonnance ou d’un médicament, référencés respectivement dans CONSULTATION ou ORDONNANCE, ne sont pas autorisées.
--Non Permis
DELETE FROM Ordonnance WHERE numOrd = 13;
--Non Permis
DELETE FROM MEDICAMENT WHERE idMed = 1;
ROLLBACK;

-- ****************************************************************************
-- nbrConsultation (nombre total de consultations pour un patient),
INSERT INTO Specialite VALUES(4, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(3, 'Nom','prenom' , 4, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(6, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 3, 0);
INSERT INTO Consultation VALUES(3, 6, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);
--Il devrait y avoir 1 consultation dans le dossier patient
SELECT NumDos, NbrConsultation FROM DossierPatient WHERE NbrConsultation = 1 AND NumDos = 6;
--Il devrait y avoir 2 consultations dans le dossier patient
INSERT INTO Consultation VALUES(1, 6, TO_DATE('2016-12-2', 'yyyy-mm-dd'), 'Mal de pied', null);
SELECT NumDos, NbrConsultation FROM DossierPatient WHERE NbrConsultation = 2 AND NumDos = 6;
--Il devrait y avoir 1 consultation dans le dossier patient
DELETE FROM Consultation WHERE CodeDocteur = 3 AND NumDos = 6;
SELECT NumDos, NbrConsultation FROM DossierPatient WHERE NbrConsultation = 1;
--Delete donnees de test
ROLLBACK;
-- ****************************************************************************
-- nbrMedicaments (nombre de medicaments differents – pas les boîtes- pour une unique ordonnance).
INSERT INTO Categorie VALUES(3, 'Happy Pills', 'Creer du bonheur');
INSERT INTO Ordonnance VALUES(14, 'Prendre le soir', 'Medicaments', TO_DATE('2016-12-30', 'yyyy-mm-dd'), 0);
INSERT INTO Medicament VALUES(5, 'Viagra', 1200, 1);
INSERT INTO Medicament VALUES(6, 'Tylenol', 12, 1);
INSERT INTO OrdonnanceMedicaments VALUES(14, 5, 5);
--Il doit y avoir 1 nbrMedicament
SELECT NumOrd, NbrMedicaments FROM Ordonnance WHERE NumOrd = 14;

INSERT INTO OrdonnanceMedicaments VALUES(14, 6, 15);
--Il doit y avoir 2 nbrMedicament
SELECT NumOrd, NbrMedicaments FROM Ordonnance WHERE NumOrd = 14;

DELETE FROM OrdonnanceMedicaments WHERE NumOrd = 14 AND IdMed = 6;
--Il doit y avoir 1 nbrMedicament 
SELECT NumOrd, NbrMedicaments FROM Ordonnance WHERE NumOrd = 14;

--Delete donnees de test
ROLLBACK;
-- ****************************************************************************
-- La suppression d'un docteur doit entraîner la suppression de ses consultations.
INSERT INTO Specialite VALUES(4, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(3, 'Nom','prenom' , 4, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(6, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 3, 0);
INSERT INTO Consultation VALUES(3, 6, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

DELETE FROM Docteur WHERE Matricule = 3;
--Il ne doit pas y avoir de consultations
SELECT CodeDocteur, NumDos, DateC FROM Consultation WHERE CodeDocteur = 3;
--Delete donnees de test
ROLLBACK;

-- ****************************************************************************
-- la modification d'un docteur doit entraîner la modification de ses consultations.
INSERT INTO Specialite VALUES(4, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(3, 'Nom','prenom' , 4, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(6, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 3, 0);
INSERT INTO Consultation VALUES(3, 6, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

UPDATE Docteur SET Matricule = 4 WHERE Matricule = 3;
-- IL doit y avoir 1 consultation
SELECT CodeDocteur, NumDos, DateC FROM Consultation WHERE CodeDocteur = 4;
--Delete donnees de test
ROLLBACK;   

-- ****************************************************************************
-- La modification d'un patient doit entraîner la modification de ses consultations.
INSERT INTO Specialite VALUES(4, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(3, 'Nom','prenom' , 4, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(6, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 3, 0);
INSERT INTO Consultation VALUES(3, 6, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

UPDATE DossierPatient SET NumDos = 7 WHERE NumDos = 6;
-- IL doit y avoir 1 consultation
SELECT CodeDocteur, NumDos, DateC FROM Consultation WHERE NumDos = 7;
--Delete donnees de test
ROLLBACK;


SET ECHO OFF
SET PAGESIZE 30

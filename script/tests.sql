-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin MATM05059000
--  Olivier Pinneau
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
ROLLBACK
INSERT INTO DossierPatient VALUES(6,'nom' , NULL, 'M', 'GONE92062712', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK
INSERT INTO Docteur VALUES(3, NULL,'prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
ROLLBACK
INSERT INTO Docteur VALUES(3, 'nom', NULL, 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
ROLLBACK
INSERT INTO Medicament VALUES(5, NULL, 2.99, 1);
ROLLBACK
INSERT INTO Salle VALUES(4, NULL);
ROLLBACK
INSERT INTO TypeChirurgie VALUES(4, NULL, 'description');
ROLLBACK
INSERT INTO Categorie VALUES(3, NULL, 'description');
ROLLBACK
INSERT INTO Specialite VALUES(4, NULL, 'description');
ROLLBACK
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), NULL, 13);
ROLLBACK

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101012', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
UPDATE DossierPatient SET NomP = NULL
WHERE NumDos = 6;
ROLLBACK

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101012', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
UPDATE DossierPatient SET PrenomP = NULL
WHERE NumDos = 6;
ROLLBACK

INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
UPDATE Docteur SET NomM = NULL
WHERE Matricule = 3;
ROLLBACK

INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
UPDATE Docteur SET PrenomP = NULL
WHERE Matricule = 3;
ROLLBACK

INSERT INTO Medicament VALUES(5, 'NomM' , 2.99, 1);
UPDATE Medicament SET NomM = NULL
WHERE IdMed = 5;
ROLLBACK

INSERT INTO Salle VALUES(4, 'Nom' );
UPDATE Salle SET Nom = NULL
WHERE IdSalle = 4;
ROLLBACK

INSERT INTO TypeChirurgie VALUES(4, 'Nom' , 'description');
UPDATE TypeChirurgie SET Nom = NULL
WHERE IdType = 4;
ROLLBACK

INSERT INTO Categorie VALUES(3, 'Nom', 'description');
UPDATE Categorie SET Nom = NULL
WHERE IdCategorie = 3;
ROLLBACK

INSERT INTO Specialite VALUES(4, 'Titre', 'description');
UPDATE Specialite SET Titre = NULL
WHERE Code = 4;
ROLLBACK


-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même salle qui se chevauche dans la plage horaire.
INSERT INTO Chirurgie VALUES(1, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 16:00:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 17:00:00', 'yyyy-mm-dd hh24:mi:ss'));
--Permis
INSERT INTO Chirurgie VALUES(2, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 17:10:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 17:20:00', 'yyyy-mm-dd hh24:mi:ss'));
DELETE FROM Chirurgie WHERE IdChirurgie = 2;
--Non Permis
INSERT INTO Chirurgie VALUES(2, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 16:30:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 17:20:00', 'yyyy-mm-dd hh24:mi:ss'));

-- ****************************************************************************
-- Toutes les valeurs (nbBoites, prix, etc.) ont une valeur par défaut à 0 et prennent des valeurs positives.
INSERT INTO OrdonnanceMedicaments VALUES(12, 3, -10);
ROLLBACK

INSERT INTO OrdonnanceMedicaments VALUES(12, 3, 2);
UPDATE OrdonnanceMedicaments SET NbBoites = -10
WHERE NumOrd = 12 AND IdMed = 3;
ROLLBACK

INSERT INTO OrdonnanceMedicaments VALUES(12, 3, NULL);
SELECT NumOrd FROM OrdonnanceMedicaments
WHERE NumOrd = 12 AND NbBoites != 0;
ROLLBACK

INSERT INTO Medicament VALUES(5, 'NomM' , -10, 1);
ROLLBACK

INSERT INTO Medicament VALUES(5, 'NomM' , 2, 1);
UPDATE Medicament SET Prix = -5
WHERE IdMed = 5;
ROLLBACK

INSERT INTO Medicament VALUES(5, 'NomM' , NULL, 1);
SELECT IdMed FROM Medicament
WHERE IdMed = 5 AND Prix != 0;
ROLLBACK


-- ****************************************************************************
-- Le champ sexe peut avoir uniquement les valeurs ‘F’ et ‘M’.
INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'D', 'GONE90101012', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', NULL, 'GONE90101012', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);
ROLLBACK

-- ****************************************************************************
-- Il ne peut pas y avoir deux médicaments avec le même nom et la même catégorie.
INSERT INTO Medicament VALUES(5, 'nom', 2.99, 1);
INSERT INTO Medicament VALUES(6, 'nom', 2.99, 1);
ROLLBACK

-- ****************************************************************************
-- Les niveaux autorisés sont : Étudiant, Interne, ou Docteur et
INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Stagiaire', 0, 0);
ROLLBACK

INSERT INTO Docteur VALUES(3, 'nom', 'prenom', 1, 'Montreal', '103 A Rue Jarry H3K3F9', NULL, 0, 0);
ROLLBACK

-- ****************************************************************************
-- les types autorisés sont : Chirurgie ou Médicaments.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Experimentation', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 2);
ROLLBACK

INSERT INTO Ordonnance VALUES(14, 'repos', NULL, TO_DATE('2016-12-02', 'yyyy-mm-dd'), 2);
ROLLBACK

-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même ordonnance avec le même rang.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Chirurgie', TO_DATE('1996-12-02', 'yyyy-mm-dd'), 0);
INSERT INTO OrdonnanceChirurgie VALUES(14, 1, 1);
INSERT INTO OrdonnanceChirurgie VALUES(14, 2, 1);
ROLLBACK

-- ****************************************************************************
-- Le type de la salle opératoire doit correspondre au type de la chirurgie.
INSERT INTO Salle VALUES(4, 'salle');
INSERT INTO SpecialisationsSalle VALUES(2, 4, TO_DATE('2002-02-06', 'yyyy-mm-dd'));
INSERT INTO Chirurgie VALUES(1, 1, 4, TO_DATE('2002-02-06', 'yyyy-mm-dd'), '16:00:00', '17:00:00');
ROLLBACK

-- ****************************************************************************
-- Le détail de l’ordonnance (ORDONNANCECHIRURGIE ou ORDONNANCEMEDICAMENTS) doit correspondre au type d’ordonnance.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Medicaments', TO_DATE('1970-06-07', 'yyyy-mm-dd'), 0);
INSERT INTO OrdonnanceChirurgie VALUES(14, 6, 1);
ROLLBACK

INSERT INTO Ordonnance VALUES(14, 'repos', 'Chirurgie', TO_DATE('1970-06-07', 'yyyy-mm-dd'), 0);
INSERT INTO OrdonnanceMedicaments VALUES(14, 6, 1);
ROLLBACK

-- ****************************************************************************
-- nbrMoyenMedicaments (nombre moyen de médicaments prescrits par un docteur),

-- ****************************************************************************
-- nbrConsultation (nombre total de consultations pour un patient),
INSERT INTO Specialite VALUES(1, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(1, 'Nom','prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(5, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 1, 0);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);
--Il devrait y avoir 1 consultation dans le dossier patient
SELECT NumDos, NbrConsultation FROM DossierPatient WHERE NbrConsultation = 1;
--Il devrait y avoir 2 consultations dans le dossier patient
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-2', 'yyyy-mm-dd'), 'Mal de pied', null);
SELECT NumDos, NbrConsultation FROM DossierPatient WHERE NbrConsultation = 2;
--Il devrait y avoir 1 consultation dans le dossier patient
DELETE FROM Consultation WHERE CodeDocteur = 1 AND NumDos = 5 AND DateC = TO_DATE('2016-12-2', 'yyyy-mm-dd');
SELECT NumDos, NbrConsultation FROM DossierPatient WHERE NbrConsultation = 1;
--Delete donnees de test
    DELETE FROM Specialite WHERE Code = 1;
    DELETE FROM Consultation WHERE CodeDocteur = 1 AND NumDos = 5 AND DateC = TO_DATE('2016-12-23', 'yyyy-mm-dd');
    DELETE FROM Docteur WHERE Matricule = 1;
    DELETE FROM DossierPatient WHERE NumDos = 5;
-- ****************************************************************************
-- nbrMedicaments (nombre de medicaments differents – pas les boîtes- pour une unique ordonnance).
INSERT INTO Categorie VALUES(1, 'Happy Pills', 'Creer du bonheur');
INSERT INTO Ordonnance VALUES(2, 'Prendre le soir', 'Medicaments', TO_DATE('2016-12-30', 'yyyy-mm-dd'), 0);
INSERT INTO Medicament VALUES(3, 'Viagra', 1200, 1);
INSERT INTO Medicament VALUES(4, 'Tylenol', 12, 1);
INSERT INTO OrdonnanceMedicaments VALUES(2, 3, 5);
--Il doit y avoir 1 nbrMedicament
SELECT NumOrd, NbrMedicaments FROM Ordonnance WHERE NumOrd = 2;

INSERT INTO OrdonnanceMedicaments VALUES(2, 4, 15);
--Il doit y avoir 2 nbrMedicament
SELECT NumOrd, NbrMedicaments FROM Ordonnance WHERE NumOrd = 2;

DELETE FROM OrdonnanceMedicaments WHERE NumOrd = 2 AND IdMed = 4;
--Il doit y avoir 1 nbrMedicament 
INSERT INTO OrdonnanceMedicaments VALUES(2, 4, 15);

--Delete donnees de test
DELETE FROM Categorie WHERE IdCategorie = 1;
DELETE FROM Ordonnance WHERE NumOrd = 2;
DELETE FROM Medicament WHERE IdMed = 3 OR IdMed = 4;
DELETE FROM OrdonnanceMedicaments WHERE NumOrd = 2 AND IdMed = 3;
-- ****************************************************************************
-- La suppression d'un docteur doit entraîner la suppression de ses consultations.
INSERT INTO Specialite VALUES(1, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(1, 'Nom','prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(5, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 1, 0);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

DELETE FROM Docteur WHERE Matricule = 1;
--Il ne doit pas y avoir de consultations
SELECT CodeDocteur, NumDos, DateC FROM Consultation WHERE CodeDocteur = 1;
--Delete donnees de test
    DELETE FROM Specialite WHERE Code = 1;
    DELETE FROM DossierPatient WHERE NumDos = 5;

-- ****************************************************************************
-- la modification d'un docteur doit entraîner la modification de ses consultations.
INSERT INTO Specialite VALUES(1, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(1, 'Nom','prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(5, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 1, 0);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

UPDATE Docteur SET Matricule = 2 WHERE Matricule = 1;
-- IL doit y avoir 1 consultation
SELECT CodeDocteur, NumDos, DateC FROM Consultation WHERE CodeDocteur = 2;
--Delete donnees de test
    DELETE FROM Specialite WHERE Code = 1;
    DELETE FROM Docteur WHERE Matricule = 2; 
    DELETE FROM Consultation WHERE CodeDocteur = 2;
    DELETE FROM DossierPatient WHERE NumDos = 5;

-- ****************************************************************************
-- La suppression d'un patient doit entraîner la modification de ses consultations en donnant la valeur nulle au NumDos.
INSERT INTO Specialite VALUES(1, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(1, 'Nom','prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(5, 'nom','prenom' , 'M', 'GONE92062712', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), null, 0);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

DELETE FROM DossierPatient WHERE NumDos = 5;
--Il doit y avoir null comme NumDos
SELECT CodeDocteur, NumDos, DateC FROM Consultation;
--Delete donnees de test
    DELETE FROM Specialite WHERE Code = 1;
    DELETE FROM Docteur WHERE Matricule = 1; 
    DELETE FROM Consultation WHERE CodeDocteur = 1;    

-- ****************************************************************************
-- La modification d'un patient doit entraîner la modification de ses consultations.
INSERT INTO Specialite VALUES(1, 'Elfe des bois', 'Vous ne passerez pas');
INSERT INTO Docteur VALUES(1, 'Nom','prenom' , 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 0, 0);
INSERT INTO DossierPatient VALUES(5, 'nom', 'prenom', 'M', '123 456 789', TO_DATE('1999-12-31', 'yyyy-mm-dd'), TO_DATE('2016-12-11', 'yyyy-mm-dd'), 1, 0);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-23', 'yyyy-mm-dd'), 'Mal de gorge', null);

UPDATE DossierPatient SET NumDos = 6 WHERE NumDos = 5;
-- IL doit y avoir 1 consultation
SELECT CodeDocteur, NumDos, DateC FROM Consultation WHERE NumDos = 6;
--Delete donnees de test
    DELETE FROM Specialite WHERE Code = 1;
    DELETE FROM Docteur WHERE Matricule = 1; 
    DELETE FROM Consultation WHERE CodeDocteur = 1;
    DELETE FROM DossierPatient WHERE NumDos = 6;


-- ****************************************************************************
-- La suppression ou la modification d'une ordonnance ou d’un médicament, référencés respectivement dans CONSULTATION ou ORDONNANCE, ne sont pas autorisées.


SET ECHO OFF
SET PAGESIZE 30

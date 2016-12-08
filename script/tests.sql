-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin
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
INSERT INTO DossierPatient VALUES(6, NULL,'prenom' , 'M', 'GONE92062712', '1992-06-27', '2016-12-02', 1, 0);
ROLLBACK
INSERT INTO DossierPatient VALUES(6,'nom' , NULL, 'M', 'GONE92062712', '1992-06-27', '2016-12-02', 1, 0);
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

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101012', '1992-06-27', '2016-12-02', 1, 0);
UPDATE DossierPatient SET NomP = NULL
WHERE NumDos = 6;
ROLLBACK

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'M', 'GONE90101012', '1992-06-27', '2016-12-02', 1, 0);
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
INSERT INTO Chirurgie VALUES(7, 1, 1, '2016-12-02', 16:00:00, 17:00:00);
INSERT INTO Chirurgie VALUES(8, 1, 1, '2016-12-02', 16:30:00, 17:30:00);
ROLLBACK

INSERT INTO Chirurgie VALUES(7, 1, 1, '2016-12-02', 16:00:00, 17:00:00);
INSERT INTO Chirurgie VALUES(8, 1, 1, '2016-12-02', 18:00:00, 19:00:00);
UPDATE Chirurgie SET HeureDebut = 16:30:00
WHERE IdChirurgie = 8;
ROLLBACK

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
INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', 'D', 'GONE90101012', '1992-06-27', '2016-12-02', 1, 0);
ROLLBACK

INSERT INTO DossierPatient VALUES(6,'nom', 'prenom', NULL, 'GONE90101012', '1992-06-27', '2016-12-02', 1, 0);
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
INSERT INTO Ordonnance VALUES(14, 'repos', 'Experimentation', '2016-12-02', 2);
ROLLBACK

INSERT INTO Ordonnance VALUES(14, 'repos', NULL, '2016-12-02', 2);
ROLLBACK

-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même ordonnance avec le même rang.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Chirurgie', '1996-12-02', 0);
INSERT INTO OrdonnanceChirurgie VALUES(14, 1, 1);
INSERT INTO OrdonnanceChirurgie VALUES(14, 2, 1);
ROLLBACK

-- ****************************************************************************
-- Le type de la salle opératoire doit correspondre au type de la chirurgie.
INSERT INTO Salle VALUES(4, 'salle');
INSERT INTO SpecialisationsSalle VALUES(2, 4, '2006-02-06');
INSERT INTO Chirurgie VALUES(1, 1, 4, '2006-02-06', 16:00:00, 17:00:00);
ROLLBACK

-- ****************************************************************************
-- Le détail de l’ordonnance (ORDONNANCECHIRURGIE ou ORDONNANCEMEDICAMENTS) doit correspondre au type d’ordonnance.
INSERT INTO Ordonnance VALUES(14, 'repos', 'Medicaments', '1970-06-17', 0);
INSERT INTO OrdonnanceChirurgie VALUES(14, 6, 1);
ROLLBACK

INSERT INTO Ordonnance VALUES(14, 'repos', 'Chirurgie', '1970-06-17', 0);
INSERT INTO OrdonnanceMedicaments VALUES(14, 6, 1);
ROLLBACK

-- ****************************************************************************
-- nbrMoyenMedicaments (nombre moyen de médicaments prescrits par un docteur),

-- nbrConsultation (nombre total de consultations pour un patient),

-- nbrMedicaments (nombre de medicaments differents – pas les boîtes- pour une unique ordonnance).

-- ****************************************************************************
-- La suppression ou la modification d'un docteur doit entraîner la suppression ou la modification de ses consultations.


-- La modification d'un patient doit entraîner la modification de ses consultations.

-- La suppression d'un patient doit entraîner la modification de ses consultations en donnant la valeur nulle au numPat.

-- La suppression ou la modification d'une ordonnance ou d’un médicament, référencés respectivement dans CONSULTATION ou ORDONNANCE, ne sont pas autorisées.


SET ECHO OFF
SET PAGESIZE 30

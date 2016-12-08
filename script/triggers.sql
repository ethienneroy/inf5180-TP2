-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin
--  Olivier Pinneau
--  Ethienne Roy
--  Emanuel Gonthier GONE27069202
-- ==========================================

-- *********************************************
-- Script de creation des triggers
-- *********************************************


SET ECHO ON

-- ****************************************************************************
-- Les données nomP, prenomP, nomM, prenomM, nomMed, nom, titre, et diagnostic doivent toujours être connues.
-- AVEC CONDITIONS NOT NULL ????


-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même salle qui se chevauche dans la plage horaire.
-- CREATE OR REPLACE TRIGGER unique_chir_salle
-- BEFORE INSERT OR UPDATE ON Chirurgie
-- FOR EACH ROW
-- DECLARE
-- selection tous les lignes qvec meme _IdSalle et meme DateChirurgie
-- si :NEW.HeureDebut > HeureDebut autre AND :NEW.HeureDebut < HeureFin
-- OR :NEW.HeureFin > HeureDebut AND :NEW.HeureFin < HeureFin
-- BEGIN
 -- raise_application_error(-20004, 'Il ne peut pas y avoir deux chirurgies pour une même salle qui se chevauche dans la plage horaire.')


-- ****************************************************************************
-- Toutes les valeurs (nbBoites, prix, etc.) ont une valeur par défaut à 0 et prennent des valeurs positives.
-- AVEC CONDITION DEFAULT ????


-- ****************************************************************************
-- Le champ sexe peut avoir uniquement les valeurs ‘F’ et ‘M’.
CREATE OR REPLACE TRIGGER verif_sexe_patient
BEFORE UPDATE OR INSERT OF Sexe ON DossierPatient
FOR EACH ROW
WHEN (NEW.Sexe != 'M' AND NEW.Sexe != 'F')
BEGIN
		raise_application_error(-20001, 'Le champs sexe peut avoir uniquement les valeurs ‘F’ et ‘M’.');
END;
/

-- ****************************************************************************
-- Il ne peut pas y avoir deux médicaments avec le même nom et la même catégorie.
-- AVEC CONDITIONS UNIQUE ????


-- ****************************************************************************
-- Les niveaux autorisés sont : Étudiant, Interne, ou Docteur et
CREATE OR REPLACE TRIGGER verif_niveau_docteur
BEFORE UPDATE OR INSERT OF Niveau ON Docteur
FOR EACH ROW
WHEN (NEW.Niveau != 'Etudiant' OR NEW.Niveau != 'Interne' OR NEW.Niveau != 'Docteur')
BEGIN
		raise_application_error(-20002, 'Les niveaux autorisés sont : Étudiant, Interne, ou Docteur')
END;
/

-- ****************************************************************************
-- les types autorisés sont : Chirurgie ou Médicaments.
CREATE OR REPLACE TRIGGER verif_type_ordonnance
BEFORE UPDATE OR INSERT OF Type ON Ordonnance
FOR EACH ROW
WHEN (NEW.Type != 'Chirurgie' OR NEW.Type != 'Medicaments')
BEGIN
		raise_application_error(-20003, 'Les types autorisés sont : Chirurgie ou Médicaments.')
END;
/

-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même ordonnance avec le même rang.

-- ****************************************************************************
-- Le type de la salle opératoire doit correspondre au type de la chirurgie.

-- ****************************************************************************
-- Le détail de l’ordonnance (ORDONNANCECHIRURGIE ou ORDONNANCEMEDICAMENTS) doit correspondre au type d’ordonnance.

-- ****************************************************************************
-- Les nbrPatients (nombre de patients d’un docteur à titre de médecin traitant),
-- CREATE OR REPLACE TRIGGER nbrPatients_docteur
-- BEFORE UPDATE OR INSERT OF _Matricule ON DossierPatient
-- FOR EACH ROW
-- BEGIN



-- nbrMoyenMedicaments (nombre moyen de médicaments prescrits par un docteur), 
-- nbrConsultation (nombre total de consultations pour un patient),
-- nbrMedicaments (nombre de medicaments differents – pas les boîtes- pour une unique ordonnance).

-- ****************************************************************************
-- La suppression ou la modification d'un docteur doit entraîner la suppression ou la modification de ses consultations.
-- La modification d'un patient doit entraîner la modification de ses consultations.
-- La suppression d'un patient doit entraîner la modification de ses consultations en donnant la valeur nulle au numPat.
-- La suppression ou la modification d'une ordonnance ou d’un médicament, référencés respectivement dans CONSULTATION ou ORDONNANCE, ne sont pas autorisées.


SET ECHO OFF

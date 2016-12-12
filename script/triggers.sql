-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin MATM05059000
--  Olivier Pinneau
--  Ethienne Roy
--  Emanuel Gonthier GONE27069202
-- ==========================================

-- *********************************************
-- Script de creation des triggers
-- *********************************************


SET ECHO ON
-- ****************************************************************************
-- Triggers pour foreign keys
CREATE OR REPLACE TRIGGER update_Docteur_dossierPatient
AFTER DELETE OR UPDATE OF Matricule ON Docteur
FOR EACH ROW
BEGIN
	UPDATE DossierPatient
	SET DossierPatient.Matricule = :NEW.Matricule
	WHERE DossierPatient.Matricule = :OLD.Matricule;
END;
/

-- ****************************************************************************
-- Il ne peut pas y avoir deux chirurgies pour une même salle qui se chevauche dans la plage horaire.
CREATE OR REPLACE TRIGGER update_Docteur_dossierPatient
AFTER DELETE ON Docteur
FOR EACH ROW
BEGIN
	SELECT COUNT(*) INTO sameDayChirurCount FROM Chirurgie
	WHERE IdSalle = :NEW.IdSalle AND DateChirurgie = :NEW.DateChirurgie AND (:NEW.HeureDebut - HeureFin) * 24 * 60 < 0;
	IF sameDayChirurCount > 0 THEN
		raise_application_error(-20004, 'Deux chirurgies ne peuvent etre dans la même salle au meme moment');
	END IF;
END;
/

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
-- Les niveaux autorisés sont : Étudiant, Interne, ou Docteur et
CREATE OR REPLACE TRIGGER verif_niveau_docteur
BEFORE UPDATE OR INSERT OF Niveau ON Docteur
FOR EACH ROW
WHEN (NEW.Niveau != 'Etudiant' AND NEW.Niveau != 'Interne' AND NEW.Niveau != 'Docteur')
BEGIN
		raise_application_error(-20002, 'Les niveaux autorisés sont : Étudiant, Interne, ou Docteur');
END;
/

-- ****************************************************************************
-- les types autorisés sont : Chirurgie ou Médicaments.
CREATE OR REPLACE TRIGGER verif_type_ordonnance
BEFORE UPDATE OR INSERT OF Type ON Ordonnance
FOR EACH ROW
WHEN (NEW.Type != 'Chirurgie' AND NEW.Type != 'Medicaments')
BEGIN
		raise_application_error(-20003, 'Les types autorisés sont : Chirurgie ou Médicaments.');
END;
/

-- ****************************************************************************
-- Le type de la salle opératoire doit correspondre au type de la chirurgie.
CREATE OR REPLACE TRIGGER verif_salle_operatoire
BEFORE UPDATE OR INSERT OF IdType ON Chirurgie
FOR EACH ROW
DECLARE salleCount INTEGER;
BEGIN
	SELECT COUNT(*) INTO salleCount FROM SpecialisationsSalle
	WHERE IdType = :NEW.IdType AND IdSalle = :NEW.IdSalle;
	IF salleCount = 0 THEN
		raise_application_error(-20005, 'La salle operatoire ne correspond pas au type de la chirurgie.');
	END IF;
END;
/

-- ****************************************************************************
-- Le détail de l’ordonnance (ORDONNANCECHIRURGIE ou ORDONNANCEMEDICAMENTS) doit correspondre au type d’ordonnance.
-- ****************************************************************************
-- Les nbrPatients (nombre de patients d’un docteur à titre de médecin traitant),


-- nbrMoyenMedicaments (nombre moyen de médicaments prescrits par un docteur),

-- nbrConsultation (nombre total de consultations pour un patient),
CREATE OR REPLACE TRIGGER nbrConsultation_patient
AFTER DELETE OR INSERT ON Consultation
FOR EACH ROW
BEGIN
  IF INSERTING THEN
    UPDATE DossierPatient
    SET NbrConsultation = NbrConsultation + 1
    WHERE DossierPatient.NumDos = :NEW.NumDos;
  ELSE
    UPDATE DossierPatient
    SET NbrConsultation = NbrConsultation - 1
    WHERE DossierPatient.NumDos = :New.NumDos;
  END IF;
END;
/

-- nbrMedicaments (nombre de medicaments differents – pas les boîtes- pour une unique ordonnance).

-- ****************************************************************************
-- La suppression ou la modification d'une ordonnance ou d’un médicament, référencés respectivement dans CONSULTATION ou ORDONNANCE, ne sont pas autorisées.

-- ****************************************************************************
--  la modification d'un docteur doit entrainer la modification de ses consultations
CREATE OR REPLACE TRIGGER cascade_modifie_docteur
AFTER UPDATE OF Matricule ON Docteur
FOR EACH ROW
BEGIN
  UPDATE Consultation
  SET CodeDocteur = :NEW.Matricule
  WHERE CodeDocteur = :OLD.Matricule;
END;
/

-- ****************************************************************************
--   La modification d'un patient doit entraîner la modification de ses consultations
CREATE OR REPLACE TRIGGER cascade_modifie_dossierPatient
AFTER UPDATE OF NumDos ON DossierPatient
FOR EACH ROW
BEGIN
  UPDATE Consultation
  SET NumDos = :NEW.NumDos
  WHERE NumDos = :OLD.NumDos;
END;
/

SET ECHO OFF

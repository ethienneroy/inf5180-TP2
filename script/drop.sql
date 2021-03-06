-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin MATM05059000
--  Olivier Pinneau
--  Ethienne Roy
--  Emanuel Gonthier GONE27069202
-- ==========================================

SET ECHO ON

DROP TABLE DossierPatient CASCADE CONSTRAINTS;
DROP TABLE Categorie CASCADE CONSTRAINTS;
DROP TABLE Specialite CASCADE CONSTRAINTS;
DROP TABLE Medicament CASCADE CONSTRAINTS;
DROP TABLE Docteur CASCADE CONSTRAINTS;
DROP TABLE Chirurgie CASCADE CONSTRAINTS;
DROP TABLE Consultation CASCADE CONSTRAINTS;
DROP TABLE Ordonnance CASCADE CONSTRAINTS;
DROP TABLE OrdonnanceChirurgie CASCADE CONSTRAINTS;
DROP TABLE OrdonnanceMedicaments CASCADE CONSTRAINTS;
DROP TABLE Salle CASCADE CONSTRAINTS;
DROP TABLE SpecialisationsSalle CASCADE CONSTRAINTS;
DROP TABLE TypeChirurgie CASCADE CONSTRAINTS;

DROP TRIGGER update_Docteur_dossierPatient;
DROP TRIGGER unique_chirur_salle;
DROP TRIGGER verif_sexe_patient;
DROP TRIGGER verif_niveau_docteur;
DROP TRIGGER verif_type_ordonnance;
DROP TRIGGER verif_salle_operatoire;
DROP TRIGGER verif_type_ordoChi;
DROP TRIGGER verif_type_ordoMed;
DROP TRIGGER nbrPatients_Docteur;
DROP TRIGGER nbrMoyenMedicaments;
DROP TRIGGER nbrConsultation_patient;
DROP TRIGGER nbrMedicaments_ordonnance;
DROP TRIGGER modif_Ord;
DROP TRIGGER modif_Med;
DROP TRIGGER cascade_modifie_docteur;
DROP TRIGGER cascade_modifie_dossierPatient;

SET ECHO OFF

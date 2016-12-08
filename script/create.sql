-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin
--  Olivier Pinneau
--  Ethienne Roy
--  Emanuel Gonthier GONE27069202
-- ==========================================

-- *********************************************
-- Script de creation des tables
-- *********************************************


ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

SET ECHO ON;


CREATE TABLE Categorie (
    IdCategorie INTEGER,
    Nom VARCHAR(20),
    Descritption VARCHAR(100),
    CONSTRAINT categorie_pk PRIMARY KEY(IdCategorie)
)
/
CREATE TABLE Specialite (
    Code INTEGER,
    Titre VARCHAR(20),
    Descritption VARCHAR(50),
    CONSTRAINT specialiste_pk PRIMARY KEY(Code)
)
/
CREATE TABLE Medicament (
    IdMed INTEGER,
    NomMed VARCHAR(20),
    Prix NUMBER(6),
    IdCategorie INTEGER,
    CONSTRAINT medicament_pk PRIMARY KEY(IdMed),
    CONSTRAINT medicament__categorie_fk FOREIGN KEY(IdCategorie) REFERENCES Categorie
)
/
CREATE TABLE Docteur (
    Matricule INTEGER,
    NomM VARCHAR(20),
    PrenomM VARCHAR(20),
    Specialite INTEGER,
    Ville VARCHAR(25),
    Adresse VARCHAR(200),
    Niveau VARCHAR(25),
    NbrPatients INTEGER,
    NbrMoyenMedicaments NUMBER(6),
    CONSTRAINT docteur_pk PRIMARY KEY(Matricule),
    CONSTRAINT docteur_specialite_fk FOREIGN KEY(Specialite) REFERENCES Specialite
)
/
CREATE TABLE DossierPatient (
    NumDos INTEGER,
    NomP VARCHAR(20),
    PrenomP VARCHAR(20),
    Sexe VARCHAR(1),
    NumAS VARCHAR(12),
    DateNaiss DATE,
    DateC Date,
    Matricule INTEGER,
    NbrConsultation INTEGER,
    CONSTRAINT dossierPatient_pk PRIMARY KEY(NumDos),
    CONSTRAINT dossierPatient_docteur_fk FOREIGN KEY(Matricule) REFERENCES Docteur,
    CONSTRAINT numAS_unique UNIQUE(NumAs)
)
/
CREATE TABLE Ordonnance (
    NumOrd INTEGER,
    Recommandantions VARCHAR(200),
    Type VARCHAR(20),
    DateC DATE,
    NbrMedicaments NUMBER(5),
    CONSTRAINT ordonnance_pk PRIMARY KEY(NumOrd)
)
/
CREATE TABLE Consultation (
	CodeDocteur INTEGER,
	NumDos INTEGER,
	DateC DATE,
	Diagnostic VARCHAR(200),
	NumOrd INTEGER,
	CONSTRAINT consultation_pk PRIMARY KEY(CodeDocteur, NumDos, DateC),
	CONSTRAINT consultation_docteur_fk FOREIGN KEY(CodeDocteur) REFERENCES Docteur,
	CONSTRAINT consultation_patient_fk FOREIGN KEY(NumDos) REFERENCES DossierPatient,
	CONSTRAINT consultation_ordonnance_fk FOREIGN KEY(NumOrd) REFERENCES Ordonnance
)
/
CREATE TABLE TypeChirurgie (
    IdType INTEGER,
    Nom VARCHAR(20),
    Descritption VARCHAR(30),
    CONSTRAINT typeChirurgie_pk PRIMARY KEY(IdType)
)
/
CREATE TABLE Chirurgie (
    IdChirurgie INTEGER,
    IdType INTEGER,
    IdSalle INTEGER,
    DateChirurgie DATE,
    HeureDebut DATE,
    HeureFin DATE,
    CONSTRAINT chirurgie_pk PRIMARY KEY(IdChirurgie),
    CONSTRAINT chirurgie_typeChirurgie_fk FOREIGN KEY(IdType) REFERENCES TypeChirurgie,
    CONSTRAINT chirurgie_salle_fk FOREIGN KEY(IdSalle) REFERENCES Salle
)
/
CREATE TABLE OrdonnanceChirurgie (
	NumOrd INTEGER,
	IdChir INTEGER,
	Rang INTEGER, -- A VERIFIER DANS LE TP1
	CONSTRAINT ordonnanceChirurgie_pk PRIMARY KEY (NumOrd, IdChir),
	CONSTRAINT ordonChirurgie_ordonnance_fk FOREIGN KEY(NumOrd) REFERENCES Ordonnance,
	CONSTRAINT ordoChirurgie_chirurgie_fk FOREIGN KEY(IdChir) REFERENCES Chirurgie
)
/
CREATE TABLE Salle (
	IdSalle INTEGER,
	Nom VARCHAR(20),
	CONSTRAINT salle_pk PRIMARY KEY(IdSalle)
)
/
CREATE TABLE SpecialisationsSalle (
	IdType INTEGER,
	IdSalle INTEGER,
	DateC DATE,
	CONSTRAINT spcialisationSalle_pk PRIMARY KEY(IdSalle, IdType),
	CONSTRAINT spcSalle_typeChirurgie_fk FOREIGN KEY(IdType) REFERENCES TypeChirurgie,
	CONSTRAINT spcSalle_salle_fk FOREIGN KEY(IdSalle) REFERENCES Salle
)
/
CREATE TABLE OrdonnanceMedicaments (
	NumOrd INTEGER,
	IdMed INTEGER,
	NbBoites NUMBER(5),
	CONSTRAINT ordonnanceMedicaments_pk PRIMARY KEY(NumOrd, IdMed),
	CONSTRAINT ordoMedicaments_medicament_fk FOREIGN KEY(IdMed) REFERENCES Medicament,
	CONSTRAINT ordoMedicaments_ordonnance_fk FOREIGN KEY(NumOrd) REFERENCES Ordonnance
)

SET ECHO OFF;





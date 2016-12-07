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


CREATE TABLE DossierPatient (
    _NumDos INTEGER,
    NomP VARCHAR(20),
    PrenomP VARCHAR(20),
    Sexe VARCHAR(1),
    NumAS VARCHAR(12),
    DateNaiss DATE,
    DateC Date,
    _Matricule INTEGER,
    NbrConsultation INTEGER,
    CONSTRAINT dossierPatient_pk PRIMARY KEY(_NumDos),
    CONSTRAINT dossierPatient_docteur_fk FOREIGN KEY(_Matricule) REFERENCES(Docteur),
    CONSTRAINT numAS_unique UNIQUE(NumAs)
)
/
CREATE TABLE Categorie (
    _IdCategorie INTEGER,
    Nom VARCHAR(20),
    Descritption VARCHAR(100),
    CONSTRAINT categorie_pk PRIMARY KEY(_IdCategorie)
)
/
CREATE TABLE Specialite (
    _Code INTEGER,
    Titre VARCHAR(20),
    Descritption VARCHAR(50),
    CONSTRAINT specialiste_pk PRIMARY KEY(_Code)
)
/
CREATE TABLE Medicament (
    _IdMed INTEGER,
    NomMed VARCHAR(20),
    Prix NUMBER(6),
    _IdCategorie INTEGER,
    CONSTRAINT medicament_pk PRIMARY KEY(_IdMed),
    CONSTRAINT medicament__categorie_fk FOREIGN KEY(_IdCategorie) REFERENCES Categorie
)
/
CREATE TABLE Docteur (
    _Matricule INTEGER,
    NomM VARCHAR(20),
    PrenomM VARCHAR(20),
    _Specialite INTEGER,
    Ville VARCHAR(25),
    Adresse VARCHAR(200),
    Niveau VARCHAR(25),
    NbrPatients INTEGER,
    NbrMoyenMedicaments NUMBER(6),
    CONSTRAINT docteur_pk PRIMARY KEY(_Matricule),
    CONSTRAINT docteur_specialite_fk FOREIGN KEY(_Specialite) REFERENCES Specialite
)
/
CREATE TABLE Consultation (
	_CodeDocteur INTEGER,
	_NumDos INTEGER,
	_DateC DATE,
	Diagnostic VARCHAR(200),
	_NumOrd INTEGER,
	CONSTRAINT consultation_pk PRIMARY KEY(_CodeDocteur, _NumDos, _DateC),
	CONSTRAINT consultation_docteur_fk FOREIGN KEY(_CodeDocteur) REFERENCES Docteur,
	CONSTRAINT consultation_patient_fk FOREIGN KEY(_NumDos) REFERENCES DossierPatient,
	CONSTRAINT consultation_ordonnance_fk FOREIGN KEY(_NumOrd) REFERENCES Ordonnance
)
/
CREATE TABLE Ordonnance (
	_NumOrd INTEGER,
	Recommandantions VARCHAR(200),
	Type VARCHAR(20),
	DateC DATE,
	NbrMedicaments NUMBER(5),
	CONSTRAINT ordonnance_pk PRIMARY KEY(_NumOrd)
)
/
CREATE TABLE OrdonnanceChirurgie (
	_NumOrd INTEGER,
	_IdChir INTEGER,
	Rang INTEGER, -- A VERIFIER DANS LE TP1
	CONSTRAINT ordonnanceChirurgie_pk PRIMARY KEY (_NumOrd, _IdChir),
	CONSTRAINT ordonnanceChirurgie_ordonnance_fk FOREIGN KEY(_NumOrd) REFERENCES Ordonnance,
	CONSTRAINT ordonnanceChirurgie_chirurgie_fk FOREIGN KEY(_IdChir) REFERENCES Chirurgie
)
/
CREATE TABLE Salle (
	_IdSalle INTEGER,
	Nom VARCHAR(20),
	CONSTRAINT salle_pk PRIMARY KEY(_IdSalle)
)
/
CREATE TABLE SpecialisationsSalle (
	_IdType INTEGER,
	_IdSalle INTEGER,
	DateC DATE,
	CONSTRAINT spcialisationSalle_pk PRIMARY KEY(_IdSalle, _IdType),
	CONSTRAINT spcialisationSalle_typeChirurgie_fk FOREIGN KEY(_IdType) REFERENCES TypeChirurgie,
	CONSTRAINT spcialisationSalle_salle_fk FOREIGN KEY(_IdSalle) REFERENCES Salle
)
/
CREATE TABLE TypeChirurgie (
	_IdType INTEGER,
	Nom VARCHAR(20),
	Descritption VARCHAR(30),
	CONSTRAINT typeChirurgie_pk PRIMARY KEY(_IdType)
)
/
CREATE TABLE OrdonnanceMedicaments (
	_NumOrd INTEGER,
	_IdMed INTEGER,
	NbBoites NUMBER(5),
	CONSTRAINT ordonnanceMedicaments_pk PRIMARY KEY(_NumOrd, _IdMed),
	CONSTRAINT ordonnanceMedicaments_medicament_fk FOREIGN KEY(_IdMed) REFERENCES Medicament,
	CONSTRAINT ordonnanceMedicaments_ordonnance_fk FOREIGN KEY(_NumOrd) REFERENCES Ordonnance
)

CREAT TABLE Chirurgie (
    _IdChirurgie INTEGER,
    _IdType INTEGER,
    _IdSalle INTEGER,
    DateChirurgie DATE,
    HeureDebut TIME,
    HeureFin TIME,
    CONSTRAINT chirurgie_pk PRIMARY KEY(_IdChirurgie),
    CONSTRAINT chirurgie_typeChirurgie_fk FOREIGN KEY(_IdType) REFERENCES TypeChirurgie,
    CONSTRAINT chirurgie_salle_fk FOREIGN KEY(_IdSalle) REFERENCES Salle
)
/
SET ECHO OFF;
    




-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin MATM05059000
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
    IdCategorie INTEGER NOT NULL,
    Nom VARCHAR(20) NOT NULL,
    Descritption VARCHAR(100),
    CONSTRAINT categorie_pk PRIMARY KEY(IdCategorie)
)
/
CREATE TABLE Specialite (
    Code INTEGER NOT NULL,
    Titre VARCHAR(20) NOT NULL,
    Descritption VARCHAR(50),
    CONSTRAINT specialiste_pk PRIMARY KEY(Code)
)
/
CREATE TABLE Medicament (
    IdMed INTEGER NOT NULL,
    NomMed VARCHAR(20) NOT NULL,
    Prix NUMBER(6) DEFAULT 0,
    IdCategorie INTEGER,
    CONSTRAINT medicament_pk PRIMARY KEY(IdMed),
    CONSTRAINT medicament__categorie_fk FOREIGN KEY(IdCategorie) REFERENCES Categorie,
    CONSTRAINT prix_positif CHECK (Prix >= 0),
    CONSTRAINT nomMed_idCategorie_unique UNIQUE (NomMed,IdCategorie)
)
/
CREATE TABLE Docteur (
    Matricule INTEGER NOT NULL,
    NomM VARCHAR(20) NOT NULL,
    PrenomM VARCHAR(20) NOT NULL,
    Specialite INTEGER,
    Ville VARCHAR(25),
    Adresse VARCHAR(200),
    Niveau VARCHAR(25),
    NbrPatients INTEGER DEFAULT 0,
    NbrMoyenMedicaments NUMBER(6) DEFAULT 0,
    CONSTRAINT docteur_pk PRIMARY KEY(Matricule),
    CONSTRAINT docteur_specialite_fk FOREIGN KEY(Specialite) REFERENCES Specialite,
    CONSTRAINT nbrPatients_positif CHECK (NbrMoyenMedicaments >= 0)
)
/
CREATE TABLE DossierPatient (
    NumDos INTEGER NOT NULL,
    NomP VARCHAR(20) NOT NULL,
    PrenomP VARCHAR(20) NOT NULL,
    Sexe VARCHAR(1),
    NumAS VARCHAR(12),
    DateNaiss DATE,
    DateC Date,
    Matricule INTEGER,
    NbrConsultation INTEGER DEFAULT 0,
    CONSTRAINT dossierPatient_pk PRIMARY KEY(NumDos),
    CONSTRAINT dossierPatient_docteur_fk FOREIGN KEY(Matricule) REFERENCES Docteur,
    CONSTRAINT numAS_unique UNIQUE(NumAs),
    CONSTRAINT nbrConsultation_positif CHECK (NbrConsultation >= 0)
)
/
CREATE TABLE Ordonnance (
    NumOrd INTEGER NOT NULL,
    Recommandantions VARCHAR(200),
    Type VARCHAR(20),
    DateC DATE,
    NbrMedicaments NUMBER(5) DEFAULT 0,
    CONSTRAINT ordonnance_pk PRIMARY KEY(NumOrd),
    CONSTRAINT nbrMedicaments_positif CHECK(NbrMedicaments >= 0)
)
/
CREATE TABLE Consultation (
	CodeDocteur INTEGER NOT NULL,
	NumDos INTEGER NOT NULL,
	DateC DATE NOT NULL,
	Diagnostic VARCHAR(200) NOT NULL,
	NumOrd INTEGER,
	CONSTRAINT consultation_pk PRIMARY KEY(CodeDocteur, NumDos, DateC),
	CONSTRAINT consultation_docteur_fk FOREIGN KEY(CodeDocteur) REFERENCES Docteur
        ON DELETE CASCADE,
	CONSTRAINT consultation_patient_fk FOREIGN KEY(NumDos) REFERENCES DossierPatient
        ON DELETE SET NULL,
	CONSTRAINT consultation_ordonnance_fk FOREIGN KEY(NumOrd) REFERENCES Ordonnance
)
/
CREATE TABLE TypeChirurgie (
    IdType INTEGER NOT NULL,
    Nom VARCHAR(20) NOT NULL,
    Descritption VARCHAR(30),
    CONSTRAINT typeChirurgie_pk PRIMARY KEY(IdType)
)
/
CREATE TABLE Salle (
    IdSalle INTEGER NOT NULL,
    Nom VARCHAR(20) NOT NULL,
    CONSTRAINT salle_pk PRIMARY KEY(IdSalle)
)
/
CREATE TABLE Chirurgie (
    IdChirurgie INTEGER NOT NULL,
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
	NumOrd INTEGER NOT NULL,
	IdChir INTEGER NOT NULL,
	Rang INTEGER, -- A VERIFIER DANS LE TP1
	CONSTRAINT ordonnanceChirurgie_pk PRIMARY KEY (NumOrd, IdChir),
	CONSTRAINT ordonChirurgie_ordonnance_fk FOREIGN KEY(NumOrd) REFERENCES Ordonnance,
	CONSTRAINT ordoChirurgie_chirurgie_fk FOREIGN KEY(IdChir) REFERENCES Chirurgie,
  CONSTRAINT numOrd_rang_unique UNIQUE(NumOrd,Rang)
)
/
CREATE TABLE SpecialisationsSalle (
	IdType INTEGER NOT NULL,
	IdSalle INTEGER NOT NULL,
	DateC DATE,
	CONSTRAINT spcialisationSalle_pk PRIMARY KEY(IdSalle, IdType),
	CONSTRAINT spcSalle_typeChirurgie_fk FOREIGN KEY(IdType) REFERENCES TypeChirurgie,
	CONSTRAINT spcSalle_salle_fk FOREIGN KEY(IdSalle) REFERENCES Salle
)
/
CREATE TABLE OrdonnanceMedicaments (
	NumOrd INTEGER NOT NULL,
	IdMed INTEGER NOT NULL,
	NbBoites NUMBER(5) DEFAULT 0,
	CONSTRAINT ordonnanceMedicaments_pk PRIMARY KEY(NumOrd, IdMed),
	CONSTRAINT ordoMedicaments_medicament_fk FOREIGN KEY(IdMed) REFERENCES Medicament,
	CONSTRAINT ordoMedicaments_ordonnance_fk FOREIGN KEY(NumOrd) REFERENCES Ordonnance,
  CONSTRAINT nbBoites_positif CHECK (NbBoites >= 0)
)
/

SET ECHO OFF;

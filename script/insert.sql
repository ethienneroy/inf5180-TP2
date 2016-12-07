-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin
--  Olivier Pinneau
--  Ethienne Roy
--  Emanuel Gonthier GONE27069202
-- ==========================================

-- *********************************************
-- Script de remplissage
-- *********************************************

SET LINESIZE 160
SET ECHO ON

-- INSERT INTO DossierPatient VALUES(numDos, nomP, prenomP, sexe, numAS, dateNaiss, dateC, matricule, nbrConsultation);
INSERT INTO DossierPatient VALUES(1, 'Gonthier', 'Emanuel', 'M', 'GONE92062700', '1992-06-27', '2016-12-02', 1, 6);
INSERT INTO DossierPatient VALUES(2, 'Tremblay', 'Lucie', 'F', 'TREL85110201', '1985-11-02', '2002-08-20', 1, 3);
INSERT INTO DossierPatient VALUES(3, 'Sauve', 'Andre', 'M', 'SAUA70092001', '1970-09-20', '1980-02-17', 2, 1);
INSERT INTO DossierPatient VALUES(4, 'Petit', 'Cecile', 'F', 'PETC40050810', '1940-05-08', '1960-02-15', 2, 1);
INSERT INTO DossierPatient VALUES(5, 'Gonthier', 'Emanuel', 'M', 'GONE66041400', '1966-04-14', '2016-12-02', 1, 2);
INSERT INTO DossierPatient VALUES(10, 'Gonthier', 'Emanuel', 'M','GONE92062701', '1992-06-27', '2016-12-02', 1, 0);


-- INSERT INTO Docteur VALUES(matricule, nomM, prenomM, specialite, ville, adresse, niveau, nbrPatients, nbrMoyenMedicaments);
INSERT INTO Docteur VALUES(1, 'Freud', 'Sigmund', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 4, 6);
INSERT INTO Docteur VALUES(2, 'Barrette', 'Gaetan', 2, 'Montreal', '1012 Rue Berri H5J5B2', 'Interne', 2, 3);
INSERT INTO Docteur VALUES(5, 'Anderson', 'Pamela', 3, 'Quebec', '20 Avenue Du Chateau E8J9C1', 'Etudiant', 0, 0);

-- INSERT INTO Consultation VALUES(CodeDocteur, numDos, dateC, diagnostic, numOrd);
INSERT INTO Consultation VALUES(1, 1, '2016-12-02', 'malade', 1);
INSERT INTO Consultation VALUES(1, 1, '2016-12-03', 'malade', 2);
INSERT INTO Consultation VALUES(1, 1, '2016-12-04', 'malade', 3);
INSERT INTO Consultation VALUES(1, 1, '2016-12-05', 'malade', 4);
INSERT INTO Consultation VALUES(1, 1, '2016-12-06', 'malade', 5);
INSERT INTO Consultation VALUES(1, 1, '2016-12-07', 'malade', 6);
INSERT INTO Consultation VALUES(1, 2, '2016-12-02', 'malade', 7);
INSERT INTO Consultation VALUES(1, 2, '2004-02-01', 'malade', 8);
INSERT INTO Consultation VALUES(1, 2, '2006-12-02', 'malade', 9);
INSERT INTO Consultation VALUES(2, 3, '2016-12-02', 'malade', 10);
INSERT INTO Consultation VALUES(2, 4, '2000-04-24', 'malade', 11);
INSERT INTO Consultation VALUES(1, 5, '2000-04-24', 'malade', 12);
INSERT INTO Consultation VALUES(1, 5, '1970-06-17', 'malade', 13);

-- INSERT INTO Ordonnance VALUES(numOrd, recommandations, type, dateC, nbrMedicaments);
INSERT INTO Ordonnance VALUES(1, 'repos', 'Medicaments', '2016-12-02', 20);
INSERT INTO Ordonnance VALUES(2, 'repos', 'Medicaments', '2016-12-03', 9);
INSERT INTO Ordonnance VALUES(3, 'repos', 'Medicaments', '2016-12-04', 3);
INSERT INTO Ordonnance VALUES(4, 'repos', 'Medicaments', '2016-12-05', 5);
INSERT INTO Ordonnance VALUES(5, 'repos', 'Chirurgie', '2016-12-06', 0);
INSERT INTO Ordonnance VALUES(6, 'repos', 'Chirurgie', '2016-12-07', 0);
INSERT INTO Ordonnance VALUES(7, 'repos', 'Medicaments', '2016-12-02', 7);
INSERT INTO Ordonnance VALUES(8, 'repos', 'Chirurgie', '2004-02-01', 0);
INSERT INTO Ordonnance VALUES(9, 'repos', 'Medicaments', '2006-12-02', 10);
INSERT INTO Ordonnance VALUES(10, 'repos', 'Medicaments', '2016-12-02', 4);
INSERT INTO Ordonnance VALUES(11, 'repos', 'Medicaments', '2000-04-24', 2);
INSERT INTO Ordonnance VALUES(12, 'repos', 'Chirurgie', '2000-04-24', 0);
INSERT INTO Ordonnance VALUES(13, 'repos', 'Chirurgie', '1970-06-17', 0);


-- INSERT INTO OrdonnanceChirurgie VALUES(numOrd, idChir, rang);
INSERT INTO OrdonnanceChirurgie VALUES(5, 1, 1);
INSERT INTO OrdonnanceChirurgie VALUES(5, 1, 2);
INSERT INTO OrdonnanceChirurgie VALUES(5, 2, 1);
INSERT INTO OrdonnanceChirurgie VALUES(6, 3, 1);
INSERT INTO OrdonnanceChirurgie VALUES(8, 4, 1);
INSERT INTO OrdonnanceChirurgie VALUES(12, 5, 1);
INSERT INTO OrdonnanceChirurgie VALUES(13, 6, 1);

-- INSERT INTO Chirurgie VALUES( idChir, idType, idSalle, dateChirurgie, HeureDebut, HeureFin);
INSERT INTO Chirurgie VALUES(1, 1, 1, '2016-12-10', 16:00:00, 17:00:00);
INSERT INTO Chirurgie VALUES(2, 1, 1, '2016-12-10', 17:01:00, 18:01:00);
INSERT INTO Chirurgie VALUES(3, 2, 2, '2016-12-10', 17:01:00, 18:01:00);
INSERT INTO Chirurgie VALUES(4, 3, 1, '2016-12-12', 12:00:00, 13:00:00);
INSERT INTO Chirurgie VALUES(5, 1, 3, '2016-12-10', 17:01:00, 18:01:00);
INSERT INTO Chirurgie VALUES(6, 2, 3, '2016-12-11', 17:01:00, 18:01:00);

-- INSERT INTO Salle VALUES(idSalle, nom);
INSERT INTO Salle VALUES(1, 'salle du bas');
INSERT INTO Salle VALUES(2, 'salle du milieu');
INSERT INTO Salle VALUES(3, 'salle du haut');

-- INSERT INTO SpecialisationsSalle VALUES(IdType, idSalle, dateC);
INSERT INTO SpecialisationsSalle VALUES(1, 1, '2016-12-10');
INSERT INTO SpecialisationsSalle VALUES(2, 2, '2016-12-10');
INSERT INTO SpecialisationsSalle VALUES(3, 1, '2016-12-12');
INSERT INTO SpecialisationsSalle VALUES(1, 3, '2016-12-10');
INSERT INTO SpecialisationsSalle VALUES(2, 3, '2016-12-11');

-- INSERT INTO TypeChirurgie VALUES(IdType, nom, Description);
INSERT INTO TypeChirurgie VALUES(1, 'lobotomi', 'ouvre la tete');
INSERT INTO TypeChirurgie VALUES(2, 'coeur ouvert', 'ouvre le coeur');
INSERT INTO TypeChirurgie VALUES(3, 'plastique', 'bricolage');

-- INSERT INTO OrdonnanceMedicaments VALUES(numOrd, idMed, nbBoites);
INSERT INTO OrdonnanceMedicaments VALUES(1, 1, 10);
INSERT INTO OrdonnanceMedicaments VALUES(1, 2, 5);
INSERT INTO OrdonnanceMedicaments VALUES(1, 3, 5);
INSERT INTO OrdonnanceMedicaments VALUES(2, 1, 9);
INSERT INTO OrdonnanceMedicaments VALUES(3, 1, 3);
INSERT INTO OrdonnanceMedicaments VALUES(4, 1, 5);
INSERT INTO OrdonnanceMedicaments VALUES(7, 1, 7);
INSERT INTO OrdonnanceMedicaments VALUES(9, 2, 10);
INSERT INTO OrdonnanceMedicaments VALUES(10, 1, 4);
INSERT INTO OrdonnanceMedicaments VALUES(11, 3, 2);

-- INSERT INTO Medicament VALUES(idMed, nomMed, prix, categorie);
INSERT INTO Medicament VALUES(1, 'tylenole', 2.99, 1);
INSERT INTO Medicament VALUES(2, 'viagra', 99.99, 2);
INSERT INTO Medicament VALUES(3, 'ibuprofene', 4.30, 1);
INSERT INTO Medicament VALUES(4, 'tylenole', 2.99, 2);

-- INSERT INTO Specialite VALUES(code, titre, description);
INSERT INTO Specialite VALUES(1, 'neurologie', 'cerveau');
INSERT INTO Specialite VALUES(2, 'cardiologie', 'coeur');
INSERT INTO Specialite VALUES(3, 'chirurgie plastique', 'refaire un peu tout');

-- INSERT INTO Categorie VALUES(IdCategorie, nom, Description);
INSERT INTO Categorie VALUES(1, 'douleur', 'quand on a mal quelque part');
INSERT INTO Categorie VALUES(2, 'probleme', 'quand on a des probleme quelque part');

SET ECHO OFF
SET PAGESIZE 30

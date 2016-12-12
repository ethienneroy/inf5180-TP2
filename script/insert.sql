-- ==========================================
--  INF5180-30 –  Base de Donnees 2
--  Francois Planet PLAF17069100
--  Mathieu Mathurin MATM05059000
--  Olivier Pinneau
--  Ethienne Roy ROYE08129209
--  Emanuel Gonthier GONE27069202
-- ==========================================

-- *********************************************
-- Script de remplissage
-- *********************************************

SET LINESIZE 160
SET ECHO ON

-- INSERT INTO Specialite VALUES(code, titre, description);
INSERT INTO Specialite VALUES(1, 'neurologie', 'cerveau');
INSERT INTO Specialite VALUES(2, 'cardiologie', 'coeur');
INSERT INTO Specialite VALUES(3, 'chirurgie plastique', 'refaire un peu tout');

-- INSERT INTO Docteur VALUES(matricule, nomM, prenomM, specialite, ville, adresse, niveau, nbrPatients, nbrMoyenMedicaments);
INSERT INTO Docteur VALUES(1, 'Freud', 'Sigmund', 1, 'Montreal', '103 A Rue Jarry H3K3F9', 'Docteur', 4, 6);
INSERT INTO Docteur VALUES(2, 'Barrette', 'Gaetan', 2, 'Montreal', '1012 Rue Berri H5J5B2', 'Interne', 2, 3);
INSERT INTO Docteur VALUES(5, 'Anderson', 'Pamela', 3, 'Quebec', '20 Avenue Du Chateau E8J9C1', 'Etudiant', 0, 0);

-- INSERT INTO DossierPatient VALUES(numDos, nomP, prenomP, sexe, numAS, dateNaiss, dateC, matricule, nbrConsultation);
INSERT INTO DossierPatient VALUES(1, 'Gonthier', 'Emanuel', 'M', 'GONE92062700', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 6);
INSERT INTO DossierPatient VALUES(2, 'Tremblay', 'Lucie', 'F', 'TREL85110201', TO_DATE('1985-11-02', 'yyyy-mm-dd'), TO_DATE('2002-08-20', 'yyyy-mm-dd'), 1, 3);
INSERT INTO DossierPatient VALUES(3, 'Sauve', 'Andre', 'M', 'SAUA70092001', TO_DATE('1970-09-20', 'yyyy-mm-dd'), TO_DATE('1980-02-17', 'yyyy-mm-dd'), 2, 1);
INSERT INTO DossierPatient VALUES(4, 'Petit', 'Cecile', 'F', 'PETC40050810', TO_DATE('1940-05-08', 'yyyy-mm-dd'), TO_DATE('1960-02-15', 'yyyy-mm-dd'), 2, 1);
INSERT INTO DossierPatient VALUES(5, 'Gonthier', 'Emanuel', 'M', 'GONE66041400', TO_DATE('1966-04-14', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 2);
INSERT INTO DossierPatient VALUES(10, 'Gonthier', 'Emanuel', 'M','GONE92062701', TO_DATE('1992-06-27', 'yyyy-mm-dd'), TO_DATE('2016-12-02', 'yyyy-mm-dd'), 1, 0);

-- INSERT INTO Ordonnance VALUES(numOrd, recommandations, type, dateC, nbrMedicaments);
INSERT INTO Ordonnance VALUES(1, 'repos', 'Medicaments', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 20);
INSERT INTO Ordonnance VALUES(2, 'repos', 'Medicaments', TO_DATE('2016-12-03', 'yyyy-mm-dd'), 9);
INSERT INTO Ordonnance VALUES(3, 'repos', 'Medicaments', TO_DATE('2016-12-04', 'yyyy-mm-dd'), 3);
INSERT INTO Ordonnance VALUES(4, 'repos', 'Medicaments', TO_DATE('2016-12-05', 'yyyy-mm-dd'), 5);
INSERT INTO Ordonnance VALUES(5, 'repos', 'Chirurgie', TO_DATE('2016-12-06', 'yyyy-mm-dd'), 0);
INSERT INTO Ordonnance VALUES(6, 'repos', 'Chirurgie', TO_DATE('2016-12-07', 'yyyy-mm-dd'), 0);
INSERT INTO Ordonnance VALUES(7, 'repos', 'Medicaments', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 7);
INSERT INTO Ordonnance VALUES(8, 'repos', 'Chirurgie', TO_DATE('2016-12-01', 'yyyy-mm-dd'), 0);
INSERT INTO Ordonnance VALUES(9, 'repos', 'Medicaments', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 10);
INSERT INTO Ordonnance VALUES(10, 'repos', 'Medicaments', TO_DATE('2016-12-02', 'yyyy-mm-dd'), 4);
INSERT INTO Ordonnance VALUES(11, 'repos', 'Medicaments', TO_DATE('2016-12-24', 'yyyy-mm-dd'), 2);
INSERT INTO Ordonnance VALUES(12, 'repos', 'Chirurgie', TO_DATE('2016-12-24', 'yyyy-mm-dd'), 0);
INSERT INTO Ordonnance VALUES(13, 'repos', 'Chirurgie', TO_DATE('2016-12-17', 'yyyy-mm-dd'), 0);

-- INSERT INTO Consultation VALUES(CodeDocteur, numDos, dateC, diagnostic, numOrd);
INSERT INTO Consultation VALUES(1, 1, TO_DATE('2016-12-02', 'yyyy-mm-dd'), 'malade', 1);
INSERT INTO Consultation VALUES(1, 1, TO_DATE('2016-12-03', 'yyyy-mm-dd'), 'malade', 2);
INSERT INTO Consultation VALUES(1, 1, TO_DATE('2016-12-04', 'yyyy-mm-dd'), 'malade', 3);
INSERT INTO Consultation VALUES(1, 1, TO_DATE('2016-12-05', 'yyyy-mm-dd'), 'malade', 4);
INSERT INTO Consultation VALUES(1, 1, TO_DATE('2016-12-06', 'yyyy-mm-dd'), 'malade', 5);
INSERT INTO Consultation VALUES(1, 1, TO_DATE('2016-12-07', 'yyyy-mm-dd'), 'malade', 6);
INSERT INTO Consultation VALUES(1, 2, TO_DATE('2016-12-02', 'yyyy-mm-dd'), 'malade', 7);
INSERT INTO Consultation VALUES(1, 2, TO_DATE('2016-12-01', 'yyyy-mm-dd'), 'malade', 8);
INSERT INTO Consultation VALUES(1, 2, TO_DATE('2016-12-02', 'yyyy-mm-dd'), 'malade', 9);
INSERT INTO Consultation VALUES(2, 3, TO_DATE('2016-12-02', 'yyyy-mm-dd'), 'malade', 10);
INSERT INTO Consultation VALUES(2, 4, TO_DATE('2016-12-24', 'yyyy-mm-dd'), 'malade', 11);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-24', 'yyyy-mm-dd'), 'malade', 12);
INSERT INTO Consultation VALUES(1, 5, TO_DATE('2016-12-17', 'yyyy-mm-dd'), 'malade', 13);



-- INSERT INTO TypeChirurgie VALUES(IdType, nom, Description);
INSERT INTO TypeChirurgie VALUES(1, 'lobotomi', 'ouvre la tete');
INSERT INTO TypeChirurgie VALUES(2, 'coeur ouvert', 'ouvre le coeur');
INSERT INTO TypeChirurgie VALUES(3, 'plastique', 'bricolage');

-- INSERT INTO Salle VALUES(idSalle, nom);
INSERT INTO Salle VALUES(1, 'salle du bas');
INSERT INTO Salle VALUES(2, 'salle du milieu');
INSERT INTO Salle VALUES(3, 'salle du haut');

-- INSERT INTO SpecialisationsSalle VALUES(IdType, idSalle, dateC);
INSERT INTO SpecialisationsSalle VALUES(1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'));
INSERT INTO SpecialisationsSalle VALUES(2, 2, TO_DATE('2016-12-10', 'yyyy-mm-dd'));
INSERT INTO SpecialisationsSalle VALUES(3, 1, TO_DATE('2016-12-12', 'yyyy-mm-dd'));
INSERT INTO SpecialisationsSalle VALUES(1, 3, TO_DATE('2016-12-10', 'yyyy-mm-dd'));
INSERT INTO SpecialisationsSalle VALUES(2, 3, TO_DATE('2016-12-11', 'yyyy-mm-dd'));


-- INSERT INTO Chirurgie VALUES( idChir, idType, idSalle, dateChirurgie, HeureDebut, HeureFin);
INSERT INTO Chirurgie VALUES(1, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 16:00:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 17:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO Chirurgie VALUES(2, 1, 1, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 17:01:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 18:01:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO Chirurgie VALUES(3, 2, 2, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 17:01:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 18:01:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO Chirurgie VALUES(4, 3, 1, TO_DATE('2016-12-12', 'yyyy-mm-dd'), TO_DATE('2016-12-12 12:00:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-12 13:00:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO Chirurgie VALUES(5, 1, 3, TO_DATE('2016-12-10', 'yyyy-mm-dd'), TO_DATE('2016-12-10 17:01:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-10 18:01:00', 'yyyy-mm-dd hh24:mi:ss'));
INSERT INTO Chirurgie VALUES(6, 2, 3, TO_DATE('2016-12-11', 'yyyy-mm-dd'), TO_DATE('2016-12-11 17:01:00', 'yyyy-mm-dd hh24:mi:ss'), TO_DATE('2016-12-11 18:01:00', 'yyyy-mm-dd hh24:mi:ss'));


-- INSERT INTO OrdonnanceChirurgie VALUES(numOrd, idChir, rang);
INSERT INTO OrdonnanceChirurgie VALUES(3, 1, 1);
INSERT INTO OrdonnanceChirurgie VALUES(4, 1, 2);
INSERT INTO OrdonnanceChirurgie VALUES(5, 2, 1);
INSERT INTO OrdonnanceChirurgie VALUES(6, 3, 1);
INSERT INTO OrdonnanceChirurgie VALUES(8, 4, 1);
INSERT INTO OrdonnanceChirurgie VALUES(12, 5, 1);
INSERT INTO OrdonnanceChirurgie VALUES(13, 6, 1);


-- INSERT INTO Categorie VALUES(IdCategorie, nom, Description);
INSERT INTO Categorie VALUES(1, 'douleur', 'quand on a mal quelque part');
INSERT INTO Categorie VALUES(2, 'probleme', 'quand on a des probleme quelque part');

-- INSERT INTO Medicament VALUES(idMed, nomMed, prix, categorie);
INSERT INTO Medicament VALUES(1, 'tylenole', 2.99, 1);
INSERT INTO Medicament VALUES(2, 'viagra', 99.99, 2);
INSERT INTO Medicament VALUES(3, 'ibuprofene', 4.30, 1);
INSERT INTO Medicament VALUES(4, 'tylenole', 2.99, 2);

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


SET ECHO OFF
SET PAGESIZE 30

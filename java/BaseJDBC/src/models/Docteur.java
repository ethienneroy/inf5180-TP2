/**
 *
 * @author Ethienne Roy ROYE08129209
 */
public class Docteur{
    int Matricule ;
    String NomM;
    String PrenomM;
    int Specialite;
    String Ville;
    String Adresse;
    String Niveau;
    int NbrPatients;
    int NbrMoyenMedicaments;

    public Docteur(int matricule, String nomM, String prenomM, int specialite, String ville, String adresse, String niveau, int nbrPatients, int nbrMoyenMedicaments) {
        Matricule = matricule;
        NomM = nomM;
        PrenomM = prenomM;
        Specialite = specialite;
        Ville = ville;
        Adresse = adresse;
        Niveau = niveau;
        NbrPatients = nbrPatients;
        NbrMoyenMedicaments = nbrMoyenMedicaments;
    }
}

/**
 *
 * @author Ethienne Roy ROYE08129209
 */
public class DossierPatient{
    int numDos;
    String nomPatient;
    String prenomPatient;
    char sexe;
    String numAs;
    Date naissance;
    Date DateC;
    int matricule;
    int nbrConsultation;
    Docteur docteur;

    public DossierPatient(int numDos, String nomPatient, String prenomPatient, char sexe, String numAs, Date naissance, Date dateC, int matricule, int nbrConsultation, Docteur docteur) {
        this.numDos = numDos;
        this.nomPatient = nomPatient;
        this.prenomPatient = prenomPatient;
        this.sexe = sexe;
        this.numAs = numAs;
        this.naissance = naissance;
        DateC = dateC;
        this.matricule = matricule;
        this.nbrConsultation = nbrConsultation;
        Docteur = docteur;
    }
}

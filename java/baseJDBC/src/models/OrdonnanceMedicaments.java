/**
 *
 * @author Ethienne Roy ROYE08129209
 */
package models;

public class OrdonnanceMedicaments{
    int NumOrd;
    int idMed;
    int nbBoites;
    Medicament medicament;
    Ordonnance ordonnance;

    public OrdonnanceMedicaments(int numOrd, int idMed, int nbBoites, Medicament medicament, Ordonnance ordonnance) {
        NumOrd = numOrd;
        this.idMed = idMed;
        this.nbBoites = nbBoites;
        this.medicament = medicament;
        this.ordonnance = ordonnance;
    }

}
/**
 *
 * @author Ethienne Roy ROYE08129209
 */
package models;

import java.util.Date;

public class Ordonnance{
    int numOrd;
    String recommandation;
    String type;
    Date dateC;
    String Diagnostique;
    int nbrMedicament;

    public Ordonnance(int numOrd, String recommandation, String type, Date dateC, String diagnostique, int nbrMedicament) {
        this.numOrd = numOrd;
        this.recommandation = recommandation;
        this.type = type;
        this.dateC = dateC;
        Diagnostique = diagnostique;
        this.nbrMedicament = nbrMedicament;
    }
}

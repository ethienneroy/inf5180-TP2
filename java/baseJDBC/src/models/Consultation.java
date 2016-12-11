/**
 *
 * @author Ethienne Roy ROYE08129209
 */
package models;

import java.util.Date;

public class Consultation{

    Docteur docteur;
    DossierPatient dossier;
    Date dateC;
    String diagnostic;
    Ordonnance ordonnance;

    public Consultation(Docteur docteur, DossierPatient dossier, Date dateC, String diagnostic, Ordonnance ordonnance) {
        this.docteur = docteur;
        this.dossier = dossier;
        this.dateC = dateC;
        this.diagnostic = diagnostic;
        this.ordonnance = ordonnance;
    }
}

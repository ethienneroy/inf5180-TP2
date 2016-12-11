/**
 *
 * @author Ethienne Roy ROYE08129209
 */
package models;

import java.util.Date;

public class Chirurgie{
    int idChirurgie;
    TypeChirurgie typeChirurgie;
    Salle salle;
    Date dateChirurgie;
    Date heureDebut;
    Date heureFin;

    public Chirurgie(int idChirurgie, TypeChirurgie typeChirurgie, Salle salle, Date dateChirurgie, Date heureDebut, Date heureFin) {
        this.idChirurgie = idChirurgie;
        this.typeChirurgie = typeChirurgie;
        this.salle = salle;
        this.dateChirurgie = dateChirurgie;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
    }
}

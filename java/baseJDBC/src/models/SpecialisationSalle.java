/**
 *
 * @author Ethienne Roy ROYE08129209
 */
package models;

import java.util.Date;

public class SpecialisationSalle{
    Salle salle;
    TypeChirurgie typeChirurgie;
    Date DateC;

    public SpecialisationSalle(Salle salle, TypeChirurgie typeChirurgie, Date dateC) {
        this.salle = salle;
        this.typeChirurgie = typeChirurgie;
        DateC = dateC;
    }
}

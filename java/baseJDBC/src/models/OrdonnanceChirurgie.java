/**
 *
 * @author Ethienne Roy ROYE08129209
 */
package models;

public class OrdonnanceChirurgie{
    int NumOrd;
    int Rang;
    Ordonnance ord;
    Chirurgie chirurgie;

    public OrdonnanceChirurgie(int numOrd, int rang, Ordonnance ord, Chirurgie chirurgie) {
        NumOrd = numOrd;
        Rang = rang;
        this.ord = ord;
        this.chirurgie = chirurgie;
    }
}

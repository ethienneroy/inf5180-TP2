/**
 *
 * @author Ethienne Roy ROYE08129209
 */
public class OrdonnanceChirurgie{
    int NumOrd;
    int idChir;
    int Rang;
    Ordonnance ord;

    public OrdonnanceChirurgie(int numOrd, int idChir, int rang, Ordonnance ord) {
        NumOrd = numOrd;
        this.idChir = idChir;
        Rang = rang;
        this.ord = ord;
    }
}

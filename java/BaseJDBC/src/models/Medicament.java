/**
 *
 * @author Ethienne Roy ROYE08129209
 */
public class Medicament{
    int id;
    String nom;
    String description;
    double prix;

    public Medicament(int id, String nom, String description, double prix, int categorie) {
        this.id = id;
        this.nom = nom;
        this.description = description;
        this.prix = prix;
        this.categorie = categorie;
    }

    int categorie;

}

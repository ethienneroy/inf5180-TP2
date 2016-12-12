package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ethienneroy on 2016-12-11.
 */
@Entity
public class Medicament {
    private byte idmed;
    private String nommed;
    private Byte prix;

    @Id
    @Column(name = "IDMED")
    public byte getIdmed() {
        return idmed;
    }

    public void setIdmed(byte idmed) {
        this.idmed = idmed;
    }

    @Basic
    @Column(name = "NOMMED")
    public String getNommed() {
        return nommed;
    }

    public void setNommed(String nommed) {
        this.nommed = nommed;
    }

    @Basic
    @Column(name = "PRIX")
    public Byte getPrix() {
        return prix;
    }

    public void setPrix(Byte prix) {
        this.prix = prix;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Medicament that = (Medicament) o;

        if (idmed != that.idmed) return false;
        if (nommed != null ? !nommed.equals(that.nommed) : that.nommed != null) return false;
        if (prix != null ? !prix.equals(that.prix) : that.prix != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idmed;
        result = 31 * result + (nommed != null ? nommed.hashCode() : 0);
        result = 31 * result + (prix != null ? prix.hashCode() : 0);
        return result;
    }
}

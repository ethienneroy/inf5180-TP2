package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ethienneroy on 2016-12-11.
 */
@Entity
public class Typechirurgie {
    private byte idtype;
    private String nom;
    private String descritption;

    @Id
    @Column(name = "IDTYPE")
    public byte getIdtype() {
        return idtype;
    }

    public void setIdtype(byte idtype) {
        this.idtype = idtype;
    }

    @Basic
    @Column(name = "NOM")
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Basic
    @Column(name = "DESCRITPTION")
    public String getDescritption() {
        return descritption;
    }

    public void setDescritption(String descritption) {
        this.descritption = descritption;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Typechirurgie that = (Typechirurgie) o;

        if (idtype != that.idtype) return false;
        if (nom != null ? !nom.equals(that.nom) : that.nom != null) return false;
        if (descritption != null ? !descritption.equals(that.descritption) : that.descritption != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idtype;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        result = 31 * result + (descritption != null ? descritption.hashCode() : 0);
        return result;
    }
}

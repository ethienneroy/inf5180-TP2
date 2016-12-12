package HIBERNATE.src.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ethienneroy on 2016-12-12.
 */
@Entity
public class Salle {
    private byte idsalle;
    private String nom;

    @Id
    @Column(name = "IDSALLE")
    public byte getIdsalle() {
        return idsalle;
    }

    public void setIdsalle(byte idsalle) {
        this.idsalle = idsalle;
    }

    @Basic
    @Column(name = "NOM")
    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Salle salle = (Salle) o;

        if (idsalle != salle.idsalle) return false;
        if (nom != null ? !nom.equals(salle.nom) : salle.nom != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idsalle;
        result = 31 * result + (nom != null ? nom.hashCode() : 0);
        return result;
    }
}

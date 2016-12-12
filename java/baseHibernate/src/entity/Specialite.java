package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ethienneroy on 2016-12-11.
 */
@Entity
public class Specialite {
    private byte code;
    private String titre;
    private String descritption;

    @Id
    @Column(name = "CODE")
    public byte getCode() {
        return code;
    }

    public void setCode(byte code) {
        this.code = code;
    }

    @Basic
    @Column(name = "TITRE")
    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
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

        Specialite that = (Specialite) o;

        if (code != that.code) return false;
        if (titre != null ? !titre.equals(that.titre) : that.titre != null) return false;
        if (descritption != null ? !descritption.equals(that.descritption) : that.descritption != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) code;
        result = 31 * result + (titre != null ? titre.hashCode() : 0);
        result = 31 * result + (descritption != null ? descritption.hashCode() : 0);
        return result;
    }
}

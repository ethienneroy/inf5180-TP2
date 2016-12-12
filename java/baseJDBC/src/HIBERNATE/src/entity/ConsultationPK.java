package HIBERNATE.src.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Time;

/**
 * Created by ethienneroy on 2016-12-12.
 */
public class ConsultationPK implements Serializable {
    private byte codedocteur;
    private byte numdos;
    private Time datec;

    @Column(name = "CODEDOCTEUR")
    @Id
    public byte getCodedocteur() {
        return codedocteur;
    }

    public void setCodedocteur(byte codedocteur) {
        this.codedocteur = codedocteur;
    }

    @Column(name = "NUMDOS")
    @Id
    public byte getNumdos() {
        return numdos;
    }

    public void setNumdos(byte numdos) {
        this.numdos = numdos;
    }

    @Column(name = "DATEC")
    @Id
    public Time getDatec() {
        return datec;
    }

    public void setDatec(Time datec) {
        this.datec = datec;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ConsultationPK that = (ConsultationPK) o;

        if (codedocteur != that.codedocteur) return false;
        if (numdos != that.numdos) return false;
        if (datec != null ? !datec.equals(that.datec) : that.datec != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) codedocteur;
        result = 31 * result + (int) numdos;
        result = 31 * result + (datec != null ? datec.hashCode() : 0);
        return result;
    }
}

package HIBERNATE.src.entity;

import javax.persistence.*;
import java.sql.Time;

/**
 * Created by ethienneroy on 2016-12-12.
 */
@Entity
@IdClass(ConsultationPK.class)
public class Consultation {
    private byte codedocteur;
    private byte numdos;
    private Time datec;
    private String diagnostic;

    @Id
    @Column(name = "CODEDOCTEUR")
    public byte getCodedocteur() {
        return codedocteur;
    }

    public void setCodedocteur(byte codedocteur) {
        this.codedocteur = codedocteur;
    }

    @Id
    @Column(name = "NUMDOS")
    public byte getNumdos() {
        return numdos;
    }

    public void setNumdos(byte numdos) {
        this.numdos = numdos;
    }

    @Id
    @Column(name = "DATEC")
    public Time getDatec() {
        return datec;
    }

    public void setDatec(Time datec) {
        this.datec = datec;
    }

    @Basic
    @Column(name = "DIAGNOSTIC")
    public String getDiagnostic() {
        return diagnostic;
    }

    public void setDiagnostic(String diagnostic) {
        this.diagnostic = diagnostic;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Consultation that = (Consultation) o;

        if (codedocteur != that.codedocteur) return false;
        if (numdos != that.numdos) return false;
        if (datec != null ? !datec.equals(that.datec) : that.datec != null) return false;
        if (diagnostic != null ? !diagnostic.equals(that.diagnostic) : that.diagnostic != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) codedocteur;
        result = 31 * result + (int) numdos;
        result = 31 * result + (datec != null ? datec.hashCode() : 0);
        result = 31 * result + (diagnostic != null ? diagnostic.hashCode() : 0);
        return result;
    }
}

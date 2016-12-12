package HIBERNATE.src.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Time;

/**
 * Created by ethienneroy on 2016-12-12.
 */
@Entity
public class Dossierpatient {
    private byte numdos;
    private String nomp;
    private String prenomp;
    private String sexe;
    private String numas;
    private Time datenaiss;
    private Time datec;
    private Byte nbrconsultation;

    @Id
    @Column(name = "NUMDOS")
    public byte getNumdos() {
        return numdos;
    }

    public void setNumdos(byte numdos) {
        this.numdos = numdos;
    }

    @Basic
    @Column(name = "NOMP")
    public String getNomp() {
        return nomp;
    }

    public void setNomp(String nomp) {
        this.nomp = nomp;
    }

    @Basic
    @Column(name = "PRENOMP")
    public String getPrenomp() {
        return prenomp;
    }

    public void setPrenomp(String prenomp) {
        this.prenomp = prenomp;
    }

    @Basic
    @Column(name = "SEXE")
    public String getSexe() {
        return sexe;
    }

    public void setSexe(String sexe) {
        this.sexe = sexe;
    }

    @Basic
    @Column(name = "NUMAS")
    public String getNumas() {
        return numas;
    }

    public void setNumas(String numas) {
        this.numas = numas;
    }

    @Basic
    @Column(name = "DATENAISS")
    public Time getDatenaiss() {
        return datenaiss;
    }

    public void setDatenaiss(Time datenaiss) {
        this.datenaiss = datenaiss;
    }

    @Basic
    @Column(name = "DATEC")
    public Time getDatec() {
        return datec;
    }

    public void setDatec(Time datec) {
        this.datec = datec;
    }

    @Basic
    @Column(name = "NBRCONSULTATION")
    public Byte getNbrconsultation() {
        return nbrconsultation;
    }

    public void setNbrconsultation(Byte nbrconsultation) {
        this.nbrconsultation = nbrconsultation;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Dossierpatient that = (Dossierpatient) o;

        if (numdos != that.numdos) return false;
        if (nomp != null ? !nomp.equals(that.nomp) : that.nomp != null) return false;
        if (prenomp != null ? !prenomp.equals(that.prenomp) : that.prenomp != null) return false;
        if (sexe != null ? !sexe.equals(that.sexe) : that.sexe != null) return false;
        if (numas != null ? !numas.equals(that.numas) : that.numas != null) return false;
        if (datenaiss != null ? !datenaiss.equals(that.datenaiss) : that.datenaiss != null) return false;
        if (datec != null ? !datec.equals(that.datec) : that.datec != null) return false;
        if (nbrconsultation != null ? !nbrconsultation.equals(that.nbrconsultation) : that.nbrconsultation != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) numdos;
        result = 31 * result + (nomp != null ? nomp.hashCode() : 0);
        result = 31 * result + (prenomp != null ? prenomp.hashCode() : 0);
        result = 31 * result + (sexe != null ? sexe.hashCode() : 0);
        result = 31 * result + (numas != null ? numas.hashCode() : 0);
        result = 31 * result + (datenaiss != null ? datenaiss.hashCode() : 0);
        result = 31 * result + (datec != null ? datec.hashCode() : 0);
        result = 31 * result + (nbrconsultation != null ? nbrconsultation.hashCode() : 0);
        return result;
    }
}

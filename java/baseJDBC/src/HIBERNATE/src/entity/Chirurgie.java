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
public class Chirurgie {
    private byte idchirurgie;
    private Byte idtype;
    private Byte idsalle;
    private Time datechirurgie;
    private Time heuredebut;
    private Time heurefin;

    @Id
    @Column(name = "IDCHIRURGIE")
    public byte getIdchirurgie() {
        return idchirurgie;
    }

    public void setIdchirurgie(byte idchirurgie) {
        this.idchirurgie = idchirurgie;
    }

    @Basic
    @Column(name = "IDTYPE")
    public Byte getIdtype() {
        return idtype;
    }

    public void setIdtype(Byte idtype) {
        this.idtype = idtype;
    }

    @Basic
    @Column(name = "IDSALLE")
    public Byte getIdsalle() {
        return idsalle;
    }

    public void setIdsalle(Byte idsalle) {
        this.idsalle = idsalle;
    }

    @Basic
    @Column(name = "DATECHIRURGIE")
    public Time getDatechirurgie() {
        return datechirurgie;
    }

    public void setDatechirurgie(Time datechirurgie) {
        this.datechirurgie = datechirurgie;
    }

    @Basic
    @Column(name = "HEUREDEBUT")
    public Time getHeuredebut() {
        return heuredebut;
    }

    public void setHeuredebut(Time heuredebut) {
        this.heuredebut = heuredebut;
    }

    @Basic
    @Column(name = "HEUREFIN")
    public Time getHeurefin() {
        return heurefin;
    }

    public void setHeurefin(Time heurefin) {
        this.heurefin = heurefin;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Chirurgie chirurgie = (Chirurgie) o;

        if (idchirurgie != chirurgie.idchirurgie) return false;
        if (idtype != null ? !idtype.equals(chirurgie.idtype) : chirurgie.idtype != null) return false;
        if (idsalle != null ? !idsalle.equals(chirurgie.idsalle) : chirurgie.idsalle != null) return false;
        if (datechirurgie != null ? !datechirurgie.equals(chirurgie.datechirurgie) : chirurgie.datechirurgie != null)
            return false;
        if (heuredebut != null ? !heuredebut.equals(chirurgie.heuredebut) : chirurgie.heuredebut != null) return false;
        if (heurefin != null ? !heurefin.equals(chirurgie.heurefin) : chirurgie.heurefin != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idchirurgie;
        result = 31 * result + (idtype != null ? idtype.hashCode() : 0);
        result = 31 * result + (idsalle != null ? idsalle.hashCode() : 0);
        result = 31 * result + (datechirurgie != null ? datechirurgie.hashCode() : 0);
        result = 31 * result + (heuredebut != null ? heuredebut.hashCode() : 0);
        result = 31 * result + (heurefin != null ? heurefin.hashCode() : 0);
        return result;
    }
}

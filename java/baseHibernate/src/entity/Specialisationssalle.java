package entity;

import javax.persistence.*;
import java.sql.Time;

/**
 * Created by ethienneroy on 2016-12-11.
 */
@Entity
@IdClass(SpecialisationssallePK.class)
public class Specialisationssalle {
    private byte idtype;
    private byte idsalle;
    private Time datec;

    @Id
    @Column(name = "IDTYPE")
    public byte getIdtype() {
        return idtype;
    }

    public void setIdtype(byte idtype) {
        this.idtype = idtype;
    }

    @Id
    @Column(name = "IDSALLE")
    public byte getIdsalle() {
        return idsalle;
    }

    public void setIdsalle(byte idsalle) {
        this.idsalle = idsalle;
    }

    @Basic
    @Column(name = "DATEC")
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

        Specialisationssalle that = (Specialisationssalle) o;

        if (idtype != that.idtype) return false;
        if (idsalle != that.idsalle) return false;
        if (datec != null ? !datec.equals(that.datec) : that.datec != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idtype;
        result = 31 * result + (int) idsalle;
        result = 31 * result + (datec != null ? datec.hashCode() : 0);
        return result;
    }
}

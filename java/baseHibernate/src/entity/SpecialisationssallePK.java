package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ethienneroy on 2016-12-11.
 */
public class SpecialisationssallePK implements Serializable {
    private byte idtype;
    private byte idsalle;

    @Column(name = "IDTYPE")
    @Id
    public byte getIdtype() {
        return idtype;
    }

    public void setIdtype(byte idtype) {
        this.idtype = idtype;
    }

    @Column(name = "IDSALLE")
    @Id
    public byte getIdsalle() {
        return idsalle;
    }

    public void setIdsalle(byte idsalle) {
        this.idsalle = idsalle;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SpecialisationssallePK that = (SpecialisationssallePK) o;

        if (idtype != that.idtype) return false;
        if (idsalle != that.idsalle) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) idtype;
        result = 31 * result + (int) idsalle;
        return result;
    }
}

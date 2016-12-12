package HIBERNATE.src.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ethienneroy on 2016-12-12.
 */
public class OrdonnancemedicamentsPK implements Serializable {
    private byte numord;
    private byte idmed;

    @Column(name = "NUMORD")
    @Id
    public byte getNumord() {
        return numord;
    }

    public void setNumord(byte numord) {
        this.numord = numord;
    }

    @Column(name = "IDMED")
    @Id
    public byte getIdmed() {
        return idmed;
    }

    public void setIdmed(byte idmed) {
        this.idmed = idmed;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdonnancemedicamentsPK that = (OrdonnancemedicamentsPK) o;

        if (numord != that.numord) return false;
        if (idmed != that.idmed) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) numord;
        result = 31 * result + (int) idmed;
        return result;
    }
}

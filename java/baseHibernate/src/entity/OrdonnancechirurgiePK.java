package entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

/**
 * Created by ethienneroy on 2016-12-11.
 */
public class OrdonnancechirurgiePK implements Serializable {
    private byte numord;
    private byte idchir;

    @Column(name = "NUMORD")
    @Id
    public byte getNumord() {
        return numord;
    }

    public void setNumord(byte numord) {
        this.numord = numord;
    }

    @Column(name = "IDCHIR")
    @Id
    public byte getIdchir() {
        return idchir;
    }

    public void setIdchir(byte idchir) {
        this.idchir = idchir;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        OrdonnancechirurgiePK that = (OrdonnancechirurgiePK) o;

        if (numord != that.numord) return false;
        if (idchir != that.idchir) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) numord;
        result = 31 * result + (int) idchir;
        return result;
    }
}

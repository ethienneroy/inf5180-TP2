package HIBERNATE.src.entity;

import javax.persistence.*;

/**
 * Created by ethienneroy on 2016-12-12.
 */
@Entity
@IdClass(OrdonnancechirurgiePK.class)
public class Ordonnancechirurgie {
    private byte numord;
    private byte idchir;
    private Byte rang;

    @Id
    @Column(name = "NUMORD")
    public byte getNumord() {
        return numord;
    }

    public void setNumord(byte numord) {
        this.numord = numord;
    }

    @Id
    @Column(name = "IDCHIR")
    public byte getIdchir() {
        return idchir;
    }

    public void setIdchir(byte idchir) {
        this.idchir = idchir;
    }

    @Basic
    @Column(name = "RANG")
    public Byte getRang() {
        return rang;
    }

    public void setRang(Byte rang) {
        this.rang = rang;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ordonnancechirurgie that = (Ordonnancechirurgie) o;

        if (numord != that.numord) return false;
        if (idchir != that.idchir) return false;
        if (rang != null ? !rang.equals(that.rang) : that.rang != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) numord;
        result = 31 * result + (int) idchir;
        result = 31 * result + (rang != null ? rang.hashCode() : 0);
        return result;
    }
}

package HIBERNATE.src.entity;

import javax.persistence.*;

/**
 * Created by ethienneroy on 2016-12-12.
 */
@Entity
@IdClass(OrdonnancemedicamentsPK.class)
public class Ordonnancemedicaments {
    private byte numord;
    private byte idmed;
    private Byte nbboites;

    @Id
    @Column(name = "NUMORD")
    public byte getNumord() {
        return numord;
    }

    public void setNumord(byte numord) {
        this.numord = numord;
    }

    @Id
    @Column(name = "IDMED")
    public byte getIdmed() {
        return idmed;
    }

    public void setIdmed(byte idmed) {
        this.idmed = idmed;
    }

    @Basic
    @Column(name = "NBBOITES")
    public Byte getNbboites() {
        return nbboites;
    }

    public void setNbboites(Byte nbboites) {
        this.nbboites = nbboites;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ordonnancemedicaments that = (Ordonnancemedicaments) o;

        if (numord != that.numord) return false;
        if (idmed != that.idmed) return false;
        if (nbboites != null ? !nbboites.equals(that.nbboites) : that.nbboites != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) numord;
        result = 31 * result + (int) idmed;
        result = 31 * result + (nbboites != null ? nbboites.hashCode() : 0);
        return result;
    }
}

package entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Time;

/**
 * Created by ethienneroy on 2016-12-11.
 */
@Entity
public class Ordonnance {
    private byte numord;
    private String recommandantions;
    private String type;
    private Time datec;
    private Byte nbrmedicaments;

    @Id
    @Column(name = "NUMORD")
    public byte getNumord() {
        return numord;
    }

    public void setNumord(byte numord) {
        this.numord = numord;
    }

    @Basic
    @Column(name = "RECOMMANDANTIONS")
    public String getRecommandantions() {
        return recommandantions;
    }

    public void setRecommandantions(String recommandantions) {
        this.recommandantions = recommandantions;
    }

    @Basic
    @Column(name = "TYPE")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
    @Column(name = "NBRMEDICAMENTS")
    public Byte getNbrmedicaments() {
        return nbrmedicaments;
    }

    public void setNbrmedicaments(Byte nbrmedicaments) {
        this.nbrmedicaments = nbrmedicaments;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Ordonnance that = (Ordonnance) o;

        if (numord != that.numord) return false;
        if (recommandantions != null ? !recommandantions.equals(that.recommandantions) : that.recommandantions != null)
            return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (datec != null ? !datec.equals(that.datec) : that.datec != null) return false;
        if (nbrmedicaments != null ? !nbrmedicaments.equals(that.nbrmedicaments) : that.nbrmedicaments != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) numord;
        result = 31 * result + (recommandantions != null ? recommandantions.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (datec != null ? datec.hashCode() : 0);
        result = 31 * result + (nbrmedicaments != null ? nbrmedicaments.hashCode() : 0);
        return result;
    }
}

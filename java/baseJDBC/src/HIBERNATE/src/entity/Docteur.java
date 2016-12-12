package HIBERNATE.src.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * Created by ethienneroy on 2016-12-12.
 */
@Entity
public class Docteur {
    private byte matricule;
    private String nomm;
    private String prenomm;
    private String ville;
    private String adresse;
    private String niveau;
    private Byte nbrpatients;
    private Byte nbrmoyenmedicaments;

    @Id
    @Column(name = "MATRICULE")
    public byte getMatricule() {
        return matricule;
    }

    public void setMatricule(byte matricule) {
        this.matricule = matricule;
    }

    @Basic
    @Column(name = "NOMM")
    public String getNomm() {
        return nomm;
    }

    public void setNomm(String nomm) {
        this.nomm = nomm;
    }

    @Basic
    @Column(name = "PRENOMM")
    public String getPrenomm() {
        return prenomm;
    }

    public void setPrenomm(String prenomm) {
        this.prenomm = prenomm;
    }

    @Basic
    @Column(name = "VILLE")
    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    @Basic
    @Column(name = "ADRESSE")
    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    @Basic
    @Column(name = "NIVEAU")
    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    @Basic
    @Column(name = "NBRPATIENTS")
    public Byte getNbrpatients() {
        return nbrpatients;
    }

    public void setNbrpatients(Byte nbrpatients) {
        this.nbrpatients = nbrpatients;
    }

    @Basic
    @Column(name = "NBRMOYENMEDICAMENTS")
    public Byte getNbrmoyenmedicaments() {
        return nbrmoyenmedicaments;
    }

    public void setNbrmoyenmedicaments(Byte nbrmoyenmedicaments) {
        this.nbrmoyenmedicaments = nbrmoyenmedicaments;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Docteur docteur = (Docteur) o;

        if (matricule != docteur.matricule) return false;
        if (nomm != null ? !nomm.equals(docteur.nomm) : docteur.nomm != null) return false;
        if (prenomm != null ? !prenomm.equals(docteur.prenomm) : docteur.prenomm != null) return false;
        if (ville != null ? !ville.equals(docteur.ville) : docteur.ville != null) return false;
        if (adresse != null ? !adresse.equals(docteur.adresse) : docteur.adresse != null) return false;
        if (niveau != null ? !niveau.equals(docteur.niveau) : docteur.niveau != null) return false;
        if (nbrpatients != null ? !nbrpatients.equals(docteur.nbrpatients) : docteur.nbrpatients != null) return false;
        if (nbrmoyenmedicaments != null ? !nbrmoyenmedicaments.equals(docteur.nbrmoyenmedicaments) : docteur.nbrmoyenmedicaments != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) matricule;
        result = 31 * result + (nomm != null ? nomm.hashCode() : 0);
        result = 31 * result + (prenomm != null ? prenomm.hashCode() : 0);
        result = 31 * result + (ville != null ? ville.hashCode() : 0);
        result = 31 * result + (adresse != null ? adresse.hashCode() : 0);
        result = 31 * result + (niveau != null ? niveau.hashCode() : 0);
        result = 31 * result + (nbrpatients != null ? nbrpatients.hashCode() : 0);
        result = 31 * result + (nbrmoyenmedicaments != null ? nbrmoyenmedicaments.hashCode() : 0);
        return result;
    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

/**
 *
 * @author Ethienne Roy ROYE08129209
 */
public class Specialite{
    int code;
    String nom;
    String description;
    int categorie;

    public Specialite(int code, String nom, String description, int categorie) {
        this.code = code;
        this.nom = nom;
        this.description = description;
        this.categorie = categorie;
    }
}

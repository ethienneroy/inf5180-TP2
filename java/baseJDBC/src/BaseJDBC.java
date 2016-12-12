/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package basejdbc;

import models.*;

import javax.print.Doc;
/**
 *
 * @author Zied Zaier < Zaier.Zied at uqam.ca>
 */

import java.sql.*;


public class BaseJDBC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Connection conn = null;
        PreparedStatement stmt = null;
        try{
            //STEP 2: enregistrement du  driver JDBC
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

            //STEP 3: Ouvrir une connexion
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@zeta2.labunix.uqam.ca:1521:BACLAB",
            args[0],args[1]);

            //STEP 4: Executer une requete
            System.out.println("Creating statement...");

//            String sql = "select docteur.matricule, docteur.nomM,docteur.prenomM,count(consultation.dateC) as numberConsultation from docteur left join consultation on docteur.matricule = consultation.codedocteur group by docteur.matricule,docteur.prenomM,docteur.nomM";
            String sql = "select docteur.matricule, docteur.nomM,docteur.prenomM,count(consultation.dateC) as numberConsultation from docteur left join consultation on docteur.matricule = consultation.codedocteur group by docteur.matricule,docteur.prenomM,docteur.nomM order by docteur.nomM";
            stmt = conn.prepareStatement(sql);
            ResultSet rs;
            rs = stmt.executeQuery();

            //STEP 5: Extraction des  donnees du result set
            while(rs.next()){
                int id  = rs.getInt(1);
                String name = rs.getString(2);
                String prenom = rs.getString(3);
                int consults = rs.getInt(4);

                //Afficher les valeurs
                System.out.print("Matricule: " + id);
                System.out.print(", Prenom: " + prenom);
                System.out.println(", Nom: " + name);
            }
            rs.close();
            stmt.close();
            conn.close();
        }catch(SQLException se){
            //Gerer les erreur pour JDBC
            se.printStackTrace();
        }catch(Exception e){
            //Gerer les erreur pour  Class.forName
            e.printStackTrace();
        }

    }




}

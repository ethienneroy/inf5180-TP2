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

    private static String user = "inf5180";
    private static String pwd = "ROY85277";
//    static final String JDBC_DRIVER = "Driver d'oracle";
    static final String DB_URL = "jdbc:oracle:thin@74.208.82.123:1521:BACLAB";
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Connection conn = null;
        Statement stmt = null;
        try{
            //STEP 2: enregistrement du  driver JDBC
            DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());

            //STEP 3: Ouvrir une connexion
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@zeta2.labunix.uqam.ca:1521:BACLAB",
            "kg191182", "NgkxSWnk");

            //STEP 4: Executer une requete
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "SELECT * FROM Medicament";
            ResultSet rs = stmt.executeQuery(sql);

            //STEP 5: Extraction des  donnees du result set
            while(rs.next()){
                //Retrouver  par le nom de la colonne
                int id  = rs.getInt("idMed");
                String name = rs.getString("nommed");
//                String phone = rs.getString("notelephone");

                //Afficher les valeurs
                System.out.print("ID: " + id);
                System.out.print(", Name: " + name);
//                System.out.println(", Phone: " + phone);
            }

            //STEP 6: Executer un Update - Insert
//            sql = "insert into client values(5,'zaier','51455555555')";
//            int number = stmt.executeUpdate(sql);
//            System.out.println(" the change 1: " + number);
//
//            //STEP 7: Executer un Update - Update
//            sql = "update client set notelephone ='9999999999’ where noclient=5";
//            number = stmt.executeUpdate(sql);
//            System.out.println(" the change 2: " + number);
//
//            //STEP 8: Executer un Update - Delete
//            sql = "Delete from client where noclient=5";
//            number = stmt.executeUpdate(sql);
//            System.out.println(" the change 3: " + number);

            //STEP 9: Clean-up de l'environnementement
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

        System.out.println("Goodbye!");

    }




}

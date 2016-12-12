package HIBERNATE.src;

import entity.Chirurgie;
import entity.Typechirurgie;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.metadata.ClassMetadata;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import persistence.HibernateUtil;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by ethienneroy on 2016-12-11.
 */
public class Main {
    public static void main(String[] args) {


        System.out.println("une query qui affiche le nombre de chirurgie par salle");

        Session uneSession = HibernateUtil.getSessionFactory().openSession();
        Transaction uneTransaction = uneSession.beginTransaction();

//        String sql = "select typechirurgie.nom,typechirurgie.descritption, count(chirurgie.idchirurgie) as numberChirurgie from typechirurgie left outer join chirurgie on typechirurgie.idtype=chirurgie.idtype group by chirurgie.idtype,typechirurgie.nom,typechirurgie.descritption;";

        List chirurgies =
                uneSession.createQuery("from Typechirurgie").list();

        System.out.println( chirurgies.size() + " TypeChirurgie trouves:" );

        for (Iterator iterTypeChirurgies = chirurgies.iterator(); iterTypeChirurgies.hasNext(); ) {
            Typechirurgie chir = (Typechirurgie) iterTypeChirurgies.next();
            System.out.println("TypeChirurgie:"+ chir.getNom());
        }

        uneTransaction.commit();
        uneSession.close();

        // Arr�t de l'application Hibernate
        HibernateUtil.shutdown();
    }
}
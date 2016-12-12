package HIBERNATE.src.persistence;

import org.hibernate.*;
import org.hibernate.cfg.*;

/**
 * Singleton qui démarre Hibernate et fournit l'objet SessionFactory
 */
public class HibernateUtil {

  private static SessionFactory sessionFactory;

  static {
    try {
       sessionFactory = new Configuration().configure().buildSessionFactory();
    } catch (Throwable ex) {
       throw new ExceptionInInitializerError(ex);
    }
  }

  public static SessionFactory getSessionFactory() {
      return sessionFactory;
  }

  public static void shutdown() {
      // Ferme les antémémoires et les bassins (pool) de connexions
      getSessionFactory().close();
  }
}

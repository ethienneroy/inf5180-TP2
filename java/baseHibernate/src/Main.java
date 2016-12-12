import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.metadata.ClassMetadata;

import java.util.Map;

 /**
 * Created by ethienneroy on 2016-12-11.
 */
public class Main {
    private static final SessionFactory ourSessionFactory;

    static {
        try {
//            ourSessionFactory = new Configuration().
//                    configure("hibernate.cfg.xml").
//                    buildSessionFactory();
            AnnotationConfiguration conf = new AnnotationConfiguration().configure();
            conf.setProperty("hibernate.connection.url", "jdbc:oracle:thin:@localhost:1521:XE");
            conf.setProperty("hibernate.connection.username", "hr");
            conf.setProperty("hibernate.connection.password", "x27136");
            conf.configure();
            ourSessionFactory = conf.buildSessionFactory();

        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession(String user,String pwd) throws HibernateException {
        return ourSessionFactory.openSession();
    }


    public static void main(final String[] args) throws Exception {
        System.out.println(args[0]);
//        afficher le nombre de chirurgies par type
        String sql = "select typechirurgie.nom,typechirurgie.descritption, count(chirurgie.idchirurgie) as numberChirurgie from typechirurgie left outer join chirurgie on typechirurgie.idtype=chirurgie.idtype group by chirurgie.idtype,typechirurgie.nom,typechirurgie.descritption;";
        final Session session = getSession(args[0],args[1]);
        try {
            System.out.println("querying all the managed entities...");
            final Map metadataMap = session.getSessionFactory().getAllClassMetadata();
            for (Object key : metadataMap.keySet()) {
                final ClassMetadata classMetadata = (ClassMetadata) metadataMap.get(key);
                final String entityName = classMetadata.getEntityName();
                final Query query = session.createQuery("from " + entityName);
                System.out.println("executing: " + query.getQueryString());
                for (Object o : query.list()) {
                    System.out.println("  " + o);
                }
            }
        } finally {
            session.close();
        }

    }
}

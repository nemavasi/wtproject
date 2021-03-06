package nemavasi.wtproject.hib;

import nemavasi.wtproject.core.dao.LogLevelEntity;
import nemavasi.wtproject.core.dao.RoleEntity;
import org.hibernate.Query;
import org.hibernate.Session;


import java.util.List;

/**
 * Created by nemavasi on 05.01.17.
 */
public class TestHib {
    public static void main(String[] args) {
        System.out.println("Hibernate tutorial");

        try {
            Session session = HibernateUtil.getSessionFactory().openSession();

            // session.beginTransaction();
            Query query = session.createQuery("from LogLevelEntity ");
            List<LogLevelEntity> list = query.list();


            System.out.println(list.get(1).getName() + " " + list.get(1).isDeleted() + " " + list.get(1).getWarning_level()+ " " + list.get(1).getSearchSynonim());

            //   session.save(contactEntity);
            //  session.getTransaction().commit();

            session.close();
        } finally {
            HibernateUtil.shutdown();
        }


    }
}

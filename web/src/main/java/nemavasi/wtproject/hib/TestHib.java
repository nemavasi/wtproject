package nemavasi.wtproject.hib;

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

        Session session = HibernateUtil.getSessionFactory().openSession();

       // session.beginTransaction();
        Query query = session.createQuery("from RoleEntity ");
        List<RoleEntity> list = query.list();

        System.out.println(list.get(1).getName());

     //   session.save(contactEntity);
      //  session.getTransaction().commit();

        session.close();

        HibernateUtil.shutdown();
    }
}

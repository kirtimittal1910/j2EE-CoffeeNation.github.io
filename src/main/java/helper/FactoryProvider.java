package helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

public class FactoryProvider {
   private static SessionFactory factory;
   
   public static SessionFactory getFactory() {
	   
	   try {
		 if(factory==null) {
			 Configuration con= new Configuration();
			 con.configure();
			 ServiceRegistry serviceRegistry = new ServiceRegistryBuilder().applySettings(con.getProperties()). buildServiceRegistry();
		     factory = con.buildSessionFactory(serviceRegistry);
		 }
	} catch (Exception e) {
		e.printStackTrace();
	}
	   
	   return factory;
   }
}

package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Entities.Product;

public class ProductDao {
	
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
 
	public boolean saveProduct(Product product) {
		 boolean save= false;
		try {
			
			Session session= this.factory.openSession();
			Transaction tx= session.beginTransaction();
			
			session.save(product);
			
			tx.commit();
			session.close();
			save= true;
			
		} catch (Exception e) {
			e.printStackTrace();
			save= false;
		}
		
		return save;
	}
	
	
	//get all products 
	public List<Product> getAllProducts(){
		Session s = this.factory.openSession();
		Query query= s.createQuery("from Product");
		List<Product> list= query.list();
		return list;
	}
	
	//get all products of given category
	public List<Product> getAllProductsById(int cId){
		Session s = this.factory.openSession();
		Query query= s.createQuery("from Product as p where p.category.categoryId = :id");
		query.setParameter("id", cId);
		List<Product> list= query.list();
		return list;
	}
	
	public List<Product> getAllProductsName(){
		Session s = this.factory.openSession();
		Query query= s.createQuery("Select P.pName from Product P");
		List<Product> list= query.list();
		return list;
	}
	

}

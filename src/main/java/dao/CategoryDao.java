package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import Entities.Category;

public class CategoryDao {
	
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	//saves the category to db
	public void saveCategory(Category cat) {
		
		Session session= this.factory.openSession();
		Transaction tx= session.beginTransaction();
		
		session.save(cat);
		tx.commit();
		session.close();
		
		return;
	}
	
	public List<Category> getCategories(){
		Session s= this.factory.openSession();
		Query query= s.createQuery("from Category");
		List<Category> list= query.list();
		return list;
	}
	
	public Category getCategoryById(int cId) {
		Category category= null;
		try {
			
			Session session= this.factory.openSession();
			 category= (Category) session.get(Category.class, cId);
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return category;
	}
	

}

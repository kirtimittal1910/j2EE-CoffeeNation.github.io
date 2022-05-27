package Entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	private String categoryTitile;
	private String categoryDescription;
	
	@OneToMany(mappedBy = "category")
	private Set<Product> products = new HashSet<>();
	
		

	public Category(int categoryId, String categoryTitile, String categoryDescription, Set<Product> products) {
		super();
		this.categoryId = categoryId;
		this.categoryTitile = categoryTitile;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}
	

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}


	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitile() {
		return categoryTitile;
	}

	public void setCategoryTitile(String categoryTitile) {
		this.categoryTitile = categoryTitile;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}
	

	public Set<Product> getProducts() {
		return products;
	}


	public void setProducts(Set<Product> products) {
		this.products = products;
	}


	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitile=" + categoryTitile + ", categoryDescription="
				+ categoryDescription + "]";
	}
	
	
}

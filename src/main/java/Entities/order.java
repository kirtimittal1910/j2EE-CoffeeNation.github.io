package Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name= "OrderItems")
public class order {
   
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int orderId;
	private String userName;
	private String contact;
	private String items;
	
	
	
	public order(int orderId, String userName, String contact, String items) {
		super();
		this.orderId = orderId;
		this.userName = userName;
		this.contact = contact;
		this.items = items;
	}
	
	public order(String userName, String contact, String items) {
		super();
		this.userName = userName;
		this.contact = contact;
		this.items = items;
	}
	
	public order() {
		super();
	}
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "order [orderId=" + orderId + ", userName=" + userName + ", contact=" + contact
				+ ", items=" + items + "]";
	}

		
	
}

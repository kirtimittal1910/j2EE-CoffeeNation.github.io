package Entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class feedback {

	private String rating;
	
	@Id
	private String email;
	private String experience;
	
	public feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public feedback(String rating, String email, String experience) {
		super();
		this.rating = rating;
		this.email = email;
		this.experience = experience;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	@Override
	public String toString() {
		return "feedback [rating=" + rating + ", email=" + email + ", experience=" + experience + "]";
	}
	
	
	
}


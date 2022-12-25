package my.model;

import java.util.Date;

public class Project_Purchase {
	private int id;
	private String user_name;
	private int item_id;
	private String item_name;
	private int amount;
	private int price;
	private Date created_at;
	private Date updated_at;
	
	public Project_Purchase() {}


	public Project_Purchase(String user_name, int item_id, String item_name, int amount, int price,
			Date created_at, Date updated_at) {
		super();
		this.user_name = user_name;
		this.item_id = item_id;
		this.item_name = item_name;
		this.amount = amount;
		this.price = price;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}




	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getUser_name() {
		return user_name;
	}




	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}




	public int getItem_id() {
		return item_id;
	}




	public void setItem_id(int item_id) {
		this.item_id = item_id;
	}




	public String getItem_name() {
		return item_name;
	}




	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}




	public int getAmount() {
		return amount;
	}




	public void setAmount(int amount) {
		this.amount = amount;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public Date getCreated_at() {
		return created_at;
	}




	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}




	public Date getUpdated_at() {
		return updated_at;
	}




	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	
}

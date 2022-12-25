package my.model;

import java.util.Date;

public class Project_Items {
	private int id;
	private String name;
	private String memo;
	private String image;
	private int price;
	private int favorite;
	private Date created_at;
	private Date updated_at;
	
	public Project_Items() {}
	
	public Project_Items(int id, String name, String memo, String image, int price, int favorite, Date created_at,
			Date updated_at) {
		super();
		this.id = id;
		this.name = name;
		this.memo = memo;
		this.image = image;
		this.price = price;
		this.favorite = favorite;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}
	

	public Project_Items(int id, String name, String memo, String image, int price, Date created_at, Date updated_at) {
		super();
		this.id = id;
		this.name = name;
		this.memo = memo;
		this.image = image;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
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

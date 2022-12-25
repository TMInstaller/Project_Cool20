package my.model;

import java.util.Date;

public class Project_Review {
	private int id;
	private String username;
	private String title;
	private String item_name;
	private String content;
	private int score;
	private String image;
	private Date created_at;
	private Date updated_at;
	
	
	public Project_Review() {}

	
	public Project_Review(int id, String username, String title, String item_name, String content, int score,
			String image, Date created_at, Date updated_at) {
		super();
		this.id = id;
		this.username = username;
		this.title = title;
		this.item_name = item_name;
		this.content = content;
		this.score = score;
		this.image = image;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}




	public Project_Review(String username, String title, String item_name, String content, int score, String image,
			Date created_at, Date updated_at) {
		super();
		this.username = username;
		this.title = title;
		this.item_name = item_name;
		this.content = content;
		this.score = score;
		this.image = image;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getScore() {
		return score;
	}


	public void setScore(int score) {
		this.score = score;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
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

package my.model;

import java.util.Date;

public class Project_User {
	private int id;
	private String username;
	private String password;
	private String p_name;
	private String gender;
	private String birth;
	private String pnum;
	private String address_num;
	private String address_road;
	private String address_detail;
	private Date created_at;
	private Date updated_at;

	public Project_User() {
	}

	public Project_User(int id, String username, String password, String p_name, String gender, String birth,
			String pnum, String address_num, String address_road, String address_detail, Date created_at,
			Date updated_at) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.p_name = p_name;
		this.gender = gender;
		this.birth = birth;
		this.pnum = pnum;
		this.address_num = address_num;
		this.address_road = address_road;
		this.address_detail = address_detail;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getAddress_num() {
		return address_num;
	}

	public void setAddress_num(String address_num) {
		this.address_num = address_num;
	}

	public String getAddress_road() {
		return address_road;
	}

	public void setAddress_road(String address_road) {
		this.address_road = address_road;
	}

	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
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
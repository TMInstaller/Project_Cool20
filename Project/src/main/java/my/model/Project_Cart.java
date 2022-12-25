package my.model;

public class Project_Cart {
	private int iid;
	private int amount;
	private String image;
	
	public Project_Cart() {} // 기본 생성자

	public Project_Cart(int iid, int amount, String image) {
		super();
		this.iid = iid;
		this.amount = amount;
		this.image = image;
	}

	public int getIid() {
		return iid;
	}

	public void setIid(int iid) {
		this.iid = iid;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}

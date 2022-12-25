package my.model;

import java.util.Date;

public class Board {
	private int boardId;
	private String title;
	private String content;
	private String userId;
	private Date bdate;
	
	public Board() {}

	public Board(String title, String content, String userId, Date bdate) {
		super();
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.bdate = bdate;
	}
	
	public Board(int boardId, String title, String content, String userId, Date bdate) {
		super();
		this.boardId = boardId;
		this.title = title;
		this.content = content;
		this.userId = userId;
		this.bdate = bdate;
	} // 메소드 오버라이딩

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getBdate() {
		return bdate;
	}

	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}
	
	
}

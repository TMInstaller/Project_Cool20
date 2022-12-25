package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Project_Notice;
import my.model.Project_Review;
import my.util.JdbcUtil;

public class Project_ReviewDao {
	
	public void insert(Connection conn, Project_Review review) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into project_review (username, title, item_name, content, score, image, created_at, updated_at)"
					+ " values(?,?,?,?,?,?,?,?)");
			pstmt.setString(1, review.getUsername());
			pstmt.setString(2, review.getTitle());
			pstmt.setString(3, review.getItem_name());
			pstmt.setString(4, review.getContent());
			pstmt.setInt(5, review.getScore());
			pstmt.setString(6, review.getImage());
			pstmt.setTimestamp(7, new Timestamp(review.getCreated_at().getTime()));
			pstmt.setTimestamp(8, new Timestamp(review.getUpdated_at().getTime()));
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	public List<Project_Review> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Project_Review review = null;
		List<Project_Review> reviewList = new ArrayList<Project_Review>();
		String sql = "select id, username, title, item_name, content, score, image, created_at, updated_at from project_review";
		try {
			pstmt = conn.prepareStatement(sql);			
			rs  = pstmt.executeQuery(); 
			while (rs.next()){
				review = new Project_Review();
				review.setId(rs.getInt(1));
				review.setUsername(rs.getString(2));
				review.setTitle(rs.getString(3));
				review.setItem_name(rs.getString(4));
				review.setContent(rs.getString(5));
				review.setScore(rs.getInt(6));
				review.setImage(rs.getString(7));
				review.setCreated_at(rs.getTimestamp(8));
				review.setUpdated_at(rs.getTimestamp(9));
				reviewList.add(review);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return reviewList;
	}
	// 해당 항목에 맞는 리뷰 불러오기
	 public Project_Review selectById(Connection conn, int rid) 
	         throws SQLException {
	      PreparedStatement pstmt=null; 
	      ResultSet rs = null;
	      Project_Review review = null;
	      try {
	         pstmt = conn.prepareStatement
	         ("select * from project_review where id = ?");
	         pstmt.setInt(1, rid);
	         rs = pstmt.executeQuery();
	         if (rs.next()){
	        	review = new Project_Review();
				review.setId(rs.getInt(1));
				review.setUsername(rs.getString(2));
				review.setTitle(rs.getString(3));
				review.setItem_name(rs.getString(4));
				review.setContent(rs.getString(5));
				review.setScore(rs.getInt(6));
				review.setImage(rs.getString(7));
				review.setCreated_at(rs.getTimestamp(8));
				review.setUpdated_at(rs.getTimestamp(9));
	         }
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
	      return review;
	   }
	 
	 public void deleteById(Connection conn, int rid) 
	         throws SQLException {
	      PreparedStatement pstmt=null;       
	      try {
	         pstmt = conn.prepareStatement
	         ("delete from project_review where id = ?");
	         pstmt.setInt(1, rid);
	         pstmt.executeUpdate();         
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	      }
	   }
	 
	 public void update(Connection conn, Project_Review review) 
	         throws SQLException {
	      PreparedStatement pstmt=null; 
	      try {
	         pstmt = conn.prepareStatement
	         ("update project_review set title=?,content=?,image=?, "
	               + "  updated_at=? where id=?");
	         pstmt.setString(1, review.getTitle());
	         pstmt.setString(2, review.getContent());
	         pstmt.setString(3, review.getImage());
	         pstmt.setTimestamp(4, new Timestamp(review.getUpdated_at().getTime()));
	         pstmt.setInt(5, review.getId());
	         pstmt.executeUpdate(); 
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	      }
	   }
	 // 이미 작성한 상품인지 여부 확인용
	 public int possible(Connection conn, String item_name) 
	         throws SQLException {
	      PreparedStatement pstmt=null; 
	      ResultSet rs = null;
	      int count = 0;
	      try {
	         pstmt = conn.prepareStatement
	         ("select count(id), username from project_review where item_name=? group by username");
	         pstmt.setString(1, item_name);
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	        	 count = rs.getInt(1);
	         }
	         count += 1;
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
	 	 return count;
	   }
	 
	 public List<Project_Review> selectListByItemName(Connection conn, String keyword) 
				throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Project_Review review = null;
			List<Project_Review> reviewList = new ArrayList<Project_Review>();
			String sql = "select id, username, title, item_name, content, score, image, created_at, updated_at from project_review ";
			sql += "where item_name="+keyword;
			try {
				pstmt = conn.prepareStatement(sql);
				rs  = pstmt.executeQuery(); 
				while (rs.next()){
					review = new Project_Review();
					review.setId(rs.getInt(1));
					review.setUsername(rs.getString(2));
					review.setTitle(rs.getString(3));
					review.setItem_name(rs.getString(4));
					review.setContent(rs.getString(5));
					review.setScore(rs.getInt(6));
					review.setImage(rs.getString(7));
					review.setCreated_at(rs.getTimestamp(8));
					review.setUpdated_at(rs.getTimestamp(9));
					reviewList.add(review);
				}
			} finally {
				//JdbcUtil.close(conn);
				JdbcUtil.close(rs);
				JdbcUtil.close(pstmt);
			}
			return reviewList;
		}
}





















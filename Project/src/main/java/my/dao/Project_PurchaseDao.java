package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Project_Items;
import my.model.Project_Purchase;
import my.util.JdbcUtil;

public class Project_PurchaseDao {
	
	public void insert(Connection conn, Project_Purchase purchase) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into project_purchase (user_name, item_id, item_name, amount, price, created_at)"
					+ " values(?,?,?,?,?,?)");
			pstmt.setString(1, purchase.getUser_name());
			pstmt.setInt(2, purchase.getItem_id());
			pstmt.setString(3, purchase.getItem_name());
			pstmt.setInt(4, purchase.getAmount());
			pstmt.setInt(5, purchase.getPrice());
			pstmt.setTimestamp(6, new Timestamp(purchase.getCreated_at().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}

	public List<Project_Purchase> showPurchase(Connection conn, String username) 
	         throws SQLException {
	      PreparedStatement pstmt=null;
	      ResultSet rs = null;
	      Project_Purchase purchase = null;
	      List<Project_Purchase> list_Purchase = new ArrayList<Project_Purchase>();
	      String sql = "select distinct(item_name) from project_purchase where user_name = ? order by created_at desc";
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, username);
	         rs = pstmt.executeQuery();
	         while (rs.next()){
	            purchase = new Project_Purchase();
	            purchase.setItem_name(rs.getString(1));
	            list_Purchase.add(purchase);
	         }
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
	      return list_Purchase;
	   }
	
// 지금까지 구매된 제품의 수량과 가격과 사람 수를 구하는 sql
// SELECT price*SUM(amount), SUM(amount), item_name
//	FROM project_purchase
//	WHERE item_name = "갈색신"
//	GROUP BY item_name;
// 누적 구매자수 구하기
// SELECT count(DISTINCT(user_name)), item_name
//	FROM project_purchase
//	WHERE item_name = "갈색신"

}
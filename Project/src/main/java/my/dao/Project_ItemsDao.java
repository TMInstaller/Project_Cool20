package my.dao;

import java.awt.ItemSelectable;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import my.model.ItemListView;
import my.model.Project_Items;
import my.util.JdbcUtil;

public class Project_ItemsDao {
	
	
	// 상품추가 페이지에서 실행 될 내용
	public void insert(Connection conn, Project_Items items) 
	// Project_Items를 선언
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into project_items (name, memo, image, price, created_at, updated_at)"
					+ " values(?,?,?,?,?,?)");
			// insert에서 추가될 항목들(상품이름, 메모, 사진, 가격, 생성일자)
			// 상품아이디(자동추가), 선호도와 업데이트날짜는 상품을 추가하는 과정에서 들어가지 않음
			pstmt.setString(1, items.getName());
			pstmt.setString(2, items.getMemo());
			pstmt.setString(3, items.getImage());
			pstmt.setInt(4, items.getPrice());
			pstmt.setTimestamp(5, new Timestamp(items.getCreated_at().getTime()));
			pstmt.setTimestamp(6, new Timestamp(items.getUpdated_at().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	

	
	public List<Project_Items> selectLike(Connection conn, String keyword) 
	         throws SQLException {
	      PreparedStatement pstmt=null;
	      ResultSet rs = null;
	      Project_Items items = null; 
	      List<Project_Items> list_Items = new ArrayList<Project_Items>();
	      String sql = "select * from project_items ";
	      if(keyword != null && !keyword.equals("")) {
	         sql += "where name like '%"+keyword+"%' or (memo like'%"+keyword+"%')";
	      }
	      sql += "order by created_at desc";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         //pstmt.setString(1, "%"+keyword+"%");
	         rs = pstmt.executeQuery();
	         while (rs.next()){
	            items = new Project_Items();
	            items.setId(rs.getInt(1));
	            items.setName(rs.getString(2));
	            items.setMemo(rs.getString(3));
	            items.setImage(rs.getString(4));
	            items.setPrice(rs.getInt(5));
	            items.setFavorite(rs.getInt(6));
	            items.setCreated_at(rs.getTimestamp(7));
	            items.setUpdated_at(rs.getTimestamp(8));;
	            list_Items.add(items);
	         }
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
	      return list_Items;
	   }
	//이름들 나열해주는 윈도우 창
	public List<Project_Items> showItems(Connection conn, String keyword) 
	         throws SQLException {
	      PreparedStatement pstmt=null;
	      ResultSet rs = null;
	      Project_Items items = null; 
	      List<Project_Items> list_Items = new ArrayList<Project_Items>();
	      String sql = "select * from project_items ";
	      if(keyword != null && !keyword.equals("")) {
	         sql += "where name like '%"+keyword+"%' or (memo like'%"+keyword+"%')";
	      }
	      sql += " order by memo";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         //pstmt.setString(1, "%"+keyword+"%");
	         rs = pstmt.executeQuery();
	         while (rs.next()){
	            items = new Project_Items();
	            items.setId(rs.getInt(1));
	            items.setName(rs.getString(2));
	            items.setMemo(rs.getString(3));
	            items.setImage(rs.getString(4));
	            items.setPrice(rs.getInt(5));
	            items.setFavorite(rs.getInt(6));
	            list_Items.add(items);
	         }
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(rs);
	      }
	      return list_Items;
	   }
	
	// -> sub9_purhase.jsp
	public Project_Items selectById(Connection conn, int id) 
			throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Project_Items items = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from project_items where id = ?");
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()){
				items = new Project_Items();
				items.setId(rs.getInt(1));
				items.setName(rs.getString(2));
				items.setMemo(rs.getString(3));
				items.setImage(rs.getString(4));
				items.setPrice(rs.getInt(5));
				items.setFavorite(rs.getInt(6));
				items.setCreated_at(rs.getTimestamp(7));
				items.setUpdated_at(rs.getTimestamp(8));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			//connection close는 jsp에서 하는걸로 한다
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return items;
	}
	
	public Project_Items selectByName(Connection conn, String item) 
			throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Project_Items items = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from project_items where name = ?");
			pstmt.setString(1, item);
			rs = pstmt.executeQuery();
			if (rs.next()){
				items = new Project_Items();
				items.setId(rs.getInt(1));
				items.setName(rs.getString(2));
				items.setMemo(rs.getString(3));
				items.setImage(rs.getString(4));
				items.setPrice(rs.getInt(5));
				items.setFavorite(rs.getInt(6));
				items.setCreated_at(rs.getTimestamp(7));
				items.setUpdated_at(rs.getTimestamp(8));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			//connection close는 jsp에서 하는걸로 한다
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return items;
	}
	
	public void updateAll(Connection conn, Project_Items item) 
			throws SQLException {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement
			("update project_items set name=?,memo=?,price=?,updated_at=? where id=?");
			pstmt.setString(1, item.getName());
			pstmt.setString(2, item.getMemo());
			pstmt.setInt(3, item.getPrice());
			pstmt.setTimestamp(4, new Timestamp(item.getUpdated_at().getTime()));
			pstmt.setInt(5, item.getId());

			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	// 구매 시 favorite 증가시키기
	public void update(Connection conn, int fav, int id) 
			throws SQLException {
		PreparedStatement pstmt=null;
		try {
			pstmt = conn.prepareStatement
			("update project_items set favorite=? where id=?");
			pstmt.setInt(1, fav);
			pstmt.setInt(2, id);
			
			pstmt.executeUpdate();
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	public List<Project_Items> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Project_Items items = null; 
		List<Project_Items> list_Items = new ArrayList<Project_Items>();
		String sql = "select * from project_items ";
		if(keyword != null && !keyword.equals("")) {
			sql += "where "+ target+" like '%"+keyword+"%'";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				items = new Project_Items();
				items.setId(rs.getInt(1));
				items.setName(rs.getString(2));
				items.setMemo(rs.getString(3));
				items.setImage(rs.getString(4));
				items.setPrice(rs.getInt(5));
				items.setFavorite(rs.getInt(6));
				list_Items.add(items);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return list_Items;
	}
	
	
	
	// 헤더 인기제품, 이름만 가져올 예정
	public List<Project_Items> selectName(Connection conn)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Project_Items> itemList = null;
		try {
			pstmt = conn.prepareStatement("select id, name from project_items order by favorite desc limit 4 ");
			rs  = pstmt.executeQuery();
			itemList = new ArrayList<Project_Items>();
			while (rs.next()){
				Project_Items item = new Project_Items();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				itemList.add(item);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return itemList;
	}
	
	// 상의 출력
	public List<Project_Items> selectCloth(Connection conn)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Project_Items> itemList = null;
		try {
			pstmt = conn.prepareStatement("select * from project_items where memo= '상의'");
			rs  = pstmt.executeQuery();
			itemList = new ArrayList<Project_Items>();
			while (rs.next()){
				Project_Items item = new Project_Items();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				item.setMemo(rs.getString(3));
				item.setImage(rs.getString(4));
				item.setPrice(rs.getInt(5));
				item.setFavorite(rs.getInt(6));
				item.setCreated_at(rs.getTimestamp(7));
				item.setUpdated_at(rs.getTimestamp(8));
				itemList.add(item);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return itemList;
	}
	
	// 하의 리스트 출력
	public List<Project_Items> selectPants(Connection conn)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Project_Items> itemList = null;
		try {
			pstmt = conn.prepareStatement("select * from project_items where memo= '하의'");
			rs  = pstmt.executeQuery();
			itemList = new ArrayList<Project_Items>();
			while (rs.next()){
				Project_Items item = new Project_Items();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				item.setMemo(rs.getString(3));
				item.setImage(rs.getString(4));
				item.setPrice(rs.getInt(5));
				item.setFavorite(rs.getInt(6));
				item.setCreated_at(rs.getTimestamp(7));
				item.setUpdated_at(rs.getTimestamp(8));
				itemList.add(item);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return itemList;
	}
	
	// 모자 리스트 출력
	public List<Project_Items> selectHat(Connection conn)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Project_Items> itemList = null;
		try {
			pstmt = conn.prepareStatement("select * from project_items where memo= '모자'");
			rs  = pstmt.executeQuery();
			itemList = new ArrayList<Project_Items>();
			while (rs.next()){
				Project_Items item = new Project_Items();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				item.setMemo(rs.getString(3));
				item.setImage(rs.getString(4));
				item.setPrice(rs.getInt(5));
				item.setFavorite(rs.getInt(6));
				item.setCreated_at(rs.getTimestamp(7));
				item.setUpdated_at(rs.getTimestamp(8));
				itemList.add(item);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return itemList;
	}
	
	public int selectCount(Connection conn, String keyword) 
			throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from project_items ";
	      if(keyword != null && !keyword.equals("")) {
	         sql += "where name like '%"+keyword+"%' or (memo like'%"+keyword+"%')";
	     }
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			return rs.getInt(1);
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
		}
	}

	
	public List<Project_Items> selectListByLimit(Connection conn, int firstRow, int endRow, String keyword) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Project_Items> itemList = new ArrayList<Project_Items>();
	      String sql = "select * from project_items ";
	      if(keyword != null && !keyword.equals("")) {
	         sql += "where name like '%"+keyword+"%' or (memo like'%"+keyword+"%')";
	     }
	      sql += " limit ?, ?";
		try {
			pstmt = conn.prepareStatement (sql);
			
			pstmt.setInt(1,firstRow);
			pstmt.setInt(2,endRow);
			rs  = pstmt.executeQuery(); 
			itemList = new ArrayList<Project_Items>();
			while (rs.next()){
				Project_Items item = new Project_Items();
				item.setId(rs.getInt(1));
				item = new Project_Items();
				item.setId(rs.getInt(1));
				item.setName(rs.getString(2));
				item.setMemo(rs.getString(3));
				item.setImage(rs.getString(4));
				item.setPrice(rs.getInt(5));
				item.setFavorite(rs.getInt(6));
				itemList.add(item);
			}
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		return itemList;
	}
	
	private static final int itemCountPerPage = 6;

	public ItemListView getItemList(Connection conn, int pageNumber, String key)
			throws SQLException {
		
		int currentPageNumber = pageNumber;
		ItemListView plv = null;
		try {
			int itemTotalCount = selectCount(conn, key);
			List<Project_Items> itemList = null;
			int firstRow = 0; // 2page -> 6
			int endRow = 0; // 2page -> 10
			if (itemTotalCount > 0) {
				firstRow = (pageNumber - 1) * itemCountPerPage;
				endRow = itemCountPerPage; // 2page -> 5, 5(가져올 때 6, 10까지)
				itemList = selectListByLimit(conn, firstRow, endRow, key);
			} else {
				currentPageNumber = 0;
				itemList = Collections.emptyList();
			}
			plv = new ItemListView(itemTotalCount, currentPageNumber, itemList
					, itemCountPerPage);
		} catch (SQLException e) {
		} finally {
			//JdbcUtil.close(conn);
		}
		return plv;
	}
	
   public void deleteById(Connection conn, int iid) 
	         throws SQLException {
	      PreparedStatement pstmt=null;       
	      try {
	         pstmt = conn.prepareStatement
	         ("delete from project_items where id = ?");
	         pstmt.setInt(1, iid);
	         pstmt.executeUpdate();
	      } catch (SQLException e){
	         e.printStackTrace();
	      } finally {
	         //JdbcUtil.close(conn);
	         JdbcUtil.close(pstmt);
	      }
	   }

}
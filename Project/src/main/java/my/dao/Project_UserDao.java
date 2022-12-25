package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Project_User;
import my.util.ConnectionProvider;
import my.util.JdbcUtil;

public class Project_UserDao {
   
   public void insert(Connection conn, Project_User user)
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into project_user(username, password, p_name, gender, birth, pnum, address_num, address_road, address_detail, created_at) values (?,?,?,?,?,?,?,?,?,?)");
         pstmt.setString(1, user.getUsername());
         pstmt.setString(2, user.getPassword());
         pstmt.setString(3, user.getP_name());
         pstmt.setString(4, user.getGender());
         pstmt.setString(5, user.getBirth());
         pstmt.setString(6, user.getPnum());
         pstmt.setString(7, user.getAddress_num());
         pstmt.setString(8, user.getAddress_road());
         pstmt.setString(9, user.getAddress_detail());
         pstmt.setTimestamp(10, new Timestamp(user.getCreated_at().getTime()));
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   // 아이디를 입력받고 유저의 정보 불러오기
   public Project_User selectById(Connection conn, String username) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Project_User user = null;
      try {
         pstmt = conn.prepareStatement
         ("select * from project_user where username = ?");
         pstmt.setString(1, username);
         rs = pstmt.executeQuery();
         if (rs.next()){
            user = new Project_User();
            user.setUsername(rs.getString(1));
            user.setPassword(rs.getString(2));
            user.setP_name(rs.getString(3));
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return user;
   }
   
   // 로그인
   public boolean login(Connection conn, String username, String password) {
		boolean result = false;
		String sql = "SELECT * FROM project_user tu WHERE username = ? AND password =?";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
   
// 입력받은 아이디에 일치하는 비밀번호인지 확인
   public boolean checkUsername(Connection conn, String username, String password) 
   throws SQLException{
      Project_User user = selectById(conn, username); 
      if (user.getUsername().equals(username)==true)
         return true;
      else
         return false;
   }
   
   // 입력받은 아이디에 일치하는 비밀번호인지 확인
   public boolean checkPassword(Connection conn, String username, String password) 
   throws SQLException{
      Project_User user = selectById(conn, username); 
      if (user.getPassword().equals(password)==true)
         return true;
      else
         return false;
   }
   /*
   public List<User> selectLike(Connection conn, String target, String keyword) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      User user = null; 
      List<User> users = new ArrayList<User>();
      try {
         pstmt = conn.prepareStatement
         ("select * from user where " +target +" like ?");
         pstmt.setString(1, "%"+keyword+"%");
         rs = pstmt.executeQuery();
         while (rs.next()){
            user = new User(); 
            user.setUserId(rs.getString(1));
            user.setPassword(rs.getString(2));
            user.setName(rs.getString(3));
            user.setLoginTime(rs.getTimestamp(4));
            users.add(user);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return users;
   }
   
   public void update(Connection conn, User user) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("update user set password=?,name=? where userId=?");
         pstmt.setString(1, user.getPassword());
         pstmt.setString(2, user.getName());
         pstmt.setString(3, user.getUserId());
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public void deleteById(Connection conn, String userId) 
         throws SQLException {
      PreparedStatement pstmt=null;       
      try {
         pstmt = conn.prepareStatement
         ("delete from user where userId = ?");
         pstmt.setString(1, userId);
         pstmt.executeUpdate();         
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public int selectCount(Connection conn) throws SQLException {
      Statement stmt = null; 
      ResultSet rs = null; 
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery("select count(*) from user");
         rs.next();
         return rs.getInt(1);
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
      }
   }
   
   public List<User> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<User> userList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from user ");         
         rs  = pstmt.executeQuery(); 
         userList = new ArrayList<User>();
         while (rs.next()){
            User user = new User();
            user.setUserId(rs.getString(1));
            user.setPassword(rs.getString(2));
            user.setName(rs.getString(3));
            user.setLoginTime(rs.getTimestamp(4));
            userList.add(user);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return userList;
   }
   */
   // idCheck입니다
   public int idCheck(Connection conn, String id)
   throws SQLException{
        int rst = 0;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
         String sql = "select * from project_user where username=?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, id);
         rs = ps.executeQuery();
         if(rs.next()){
          rst = 1;
         }
        }catch(Exception e){
         e.printStackTrace();
        }finally{
         //JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(ps);
        }
        return rst;
       }

   
}
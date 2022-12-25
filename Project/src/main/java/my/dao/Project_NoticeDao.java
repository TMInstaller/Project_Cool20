package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Project_Notice;
import my.util.JdbcUtil;

public class Project_NoticeDao {
   
   public void insert(Connection conn, Project_Notice notice)
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("insert into project_notice (notice_title, notice_content, userid, notice_date)"
               + " values(?,?,?,?)");
         pstmt.setString(1, notice.getNotice_title());
         pstmt.setString(2, notice.getNotice_content());
         pstmt.setString(3, notice.getUserid());
         pstmt.setTimestamp(4, new Timestamp(notice.getNotice_date().getTime()));
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public Project_Notice selectById(Connection conn, int notice_id) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Project_Notice notice = null; 
      System.out.println("==================");
      System.out.println(notice_id);
      System.out.println("==================");
      try {
         pstmt = conn.prepareStatement
         ("select * from project_notice where notice_id = ?");
         pstmt.setInt(1, notice_id);
         rs = pstmt.executeQuery();
         if (rs.next()){
            notice = new Project_Notice(); 
            notice.setNotice_id(rs.getInt(1));
            notice.setNotice_title(rs.getString(2));
            notice.setNotice_content(rs.getString(3));
            notice.setUserid(rs.getString(4));
            notice.setNotice_date(rs.getTimestamp(5));
         }
         System.out.println("==================");
         System.out.println(notice.getUserid());
         System.out.println("==================");
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return notice;
   }
   
   public List<Project_Notice> selectLike(Connection conn, String target, String keyword) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      ResultSet rs = null;
      Project_Notice notice = null; 
      List<Project_Notice> notices = new ArrayList<Project_Notice>(); // 제네릭
      try {
         pstmt = conn.prepareStatement
         ("select * from notice where " +target +" like ?");
         pstmt.setString(1, "%"+keyword+"%");
         rs = pstmt.executeQuery();
         while (rs.next()){
            notice = new Project_Notice(); 
            notice.setNotice_id(rs.getInt(1));
            notice.setNotice_title(rs.getString(2));
            notice.setNotice_content(rs.getString(3));
            notice.setUserid(rs.getString(4));
            notice.setNotice_date(rs.getTimestamp(5));
            notices.add(notice);
         }
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         JdbcUtil.close(pstmt);
         JdbcUtil.close(rs);
      }
      return notices;
   }
   
   public void update(Connection conn, Project_Notice notice) 
         throws SQLException {
      PreparedStatement pstmt=null; 
      try {
         pstmt = conn.prepareStatement
         ("update project_notice set notice_title=?,notice_content=?,userid=?, "
               + "  notice_date=? where notice_id=?");
         pstmt.setString(1, notice.getNotice_title());
         pstmt.setString(2, notice.getNotice_content());
         pstmt.setString(3, notice.getUserid());
         pstmt.setTimestamp(4, new Timestamp(notice.getNotice_date().getTime()));
         pstmt.setInt(5, notice.getNotice_id());
         pstmt.executeUpdate(); 
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public void deleteById(Connection conn, int noticeId) 
         throws SQLException {
      PreparedStatement pstmt=null;       
      try {
         pstmt = conn.prepareStatement
         ("delete from project_notice where notice_id = ?");
         pstmt.setInt(1, noticeId);
         pstmt.executeUpdate();         
      } catch (SQLException e){
         e.printStackTrace();
      } finally {
         //JdbcUtil.close(conn);
         JdbcUtil.close(pstmt);
      }
   }
   
   public int selectCount(Connection conn) throws SQLException {
      Statement stmt = null; 
      ResultSet rs = null; 
      try {
         stmt = conn.createStatement();
         rs = stmt.executeQuery("select count(*) from notice");
         rs.next();
         return rs.getInt(1);
      } finally {
         JdbcUtil.close(rs);
      }
   }
   
   public List<Project_Notice> selectList(Connection conn) 
         throws SQLException {
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      List<Project_Notice> boardList = null;
      try {
         pstmt = conn.prepareStatement
               ("select * from project_notice order by notice_date desc");         
         rs  = pstmt.executeQuery(); 
         boardList = new ArrayList<Project_Notice>();
         while (rs.next()){
            Project_Notice board = new Project_Notice();
            board.setNotice_id(rs.getInt(1));
            board.setNotice_title(rs.getString(2));
            board.setNotice_content(rs.getString(3));
            board.setUserid(rs.getString(4));
            board.setNotice_date(rs.getTimestamp(5));
            boardList.add(board);
         }
      } finally {
         JdbcUtil.close(conn);
         JdbcUtil.close(rs);
         JdbcUtil.close(pstmt);
      }
      return boardList;
   }

}



















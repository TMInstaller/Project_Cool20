package my.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import my.model.Board;
import my.util.JdbcUtil;

public class BoardDao {
	
	public void insert(Connection conn, Board board) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("insert into board (title, content, userId, bdate)"
					+ " values(?,?,?,?)");
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getUserId());
			pstmt.setTimestamp(4, new Timestamp(board.getBdate().getTime()));
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Board selectById(Connection conn, int boardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Board board = null; 
		try {
			pstmt = conn.prepareStatement
			("select * from board where boardId = ?");
			pstmt.setInt(1, boardId);
			rs = pstmt.executeQuery();
			if (rs.next()){
				board = new Board(); 
				board.setBoardId(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setUserId(rs.getString(4));
				board.setBdate(rs.getTimestamp(5));
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return board;
	}
	
	public List<Board> selectLike(Connection conn, String target, String keyword) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		ResultSet rs = null;
		Board board = null; 
		List<Board> boards = new ArrayList<Board>(); // 제네릭
		try {
			pstmt = conn.prepareStatement
			("select * from board where " +target +" like ?");
			pstmt.setString(1, "%"+keyword+"%");
			rs = pstmt.executeQuery();
			while (rs.next()){
				board = new Board(); 
				board.setBoardId(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setUserId(rs.getString(4));
				board.setBdate(rs.getTimestamp(5));
				boards.add(board);
			}
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return boards;
	}
	
	public void update(Connection conn, Board board) 
			throws SQLException {
		PreparedStatement pstmt=null; 
		try {
			pstmt = conn.prepareStatement
			("update board set title=?,content=?,userId=?, "
					+ "   bdate=? where boardId=?");
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getUserId());
			pstmt.setTimestamp(4, new Timestamp(board.getBdate().getTime()));
			pstmt.setInt(5, board.getBoardId());
			pstmt.executeUpdate(); 
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			//JdbcUtil.close(conn);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void deleteById(Connection conn, int boardId) 
			throws SQLException {
		PreparedStatement pstmt=null; 		
		try {
			pstmt = conn.prepareStatement
			("delete from board where boardId = ?");
			pstmt.setInt(1, boardId);
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
			rs = stmt.executeQuery("select count(*) from board");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
		}
	}
	
	public List<Board> selectList(Connection conn) 
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> boardList = null;
		try {
			pstmt = conn.prepareStatement
					("select * from board ");			
			rs  = pstmt.executeQuery(); 
			boardList = new ArrayList<Board>();
			while (rs.next()){
				Board board = new Board();
				board.setBoardId(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setContent(rs.getString(3));
				board.setUserId(rs.getString(4));
				board.setBdate(rs.getTimestamp(5));
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





















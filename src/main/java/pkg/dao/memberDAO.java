package pkg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class memberDAO {
	private Connection conn =null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public String getMemberName(String id) {
		String mName = "";
		
		try {
			conn = DBCP.DBconnection();
			String sql = "select mName from member where mId = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) mName = rs.getString(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			daoClose();
		}
		
		return mName;
	}
	
	public String getAdminName(String id) {
		String mName = "";
		
		try {
			conn = DBCP.DBconnection();
			String sql = "select name from admin where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) mName = rs.getString(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			daoClose();
		}
		
		return mName;
	}
	
	public void daoClose() {
		try {
			if(conn != null) conn.close();
			if(stmt != null) stmt.close();
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
		}catch(Exception e) {}
	}
}

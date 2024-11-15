package pkg.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import pkg.dto.bbsBean;

public class bbsDAO {
	
	private Connection conn =null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public List<bbsBean> selectBBS() {
		List<bbsBean> list = new ArrayList<bbsBean>();
		try {
			conn = DBCP.DBconnection();
			String sql = "select * from BBS order by bNum desc";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				bbsBean bbs = new bbsBean();
				bbs.setbNum(rs.getInt("bNum"));
				bbs.setbTitle(rs.getString("bTitle"));
				bbs.setbContent(rs.getString("bContent"));
				bbs.setbMemId(rs.getString("bMemId"));
				bbs.setbRegTM(rs.getTimestamp("bRegTM"));				
				list.add(bbs);
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			daoClose();
		}
		return list;
	}
	
	public boolean insertBBS(HttpServletRequest req) {
		boolean chk = false;
		try {
			conn = DBCP.DBconnection();
			String sql = "insert into bbs (bTitle, bContent, bMemId) ";
				sql += "values (?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, req.getParameter("bTitle"));
			pstmt.setString(2, req.getParameter("bContent"));
			pstmt.setString(3, req.getParameter("bMemId"));
			int rntNum = pstmt.executeUpdate();
			if(rntNum == 1) {
				System.out.println("글입력 성공");
				chk = true;
			}
			
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			daoClose();
		}
		
		return chk;
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

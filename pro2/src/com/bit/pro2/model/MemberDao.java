package com.bit.pro2.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
	
	public void memberNew(String username, String userid, String userpw, String useraddr, String userphone, String usermail) throws SQLException {
		String sql = "INSERT INTO MEMBER (USERNUM, USERNAME, USERID, USERPW, USERADDR, USERPHONE, USERMAIL) VALUES (MEMBER_SEQ.NEXTVAL, '?', '?', '?', '?', '?', '?')";
		
		try{
			InitialContext init = new InitialContext();
			Context context = (Context) init.lookup("java:/comp/env");
			DataSource dataSource = (DataSource) context.lookup("jdbc/oracle");
			conn = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userid);
			pstmt.setString(3, userpw);
			pstmt.setString(4, useraddr);
			pstmt.setString(5, userphone);
			pstmt.setString(6, usermail);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public void memberUpdate(String userpw, String useraddr, String userphone, String usermail, String userid) throws SQLException {
		String sql = "UPDATE MEMBER SET USERPW='?', USERADDR='?', USERPHONE='?', USERMAIL='?' WHERE USERID='?'";

		try{
			InitialContext init = new InitialContext();
			Context context = (Context) init.lookup("java:/comp/env");
			DataSource dataSource = (DataSource) context.lookup("jdbc/oracle");
			conn = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userpw);
			pstmt.setString(2, useraddr);
			pstmt.setString(3, userphone);
			pstmt.setString(4, usermail);
			pstmt.setString(5, userid);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public void memberLevel(String userlevel, int usernum) throws SQLException {
		String sql = "UPDATE MEMBER SET USERLEVEL='?' WHERE USERNUM=?";

		try{
			InitialContext init = new InitialContext();
			Context context = (Context) init.lookup("java:/comp/env");
			DataSource dataSource = (DataSource) context.lookup("jdbc/oracle");
			conn = dataSource.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userlevel);
			pstmt.setInt(2, usernum);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
	}
	
	public ArrayList<MemberDto> memberGet(String userid) throws SQLException {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "SELECT USERNAME, USERPW, USERADDR, USERPHONE, USERMAIL FROM MEMBER WHERE USERID='?'";
		
		try {
			InitialContext init = new InitialContext();
			Context context = (Context) init.lookup("java:/comp/env");
			DataSource dataSource = (DataSource) context.lookup("jdbc/oracle");
			conn = dataSource.getConnection();
			System.out.println("connection ready");
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			System.out.println(sql);
			System.out.println("sql ready");
			while(rs.next()){
				MemberDto bean = new MemberDto();
				bean.setUsername(rs.getString("username"));
				bean.setUserpw(rs.getString("userpw"));
				bean.setUseraddr(rs.getString("useraddr"));
				bean.setUserphone(rs.getString("userphone"));
				bean.setUsermail(rs.getString("usermail"));
				list.add(bean);
			}
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}
		return list;
	}

}

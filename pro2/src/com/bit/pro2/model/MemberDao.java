package com.bit.pro2.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.pro2.util.MyOra;

public class MemberDao {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void memberNew(String username, String userid, String userpw, String useraddr, String userphone, String usermail) throws SQLException {
		String sql = "INSERT INTO MEMBER (USERNUM, USERNAME, USERID, USERPW, USERADDR, USERPHONE, USERMAIL) VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userid);
			pstmt.setString(3, userpw);
			pstmt.setString(4, useraddr);
			pstmt.setString(5, userphone);
			pstmt.setString(6, usermail);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
	}
	
	public void memberUpdate(String username, String userpw, String useraddr, String userphone, String usermail, String userid) throws SQLException {
		String sql = "UPDATE MEMBER SET USERNAME=?, USERPW=?, USERADDR=?, USERPHONE=?, USERMAIL=? WHERE USERID=?";

		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userpw);
			pstmt.setString(3, useraddr);
			pstmt.setString(4, userphone);
			pstmt.setString(5, usermail);
			pstmt.setString(6, userid);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
	}
	
	public void memberLevel(String userlevel, int usernum) throws SQLException {
		String sql = "UPDATE MEMBER SET USERLEVEL=? WHERE USERNUM=?";
		try {
		
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userlevel);
			pstmt.setInt(2, usernum);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
	}
	
	public ArrayList<MemberDto> memberGet(String userid) throws SQLException {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		String sql = "SELECT USERNAME, USERPW, USERADDR, USERPHONE, USERMAIL FROM MEMBER WHERE USERID=?";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
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
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		return list;
	}

}

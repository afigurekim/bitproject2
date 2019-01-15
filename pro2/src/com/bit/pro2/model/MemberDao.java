package com.bit.pro2.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.pro2.util.MyOra;

public class MemberDao {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public int memberNew(String username, String userid, String userpw, String useraddr, String userphone, String usermail) throws SQLException {
		String sql = "INSERT INTO MEMBER (USERNUM, USERNAME, USERID, USERPW, USERADDR, USERPHONE, USERMAIL) VALUES (MEMBER_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)";
		int su = 0;
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
		return su;
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

	// CSH 2019/01/10	Dao
	
	public ArrayList<MemberDto> userSelectAll() throws SQLException{
		String sql="SELECT * FROM MEMBER";
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				MemberDto dto=new MemberDto();
				
				dto.setUsernum(rs.getInt("usernum"));
				dto.setUsername(rs.getString("username"));
				dto.setUserid(rs.getString("userid"));
				dto.setUserpw(rs.getString("userpw"));
				dto.setUseraddr(rs.getString("useraddr"));
				dto.setUserphone(rs.getString("userphone"));
				dto.setUsermail(rs.getString("usermail"));
				dto.setUserprog(rs.getInt("userprog"));
				dto.setUserlevel(rs.getString("userlevel"));
				
				list.add(dto);
				
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return list;
	}
	
	public ArrayList<MemberDto> userSelectTeacher() throws SQLException{
		String sql="SELECT USERNUM,USERNAME FROM MEMBER WHERE USERLEVEL='teacher'";
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				MemberDto dto=new MemberDto();
				
				dto.setUsernum(rs.getInt("usernum"));
				dto.setUsername(rs.getString("username"));
				
				list.add(dto);
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		return list;
	}
	
	public ArrayList<MemberDto> userSelectStudent() throws SQLException{
		String sql="SELECT USERNUM,USERNAME FROM MEMBER WHERE USERLEVEL='student'";
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				MemberDto dto=new MemberDto();
				
				dto.setUsernum(rs.getInt("usernum"));
				dto.setUsername(rs.getString("username"));
				
				list.add(dto);
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		return list;
	}
	
	public int updateAdmissionOne(int usernum, String userlevel) throws SQLException{
		int result=0;
		
		String sql="UPDATE MEMBER SET USERLEVEL=? WHERE USERNUM=?";

		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userlevel);
			pstmt.setInt(2, usernum);
			result=pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		return result;
	}
		
	// KDH 2019-01-14 (updateProgram, selectProgram)
	
	public void updateProgram(int userprog, String userid) throws SQLException {
		String sql="UPDATE MEMBER SET USERPROG=? WHERE USERID=?";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setInt(1, userprog);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
	}
	
	public MemberDto selectProgram(String userid) throws SQLException {
		MemberDto bean = new MemberDto();
		String sql = "SELECT USERPROG FROM MEMBER WHERE USERID=?";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setUserprog(rs.getInt("userprog"));
			}
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return bean;
	}

	public int memberlogin(String userid, String userpw) throws SQLException{
		String sql="select count(*) as cnt from member where userid=? and userpw=?";
			int su=0;
		try{
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs=pstmt.executeQuery();
			while(rs.next()){
				su=rs.getInt("cnt");
				System.out.println(su);
			}
		}finally{
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
	
		}
		
		return su;
	}
	
}

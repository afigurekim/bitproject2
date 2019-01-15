package com.bit.pro2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import jdk.nashorn.internal.ir.ForNode;

public class BoardDao {
	
	private final String driver="oracle.jdbc.OracleDriver"; 
	private final String url="jdbc:oracle:thin:@localhost:1521:xe"; 
	private final String user="scott"; 
	private final String password="tiger"; 
	 	 

	
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Connection conn;
		
public ArrayList<BoardDto> selectAll(Criteria cri){
	ArrayList<BoardDto> list=new ArrayList<BoardDto>();
	System.out.println(cri.getPage());
	System.out.println(cri.getPageStart());
	System.out.println(cri.getPerPageNum());

	int page=cri.getPage();
	int perPageNum=cri.getPerPageNum();
	
	try{
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		pstmt=conn.prepareStatement("select * from (select * from(select rownum rnum,qnanum,qnaname,qnapw,qnaphone,qnatitle,qnacont,qnaresp from board)where rnum<=?) where rnum>=?");
		pstmt.setInt(1,perPageNum);
		pstmt.setInt(2, page);
		rs=pstmt.executeQuery();
		while(rs.next()){
			BoardDto dto=new BoardDto();
			dto.setQnanum(rs.getInt("qnanum"));
			dto.setQnaname(rs.getString("qnaname"));
			dto.setQnapw(rs.getInt("qnapw"));
			dto.setQnaphone(rs.getInt("qnaphone"));
			dto.setQnatitle(rs.getString("qnatitle"));
			dto.setQnacont(rs.getString("qnacont"));
			dto.setQnaresp(rs.getString("qnaresp"));
			list.add(dto);
		}
		
		}catch (ClassNotFoundException e) {
				e.printStackTrace();
		}catch (SQLException e) {
				e.printStackTrace();
	}finally{
		try {
	
		if(rs!=null)rs.close();
		if(pstmt!=null)pstmt.close();
		if(conn!=null)conn.close();
	}catch (SQLException e) {
			e.printStackTrace();
	}
	}
	return list;
	

	}


	public int countPaging(Criteria cri){
		
		int count=0;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,user,password);
			pstmt=conn.prepareStatement("select count(*) from board");
			rs=pstmt.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
		}catch(ClassNotFoundException e){
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			if(rs!=null)
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(pstmt!=null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			if(conn!=null)
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
	//	return session.selectOne(".countPaging",cri);
		return count;
	}

		
		
	public int insertOne(String qnaname,int qnapw,int qnaphone,String qnatitle,String qnacont) {
	String sql="insert into Board(qnanum,qnaname,qnapw,qnaphone,qnatitle,qnacont) values(board_seq.nextval,?,?,?,?,?)";
	int su=0;
	
	try {
		Class.forName(driver);
		conn=DriverManager.getConnection(url, user, password);
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, qnaname);
		pstmt.setInt(2, qnapw);
		pstmt.setInt(3, qnaphone);
		pstmt.setString(4, qnatitle);
		pstmt.setString(5, qnacont);
		su=pstmt.executeUpdate();	//(1) INSERT, DELETE, UPDATE�� ���� �� (2) �ƹ� ������ ������ 0
	}catch (ClassNotFoundException e) {
			e.printStackTrace();
	}catch (SQLException e) {
			e.printStackTrace();
	}finally {
		try {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	return su;
}
	
	public BoardDto selectOne(int qnanum) {
		String sql="select*from board where qnanum=?";
		BoardDto dto=new BoardDto();
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, qnanum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setQnanum(rs.getInt("qnanum"));
				dto.setQnaname(rs.getString("qnaname"));
				dto.setQnapw(rs.getInt("qnapw"));
				dto.setQnaphone(rs.getInt("qnaphone"));
				dto.setQnacont(rs.getString("qnacont"));
				dto.setQnatitle(rs.getString("qnatitle"));
				dto.setQnaresp(rs.getString("qnaresp"));
			} 
			 		} catch (ClassNotFoundException e) { 
			 			e.printStackTrace(); 
			 		} catch (SQLException e) { 
			 			e.printStackTrace(); 
			 		} finally{ 
			 			try { 
			 				if(rs!=null)rs.close(); 
			 				if(pstmt!=null)pstmt.close(); 
			 				if(conn!=null)conn.close(); 
			 			} catch (SQLException e) { 
			 				e.printStackTrace(); 
			 			} 
			 		} 
			 		 
			 		return dto; 
			 	} 
			 	 
	
	
			public int updateOne(String qnatitle,String qnacont,int qnanum){ 
			 		int su=0; 
			 		String sql="UPDATE board SET qnatitle=?,qnacont=? WHERE qnanum=?"; 
			 		try { 
			 			Class.forName(driver); 
			 			conn=DriverManager.getConnection(url, user, password); 
			 			pstmt=conn.prepareStatement(sql); 
			 			pstmt.setString(1, qnatitle); 
			 			pstmt.setString(2, qnacont); 
			 			pstmt.setInt(3, qnanum); 
			 			su=pstmt.executeUpdate(); 
			 		} catch (ClassNotFoundException e) { 
			 			e.printStackTrace(); 
			 		} catch (SQLException e) { 
			 			e.printStackTrace(); 
			 		} finally { 
			 			try { 
			 				if(pstmt!=null)pstmt.close(); 
			 				if(conn!=null)conn.close(); 
						} catch (SQLException e) { 
			 				e.printStackTrace(); 
			 			} 
			 		} 
			 		System.out.print(su);
			 		return su; 
			 	} 
			 	
			 	public int deleteOne(int num){
			 		int su=0;
			 		String sql="delete from board where qnanum=?";
			 		
			 		try{
			 			Class.forName(driver);
			 			conn=DriverManager.getConnection(url,user,password);
			 			pstmt=conn.prepareStatement(sql);
			 			pstmt.setInt(1, num);
			 			su=pstmt.executeUpdate();
			 		}catch(ClassNotFoundException e){
			 			e.printStackTrace();
			 		}catch (SQLException e) {
			 			e.printStackTrace();
					}finally{
						try{
							if(pstmt!=null)pstmt.close();
							if(conn!=null)conn.close();
						}catch(SQLException e){
							e.printStackTrace();
						}
					}
			 		return su;
			 	}
			 } 
		 

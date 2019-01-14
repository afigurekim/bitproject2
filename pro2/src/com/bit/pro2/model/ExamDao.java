package com.bit.pro2.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.pro2.util.MyOra;

public class ExamDao {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ArrayList<ExamDto> examSelectall() throws SQLException{
		String sql="SELECT * FROM EXAMLIST";
		ArrayList<ExamDto> examlist=new ArrayList<ExamDto>();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ExamDto dto=new ExamDto();
				
				dto.setExamnum(rs.getInt("examnum"));
				dto.setSubname(rs.getString("subname"));
				dto.setExamdate(rs.getDate("examdate"));
				dto.setSubroom(rs.getString("subroom"));
				dto.setSubteach(rs.getInt("subteach"));
				
				examlist.add(dto);
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return examlist;
	}
	
	public ExamDto examSelectOne(int examnum) throws SQLException{
		String sql ="SELECT SUBNAME, EXAMDATE, SUBROOM, SUBTEACH FROM EXAMLIST WHERE EXAMNUM=?";;

		ExamDto dto = new ExamDto();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setInt(1, examnum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				
				dto.setSubname(rs.getString("subname"));
				dto.setExamdate(rs.getDate("examdate"));
				dto.setSubroom(rs.getString("subroom"));
				dto.setSubteach(rs.getInt("subteach"));
			}
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return dto;
	}
}

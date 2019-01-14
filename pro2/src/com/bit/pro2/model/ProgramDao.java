package com.bit.pro2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.pro2.util.MyOra;

public class ProgramDao {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ArrayList<ProgramDto> progSelectAll() throws SQLException{
		String sql="SELECT * FROM PROGRAM";
		ArrayList<ProgramDto> proglist = new ArrayList<ProgramDto>();
		
		try {
			pstmt= MyOra.getConnection().prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ProgramDto dto=new ProgramDto();
				
				dto.setPrognum(rs.getInt("prognum"));
				dto.setProgname(rs.getString("progname"));
				dto.setProgteach(rs.getInt("progteach"));
				dto.setProgroom(rs.getString("progroom"));
				dto.setDatestart(rs.getDate("datestart"));
				dto.setDateend(rs.getDate("dateend"));
				dto.setTimestart(rs.getString("timestart"));
				dto.setTimeend(rs.getInt("timeend"));
				dto.setProgsize(rs.getInt("progsize"));

				proglist.add(dto);
			}
		} finally {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		return proglist;

	}
	
	public int progInsertOne( ProgramDto dto ) throws SQLException{
		String sql="INSERT INTO PROGRAM VALUES (PROGRAM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?)";

		int result=0;
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, dto.getProgname());
			pstmt.setInt(2, dto.getProgteach());
			pstmt.setString(3, dto.getProgroom());
			pstmt.setDate(4, dto.getDatestart());
			pstmt.setDate(5, dto.getDateend());
			pstmt.setString(6, dto.getTimestart());
			pstmt.setInt(7, dto.getTimeend());
			pstmt.setInt(8, dto.getProgsize());
			result=pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return result;
	}
		
}

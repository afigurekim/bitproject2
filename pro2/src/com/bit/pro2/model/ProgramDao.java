package com.bit.pro2.model;

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
				dto.setProgcnt(rs.getInt("progcnt")); // KDH 2019-01-14 (progcnt 추가)

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
		String sql="INSERT INTO PROGRAM VALUES (PROGRAM_SEQ.NEXTVAL,?,?,?,?,?,?,?,?,0)"; // KDH 2019-01-14 (progcnt 추가)

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
	
	// KDH 2019-01-14 (updateCnt, progSelectOne)
	
	public void updateCnt(int prognum) throws SQLException {
		String sql = "UPDATE PROGRAM SET PROGCNT=(PROGCNT+1) WHERE PROGNUM=?";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setInt(1, prognum);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
	}
	
	public ArrayList<ProgramDto> progSelectOne(int prognum) throws SQLException {
		String sql = "SELECT PROGNAME, PROGROOM, DATESTART, DATEEND, TIMESTART, PROGSIZE FROM PROGRAM WHERE PROGNUM=?";
		ArrayList<ProgramDto> progonelist = new ArrayList<ProgramDto>();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setInt(1, prognum);
			rs = pstmt.executeQuery();
			while(rs.next()){
				ProgramDto dto=new ProgramDto();
				
				dto.setProgname(rs.getString("progname"));
				dto.setProgroom(rs.getString("progroom"));
				dto.setDatestart(rs.getDate("datestart"));
				dto.setDateend(rs.getDate("dateend"));
				dto.setTimestart(rs.getString("timestart"));
				dto.setProgsize(rs.getInt("progsize"));

				progonelist.add(dto);
				
			}
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return progonelist;
	}
	
	// KDH 2019-01-15 (updateMinus)
	
	public void updateMinus(int prognum) throws SQLException {
		String sql = "UPDATE PROGRAM SET PROGCNT=(PROGCNT-1) WHERE PROGNUM=?";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setInt(1, prognum);
			pstmt.executeUpdate();
		} finally {
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
	}
	
}

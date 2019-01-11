package com.bit.pro2.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProgramDao {
	private final String driver="oracle.jdbc.OracleDriver";
	private final String url="jdbc:oracle:thin:@localhost:1521:xe";
	private final String user="scott";
	private final String password="tiger";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ArrayList<ProgramDto> progSelectAll(){
		String sql="SELECT * FROM PROGRAM";
		ArrayList<ProgramDto> proglist = new ArrayList<ProgramDto>();
		
		try {
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, password);
			pstmt=conn.prepareStatement(sql);
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
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return proglist;

	}
	
}

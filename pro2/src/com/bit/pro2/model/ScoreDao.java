package com.bit.pro2.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.pro2.util.MyOra;

public class ScoreDao {
	private PreparedStatement pstmt;
	private ResultSet rs;

	public ArrayList<ScoreDto> scoreSelectAll(int examnum) throws SQLException{
		String sql="SELECT * FROM SCORELIST WHERE EXAMNUM=?";
		ArrayList<ScoreDto> list = new ArrayList<ScoreDto>();
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setInt(1, examnum);
			rs=pstmt.executeQuery();
			while(rs.next()){
				ScoreDto dto=new ScoreDto();
				
				dto.setExamnum(rs.getInt("examnum"));
				dto.setStunum(rs.getInt("stunum"));
				dto.setExamscore(rs.getInt("examscore"));
				dto.setExamchk(rs.getInt("examchk"));
				
				list.add(dto);
			}
			
		} finally {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		return list;
	}
	
}

package com.bit.pro2.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bit.pro2.util.MyOra;

public class StuscoreDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public ArrayList<StuscoreDto> scoreGet(String userid) throws SQLException {
		ArrayList<StuscoreDto> list = new ArrayList<StuscoreDto>();
		String sql = "SELECT EXAMDATE, SUBNAME, TEACHNAME, EXAMSCORE FROM SCORELIST WHERE STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?)";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				StuscoreDto bean = new StuscoreDto();
				bean.setSubname(rs.getString("subname"));
				bean.setExamdate(rs.getString("examdate"));
				bean.setTeachname(rs.getString("teachname"));
				bean.setExamscore(rs.getInt("examscore"));
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

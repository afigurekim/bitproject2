package com.bit.pro2.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.bit.pro2.util.MyOra;

public class CheckinDao {
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public CheckinDto checkinIn(String userid) throws SQLException{
		CheckinDto bean = new CheckinDto();
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String sql = "SELECT CHECKIN FROM CHECKINLIST WHERE CHECKDATE='" + date + "' AND STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?)";
		String sql2 = "INSERT INTO CHECKINLIST (STUNUM, CHECKDATE, CHECKIN) VALUES ((SELECT USERNUM FROM MEMBER WHERE USERID=?),(SELECT TO_CHAR(SYSDATE,'YYYYMMDD')FROM DUAL),(SELECT TO_CHAR(SYSDATE,'HH24MISS')FROM DUAL))";
		String sql3 = "SELECT CHECKIN FROM CHECKINLIST WHERE STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?) AND CHECKDATE=(SELECT TO_CHAR(SYSDATE,'YYYYMMDD')FROM DUAL)";
		
		try{
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setCheckin(rs.getString("checkin"));
			}
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		if (bean.getCheckin()!=null){
			bean.setCheckin("999999");
		} else {
			try { 
				pstmt = MyOra.getConnection().prepareStatement(sql2);
				pstmt.setString(1, userid);
				pstmt.executeUpdate();
			} finally {
				if(pstmt!=null)pstmt.close();
				if(MyOra.getConnection()!=null)MyOra.getConnection().close();
			}
			
			try{
				pstmt = MyOra.getConnection().prepareStatement(sql3);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				while(rs.next()){
					bean.setCheckin(rs.getString("checkin"));
				}
			} finally {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(MyOra.getConnection()!=null)MyOra.getConnection().close();
			}
		}
		return bean;
	}
	
	public CheckinDto checkinOut(String userid) throws SQLException{
		CheckinDto bean = new CheckinDto();
		String date = new SimpleDateFormat("yyyyMMdd").format(new Date());
		String sql = "SELECT CHECKOUT FROM CHECKINLIST WHERE CHECKDATE='" + date + "' AND STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?)";
		String sql2 = "SELECT CHECKIN FROM CHECKINLIST WHERE CHECKDATE='" + date + "' AND STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?)";
		String sql3 = "UPDATE CHECKINLIST SET CHECKOUT=(SELECT TO_CHAR(SYSDATE,'HH24MISS')FROM DUAL) WHERE STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?) AND CHECKDATE='" + date + "'";
		String sql4 = "SELECT CHECKOUT FROM CHECKINLIST WHERE STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?) AND CHECKDATE='" + date + "'";
		
		try{
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				bean.setCheckout(rs.getString("checkout"));
			}
		} finally {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(MyOra.getConnection()!=null)MyOra.getConnection().close();
		}
		
		if (bean.getCheckout()!=null) {
			bean.setCheckout("888888");
		} else {
			try{
				pstmt = MyOra.getConnection().prepareStatement(sql2);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				while(rs.next()){
					bean.setCheckin(rs.getString("checkin"));
				}
			} finally {
				if(rs!=null)rs.close();
				if(pstmt!=null)pstmt.close();
				if(MyOra.getConnection()!=null)MyOra.getConnection().close();
			}
			
			if (bean.getCheckin()==null){
				bean.setCheckout("999999");
			} else {
				try{
					pstmt = MyOra.getConnection().prepareStatement(sql3);
					pstmt.setString(1, userid);
					pstmt.executeUpdate();
				} finally {
					if(pstmt!=null)pstmt.close();
					if(MyOra.getConnection()!=null)MyOra.getConnection().close();
				}
				
				bean = new CheckinDto();
				
				try{
					pstmt = MyOra.getConnection().prepareStatement(sql4);
					pstmt.setString(1, userid);
					rs = pstmt.executeQuery();
					while(rs.next()){
						bean.setCheckout(rs.getString("checkout"));
					}
				} finally {
					if(rs!=null)rs.close();
					if(pstmt!=null)pstmt.close();
					if(MyOra.getConnection()!=null)MyOra.getConnection().close();
				}
			}
		}
		return bean;
	}
	
	public ArrayList<CheckinDto> checkinGet(String userid) throws SQLException {
		ArrayList<CheckinDto> list = new ArrayList<CheckinDto>();
		String sql = "SELECT CHECKDATE, CHECKIN, CHECKOUT FROM CHECKINLIST WHERE STUNUM=(SELECT USERNUM FROM MEMBER WHERE USERID=?) ORDER BY CHECKDATE DESC";
		
		try {
			pstmt = MyOra.getConnection().prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				CheckinDto bean = new CheckinDto();
				bean.setCheckdate(rs.getString("checkdate"));
				bean.setCheckin(rs.getString("checkin"));
				bean.setCheckout(rs.getString("checkout"));
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

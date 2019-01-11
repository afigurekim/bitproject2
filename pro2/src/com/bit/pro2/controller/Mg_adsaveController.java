package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;

public class Mg_adsaveController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int usernum=0;
		int su=0;
		String userlevel=null;
		String strnum=null;
		
		req.setCharacterEncoding("utf-8");

		try {
			MemberDao dao = new MemberDao();
			ArrayList<MemberDto> list = dao.userSelectAll();

			for(int i=0; i<list.size();i++){
				MemberDto bean=list.get(i);
				
				usernum=bean.getUsernum();
				strnum=Integer.toString(usernum);
				userlevel=req.getParameter(strnum);
				
				su=dao.updateAdmissionOne(usernum, userlevel);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(su>0) resp.sendRedirect("mg_admission.bit?result='success'");
		else resp.sendRedirect("mg_admission.bit?result='failure'");
	}
}






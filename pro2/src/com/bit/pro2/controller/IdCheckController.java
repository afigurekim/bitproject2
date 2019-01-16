package com.bit.pro2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;

public class IdCheckController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		String id=req.getParameter("userid");
		
		
		MemberDao dao=new MemberDao();
		
		int su=0;
		
		try {
			su=dao.membercheck(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		PrintWriter out=resp.getWriter();
		out.print(su);
		out.close();
		
	
	}

}

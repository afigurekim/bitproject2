package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;

public class MyinfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		System.out.println(userid);
		MemberDao dao = new MemberDao();
		
		try {
			ArrayList<MemberDto> list = dao.memberGet(userid);
			request.setAttribute("alist", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		request.getRequestDispatcher("../myinfo.jsp").forward(request, response);
	}
	
	

}

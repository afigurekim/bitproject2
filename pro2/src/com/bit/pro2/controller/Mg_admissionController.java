package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;

public class Mg_admissionController extends HttpServlet{
//	/mg_admission.bit
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		MemberDao dao = new MemberDao();
		System.out.println("--Mg_admissionController--");
		try {
			ArrayList<MemberDto> list = dao.userSelectAll();
			req.setAttribute("adlist", list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rd = req.getRequestDispatcher("mg_admin/mg_admin_admission.jsp");
		rd.forward(req, resp);
	}
}

package com.bit.pro2.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;
import com.bit.pro2.model.ProgramDao;
import com.bit.pro2.model.ProgramDto;

public class Mg_subadminController extends HttpServlet{
//	/mg_subadmin.bit
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ProgramDao dao = new ProgramDao();
		ArrayList<ProgramDto> list = dao.progSelectAll();
		
		req.setAttribute("sublist", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("/mg_admin/mg_admin_subadmin.jsp");
		rd.forward(req, resp);
	}
}


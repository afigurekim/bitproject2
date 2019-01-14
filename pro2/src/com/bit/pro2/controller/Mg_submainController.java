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
import com.bit.pro2.model.ProgramDao;
import com.bit.pro2.model.ProgramDto;

public class Mg_submainController extends HttpServlet{
//	/mg_submain.bit
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		ProgramDao progDao = new ProgramDao();
		MemberDao memDao = new MemberDao();
		
		try {
			ArrayList<ProgramDto> proglist = progDao.progSelectAll();
			ArrayList<MemberDto> teacherlist = memDao.userSelectTeacher();
			
			req.setAttribute("proglist", proglist);
			req.setAttribute("teacherlist", teacherlist);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("/mg_admin/mg_admin_submain.jsp");
		rd.forward(req, resp);
	}
}


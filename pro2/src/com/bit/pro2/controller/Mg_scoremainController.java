package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.ExamDao;
import com.bit.pro2.model.ExamDto;
import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;

public class Mg_scoremainController extends HttpServlet{
//	/mg_scoremain.bit
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		ExamDao examdao=new ExamDao();
		MemberDao memDao = new MemberDao();
		
		try {
			ArrayList<ExamDto> examlist = examdao.examSelectall();
			ArrayList<MemberDto> teacherlist = memDao.userSelectTeacher();
			
			req.setAttribute("examlist", examlist);
			req.setAttribute("teacherlist", teacherlist);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		RequestDispatcher rd = req.getRequestDispatcher("/mg_admin/mg_tea_scoremain.jsp");
		rd.forward(req, resp);
	}

}

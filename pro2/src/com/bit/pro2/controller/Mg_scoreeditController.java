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
import com.bit.pro2.model.ScoreDao;
import com.bit.pro2.model.ScoreDto;


public class Mg_scoreeditController extends HttpServlet{
//	/mg_scoreedit.bit
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int examnum=Integer.parseInt(req.getParameter("idx"));
	
		ExamDao examdao= new ExamDao();
		MemberDao memdao = new MemberDao();
		ScoreDao scdao = new ScoreDao();
		
		try {
			ExamDto examdto = examdao.examSelectOne(examnum);
			ArrayList<MemberDto> teacherlist = memdao.userSelectTeacher();
			ArrayList<MemberDto> studentlist = memdao.userSelectStudent();
			ArrayList<ScoreDto> scorelist = scdao.scoreSelectAll(examnum);
			
			req.setAttribute("exdto", examdto);
			req.setAttribute("tealist", teacherlist);
			req.setAttribute("stulist", studentlist);
			req.setAttribute("scolist", scorelist);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = req.getRequestDispatcher("/mg_admin/mg_tea_scoreedit.jsp");
		rd.forward(req, resp);
	}
}

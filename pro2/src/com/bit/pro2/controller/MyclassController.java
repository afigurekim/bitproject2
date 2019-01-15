package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;
import com.bit.pro2.model.ProgramDao;
import com.bit.pro2.model.ProgramDto;

public class MyclassController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("id");
		String app = "false";
		session.setAttribute("app", app);
		
		MemberDao memberdao = new MemberDao();
		ProgramDao programdao = new ProgramDao();
		
		try {
			MemberDto membean = memberdao.selectProgram(userid);
			req.setAttribute("membean", membean);
			if(membean!=null){
				ArrayList<ProgramDto> progonelist = programdao.progSelectOne(membean.getUserprog());
				req.setAttribute("progonelist", progonelist);
			}
			ArrayList<ProgramDto> proglist = programdao.progSelectAll();
			req.setAttribute("proglist", proglist);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/mypage/myclass.jsp").forward(req, resp);
	}
	
}

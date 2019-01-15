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

public class MyclassAppController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("id");
		
		int userprog = Integer.parseInt(req.getParameter("userprog"));
		int appnum = Integer.parseInt(req.getParameter("appnum"));
		MemberDao memberdao = new MemberDao();
		ProgramDao programdao = new ProgramDao();
		if(userprog==0){
			try {
				memberdao.updateProgram(appnum, userid);
				programdao.updateCnt(appnum);
				
				MemberDto membean = memberdao.selectProgram(userid);
				req.setAttribute("membean", membean);
				ArrayList<ProgramDto> progonelist = programdao.progSelectOne(membean.getUserprog());
				req.setAttribute("progonelist", progonelist);
				ArrayList<ProgramDto> proglist = programdao.progSelectAll();
				req.setAttribute("proglist", proglist);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			try {
				programdao.updateMinus(userprog);
				memberdao.updateProgram(appnum, userid);
				programdao.updateCnt(appnum);
				
				MemberDto membean = memberdao.selectProgram(userid);
				req.setAttribute("membean", membean);
				ArrayList<ProgramDto> progonelist = programdao.progSelectOne(membean.getUserprog());
				req.setAttribute("progonelist", progonelist);
				ArrayList<ProgramDto> proglist = programdao.progSelectAll();
				req.setAttribute("proglist", proglist);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		String app = "true";
		session.setAttribute("app", app);
		
		req.getRequestDispatcher("/mypage/myclass.jsp").forward(req, resp);
	}
	
}

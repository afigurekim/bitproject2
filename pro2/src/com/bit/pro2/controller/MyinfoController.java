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

public class MyinfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("id");
		String pwchk = null;
		String nullchk = null;
		session.setAttribute("pwchk", pwchk);
		session.setAttribute("nullchk", nullchk);
		
		MemberDao dao = new MemberDao();
		
		try {
			ArrayList<MemberDto> list = dao.memberGet(userid);
			req.setAttribute("alist", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		req.getRequestDispatcher("/mypage/myinfo.jsp").forward(req, resp);
	}
	
}

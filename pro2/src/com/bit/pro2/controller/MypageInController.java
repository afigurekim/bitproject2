package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.CheckinDao;
import com.bit.pro2.model.CheckinDto;

public class MypageInController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		
		CheckinDao dao = new CheckinDao();
		
		try {
			CheckinDto bean = dao.checkinIn(userid);
			req.setAttribute("bean", bean);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("mypage.jsp").forward(req, resp);
	}

}

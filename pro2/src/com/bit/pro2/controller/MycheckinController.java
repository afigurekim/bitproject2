package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.CheckinDao;
import com.bit.pro2.model.CheckinDto;

public class MycheckinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userid = req.getParameter("userid");
		
		CheckinDao dao = new CheckinDao();
		
		try {
			ArrayList<CheckinDto> list = dao.checkinGet(userid);
			req.setAttribute("alist", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		req.getRequestDispatcher("mycheckin.jsp").forward(req, resp);
	}
	
}

package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.pro2.model.StuscoreDao;
import com.bit.pro2.model.StuscoreDto;

public class MyscoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("id");
		
		StuscoreDao dao = new StuscoreDao();
		
		try {
			ArrayList<StuscoreDto> list = dao.scoreGet(userid);
			req.setAttribute("alist", list);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.getRequestDispatcher("/mypage/myscore.jsp").forward(req, resp);
	}
	
	

}

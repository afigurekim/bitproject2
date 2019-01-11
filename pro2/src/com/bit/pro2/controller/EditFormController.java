package com.bit.pro2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.BoardDao;
import com.bit.pro2.model.BoardDto;


public class EditFormController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int num=Integer.parseInt(req.getParameter("num"));
		
		BoardDao dao=new BoardDao();
		BoardDto bean=dao.selectOne(num);
		
		req.setAttribute("a", bean);

		RequestDispatcher rd = req.getRequestDispatcher("edit.jsp"); 
		rd.forward(req, resp); 
	
	
	}

}

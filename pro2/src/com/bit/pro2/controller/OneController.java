package com.bit.pro2.controller; 
 
 
 import java.io.IOException; 
 
 


 import javax.servlet.RequestDispatcher; 
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet; 
import javax.servlet.http.HttpServletRequest; 
import javax.servlet.http.HttpServletResponse; 

import com.bit.pro2.model.BoardDao;
import com.bit.pro2.model.BoardDto;

 

 
 public class OneController extends HttpServlet{ 
 	// /detail.bit 
 	@Override 
 	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
 			throws ServletException, IOException { 
 		//param 
 		int num=Integer.parseInt(req.getParameter("qnanum")); 
 		 
 		// dao 
 		BoardDao bean=new BoardDao(); 
 		BoardDto dto = bean.selectOne(num); 
 		 
 		// setAttr 
 		req.setAttribute("bean", dto); 
 		 
 		// forword 
 		RequestDispatcher rd = req.getRequestDispatcher("detail.jsp"); 
 		rd.forward(req, resp); 
 	} 
 	 
 } 

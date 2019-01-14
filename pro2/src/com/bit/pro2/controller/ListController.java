package com.bit.pro2.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.BoardDao;
import com.bit.pro2.model.BoardDto;
import com.bit.pro2.model.Criteria;
import com.bit.pro2.model.PageMaker;


public class ListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.print("실행하기");
		
		Criteria cri=new Criteria();
		PageMaker pm=new PageMaker();
		
		pm.setCri(cri);
		pm.setTotalCount(131);
		
		req.setAttribute("pagemaker", pm);
		
		
		//database ���� �� ���
		BoardDao bean=new BoardDao();
		ArrayList<BoardDto>list=bean.selectAll(cri);
		
		//request scope �� ����
		req.setAttribute("alist", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("list.jsp"); 
		rd.forward(req, resp); 

	}

}

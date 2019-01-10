package pro2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pro2.model.BoardDao;

public class AddController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//get param
		req.setCharacterEncoding("utf-8");
		int pw=Integer.parseInt(req.getParameter("pw"));
		int phone=Integer.parseInt(req.getParameter("phone"));
		String name=req.getParameter("name");
		String title=req.getParameter("title");
		System.out.print(title);
		String cont=req.getParameter("cont");
		System.out.print(cont);
		//dao
		BoardDao bean=new BoardDao();
		int su=bean.insertOne(name,pw,phone,title,cont);
		
		if(su==0){
			System.out.println("입력 불가");
		}else{
			System.out.println("입력 성공");
		}
		
	
		if(su>0){
			resp.sendRedirect("list.bit");
		}else{
			resp.sendRedirect("list.bit");
		}
		
	}

}

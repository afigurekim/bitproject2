package pro2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pro2.model.BoardDao;
import pro2.model.BoardDto;

public class EditController extends HttpServlet{

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		//get param
		req.setCharacterEncoding("utf-8");
		System.out.println("editcontroller ");
		int num=Integer.parseInt(req.getParameter("num"));
		String title=req.getParameter("title");
		String cont=req.getParameter("cont");
		System.out.println(num);
		
		
		
		//dao
		BoardDao dao=new BoardDao();
		int su=dao.updateOne(title, cont, num);
	
		
		if(su==0){
			System.out.println("수정 불가");
		}else{
			System.out.println("수정 성공");
		}

	
	if(su>0){
		resp.sendRedirect("list.bit");
	}else{
		resp.sendRedirect("edit.bit");
	}
	

	}
}

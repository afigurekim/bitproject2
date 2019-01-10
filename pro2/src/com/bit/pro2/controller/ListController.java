package pro2.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pro2.model.BoardDao;
import pro2.model.BoardDto;


public class ListController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.print("리스트컨트롤러");
		
		
		//database 실행 및 결과
		BoardDao bean=new BoardDao();
		ArrayList<BoardDto>list=bean.selectAll();
		
		//request scope 값 전달
		req.setAttribute("alist", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("list.jsp"); 
		rd.forward(req, resp); 

	}

}

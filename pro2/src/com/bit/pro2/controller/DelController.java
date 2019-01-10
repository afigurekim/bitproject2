package pro2.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pro2.model.BoardDao;

public class DelController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("delcontroller ");
		int num=Integer.parseInt(req.getParameter("num"));
		System.out.println(num);
		
		BoardDao dao=new BoardDao();
		
			int su=dao.deleteOne(num);
			
		if(su==0){
			System.out.println("삭제 불가");
		}else{
			System.out.println("삭제 성공");
		}
	
	if(su>0){
		resp.sendRedirect("list.bit");
	}else{
		resp.sendRedirect("list.bit");
	}

}
}

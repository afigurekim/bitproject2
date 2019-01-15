package com.bit.pro2.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;


public class LoginController extends HttpServlet{
	
	@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp)
				throws ServletException, IOException {
		
	
	req.setCharacterEncoding("utf-8");
	String id=req.getParameter("userid");
	String pw=req.getParameter("userpw");
	
	MemberDao dao=new MemberDao();
	MemberDto memDto = new MemberDto();		/*CSH 2019/01/15*/
	
	String level ="";
	int su=0;	
	
	try {
		su = dao.memberlogin(id,pw);
		
		memDto = dao.memberGetOne(id);		/*CSH 2019/01/15 session 에 level 추가 사용*/
		level =memDto.getUserlevel();
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	HttpSession session=req.getSession();
	
	if(su==1){
		session.setAttribute("id", id);
		session.setAttribute("level", level);		/*CSH 2019/01/15*/
	}
	resp.setContentType("application/json; charset=\"utf-8\"");
	resp.setCharacterEncoding("utf-8");
	PrintWriter out=resp.getWriter();
	
	out.print(su);
	out.close();
	}
}
	
	
	
	



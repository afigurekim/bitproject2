package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;

public class JoinController extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		req.setCharacterEncoding("utf-8");
		String name=req.getParameter("username");
		String id=req.getParameter("userid");
		String pw=req.getParameter("userpw");
		String pwck=req.getParameter("userpwck");
		String addr=req.getParameter("useraddr");
		String phone=req.getParameter("userphone");
		String mail=req.getParameter("usermail");
		
		
		MemberDao dao=new MemberDao();
		/*System.out.println("name:"+name+" ,id:"+id+" ,pw:"+pw+",addr:"+addr+", phone:"+phone+", mail:"+mail);*/
				int su=0;
				try {
					su = dao.memberNew(name,id,pw,addr,phone,mail);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
	
			if(su>0) resp.sendRedirect("joinend.jsp?result='success'");
			else resp.sendRedirect("join.bit?result='failure'");
			
	}

}

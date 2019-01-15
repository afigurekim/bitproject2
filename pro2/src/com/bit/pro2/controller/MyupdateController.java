package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.pro2.model.MemberDao;

public class MyupdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		
		String userpw = req.getParameter("userpw");
		String userpwchk = req.getParameter("userpwchk");
		
		String pwchk = null;
		if(!userpw.equals(userpwchk)){
			pwchk = "false";
			session.setAttribute("pwchk", pwchk);
			req.getRequestDispatcher("/mypage/myinfo.jsp").forward(req, resp);
		}else{
			String username = req.getParameter("username");
			String useraddr;
			if(req.getParameter("addrcode")==null || req.getParameter("addrcode")==""){
				useraddr = req.getParameter("addrmain");
			} else { 
				useraddr = req.getParameter("addrcode")+" "+req.getParameter("addrmain")+" "+req.getParameter("addrdetail")+" "+req.getParameter("addrextra");
			}
			String userphone = req.getParameter("userphone");
			String usermail = req.getParameter("usermail");
			String userid = req.getParameter("userid");
			
			MemberDao dao = new MemberDao();
			
			try {
				dao.memberUpdate(username, userpw, useraddr, userphone, usermail, userid);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			pwchk = "true";
			session.setAttribute("pwchk", pwchk);
			req.getRequestDispatcher("/mypage/myinfo.jsp").forward(req, resp);
		}
	}
	
}

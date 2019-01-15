package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bit.pro2.model.MemberDao;
import com.bit.pro2.model.MemberDto;

public class MyupdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		
		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");
		String userpwchk = req.getParameter("userpwchk");
		
		String pwchk = null;
		
		MemberDao dao = new MemberDao();
		
		if(!userpw.equals(userpwchk)){
			pwchk = "false";
			session.setAttribute("pwchk", pwchk);
			ArrayList<MemberDto> list;
			try {
				list = dao.memberGet(userid);
				req.setAttribute("alist", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
			
			try {
				dao.memberUpdate(username, userpw, useraddr, userphone, usermail, userid);
				ArrayList<MemberDto> list = dao.memberGet(userid);
				req.setAttribute("alist", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			pwchk = "true";
			session.setAttribute("pwchk", pwchk);
			req.getRequestDispatcher("/mypage/myinfo.jsp").forward(req, resp);
		}
	}
	
}

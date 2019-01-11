package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.MemberDao;

public class MyupdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String userpw = req.getParameter("userpw");
		String userpwchk = req.getParameter("userpwchk");
		if(!userpw.equals(userpwchk)){
			resp.sendRedirect("myinfo.bit?userid="+req.getParameter("userid")+"&pwchk=false");
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
			
			resp.sendRedirect("myinfo.bit?userid="+userid+"&pwchk=true");
		}
	}
	
}

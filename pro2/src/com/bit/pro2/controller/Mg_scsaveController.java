package com.bit.pro2.controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bit.pro2.model.ProgramDao;
import com.bit.pro2.model.ProgramDto;

public class Mg_scsaveController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		int su=0;
	
		req.setCharacterEncoding("utf-8");
		
		String progname = req.getParameter("progname");
		int progteach = Integer.parseInt(req.getParameter("progteach"));
		String progroom = req.getParameter("progroom");
		String datestart = req.getParameter("datestart");
		String dateend = req.getParameter("dateend");
		String timestart = req.getParameter("timestart");
		int timeend = Integer.parseInt(req.getParameter("timeend"));
		int progsize = Integer.parseInt(req.getParameter("progsize"));

		Date dstart=Date.valueOf(datestart);
		Date dsend=Date.valueOf(dateend);
				
		ProgramDto dto=new ProgramDto();
		ProgramDao dao=new ProgramDao();
		
		dto.setProgname(progname);
		dto.setProgteach(progteach);
		dto.setProgroom(progroom);
		dto.setDatestart(dstart);
		dto.setDateend(dsend);
		dto.setTimestart(timestart);
		dto.setTimeend(timeend);
		dto.setProgsize(progsize);
		
		try {
			su=dao.progInsertOne(dto);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(su>0) resp.sendRedirect("mg_submain.bit?result='success'");
		else resp.sendRedirect("mg_submain.bit?result='failure'");
	}
}

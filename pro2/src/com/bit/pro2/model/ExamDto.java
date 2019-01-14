package com.bit.pro2.model;

import java.sql.Date;

public class ExamDto {
	private int examnum, subteach;
	private String subname, subroom;
	private Date examdate;
	
	public int getExamnum() {
		return examnum;
	}
	public void setExamnum(int examnum) {
		this.examnum = examnum;
	}
	public int getSubteach() {
		return subteach;
	}
	public void setSubteach(int subteach) {
		this.subteach = subteach;
	}
	public String getSubname() {
		return subname;
	}
	public void setSubname(String subname) {
		this.subname = subname;
	}
	public String getSubroom() {
		return subroom;
	}
	public void setSubroom(String subroom) {
		this.subroom = subroom;
	}
	public Date getExamdate() {
		return examdate;
	}
	public void setExamdate(Date examdate) {
		this.examdate = examdate;
	}
	
	
}

package com.bit.pro2.model;

public class StuscoreDto {
	private String subname, examdate, teachname;
	private int examscore;
	
	public StuscoreDto() {
		
	}

	public String getSubname() {
		return subname;
	}

	public void setSubname(String subname) {
		this.subname = subname;
	}

	public String getExamdate() {
		return examdate;
	}

	public void setExamdate(String examdate) {
		this.examdate = examdate;
	}

	public String getTeachname() {
		return teachname;
	}

	public void setTeachname(String teachname) {
		this.teachname = teachname;
	}

	public int getExamscore() {
		return examscore;
	}

	public void setExamscore(int examscore) {
		this.examscore = examscore;
	}
	
}

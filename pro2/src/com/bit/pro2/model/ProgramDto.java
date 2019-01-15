package com.bit.pro2.model;

import java.sql.Date;

public class ProgramDto {
	private int prognum, progteach, timeend, progsize, progcnt; // KDH 2019-01-14 (progcnt Ãß°¡)
	private String progname, progroom, timestart;
	private Date datestart, dateend;
	public int getPrognum() {
		return prognum;
	}
	public void setPrognum(int prognum) {
		this.prognum = prognum;
	}
	public int getProgteach() {
		return progteach;
	}
	public void setProgteach(int progteach) {
		this.progteach = progteach;
	}
	public int getTimeend() {
		return timeend;
	}
	public void setTimeend(int timeend) {
		this.timeend = timeend;
	}
	public int getProgsize() {
		return progsize;
	}
	public void setProgsize(int progsize) {
		this.progsize = progsize;
	}
	public int getProgcnt() {
		return progcnt;
	}
	public void setProgcnt(int progcnt) {
		this.progcnt = progcnt;
	}
	public String getProgname() {
		return progname;
	}
	public void setProgname(String progname) {
		this.progname = progname;
	}
	public String getProgroom() {
		return progroom;
	}
	public void setProgroom(String progroom) {
		this.progroom = progroom;
	}
	public String getTimestart() {
		return timestart;
	}
	public void setTimestart(String timestart) {
		this.timestart = timestart;
	}
	public Date getDatestart() {
		return datestart;
	}
	public void setDatestart(Date datestart) {
		this.datestart = datestart;
	}
	public Date getDateend() {
		return dateend;
	}
	public void setDateend(Date dateend) {
		this.dateend = dateend;
	}
	
}
